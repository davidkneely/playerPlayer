//
//  ViewController.swift
//  playerPlayer
//
//  Created by David Neely on 1/28/17.
//  Copyright © 2017 David Neely. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var playPauseButton: UIButton!
    
    @IBOutlet weak var oneSpeedTwoSpeedButton: UIButton!
    
    @IBOutlet weak var timeElapsed: UILabel!
    
    @IBOutlet weak var totalTime: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    var audioPlayer = AVAudioPlayer()
    
    let audioTracks = ["guitar1", "guitar2", "guitar3", "guitar4", "guitar5", "guitar6", "guitar7"]
    
    let chapterImages = ["branches.png",
                         "bust.png",
                         "peace.png"]
    
    func getRandomImageStringFrom(images: [String]) -> String {
        
        let randomIndex = arc4random_uniform(UInt32(images.count))
        
        let returnString = images[Int(randomIndex)]
        
        return returnString
    }
    
    func changeImage() {
        
        imageView.image = UIImage.init(named: getRandomImageStringFrom(images: chapterImages))
        
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        
    }
    
    func audioPlayerDidFinishPlaying(_: AVAudioPlayer, successfully: Bool) {
        
        audioPlayer.stop()
        
        playPauseButton.setImage(UIImage(named: "play.png"), for: UIControlState.normal)
        
        updateLabelsAndSlider()
        
        
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        initAudioPlayer()
        
        initSlider()
        
        changeImage()
    }
    
    func getRandomTrackFrom(tracks: [String]) -> String {
        
        let randomIndex = arc4random_uniform(UInt32(tracks.count))
        
        let returnString = tracks[Int(randomIndex)]
        
        return returnString
    }
    
    func initSlider() {
        
        slider.tintColor = UIColor.red
        
        slider.thumbTintColor = UIColor.green
        
        slider.maximumTrackTintColor = UIColor.cyan
        
        slider.minimumTrackTintColor = UIColor.black
    }
    
    func initChapterMarkersAndImages() {
        
        // creates array of images
    }
    
    func updateLabelsAndSlider() {
        
        slider.value = Float(audioPlayer.currentTime)
        
        totalTime.text = "\(Int(audioPlayer.duration)):00"
        
        timeElapsed.text = "\(Int(audioPlayer.currentTime)):00"
        
        //        totalTime.text = "\(getTimeFrom(float: Float(audioPlayer.duration)))"
        //
        //        timeElapsed.text = "\(getTimeFrom(float: Float(audioPlayer.currentTime)))"
    }
    
    func updateTime(_ timer: Timer) {
        
        updateLabelsAndSlider()
    }
    
    func initAudioPlayer() {
        
        let randomTrack = getRandomTrackFrom(tracks: audioTracks)
        
        do {
            
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: randomTrack, ofType: "mp3")!))
            
            audioPlayer.prepareToPlay()
            
            audioPlayer.enableRate = true
            
            audioPlayer.delegate = self
            
            slider.maximumValue = Float(audioPlayer.duration)
            
            slider.value = 0.0
            
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
            
        } catch {
            
            print(error)
        }
        
        
    }
    
    func rewindAudio() {
        
        var currentPosition = audioPlayer.currentTime
        
        if(currentPosition < 20) {
            
            currentPosition = 0
            
        } else {
            
            currentPosition = currentPosition - 20
        }
        
        audioPlayer.currentTime = currentPosition

        audioPlayer.play()
    }
    
    func getTimeFrom(float: Float) -> String {
        
        let timeInInts = Int(float)
        
        let timeInMinutes = timeInInts / 60
        
        return "\(timeInMinutes)"
    }
    
    @IBAction func playPause(_ sender: Any) {
        
        if (audioPlayer.isPlaying == true) {
            
            audioPlayer.stop()
            
            playPauseButton.setImage(UIImage(named: "play.png"), for: UIControlState.normal)
            
        } else {
            
            audioPlayer.play()
            
            playPauseButton.setImage(UIImage(named: "pause.png"), for: UIControlState.normal)
        }
        
        totalTime.text = "\(audioPlayer.duration)"
        
        timeElapsed.text = "\(audioPlayer.currentTime)"
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
    
    @IBAction func rewindBy20Seconds(_ sender: Any) {
        
        rewindAudio()
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        
        audioPlayer.currentTime = TimeInterval(slider.value)
    }
}
