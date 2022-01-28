import UIKit

UITextChecker.learnWord("iltekin")
print(UITextChecker.availableLanguages)

func checkWord(word: String) -> Bool {
    let checker = UITextChecker()
    let misspelledWord = checker.rangeOfMisspelledWord(in: word, range: NSRange(location: 0, length: word.utf16.count), startingAt: 0, wrap: false, language: "tr_TR")
    return misspelledWord.location == NSNotFound
}

func guessWord(word: String) -> [String] {
    let checker = UITextChecker()
    let guessedWord = checker.guesses(forWordRange: NSRange(location: 0, length: word.utf16.count), in: word, language: "tr_TR")
    
    return guessedWord!
}

func completeWord(word: String, lang: String) -> [String] {
    let checker = UITextChecker()
    let completeResults = checker.completions(forPartialWordRange: NSRange(location: 0, length: word.utf16.count), in: word, language: lang)
    return completeResults!
}

checkWord(word: "kalem")
checkWord(word: "kolem")
checkWord(word: "sahip")
checkWord(word: "osman")
checkWord(word: "sezer")
checkWord(word: "iltekin")

guessWord(word: "soğan")

completeWord(word: "than", lang: "en_US")
completeWord(word: "grac", lang: "es_ES")
completeWord(word: "teşek", lang: "tr_TR")
completeWord(word: "seze", lang: "tr_TR")
completeWord(word: "kalemt", lang: "tr_TR")
completeWord(word: "k", lang: "tr_TR")
