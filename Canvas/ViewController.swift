//
//  ViewController.swift
//  Canvas
//
//  Created by Jay Liew on 11/2/16.
//  Copyright © 2016 Jay Liew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var trayView: UIView!
    
    var trayOriginalCenter: CGPoint!
    var trayCenterWhenOpen: CGPoint!
    var trayCenterWhenClosed: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trayCenterWhenOpen = trayView.center
        trayCenterWhenClosed = CGPoint(x: trayView.center.x,
                                       y: trayView.center.y + (
                                        self.trayView.frame.size.height - 40))
        
    }

    @IBAction func onTrayTap(_ sender: AnyObject) {
        if (trayCenterWhenOpen == trayView.center){
            UIView.animate(withDuration: 0.5, // going down
                delay: 0,
                usingSpringWithDamping: 0.5,
                initialSpringVelocity: 0,
                options: .curveEaseIn,
                animations: {
                    self.trayView.center = self.trayCenterWhenClosed
                }, completion: nil)

        }else{
            UIView.animate(withDuration: 0.5, // going up
                delay: 0,
                usingSpringWithDamping: 0.5,
                initialSpringVelocity: 0,
                options: .curveEaseIn,
                animations: {
                    self.trayView.center = self.trayCenterWhenOpen
                }, completion: nil)
        }
    }
    
    @IBAction func onTrayPanGesture(_ sender: UIPanGestureRecognizer) {
        
        let point = sender.location(in: self.view)
        
        if sender.state == .began {
            trayOriginalCenter = trayView.center
            print("Gesture began at: \(point)")
        }else if sender.state == .changed {
            if(sender.velocity(in: trayView).y > 0){
                
                UIView.animate(withDuration: 0.5, // going down
                               delay: 0,
                               usingSpringWithDamping: 0.5,
                               initialSpringVelocity: 0,
                               options: .curveEaseIn,
                               animations: {
                                self.trayView.center = self.trayCenterWhenClosed
                    }, completion: nil)
                
            }else{
                UIView.animate(withDuration: 0.5, // going up
                    delay: 0,
                    usingSpringWithDamping: 0.5,
                    initialSpringVelocity: 0,
                    options: .curveEaseIn,
                    animations: {
                        self.trayView.center = self.trayCenterWhenOpen
                    }, completion: nil)
            }
            
            print("Gesture changed at: \(point)")
        }else if sender.state == .ended {
            print("Gesture ended at: \(point)")
        }
        
    }// on tray pay
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

