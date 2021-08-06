//
//  MeteorShower3DScene.swift
//  stargazers
//
//  Created by Fabio Sim on 02/08/21.
//

import SpriteKit

class MeteorShower3DScene: SKScene, HasPublisher {
    
    let bounds: CGRect
    let sunRadius: CGFloat // Reference length for all other measurements
    
    weak var simulation: Simulation?
    
    //  MARK: - Date Ranges
    
    let lyrids = Date("2021-04-14")...Date("2021-04-30")
    let perseids = Date("2021-07-17")...Date("2021-08-24")
    let geminids = Date("2021-12-04")...Date("2021-12-20")
    
    //  MARK: - Node Properties
    
    var backgroundNode: SKSpriteNode!
    
    var sunNode: SKShapeNode!
    var earthNode: SKSpriteNode!
    
    var pathNode: SKShapeNode!
    
    var lyridsNode: SKSpriteNode!
    var perseidsNode: SKSpriteNode!
    var geminidsNode: SKSpriteNode!
    
    var touchedNode: SKNode?

    //  MARK: - Lifecycle Methods
    
    override init(size: CGSize) {
        self.bounds = CGRect(origin: .zero, size: size)
        self.sunRadius = size.height * 0.07
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        makeBackground()
        makeSun()
        makeEarthPath()

        makeEarth()
        extraSetup()
        
        makeLyrids()
        makePerseids()
        makeGeminids()
        
        setAsteroidBelt(at: -.pi)
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
        sunNode.zPosition = 1
        sunNode.fillColor = .white
        sunNode.strokeColor = .clear
        sunNode.fillTexture = SKTexture(imageNamed: "Sun")
        addChild(sunNode)
    }
        
    func makeEarthPath() {
        let rect = CGSize(width: sunNode.frame.width * 6, height: sunNode.frame.height * 1.4)
        pathNode = SKShapeNode(ellipseOf: rect)
        let visiblePathNode = pathNode.copy() as! SKShapeNode
        visiblePathNode.position = sunNode.position
        visiblePathNode.zPosition = 1
        visiblePathNode.lineWidth = 5
        visiblePathNode.strokeColor = .systemBlue
        addChild(visiblePathNode)
        
        pathNode.name = "EarthPath"
        pathNode.strokeColor = .red
//        addChild(pathNode)
    }
    
    func makeEarth() {
        earthNode = SKSpriteNode(imageNamed: "EarthPoint")
        let ratio = 1.7 * sunRadius / earthNode.size.width
        earthNode.size = CGSize(width: earthNode.size.width * ratio, height: earthNode.size.height * ratio)
        earthNode.name = "Earth"
        earthNode.anchorPoint = CGPoint(x: 0.5, y: 1.05*(earthNode.size.height - earthNode.size.width/2)/earthNode.size.height)
        earthNode.zPosition = 2
        addChild(earthNode)
    }
    
    func extraSetup() {
        pathNode.position = CGPoint(x: sunNode.position.x, y: sunNode.position.y + earthNode.size.height - earthNode.size.width / 2)
        earthNode.position = getPathPoint(for: -.pi)
    }
    
    func makeLyrids() {
        lyridsNode = SKSpriteNode(imageNamed: "LyridsBelt")
        lyridsNode.position = CGPoint(x: bounds.maxX * 0.5, y: bounds.maxY * 0.65)
        let ratio = 15 * sunRadius / lyridsNode.size.width
        lyridsNode.size = CGSize(width: lyridsNode.size.width * ratio, height: lyridsNode.size.height * ratio)
        addChild(lyridsNode)
    }
    
    func makePerseids() {
        perseidsNode = SKSpriteNode(imageNamed: "PerseidsBelt")
        perseidsNode.position = CGPoint(x: bounds.maxX * 0.3, y: bounds.maxY * 0.4)
        let ratio = 20 * sunRadius / perseidsNode.size.width
        perseidsNode.size = CGSize(width: perseidsNode.size.width * ratio, height: perseidsNode.size.height * ratio)
        addChild(perseidsNode)
    }
    
    func makeGeminids() {
        geminidsNode = SKSpriteNode(imageNamed: "GeminidsBelt")
        geminidsNode.position = CGPoint(x: bounds.maxX * 0.5, y: bounds.maxY * 0.6)
        let ratio = 10 * sunRadius / geminidsNode.size.width
        geminidsNode.size = CGSize(width: geminidsNode.size.width * ratio, height: geminidsNode.size.height * ratio)
        addChild(geminidsNode)
    }
    
    //  MARK: - Node Manipulation Methods
    
    func setAsteroidBelt(at angle: CGFloat) {
        lyridsNode.alpha = 0
        perseidsNode.alpha = 0
        geminidsNode.alpha = 0
        
        let date = getDate(from: angle)
        switch date {
        case lyrids:
            lyridsNode.alpha = 1
        case perseids:
            perseidsNode.alpha = 1
        case geminids:
            geminidsNode.alpha = 1
        default:
            return
        }
    }
    
    //  MARK: - Touch Handlers
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNodes = nodes(at: location)
            touchedNode = touchedNodes.first(where: { $0.name == "Earth" })
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let node = touchedNode {
            let location = touch.location(in: self)
            let angle = getAngle(for: location)
            let pathPoint = getPathPoint(for: angle)
            node.position = pathPoint
            setAsteroidBelt(at: angle)
            simulation?.notifyEarthView(with: angle)
            simulation?.notifyViewModel(with: getDateString(from: angle))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchedNode = nil
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchedNode = nil
    }
}

//  MARK: - Path Mathematics

extension MeteorShower3DScene {
    private func getAngle(for touchLocation: CGPoint) -> CGFloat {
        atan2(touchLocation.y - pathNode.position.y, touchLocation.x - pathNode.position.x)
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

//  MARK: - ViewModel Utilities

extension MeteorShower3DScene {
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

extension Date {
    init(_ dateString: String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
//        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval: 0, since: date)
    }
}
