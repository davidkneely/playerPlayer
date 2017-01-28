//
//  ViewController.swift
//  playerPlayer
//
//  Created by David Neely on 1/28/17.
//  Copyright © 2017 David Neely. All rights reserved.
//

import UIKit
import AVFoundation
import iOSAudioPlayer

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    
    let audioTracks = ["guitar1", "guitar2", "guitar3", "guitar4", "guitar5", "guitar6", "guitar7"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        initAudioPlayer()
    }
    
    func getRandomTrack(tracks: [String]) -> String {
        
        let randomIndex = arc4random_uniform(UInt32(tracks.count))
        
        let returnString = tracks[Int(randomIndex)]
        
        return returnString
    }
    
    func initAudioPlayer() {
        
        let randomTrack = getRandomTrack(tracks: audioTracks)
        
        do {
            
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: randomTrack, ofType: "mp3")!))
            
            audioPlayer.prepareToPlay()
            
        } catch {
            
            print(error)
        }
    }
    
    func playAudio() {
        audioPlayer.play()
    }
    
    func stopAudio() {
        audioPlayer.stop()
    }
    
    func rewindAudio() {
        audioPlayer.play()
    }

    @IBAction func play(_ sender: Any) {
        
        playAudio()
    }
    @IBAction func stop(_ sender: Any) {
        
        stopAudio()
    }

    @IBAction func rewind(_ sender: Any) {
    }
}

// create an audio player



// allow for buttons that manipulate the audio being played

// play

// pause

// -20 seconds

// speed 1

// speed 2

// bar to scrub forward and backward

// current time

// time duration





    
