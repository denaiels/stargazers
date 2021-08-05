//
//  MeteorShower2DScene.swift
//  stargazers
//
//  Created by Fabio Sim on 02/08/21.
//

import SpriteKit

class MeteorShower2DScene: SKScene, HasListener {
    
    let bounds: CGRect
    
    //  MARK: - Lifecycle Methods
    
    override init(size: CGSize) {
        self.bounds = CGRect(origin: .zero, size: size)
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        
    }
    
    //  MARK: - Notification Handlers
    
    func notified(of value: CGFloat) {
        
    }
}
