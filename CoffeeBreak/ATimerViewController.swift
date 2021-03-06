//
//  ATimerViewController.swift
//  CoffeeBreak
//
//  Created by Ani Khalili on 5/13/16.
//  Copyright © 2016 Ani Khalili. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation
import AudioToolbox

class ATimerViewController: UIViewController {
    
    @IBOutlet var workTimerLabel: UILabel!
    @IBOutlet var activityTimerLabel: UILabel!
    @IBOutlet var stopButtonOutlet: UIButton!
    @IBOutlet var startButtonOutlet: UIButton!
    
    @IBOutlet var settingsNavButton: UIBarButtonItem!
    //for work state
    var workTimer = NSTimer()
    var workSeconds : Int = 0
    //var workInterval :Int = 10 //value in seconds default will be 3600
    
    //for activity state
    var activityTimer = NSTimer()
    var activitySeconds : Int = 0
    //var activityInterval : Int = 5 //value in seconds default will be 1 minute
    
    var accelerationZ : Double = 0.0
    var movementManager = CMMotionManager()


    override func viewDidLoad() {
        super.viewDidLoad()

        movementManager.accelerometerUpdateInterval = 0.1
        
        //Start Tracking Accelerometer
        print("Line 35")
                movementManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!) { (accelerometerData: CMAccelerometerData?, NSError) -> Void in
                    self.accelerationZ = accelerometerData!.acceleration.z
                    self
                    if(NSError != nil) {
                        print("\(NSError)")
                    }
                }
        print("Line 43")
        stopButtonOutlet.enabled = false
        startButtonOutlet.layer.cornerRadius = 10
        stopButtonOutlet.layer.cornerRadius = 10
        workTimerLabel.layer.cornerRadius = 10
        workTimerLabel.layer.masksToBounds = true
        activityTimerLabel.layer.cornerRadius = 10
        activityTimerLabel.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let viewedTutorial = userDefaults.boolForKey("completedTutorial")
        
        if !viewedTutorial
        {
            let tutorialVC = self.storyboard!.instantiateViewControllerWithIdentifier("tutorialView")
            self.presentViewController(tutorialVC, animated: true, completion: nil)
        }

    }
    
    
    @IBAction func startButton(sender: UIButton) {
        print("Line 53")
        workTimerLabel.text = formatTime(activitySeconds)
        activityTimerLabel.text = formatTime(workSeconds)
        sender.enabled = false
        stopButtonOutlet.enabled = true
        settingsNavButton.enabled = false
        startWorkTimer()
    }
    
    @IBAction func stopButton(sender: UIButton) {
        if activityTimer.valid{
            activityTimer.invalidate()
        }
        if workTimer.valid{
            workTimer.invalidate()
        }
        
        activitySeconds = 0
        workSeconds = 0
        
        workTimerLabel.text = "Stopped Session"
        activityTimerLabel.text = "Stopped Session"
        startButtonOutlet.enabled = true
        settingsNavButton.enabled = true
        
    }
    
    func startActivityTimer(){
        print("Line 64")
        activityTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: ("updateActivityTimer"), userInfo: nil, repeats: true)
        playSound(1304)
    }
    
    func updateActivityTimer(){
        print("Line 69")
        if (fabs(self.accelerationZ) > 1.0) && (activitySeconds < activityInterval){
            activitySeconds = activitySeconds + 1
            activityTimerLabel.text = formatTime(activitySeconds)
        }
        
        if(activitySeconds >= activityInterval){
            //stop this timer
            activityTimer.invalidate()
            activityTimerLabel.text = "Good Job";
            playSound(1331)
            restartTiming()
            startButtonOutlet.enabled = true
            settingsNavButton.enabled = true
        }
    }
    
    func startWorkTimer(){
        print("Line 82")
        workTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: ("updateWorkTimer"), userInfo: nil, repeats: true)
    }
    
    func updateWorkTimer(){
        print("Line 87")
        if (workSeconds < workInterval){
            
            workSeconds = workSeconds + 1
            workTimerLabel.text = formatTime(workSeconds)
        }
        else if (workSeconds >= workInterval){
            workTimer.invalidate()
            workTimerLabel.text = "Take a break!!"
            startActivityTimer()
            
            //call reminder for user the take break
        }
    }
    
    func formatTime(t : Int) -> String{
        
        let hours = t / 3600
        let minutes = t / 60 % 60
        let seconds = t % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    func playSound(soundID : Int){
        AudioServicesPlayAlertSound(SystemSoundID(soundID))
    }
    
    func restartTiming(){
        activitySeconds = 0
        workSeconds = 0
        //activityTimerLabel.text = formatTime(activitySeconds)
        //workTimerLabel.text = formatTime(workSeconds)
    }

}
