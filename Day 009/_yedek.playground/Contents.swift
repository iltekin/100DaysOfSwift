import UIKit

switch test {

case .failure(let error):
    
    
    
    
    DispatchQueue.main.async {
        
        print("hata",error)
        self?.showDialog(title: "Hata", message: error.localizedDescription)
    }
    
    break
case .success(let result):
    
    
    DispatchQueue.main.async {
        self?.performSegue(withIdentifier: "goHomePage", sender: nil)
    }
    break
}
