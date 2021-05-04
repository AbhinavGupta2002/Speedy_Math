//
//  ViewController.swift
//  Speedy Math
//
//  Created by Abhinav Gupta on 20/03/2021.
//

import UIKit
import AVFoundation

class MusicHelper {
    static let sharedHelper = MusicHelper()
    var audioPlayer: AVAudioPlayer?
    
    func playBackgroundMusic(song: String, type: String, loop: Bool) {
        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: song, ofType: type)!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
            if (loop == true) {
                audioPlayer!.numberOfLoops = -1
            } else {
                audioPlayer!.numberOfLoops = 0
            }
            audioPlayer!.prepareToPlay()
            audioPlayer!.play()
        } catch {
            print("Cannot play the file")
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func addition(_ sender: Any) {
        MusicHelper.sharedHelper.playBackgroundMusic(song: "click", type: "wav", loop: false)
    }
    
    @IBAction func subtraction(_ sender: Any) {
        MusicHelper.sharedHelper.playBackgroundMusic(song: "click", type: "wav", loop: false)
    }
    
    @IBAction func multiplication(_ sender: Any) {
        MusicHelper.sharedHelper.playBackgroundMusic(song: "click", type: "wav", loop: false)
    }
    
    @IBAction func division(_ sender: Any) {
        MusicHelper.sharedHelper.playBackgroundMusic(song: "click", type: "wav", loop: false)
    }
    
    @IBAction func mixed(_ sender: Any) {
        MusicHelper.sharedHelper.playBackgroundMusic(song: "click", type: "wav", loop: false)
    }
    

}

