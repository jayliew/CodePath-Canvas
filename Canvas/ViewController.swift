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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onTrayPanGesture(_ sender: UIPanGestureRecognizer) {
        
        let point = sender.location(in: self.view)
        
        if sender.state == .began {
            trayOriginalCenter = trayView.center
            print("Gesture began at: \(point)")
        }else if sender.state == .changed {
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + sender.translation(in: self.view).y)
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

