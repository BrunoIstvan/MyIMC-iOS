
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var viResult: UIView!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func getMeasures() -> (weight: Double, height: Double)? {
        let numberFormatter = NumberFormatter()
        guard let weight = numberFormatter.number(from: tfWeight.text!)?.doubleValue,
            let height = numberFormatter.number(from: tfHeight.text!)?.doubleValue
            else {return nil}
        return (weight, height)
    }
    
    @IBAction func calculate(_ sender: Any) {
        guard let measures = getMeasures() else {return}
        let imc = IMCCalculator.calculate(weight: measures.weight, height: measures.height)
        showResults(for: imc)
    }
    
    func showResults(for imc: IMC) {
        lbResult.text = "\(round(imc.value)): \(imc.result)"
        ivResult.image = UIImage(named: imc.image)
        viResult.isHidden = false
        view.endEditing(true)
    }
    
}

