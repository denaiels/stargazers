//
//  Eclipse2DScene.swift
//  EclipseTest
//
//  Created by Fabio Sim on 21/07/21.
//

import SpriteKit
import CoreImage
import CoreImage.CIFilterBuiltins

class Eclipse2DScene: SKScene, HasListener {
    
    let bounds: CGRect
    let sunRadius: CGFloat // Reference length for all other measurements
    
//    weak var simulation: Simulation?
    
    //  MARK: - Node Properties
    
    var backgroundNode: SKSpriteNode!
    
    var sunNode: SKShapeNode!
    
    var sunBeamsGenerator = CIFilter.sunbeamsGenerator()
    var sunBeamsNode: SKSpriteNode!

    var moonNode: SKShapeNode!
    
//    var touchedNode: SKNode?
    
    //  MARK: - Lifecycle Methods
    
    override init(size: CGSize) {
        self.bounds = CGRect(origin: .zero, size: size)
        self.sunRadius = size.height * 0.2
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {        
        makeBackground()
        makeSun()
        makeMoon()
        
        makeSunBeamsGenerator()
        makeSunBeams()
//        animateSunBeams() // Heavy preview load, comment out during development
    }
        
    //  MARK: - Node Creation Methods
    
    func makeBackground() {
        backgroundNode = SKSpriteNode(imageNamed: "Stars")
        backgroundNode.size = size
        backgroundNode.position = CGPoint(x: bounds.midX, y: bounds.midY)
        backgroundNode.zPosition = -1
        addChild(backgroundNode)
    }
    
    func makeSun() {
        sunNode = SKShapeNode(circleOfRadius: sunRadius)
        sunNode.name = "Sun"
        sunNode.position = CGPoint(x: bounds.midX, y: bounds.midY)
        sunNode.fillColor = UIColor(named: "SunColor")!
        
        let sun = SKEffectNode()
        sun.zPosition = 0.3
        let edgeBlur = CIFilter.gaussianBlur()
        edgeBlur.radius = 7
        sun.filter = edgeBlur
        sun.addChild(sunNode.copy() as! SKNode)
        sun.shouldRasterize = true
        
        let yellowBlur = SKEffectNode()
        yellowBlur.zPosition = 0.2
        let yellowBlurFilter = CIFilter.gaussianBlur()
        yellowBlurFilter.radius = Float(sunRadius * 0.6)
        yellowBlur.filter = yellowBlurFilter
        yellowBlur.addChild(sunNode.copy() as! SKNode)
        yellowBlur.shouldRasterize = true
        
        let redSun = SKShapeNode(circleOfRadius: sunRadius * 1.5)
        redSun.position = CGPoint(x: bounds.midX, y: bounds.midY)
        redSun.fillColor = UIColor(named: "FlareColor")!
        
        let redBlur = SKEffectNode()
        redBlur.zPosition = 0.1
        let redBlurFilter = CIFilter.gaussianBlur()
        redBlurFilter.radius = Float(sunRadius)
        redBlur.filter = redBlurFilter
        redBlur.addChild(redSun)
        redBlur.shouldRasterize = true
        
        addChild(sun)
        addChild(yellowBlur)
        addChild(redBlur)
    }
    
    func makeSunBeamsGenerator() {
//        sunBeamsGenerator.center = CGPoint.zero
//        sunBeamsGenerator.color = CIColor(color: UIColor(named: "FlareColor")!)
        sunBeamsGenerator.maxStriationRadius = Float(sunRadius * 0.08)
//        sunBeamsGenerator.striationContrast = 1
//        sunBeamsGenerator.striationStrength = 1
//        sunBeamsGenerator.sunRadius = 30
//        sunBeamsGenerator.time = 0
    }
    
    func makeSunBeams() {
        let beamImage = sunBeamsGenerator.outputImage!
        let cgImage = CIContext().createCGImage(beamImage, from: beamImage.extent)!
        
        sunBeamsNode = SKSpriteNode(texture: SKTexture(image: UIImage(cgImage: cgImage)))
        sunBeamsNode.position = CGPoint(x: bounds.midX, y: bounds.midY)
        setSunBeamsAlpha()
        addChild(sunBeamsNode)
    }
    
    func makeMoon() {
        let moonRadius = sunRadius - 1
        moonNode = SKShapeNode(circleOfRadius: moonRadius)
        moonNode.name = "Moon"
        moonNode.position = CGPoint(x: 0.5 * bounds.maxX, y: bounds.midY)
        moonNode.zPosition = 1
        moonNode.fillColor = .gray
        moonNode.strokeColor = .clear
        moonNode.fillTexture = SKTexture(imageNamed: "Moon")
        addChild(moonNode)
        setMoonFill()
    }
    
    //  MARK: - Node Manipulation Methods
    
    func animateSunBeams() {
        var elapsedTime: Float = 0
        run(.repeatForever(.sequence([
            .customAction(withDuration: 0, actionBlock: { [unowned self] _,_ in
                elapsedTime = (elapsedTime + 0.0005).truncatingRemainder(dividingBy: 2 * .pi)
                sunBeamsGenerator.time = 0.5 * sin(elapsedTime) + 0.5
                sunBeamsNode.removeFromParent()
                makeSunBeams()
            }),
            .wait(forDuration: 0.01)
        ])))
    }
    
    func setSunBeamsAlpha() {
        let distanceSunMoon = distanceSunMoon
        switch distanceSunMoon {
        case ..<(sunRadius / 3):
            sunBeamsNode.alpha = 1 - distanceSunMoon / (sunRadius / 3)
        default:
            sunBeamsNode.alpha = 0
        }
    }
    
    func setMoonFill() {
        let distanceSunMoon = distanceSunMoon
        switch distanceSunMoon {
        case ..<(sunRadius*2):
            moonNode.fillColor = UIColor(white: 0.1 + 0.4 * distanceSunMoon / (sunRadius*2), alpha: 1)
        default:
            moonNode.fillColor = .gray
        }
    }
    
    //  MARK: - Touch Handlers
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touch = touches.first {
//            let location = touch.location(in: self)
//            let touchedNodes = nodes(at: location)
//            touchedNode = touchedNodes.first(where: { $0.name == "Moon" })
//        }
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touch = touches.first, let node = touchedNode {
//            let location = touch.location(in: self)
//            node.position.x = location.x
////            coordinator?.notify3D(of: location.x / bounds.maxX)
//            setMoonFill()
//            setSunBeamsAlpha()
//        }
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        touchedNode = nil
//    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        touchedNode = nil
//    }
    
    //  MARK: - Notification Handlers
    
    func notified(of angle: CGFloat) {
        let m = (bounds.maxX - bounds.midX) / (2.75 - CGFloat.pi) // Linear Gradient
        switch angle {
        case 2.5...CGFloat.pi:
            moonNode.position.x = bounds.midX + m * (angle - CGFloat.pi)
        case (-CGFloat.pi)...(-2.5):
            moonNode.position.x = bounds.midX + m * (angle + CGFloat.pi)
        default:
            return
        }
        setMoonFill()
        setSunBeamsAlpha()
    }
}

//  MARK: - Utilities

extension Eclipse2DScene {
    private var distanceSunMoon: CGFloat {
        sqrt(pow(moonNode.position.x - sunNode.position.x, 2) + pow(moonNode.position.y - sunNode.position.y, 2))
    }
}
