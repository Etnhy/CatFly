//
//  PowerUp.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 13.05.2022.
//

import SpriteKit
import UIKit

class PowerUp: SKSpriteNode {
    let initialSize = CGSize(width: 52.0, height: 52.0)
    let textureAtlas = SKTextureAtlas(named: "GreenPowerUp")
    var animationSpriteArray = [SKTexture]()
    
    init() {
        let greenTexture = textureAtlas.textureNamed("missle_green_01")
        super.init(texture: greenTexture , color: .clear, size: initialSize)
        self.name = "power_up"
        self.zPosition = 20
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func performRotation() {
        for i in 1...15 {
            let number = String(format: "%02d", i)
            animationSpriteArray.append(SKTexture(imageNamed: "missle_green_\(number)"))
        }
        SKTexture.preload(animationSpriteArray) {
            let rotation = SKAction.animate(with: self.animationSpriteArray, timePerFrame: 0.05, resize: false, restore: false)
            let rotationForever = SKAction.repeatForever(rotation)
            self.run(rotationForever)
        }
    }
}
