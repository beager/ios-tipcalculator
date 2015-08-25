//
//  ViewController.swift
//  tips
//
//  Created by Bill Eager on 8/25/15.
//  Copyright (c) 2015 Bill Eager. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        var defaults = NSUserDefaults.standardUserDefaults()
        var intValue = defaults.integerForKey("defaultTipAmount") ?? 0
        tipControl.selectedSegmentIndex = intValue
        
        var date = NSDate().timeIntervalSince1970
        var dateAsInt = NSInteger(date)
        var lastUpdated = defaults.integerForKey("savedBillAmountLastUpdated")
        var diff = dateAsInt - lastUpdated
        println(String(diff))
        
        if (diff < 600) {
            billField.text = String(defaults.integerForKey("savedBillAmount"))
        }
        
        self.updateLabels()
        
        billField.becomeFirstResponder()
    }
    
    func updateLabels() {
        var tipPercentages = [0.18, 0.2, 0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        billField.becomeFirstResponder()
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        self.updateLabels()
        
        var billAmount = (billField.text as NSString).doubleValue
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(billAmount, forKey: "savedBillAmount")
        defaults.setInteger(NSInteger(NSDate().timeIntervalSince1970), forKey: "savedBillAmountLastUpdated")
    }

    @IBAction func onTap(sender: AnyObject) {
    }
    
}

