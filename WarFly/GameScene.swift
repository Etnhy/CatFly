//
//  GameScene.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 12.05.2022.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene {
    
    var player: PlayerPlane!
    
    
    
    override func didMove(to view: SKView) {
        configuredStartScene()
        spawnClouds()
        spawnIsland()
        performFlying()
        
        spawnPowerUp()
        spawnEnemy(_count: 5)
    
    }
    
    fileprivate func spawnEnemy(_count: Int) {
        let enemyTextureAtlas = SKTextureAtlas(named: "Enemy_1")
        SKTextureAtlas.preloadTextureAtlases([enemyTextureAtlas]) {
            Enemy.textureAtlas = enemyTextureAtlas
            let waitAction = SKAction.wait(forDuration: 1.0)
            let spawnEnemy = SKAction.run {
                let enemy = Enemy()
                enemy.position = CGPoint(x: self.size.width / 2, y: self.size.height + 110)
                self.addChild(enemy)
                enemy.flySpiral()
            }
            let spawnAction = SKAction.sequence([waitAction, spawnEnemy])
            let repeatAction = SKAction.repeat(spawnAction, count: _count)
            self.run(repeatAction)
        }
    }
    
    fileprivate func spawnPowerUp() {
        let powerUp = PowerUp()
        powerUp.performRotation()
        powerUp.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        self.addChild(powerUp)

    }
    fileprivate func configuredStartScene() {
        let screeenCenterPOint = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        let backgound = Background.populateBackground(at: screeenCenterPOint)
        backgound.size = self.size
        self.addChild(backgound)
        let screen = UIScreen.main.bounds
        player = PlayerPlane.populate(at: CGPoint(x: screen.size.width / 2, y: 100))
        self.addChild(player)
    }
    fileprivate func spawnClouds() {
        let spawnCloudWait = SKAction.wait(forDuration: 1)
        let spawnCloudAction = SKAction.run {
            let cloud = Cloud.populate(at: nil)
            self.addChild(cloud)
        }
        let spawnCloudSequence = SKAction.sequence([spawnCloudWait, spawnCloudAction])
        let spawnCloudForever = SKAction.repeatForever(spawnCloudSequence)
        run(spawnCloudForever)
    }
    fileprivate func spawnIsland() {
        let spawnIslandWait = SKAction.wait(forDuration: 2)
        let spawnIslandAction = SKAction.run {
            let island = Island.populate(at: nil)
            self.addChild(island)
        }
        let spawnIslandSequence = SKAction.sequence([spawnIslandWait, spawnIslandAction])
        let spawnIslandForever = SKAction.repeatForever(spawnIslandSequence)
        run(spawnIslandForever)
    }
    
    fileprivate func performFlying() {
        let deadLine = DispatchTime.now() + .nanoseconds(1)
        DispatchQueue.main.asyncAfter(deadline: deadLine) { [unowned self] in 
            self.player.performFly()
            
        }
    }
    override func didSimulatePhysics() {
        
        player.checkPOsition()
        
        enumerateChildNodes(withName: "sprite") { node, stop in
            if node.position.y < -100 {
                node.removeFromParent()
            }
        }
    }
}
