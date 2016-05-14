//
//  SettingsViewController.swift
//  CoffeeBreak
//
//  Created by Ani Khalili on 5/13/16.
//  Copyright © 2016 Ani Khalili. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    //hours
    let reminderIntervals = ["1", "2", "3"]
    
    //minutes
    let breakIntervals = [1,2]
    
    @IBOutlet var workIntervalPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        workIntervalPickerView.delegate = self
        workIntervalPickerView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return reminderIntervals.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return "\(reminderIntervals[row]) Hour(s)"
    }



}
