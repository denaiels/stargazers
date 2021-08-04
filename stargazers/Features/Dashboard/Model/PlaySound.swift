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
    //audioPlayer?.stop()
    audioPlayer?.stop()
}

func stopSound2(player: AVAudioPlayer?){
    //audioPlayer?.stop()
    player?.stop()
}





//var player: AVAudioPlayer!
//func playSound2() {
//    let url = Bundle.main.url(forResource: "A", withExtension: "mp3")
//    player = try! AVAudioPlayer(contentsOf: url!)
//    player.play()
//    
//}

