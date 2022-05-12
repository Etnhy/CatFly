//
//  GameScene.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 12.05.2022.
//

import SpriteKit
import GameplayKit
import CoreMotion


class GameScene: SKScene {
    
    var player: SKSpriteNode!
    let motionManager = CMMotionManager()
    var xAcceleration: CGFloat = 0
    
    override func didMove(to view: SKView) {
        configuredStartScene()
    }
    
    
    
    fileprivate func configuredStartScene() {
        let screeenCenterPOint = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        let backgound = Background.populateBackground(at: screeenCenterPOint)
        backgound.size = self.size
        self.addChild(backgound)
        
        let screen = UIScreen.main.bounds


        
        let island = Island.populate(at: CGPoint(x: 100, y: 200))
        self.addChild(island)

        let island2 = Island.populate(at: CGPoint(x: self.size.width - 100 , y: self.size.height - 200))

        self.addChild(island2)
        
//        let cloud = Cloud.populate()
//        self.addChild(cloud)

        player = PlayerPlane.populate(at: CGPoint(x: screen.size.width / 2, y: 100))
        self.addChild(player)
        
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { data, error in
            if let data = data {
                let acceleration = data.acceleration
                self.xAcceleration = acceleration.x * 0.7 + self.xAcceleration * 0.3
                
            }
        }

    }
    
    override func didSimulatePhysics() {
        super.didSimulatePhysics()
        player.position.x += xAcceleration * 50
        if player.position.x < -70 {
            player.position.x = self.size.width + 70
        } else if player.position.x > self.size.width + 70 {
            player.position.x = -70
        }
    }
}
