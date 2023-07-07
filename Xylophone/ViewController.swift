//
//  ViewController.swift
//  Xylophone
//
//  Created by Hakan Koraltürk on 8.07.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playSound(sound: String) {
        
        let url = Bundle.main.url(forResource: sound, withExtension: "wav")
        do {
            
            /* All time playing, silent or no silent */
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            audioPlayer = try! AVAudioPlayer(contentsOf: url!)
            audioPlayer.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func pressedKey(_ sender: UIButton) {
        
        playSound(sound: sender.currentTitle!)
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1.0
        }
    }
}

