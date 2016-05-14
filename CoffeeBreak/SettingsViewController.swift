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
    @IBOutlet var segControlOutlet: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        workIntervalPickerView.delegate = self
        workIntervalPickerView.dataSource = self
        segControlOutlet.tintColor = UIColor(red: 204/255, green: 236/255, blue: 255/255, alpha: 1.0)
        //segControlOutlet.tintColor = UIColor.blackColor()
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
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0: workInterval = 10
        case 1: workInterval = 15
        case 2: workInterval = 20
        default:
            workInterval = 10
        }
    }

    @IBAction func selectActivityInterval(sender: UISegmentedControl) {
        
        let idx : Int = sender.selectedSegmentIndex
        
        switch idx{ 
        case 0:
            activityInterval = 10 //in seconds
        case 1:
            activityInterval = 120 //in seconds
        default:
            activityInterval = 60
        }
    }


}
