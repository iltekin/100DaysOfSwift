//
//  ViewController.swift
//  Word Scramble
//
//  Created by Sezer İltekin on 23.01.2022.
//

import UIKit

class ViewController: UITableViewController {
    var allWords = [String]()
    var usedWords = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
        
        title = "Word Scramble"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(startGame))
        startGame()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "wordCell")
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
   @objc func startGame() {
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    @objc func promptForAnswer() {
        let ac = UIAlertController(title: "Enter Answer", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] _ in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(answer)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
        
    }
    
    func submit(_ answer: String) {
        let lowerAnswer = answer.lowercased()
        
        if isPossible(word: lowerAnswer) {
            if isOriginal(word: lowerAnswer){
                if isReal(word: lowerAnswer){
                    if isEnough(word: lowerAnswer) {
                        usedWords.insert(lowerAnswer, at: 0)
                        let indexPath = IndexPath(row: 0, section: 0)
                        tableView.insertRows(at: [indexPath], with: .automatic)
                    }
                }
            }
        }
        
    }
    
    func isPossible(word: String) -> Bool {
        guard var tempWord = title?.lowercased() else { return false }
        
        for letter in word {
            if let position = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: position)
            } else {
                invalidAnswerAlert(title: "Word not possible", message: "You can't spell that word from \(tempWord)")
                return false
            }
        }
        
        return true
    }
    
    func isOriginal(word: String) -> Bool {
        if usedWords.contains(word) {
            invalidAnswerAlert(title: "Word used already", message: "Be more original!")
            return false
        } else {
            return true
        }
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: NSRange(0..<word.utf16.count), startingAt: 0, wrap: false, language: "en")
        
        print(misspelledRange.debugDescription)
        
        if misspelledRange.location == NSNotFound {
            return true
        } else {
            invalidAnswerAlert(title: "Word not recognised", message: "You can't just make them up, you know!")
            return false
        }
    }
    
    func isEnough(word: String) -> Bool {
        if word == title {
            invalidAnswerAlert(title: "Answer is the question!", message: "I can't accept the word itself!")
        } else if word.utf16.count < 3 {
            invalidAnswerAlert(title: "Shorter than expected!", message: "I can't accept words lower than 3 letters!")
        } else {
            return true
        }
        
        return false
    }
    
    func invalidAnswerAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }

}

