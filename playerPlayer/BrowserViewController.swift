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
    
    var labelText: String = ""
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        textLabel.text = labelText

    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        var destViewController: ViewController = segue.destination as! ViewController
//        
//
//    }

}
 
