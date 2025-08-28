import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countButton: UIButton!

    let counter = Counter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func executeCounter(_ sender: Any) {
        let number = counter.addCount()
        countLabel.text = "\(number)"
    }


}

