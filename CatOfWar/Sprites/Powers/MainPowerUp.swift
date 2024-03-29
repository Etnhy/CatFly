//
//  PowerUp.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 13.05.2022.
//

import SpriteKit

class MainPowerUp: SKSpriteNode {
    
    fileprivate let initialSize = CGSize(width: 52.0, height: 52.0)
    
    fileprivate let textureAtlas: SKTextureAtlas!
    fileprivate var textureNameBeginsWith = ""
    fileprivate var animationSpriteArray = [SKTexture]()
    
    init(textureAtlas: SKTextureAtlas) {
        self.textureAtlas = textureAtlas
        let textureName = textureAtlas.textureNames.sorted()[0]
        let texture = textureAtlas.textureNamed(textureName)
        
        textureNameBeginsWith = String(textureName.dropLast(6)) //01.png
        
        super.init(texture: texture , color: .clear, size: initialSize)
        self.setScale(0.45)
//        self.name = "sprite"
        self.zPosition = 20
        
        
        self.physicsBody = SKPhysicsBody(texture: texture, alphaThreshold: 0.5, size: self.size)
        physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask    = BitMaskCategory.powerUp.rawValue
        self.physicsBody?.collisionBitMask   = BitMaskCategory.player.rawValue
        self.physicsBody?.contactTestBitMask = BitMaskCategory.player .rawValue

    }
    
    func startMovement() {
        performRotation()
        
        let moveForward = SKAction.moveTo(y: -100, duration: 5)
        self.run(moveForward)
    }
    
   fileprivate func performRotation() {
        for i in 1...15 {
            let number = String(format: "%02d", i)
            animationSpriteArray.append(SKTexture(imageNamed: textureNameBeginsWith + number.description))
        }
        SKTexture.preload(animationSpriteArray) {
            let rotation = SKAction.animate(with: self.animationSpriteArray, timePerFrame: 0.05, resize: false, restore: false)
            let rotationForever = SKAction.repeatForever(rotation)
            self.run(rotationForever)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



struct PowerUpNames {
   static let bluePowerUp  = "bluePowerUp"
   static let greenPowerUp = "greenPowerUp"
}
