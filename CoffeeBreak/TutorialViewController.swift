//
//  TutorialViewController.swift
//  CoffeeBreak
//
//  Created by Ani Khalili on 5/13/16.
//  Copyright © 2016 Ani Khalili. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    @IBOutlet var doneButtonOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        doneButtonOutlet.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doneButton(sender: AnyObject) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setBool(true, forKey: "completedTutorial")
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
