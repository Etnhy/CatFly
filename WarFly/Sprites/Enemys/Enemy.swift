//
//  Enemy.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 13.05.2022.
//

import SpriteKit

class Enemy: SKSpriteNode {
    
    static var textureAtlas : SKTextureAtlas?
    
    init() {
        let texture = Enemy.textureAtlas?.textureNamed("airplane_4ver2_13")
        super.init(texture: texture, color: .clear, size: CGSize(width: 221, height: 204))
        self.xScale = 0.5
        self.yScale = -0.5 //разворот
        self.zPosition = 20
        self.name = "sprite"
        
    }
    
    func flySpiral() {
        let screenSize = UIScreen.main.bounds
        let timeHorizontal: Double = 3
        let timeViertical: Double = 10
        
        let moveLeft = SKAction.moveTo(x: 50, duration: timeHorizontal)
        moveLeft.timingMode = .easeInEaseOut
        let moveRight = SKAction.moveTo(x: screenSize.width - 50, duration: timeHorizontal)
        moveRight.timingMode = .easeInEaseOut
        let sideMovementSequense = SKAction.sequence([moveLeft,moveRight])
        
        let foreverSideMovement = SKAction.repeatForever(sideMovementSequense)
        
        let forwardMovement = SKAction.moveTo(y: -105, duration: timeViertical)
        let groupMovement = SKAction.group([foreverSideMovement, forwardMovement])
        self.run(groupMovement)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
