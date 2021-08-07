//
//  MeteorShower2DScene.swift
//  stargazers
//
//  Created by Fabio Sim on 02/08/21.
//

import AVFoundation
import SpriteKit

class MeteorShower2DScene: SKScene, HasListener {
    
    let bounds: CGRect
    var runOnce = false
    
    //  MARK: - Date Ranges
    
    let lyrids = Date("2021-04-14")...Date("2021-04-30")
    let perseids = Date("2021-07-17")...Date("2021-08-24")
    let geminids = Date("2021-12-04")...Date("2021-12-20")
    
    //  MARK: - Node Properties
    
    var backgroundNode: SKSpriteNode!
    
    var perseidsNode: SKVideoNode!
    var perseidsPlayer: AVPlayer!
    
    var geminidsNode: SKVideoNode!
    var geminidsPlayer: AVPlayer!
    
    var lyridsNode: SKVideoNode!
    var lyridsPlayer: AVPlayer!
    
    //  MARK: - Lifecycle Methods
    
    override init(size: CGSize) {
        self.bounds = CGRect(origin: .zero, size: size)
        super.init(size: size)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: perseidsPlayer.currentItem)
        NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: geminidsPlayer.currentItem)
        NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: lyridsPlayer.currentItem)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        if runOnce == false {
            makeBackground()
            makePerseids()
            makeGeminids()
            makeLyrids()
            runOnce = true
        }
    }
    
    //  MARK: - Node Creation Methods
    
    func makeBackground() {
        backgroundNode = SKSpriteNode(imageNamed: "EmptySky")
        backgroundNode.size = size
        backgroundNode.position = CGPoint(x: bounds.midX, y: bounds.midY)
        backgroundNode.zPosition = 0
        addChild(backgroundNode)
    }
    
    func makeVideoPlayer(named filename: String) -> AVPlayer {
        let player = AVPlayer(url: Bundle.main.url(forResource: filename, withExtension: "mp4")!)
        player.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: .AVPlayerItemDidPlayToEndTime,
                                               object: player.currentItem)
        return player
    }
    
    func makePerseids() {
        perseidsPlayer = makeVideoPlayer(named: "Perseids")
        
        perseidsNode = SKVideoNode(avPlayer: perseidsPlayer)
        perseidsNode.size = size
        perseidsNode.position = CGPoint(x: bounds.midX, y: bounds.midY)
        perseidsNode.zPosition = -1
        addChild(perseidsNode)
        perseidsNode.play()
    }
    
    func makeGeminids() {
        geminidsPlayer = makeVideoPlayer(named: "Geminids")
        
        geminidsNode = SKVideoNode(avPlayer: geminidsPlayer)
        geminidsNode.size = size
        geminidsNode.position = CGPoint(x: bounds.midX, y: bounds.midY)
        geminidsNode.zPosition = -1
        addChild(geminidsNode)
        geminidsNode.play()
    }
    
    func makeLyrids() {
        lyridsPlayer = makeVideoPlayer(named: "Lyrids")
        
        lyridsNode = SKVideoNode(avPlayer: lyridsPlayer)
        lyridsNode.size = size
        lyridsNode.position = CGPoint(x: bounds.midX, y: bounds.midY)
        lyridsNode.zPosition = -1
        addChild(lyridsNode)
        lyridsNode.play()
    }
    
    @objc private func playerItemDidReachEnd(notification: Notification) {
        if let playerItem = notification.object as? AVPlayerItem {
            playerItem.seek(to: .zero, completionHandler: nil)
        }
    }
    
    //  MARK: - Notification Handlers
    
    func notified(of value: CGFloat) { // angle
        lyridsNode.zPosition = -1
        perseidsNode.zPosition = -1
        geminidsNode.zPosition = -1
        
        let date = getDate(from: value)
        switch date {
        case lyrids:
            lyridsNode.zPosition = 1
        case perseids:
            perseidsNode.zPosition = 1
        case geminids:
            geminidsNode.zPosition = 1
        default:
            return
        }
    }
}

//  MARK: - ViewModel Utilities

extension MeteorShower2DScene {
    func getDate(from angle: CGFloat) -> Date {
        let m = 365 / (2 * CGFloat.pi) // Linear Gradient
        let ordinalDate = ceil(m * (angle + .pi))
        
        var components = DateComponents()
        components.day = Int(ordinalDate)
        components.year = 2021 // Not leap year
        
        let date = Calendar.current.date(from: components)!
        return date
    }
    
    func getDateString(from angle: CGFloat) -> String {
        let date = getDate(from: angle)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM"
        
        return dateFormatter.string(from: date)
    }
}
