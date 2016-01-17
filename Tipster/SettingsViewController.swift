import UIKit

class SettingsViewController: UITableViewController {
    
    @IBOutlet weak var defaultTipPercentage: UISegmentedControl!
        
    override func viewDidLoad() {
        super.viewDidLoad();
        
        let defaults = NSUserDefaults.standardUserDefaults();
        defaultTipPercentage.selectedSegmentIndex = defaults.integerForKey("defaultPercentageIndex");
    }
    
    @IBAction func onDefaultPercentageIndexChange(sender: UISegmentedControl) {
        let defaults = NSUserDefaults.standardUserDefaults();
        defaults.setInteger(sender.selectedSegmentIndex, forKey: "defaultPercentageIndex");
    }
    
}