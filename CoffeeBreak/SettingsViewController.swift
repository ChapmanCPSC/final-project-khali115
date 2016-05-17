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
        segControlOutlet.tintColor = UIColor.whiteColor()
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
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0: workInterval = 3600
        case 1: workInterval = 7200
        case 2: workInterval = 10800
        default:
            workInterval = 3600
        }
    }
    
    //reference:http://stackoverflow.com/questions/29243564/change-uipicker-color-swift
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = "\(reminderIntervals[row]) Hour(s)"
        var myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 20.0)!,NSForegroundColorAttributeName:UIColor.whiteColor()])
        return myTitle
    }

    @IBAction func selectActivityInterval(sender: UISegmentedControl) {
        
        let idx : Int = sender.selectedSegmentIndex
        
        switch idx{ 
        case 0:
            activityInterval = 60 //in seconds
        case 1:
            activityInterval = 120 //in seconds
        default:
            activityInterval = 60
        }
    }


}
