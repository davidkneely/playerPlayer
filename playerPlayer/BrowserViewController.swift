//
//  BrowserViewController.swift
//  playerPlayer
//
//  Created by David Neely on 1/28/17.
//  Copyright © 2017 David Neely. All rights reserved.
//

import Foundation

import UIKit

import AVFoundation

class BrowserViewController: UIViewController {
    
    @IBOutlet weak var miniPlayer: UIView!
    
    var labelText: String = ""
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        textLabel.text = labelText

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let currentX = miniPlayer.frame.origin.x
        
        let currentY = miniPlayer.frame.origin.x
        
        let updatedY = currentY + 100
        
        miniPlayer.frame = CGRect(x: currentX, y: updatedY, width: miniPlayer.frame.width, height: miniPlayer.frame.height)

        // move up the view
        
        let options = UIViewAnimationOptions.curveEaseOut
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: options, animations: {
            
            self.miniPlayer.frame = CGRect(x: currentX, y: currentY, width: self.miniPlayer.frame.width, height: self.miniPlayer.frame.height)
            
        }, completion: { animationFinished in
            
            
        })

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var destViewController: ViewController = segue.destination as! ViewController
        

    }

}
 
