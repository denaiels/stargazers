//
//  Simulation.swift
//  stargazers
//
//  Created by Fabio Sim on 02/08/21.
//

import SpriteKit

class Simulation: ObservableObject {
    
    //  MARK: - Properties
    
    @Published private(set) var status = "01 January"
    @Published private(set) var phenomenonName = "-"
    
    @Published var phenomena = [Phenomenon(id: 1, name: "Lyrids", isDone: false),
                                             Phenomenon(id: 2, name: "Perseids", isDone: false),
                                             Phenomenon(id: 3, name: "Geminids", isDone: false)
    ]
//    @Published private(set) var phenomenon: Phenomenon = Phenomenon(id: 0, name: "-", isDone: false)
    
    enum PhenomenonType {
        case solarEclipse
        case meteorShower
    }
    let phenomenonType: PhenomenonType
    
    let earthViewScene: SKScene & HasListener
    let solarSystemScene: SKScene & HasPublisher
    
    //  MARK: - Lifecycle Methods
    
    init(phenomenon: PhenomenonType) {
        self.phenomenonType = phenomenon
        
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
    
    func notifyViewModelDate(with value: String) {
        status = value
    }
    
    func notifyViewModelPhenomenonName(with value: String) {
        phenomenonName = value
    }
    
    func notifyViewModelObjectives(with index: Int) {
        phenomena[index].isDone = true
    }
}

protocol HasListener: AnyObject {
    func notified(of value: CGFloat)
}

protocol HasPublisher: AnyObject {
    var simulation: Simulation? { get set }
}
