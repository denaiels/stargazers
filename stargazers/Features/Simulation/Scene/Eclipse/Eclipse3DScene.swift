//
//  Eclipse3DScene.swift
//  EclipseTest
//
//  Created by Fabio Sim on 28/07/21.
//

import SpriteKit

class Eclipse3DScene: SKScene, HasPublisher {
    
    let bounds: CGRect
    let earthRadius: CGFloat // Reference length for all other measurements
    
    weak var simulation: Simulation?

    //  MARK: - Node Properties
    
    var backgroundNode: SKSpriteNode!
    
    var sunNode: SKShapeNode!
    var earthNode: SKShapeNode!
    var moonNode: SKShapeNode!
    
    var pathNode: SKShapeNode!
    
    var touchedNode: SKNode?
    
    //  MARK: - Lifecycle Methods
    
    override init(size: CGSize) {
        self.bounds = CGRect(origin: .zero, size: size)
        self.earthRadius = size.height * 0.1
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        makeBackground()
        makeSun()
        makeEarth()
        makeMoon()
        
        makeMoonPath()
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
        sunNode = SKShapeNode(circleOfRadius: earthRadius * 4)
        sunNode.name = "Sun"
        sunNode.position = CGPoint(x: bounds.minX - earthRadius * 2, y: bounds.midY)
        sunNode.zPosition = 1
        sunNode.fillColor = .white
        sunNode.strokeColor = .clear
        sunNode.fillTexture = SKTexture(imageNamed: "Sun")
        addChild(sunNode)
    }
    
    func makeEarth() {
        earthNode = SKShapeNode(circleOfRadius: earthRadius)
        earthNode.name = "Earth"
        earthNode.position = CGPoint(x: 0.7 * bounds.maxX, y: bounds.midY)
        earthNode.zPosition = 1
        earthNode.fillColor = .white
        earthNode.strokeColor = .clear
        earthNode.fillTexture = SKTexture(imageNamed: "Earth")
        addChild(earthNode)
    }
    
    func makeMoon() {
        moonNode = SKShapeNode(circleOfRadius: earthRadius * 0.3)
        moonNode.name = "Moon"
        moonNode.position = CGPoint(x: 0.7 * bounds.maxX, y: bounds.midY - earthRadius * 0.3)
        moonNode.zPosition = 1.5
        moonNode.fillColor = .white
        moonNode.strokeColor = .clear
        moonNode.fillTexture = SKTexture(imageNamed: "Moon")
        setMoonProperties()
        addChild(moonNode)
    }
    
    func makeMoonPath() {
        let rect = CGSize(width: earthNode.frame.width * 2.3, height: earthNode.frame.height * 0.3)
        pathNode = SKShapeNode(ellipseOf: rect)
        pathNode.name = "MoonPath"
        pathNode.position = earthNode.position
        pathNode.zPosition = 2
        pathNode.strokeColor = .red
        addChild(pathNode)
    }
    
    //  MARK: - Node Manipulation Methods
    
    func setMoonProperties() {
        let angle = getAngle(for: moonNode.position)
        moonNode.setScale(1 - 0.2 * sin(angle))
        moonNode.zPosition = angle < 0 ? 1.5 : 0.5
    }
    
    //  MARK: - Touch Handlers
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNodes = nodes(at: location)
            touchedNode = touchedNodes.first(where: { $0.name == "Moon" })
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let node = touchedNode {
            let location = touch.location(in: self)
            let angle = getAngle(for: location)
            let pathPoint = getPathPoint(for: angle)
            node.position = pathPoint
            simulation?.notifyEarthView(with: angle)
            setMoonProperties()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchedNode = nil
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchedNode = nil
    }
    
    //  MARK: - Notification Handlers
    
    func positionNotified(_ positionRatio: CGFloat) {
        let m = (2.75 - CGFloat.pi) / (1 - 0.5) // Linear Gradient
        switch positionRatio {
        case 0.5...1:
            moonNode.position = getPathPoint(for: CGFloat.pi + m * (positionRatio - 0.5))
        case 0...0.5:
            moonNode.position = getPathPoint(for: -CGFloat.pi + m * (positionRatio - 0.5))
        default:
            return
        }
        setMoonProperties()
    }
}

//  MARK: - Path Mathematics

extension Eclipse3DScene {
    private func getAngle(for touchLocation: CGPoint) -> CGFloat {
        atan2(touchLocation.y - earthNode.position.y, touchLocation.x - earthNode.position.x)
    }
    
    private func getPathPoint(for angle: CGFloat) -> CGPoint {
        let a = pathNode.frame.width / 2
        let b = pathNode.frame.height / 2
        
        var x = sqrt(1.0 / (1.0 / pow(a, 2) + pow(tan(angle) / b, 2)))
        var y = abs(tan(angle)) * x
        
        switch angle {
        case 0...(CGFloat.pi/2):
            break
        case (CGFloat.pi/2)...CGFloat.pi:
            x = -x
        case (-CGFloat.pi)...(-CGFloat.pi/2):
            x = -x
            y = -y
        case (-CGFloat.pi/2)...0:
            y = -y
        default:
            break
        }
                
        return CGPoint(x: x + pathNode.position.x, y: y + pathNode.position.y)
    }
}
