//
//  SettingsViewController.swift
//  Tippit
//
//  Created by Jianfeng Ye on 1/15/15.
//  Copyright (c) 2015 Jianfeng Ye. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var Tip1Field: UITextField!
    @IBOutlet weak var Tip2Field: UITextField!
    @IBOutlet weak var Tip3Field: UITextField!
    
    @IBAction func onEdit(sender: AnyObject) {
        (sender as UITextField).text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var settings = NSUserDefaults.standardUserDefaults()
        var tip1 = settings.integerForKey("SETTINGS_TIP1")
        Tip1Field.text = "\(tip1)"
        var tip2 = settings.integerForKey("SETTINGS_TIP2")
        Tip2Field.text = "\(tip2)"
        var tip3 = settings.integerForKey("SETTINGS_TIP3")
        Tip3Field.text = "\(tip3)"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        saveSettings()
    }
    
    @IBAction func onSave(sender: AnyObject) {
        
    }
    
    @IBAction func onTapAnyWhere(sender: AnyObject) {
        view.endEditing(true)
    }

    func saveSettings() {
        var settings = NSUserDefaults.standardUserDefaults()
        settings.setInteger(Tip1Field.text.toInt()!, forKey: "SETTINGS_TIP1")
        settings.setInteger(Tip2Field.text.toInt()!, forKey: "SETTINGS_TIP2")
        settings.setInteger(Tip3Field.text.toInt()!, forKey: "SETTINGS_TIP3")
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
