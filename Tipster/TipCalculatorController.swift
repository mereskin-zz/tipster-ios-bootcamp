import UIKit

class TipCalculatorController: UIViewController {

    @IBOutlet weak var amountText: UITextField!
    @IBOutlet weak var tipSegment: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    let tipPercentages = [10.0, 15.0, 20.0, 25.0];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = NSUserDefaults.standardUserDefaults();

        amountText.text = "";
        tipSegment.selectedSegmentIndex = defaults.integerForKey("defaultPercentageIndex");
        amountText.becomeFirstResponder();
        
        renderTipandTotal();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func renderTipandTotal() {
        let amountString : NSString = amountText.text!;
        let amountValue = amountString.doubleValue;
        
        let tipPercentage = tipPercentages[tipSegment.selectedSegmentIndex];
        let tipValue = amountValue * tipPercentage / 100;
        let totalValue = amountValue + tipValue;
        
        let tipString = String(format: "%.2f", tipValue);
        let totalString = String(format: "%.2f", totalValue);
        
        tipLabel.text = tipString;
        totalLabel.text = totalString;
    }
    
    @IBAction func onAmountChanged() {
        renderTipandTotal();
    }
    
    @IBAction func onValueChanged() {
        renderTipandTotal();
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

