//
//  SettingsViewController.swift
//  tips
//
//  Created by Bill Eager on 8/25/15.
//  Copyright (c) 2015 Bill Eager. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var defaultTipAmountControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        var defaults = NSUserDefaults.standardUserDefaults()
        var intValue = defaults.integerForKey("defaultTipAmount") ?? 0
        defaultTipAmountControl.selectedSegmentIndex = intValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBackButtonPress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onDefaultTipAmountChanged(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTipAmountControl.selectedSegmentIndex, forKey: "defaultTipAmount")
        defaults.synchronize()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
