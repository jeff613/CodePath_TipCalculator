//
//  ViewController.swift
//  Tippit
//
//  Created by Jianfeng Ye on 1/14/15.
//  Copyright (c) 2015 Jianfeng Ye. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BillAmountField: UITextField!
    @IBOutlet weak var TipLabel: UILabel!
    @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet weak var TipControl: UISegmentedControl!
    
    var tipPercentages = [0.1, 0.15, 0.2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear")
        
        var settings = NSUserDefaults.standardUserDefaults();
        var tip1 = settings.integerForKey("SETTINGS_TIP1")
        var tip2 = settings.integerForKey("SETTINGS_TIP2")
        var tip3 = settings.integerForKey("SETTINGS_TIP3")
        
        TipControl.setTitle("\(tip1)%", forSegmentAtIndex: 0);
        TipControl.setTitle("\(tip2)%", forSegmentAtIndex: 1);
        TipControl.setTitle("\(tip3)%", forSegmentAtIndex: 2);
        
        if (tip1 != 0 && tip2 != 0 && tip3 != 0)
        {
            tipPercentages = [Double(tip1) / 100, Double(tip2) / 100, Double(tip3) / 100]
        }

        calculate()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("view did disappear")
        
        var a = 10
        let closure = { (t1: Int) -> Int in
            t1 + 2
        }
        
        func returnPrintWithValue(value: Int, inputFunc: (Int) -> ()) -> () -> (){
            return { inputFunc(value) }
        }
        
        let print4 = returnPrintWithValue(4) { println($0) }
        print4()
        
        a = 20
        println(closure(10))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func onEditingChanged(sender: AnyObject) {

        calculate()
    }
    
    func calculate() {
        var tipPercent = tipPercentages[TipControl.selectedSegmentIndex]
        
        var billAmount = (BillAmountField.text as NSString).doubleValue
        var tip = billAmount * tipPercent
        var total = billAmount + tip
        
        TipLabel.text = String(format: "$%.2f", tip)
        TotalLabel.text = String(format: "$%.2f", total)
    }
}

