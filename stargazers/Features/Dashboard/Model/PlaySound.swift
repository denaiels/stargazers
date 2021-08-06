//
//  PlaySound.swift
//  stargazers
//
//  Created by Dhika Aditya Are on 04/08/21.
//

import Foundation
import AVFoundation

//MARK: Audio Player?

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }
        catch{
            
        }
    }
}



func stopSound(sound: String, type: String){
    audioPlayer?.stop()
}

func stopSound2(player: AVAudioPlayer?){
    player?.stop()
}

