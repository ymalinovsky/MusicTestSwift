//
//  ViewController.swift
//  MusicTest
//
//  Created by Yan Malinovsky on 28.11.16.
//  Copyright © 2016 Yan Malinovsky. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    
    var playPauseBtn: UIBarButtonItem = UIBarButtonItem()
    
    var musicPaused: Bool = false

    @IBOutlet var toolbar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let filePath: String = Bundle.main.path(forResource: "rgb-first", ofType: "mp3")!
        
        let audioPath: URL = URL(fileURLWithPath: filePath)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioPath)
        } catch {
            NSLog("Audio file not found.")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playPause(_ sender: UIBarButtonItem) {
        var items = toolbar.items
        
        if musicPaused == false {
            playPauseBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.pause, target: self, action: "playPause:")
            items![0] = playPauseBtn
            toolbar.setItems(items, animated: true)
            audioPlayer.play()
            musicPaused = true
        } else {
            playPauseBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.play, target: self, action: "playPause:")
            items![0] = playPauseBtn
            toolbar.setItems(items, animated: true)
            audioPlayer.stop()
            musicPaused = false
        }
    }
    
    @IBAction func stopMusic(_ sender: UIBarButtonItem) {
        
    }

}

