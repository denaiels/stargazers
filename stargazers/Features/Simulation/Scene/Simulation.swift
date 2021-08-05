//
//  Simulation.swift
//  stargazers
//
//  Created by Fabio Sim on 02/08/21.
//

import SpriteKit

class Simulation: ObservableObject {
    
    //  MARK: - Properties
    
    @Published var status = "Hello"
    
    enum Phenomenon {
        case solarEclipse
        case meteorShower
    }
    let phenomenon: Phenomenon
    
    let earthViewScene: SKScene & HasListener
    let solarSystemScene: SKScene & HasPublisher
    
    //  MARK: - Lifecycle Methods
    
    init(phenomenon: Phenomenon) {
        self.phenomenon = phenomenon
        
        let size = UIScreen.main.bounds.size.landscape()
        switch phenomenon {
        case .solarEclipse:
            self.earthViewScene = Eclipse2DScene(size: size)
            self.solarSystemScene = Eclipse3DScene(size: size)
        case .meteorShower:
            self.earthViewScene = MeteorShower2DScene(size: size)
            self.solarSystemScene = MeteorShower3DScene(size: size)
        }
        
        setSimulationDelegate()
    }
    
    private func setSimulationDelegate() {
        solarSystemScene.simulation = self
    }
    
    //  MARK: - Notification Connectors
    
    func notifyEarthView(with value: CGFloat) {
        earthViewScene.notified(of: value)
    }
    
    func notifyViewModel(with value: String) {
        status = value
    }
}

protocol HasListener: AnyObject {
    func notified(of value: CGFloat)
}

protocol HasPublisher: AnyObject {
    var simulation: Simulation? { get set }
}
