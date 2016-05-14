//
//  ATimerViewController.swift
//  CoffeeBreak
//
//  Created by Ani Khalili on 5/13/16.
//  Copyright © 2016 Ani Khalili. All rights reserved.
//

import UIKit
import CoreMotion

class ATimerViewController: UIViewController {
    
    @IBOutlet var workTimerLabel: UILabel!
    @IBOutlet var activityTimerLabel: UILabel!
    
    //for work state
    var workTimer = NSTimer()
    var workSeconds : Int = 0
    
    //for activity state
    var activityTimer = NSTimer()
    var activitySeconds : Int = 0
    
    var accelerationZ : Double = 0.0
    var movementManager = CMMotionManager()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        // Do any additional setup after loading the view.
        movementManager.accelerometerUpdateInterval = 0.1
        
        //Start Tracking Accelerometer
        //        movementManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!) { (accelerometerData: CMAccelerometerData?, NSError) -> Void in
        //            self.accelerationZ = accelerometerData!.acceleration.z
        //            self
        //            if(NSError != nil) {
        //                print("\(NSError)")
        //            }
        //        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func startButton(sender: AnyObject) {
        
        movementManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!) { (accelerometerData: CMAccelerometerData?, NSError) -> Void in
            self.accelerationZ = accelerometerData!.acceleration.z
            self
            if(NSError != nil) {
                print("\(NSError)")
            }
        }
        
        
    }
    
    
    func startActivityTimer(){
        activityTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: ("updateActivityTimer"), userInfo: nil, repeats: true)
    }
    
    func updateActivityTimer(){
        if (fabs(self.accelerationZ) > 1.0) && (activitySeconds < 5){
            activitySeconds = activitySeconds + 1
            activityTimerLabel.text = "\(activitySeconds)"
        }
        if(activitySeconds >= 5){
            //stop this timer
            activityTimer.invalidate()
            activityTimerLabel.text = "Good Job";
        }
    }
    
    func startWorkTimer(){
        workTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: ("updateWorkTimer"), userInfo: nil, repeats: true)
    }
    
    func updateWorkTimer(){
        if (workSeconds < 10){
            
            workSeconds = workSeconds + 1
            workTimerLabel.text = "\(workSeconds)"
        }
        else if (workSeconds >= 10){
            workTimer.invalidate()
            workTimerLabel.text = "Take a break!!"
            startActivityTimer()
            
            //call reminder for user the take break
        }
    }

    



}
