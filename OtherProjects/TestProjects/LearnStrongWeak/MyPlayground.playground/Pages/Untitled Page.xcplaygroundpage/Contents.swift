import UIKit

protocol ListViewControllerDelegate: AnyObject {
    func configure(with list : [Any])
}

class ListViewController : UIViewController {
    
    weak var delegate : ListViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

