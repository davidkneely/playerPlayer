//
//  ViewController.swift
//  playerPlayer
//
//  Created by David Neely on 1/28/17.
//  Copyright © 2017 David Neely. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var playPauseButton: UIButton!
    
    @IBOutlet weak var oneSpeedTwoSpeedButton: UIButton!
    
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
            
            audioPlayer.enableRate = true
            
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
    
    func nextAudio() {
        
        stopAudio()
        
        let randomTrack = getRandomTrack(tracks: audioTracks)
        
        do {
            
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: randomTrack, ofType: "mp3")!))
            
            audioPlayer.prepareToPlay()
            
        } catch {
            
            print(error)
        }
        
        playAudio()
    }
    
    func rewindAudio() {
        
        print("currentTime: " + "\(audioPlayer.currentTime)")
        
        var currentPosition = audioPlayer.currentTime
        
        if(currentPosition < 20) {
            
            currentPosition = 0
            
        } else {
            
            currentPosition = currentPosition - 20
        }
        
        audioPlayer.currentTime = currentPosition
        
        print("currentTime: " + "\(audioPlayer.currentTime)")
        
        audioPlayer.play()
    }

    @IBAction func play(_ sender: Any) {
        
        playAudio()
    }
    
    @IBAction func stop(_ sender: Any) {
        
        stopAudio()
    }

    @IBAction func rewind(_ sender: Any) {
        
        rewindAudio()
    }
    
    @IBAction func next(_ sender: Any) {
        
        nextAudio()
    }
    
    @IBAction func playPauseB(_ sender: Any) {
        
        if (audioPlayer.isPlaying == true) {
            
            audioPlayer.stop()
            
            playPauseButton.setImage(UIImage(named: "play.png"), for: UIControlState.normal)
            
        } else {
            
            audioPlayer.play()
            
            playPauseButton.setImage(UIImage(named: "pause.png"), for: UIControlState.normal)
        }
    }
    
    @IBAction func oneSpeedTwoSpeed(_ sender: Any) {
        
        if (audioPlayer.rate == 1.0) {
            
            audioPlayer.rate = 2.0
            
            oneSpeedTwoSpeedButton.setImage(UIImage(named: "2x.png"), for: UIControlState.normal)
            
        } else {
            
            audioPlayer.rate = 1.0
            
            oneSpeedTwoSpeedButton.setImage(UIImage(named: "1x.png"), for: UIControlState.normal)
        }
        
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





    
