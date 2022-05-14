//
//  GameScene.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 12.05.2022.
//

import SpriteKit
import GameplayKit


class GameScene: ParentScene {
    

    
    fileprivate var player: PlayerPlane!
    fileprivate let hud = HUD()
    fileprivate let screenSize = UIScreen.main.bounds.size
    fileprivate let pauseNode = SKNode()
    fileprivate var lives = 3 {
        didSet {
            switch lives {
            case 3:
                hud.life1.isHidden = false
                hud.life2.isHidden = false
                hud.life3.isHidden = false
            case 2:
                hud.life1.isHidden = false
                hud.life2.isHidden = false
                hud.life3.isHidden = true
            case 1:
                hud.life1.isHidden = false
                hud.life2.isHidden = true
                hud.life3.isHidden = true
            default: break
            }
        }
    }
    
    // MARK: - didMove to:
    override func didMove(to view: SKView) {
        self.scene?.isPaused = false
        // checing if scene persists
        guard sceneManager.gameScene == nil else {return}
        sceneManager.gameScene = self
        
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector.zero
        
        configuredStartScene()
        spawnClouds()
        spawnIsland()
        self.player.performFly()

        spawnPowerUp()
        spawnEnemies()
        createHUD()
    }
    fileprivate func createHUD() {
        hud.configureUI(screenSize:screenSize)
        addChild(hud)
    }
    
    // MARK: - -
    fileprivate func spawnEnemies() {
        let waitAction = SKAction.wait(forDuration: 3)
        let spawnSpiralAction = SKAction.run { [unowned self] in
            self.spawnSpiralOfEnemise()
        }
        let spawnAction = SKAction.sequence([waitAction, spawnSpiralAction])
        let repeatAction = SKAction.repeatForever(spawnAction)
        self.run(repeatAction)
        
//        self.run(SKAction.repeatForever(SKAction.sequence([waitAction,spawnSpiralAction])))
    }
    
    fileprivate func spawnSpiralOfEnemise() {
        let atlas = AssetsStorage.shared
        let enemyTextureAtlas = atlas.enemy_1Atlas
        let enemyTextureAtlas2 = atlas.enemy_2Atlas

        SKTextureAtlas.preloadTextureAtlases([enemyTextureAtlas, enemyTextureAtlas2]) { [unowned self] in
            let nubmerRandom = Int(arc4random_uniform(2))
            
            let arrayOfAtlasses = [enemyTextureAtlas,enemyTextureAtlas2]
            let textureAtlas = arrayOfAtlasses[nubmerRandom]
            
            let waitAction = SKAction.wait(forDuration: 1.0)
            let spawnEnemy = SKAction.run { [unowned self] in
                let textureNames = textureAtlas.textureNames.sorted()
                let texture = textureAtlas.textureNamed(textureNames[12])
                let enemy = Enemy(enemyTexture: texture)
                enemy.position = CGPoint(x: self.size.width / 2, y: self.size.height + 110)
                self.addChild(enemy)
                enemy.flySpiral()
            }
            let spawnAction = SKAction.sequence([waitAction, spawnEnemy])
            let repeatAction = SKAction.repeat(spawnAction, count: 3)
            self.run(repeatAction)
        }
    }
    
    fileprivate func spawnPowerUp() {

        let spawnAction = SKAction.run {
            let randomNumber = Int(arc4random_uniform(2))
            let powerUp = randomNumber == 1 ? BluePowerUp() : GreenPowerUp()
            let randomPositionX = arc4random_uniform(UInt32(self.size.width - 30))
            
            powerUp.position = CGPoint(x: CGFloat(randomPositionX), y: self.size.height + 100)
            powerUp.startMovement()
            self.addChild(powerUp)

        }
        let randomTimeSpawn = Double(arc4random_uniform(11) + 10)
        let waitAction = SKAction.wait(forDuration: randomTimeSpawn)
        
        self.run(SKAction.repeatForever(SKAction.sequence([spawnAction, waitAction])))

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

    
    // MARK: - didSimulatePhysics
    override func didSimulatePhysics() {
        
        player.checkPOsition()
        
        enumerateChildNodes(withName: "sprite") { node, stop in
            if node.position.y <= -100 {
                node.removeFromParent()
                if node.isKind(of: MainPowerUp.self) {
                    print("power up is removed from scene")
                }
            }
            
        }// sprite
        
        enumerateChildNodes(withName: "shotSprite") { node, stop in
            if node.position.y >= self.size.height + 100 {
                node.removeFromParent()
            }

        }// shot
        

    }
    
    fileprivate func playerFire() {
        let shot = YellowShot()
        shot.position = self.player.position
        shot.startMovement()

        self.addChild(shot)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        let node = self.atPoint(location)
        
        if node.name == "pause" {
            let transition = SKTransition.doorsCloseHorizontal(withDuration: 1)
            let pauseScene = PauseScene(size: self.size)
            pauseScene.scaleMode = .aspectFill
            sceneManager.gameScene = self
            self.scene?.isPaused = true
            self.scene?.view?.presentScene(pauseScene, transition: transition)
        } else {
            playerFire()

        }
    }
}

// MARK: - SKPhysicsContactDelegate
extension GameScene :SKPhysicsContactDelegate {
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        let contactCategory: BitMaskCategory = [contact.bodyA.category, contact.bodyB.category]
        
        let explosion = SKEmitterNode(fileNamed: "EnemyExplosion")
        explosion?.zPosition = 25
        let contactPoint = contact.contactPoint
        explosion?.position = contactPoint
        
        let waitForExplosionAction = SKAction.wait(forDuration: 1)
        
        
        switch contactCategory {
            
        case [.enemy, .player]  : print("enemy vs player")
            if contact.bodyA.node?.name == "sprite" {
                if contact.bodyA.node?.parent != nil {
                    contact.bodyA.node?.removeFromParent()
                    lives -= 1
                }
            } else {
                if contact.bodyB.node?.parent != nil {
                    contact.bodyB.node?.removeFromParent()
                    lives -= 1
                }
            }
            addChild(explosion!)
            self.run(waitForExplosionAction){ explosion?.removeFromParent() }

        case [.powerUp, .player]: print("powerUp vs player")
            
        case [.enemy, .shot]    : print("enemy vs shot")
            if contact.bodyA.node?.name == "sprite" {
                if contact.bodyA.node?.parent != nil {
                    contact.bodyA.node?.removeFromParent()
                }
            } else {
                if contact.bodyB.node?.parent != nil {
                    contact.bodyB.node?.removeFromParent()
                }
            }

            
            
            addChild(explosion!)
            self.run(waitForExplosionAction){ explosion?.removeFromParent() }
            
        default: preconditionFailure("Unable to detect collision category")
            
        
        }
//        print(contact.contactPoint)
        /*
        let bodyA   = contact.bodyA.categoryBitMask
        let bodyB   = contact.bodyB.categoryBitMask
        let player  = BitMaskCategory.player
        let enemy   = BitMaskCategory.enemy
        let shot    = BitMaskCategory.shot
        let powerUp = BitMaskCategory.powerUp
        
        if bodyA == player && bodyB == enemy || bodyB == player && bodyA == enemy {
            print("enemy vs player")
        } else if bodyA == player && bodyB == powerUp || bodyB == player && bodyA == powerUp {
            print("powerUp vs player")
        } else if bodyA == shot && bodyB == enemy || bodyB == shot && bodyA == enemy {
            print("enemy vs shot")
        }
         */
        
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        
    }
}
