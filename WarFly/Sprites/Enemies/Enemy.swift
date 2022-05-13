//
//  Enemy.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 13.05.2022.
//

import SpriteKit

final class Enemy: SKSpriteNode { //, GameBackgroundSpriteabale

    static var textureAtlas : SKTextureAtlas?
    var enemyTextures: SKTexture?
    
    init(enemyTexture: SKTexture) {
        let texture = enemyTexture
        super.init(texture: texture, color: .clear, size: CGSize(width: 221, height: 204))
        self.xScale = 0.5
        self.yScale = -0.5 //разворот
        self.zPosition = 20
        self.name = "sprite"
        
        self.physicsBody = SKPhysicsBody(texture: texture, alphaThreshold: 0.5, size: self.size)
        physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask    = BitMaskCategory.enemy
        self.physicsBody?.collisionBitMask   = BitMaskCategory.player | BitMaskCategory.shot
        self.physicsBody?.contactTestBitMask = BitMaskCategory.player | BitMaskCategory.shot

    }
    fileprivate static func move(from point: CGPoint) -> SKAction {
        let movePoint = CGPoint(x: point.x, y: -200)
        let moveDistance = point.y + 200
        let movementSpeed: CGFloat = 150.0
        let duration = moveDistance / movementSpeed
        return SKAction.move(to: movePoint, duration: TimeInterval(duration))
    }


    func flySpiral() {
        let screenSize = UIScreen.main.bounds
        let timeHorizontal: Double = 3
        let timeViertical: Double = 7
        
        let moveLeft = SKAction.moveTo(x: 50, duration: timeHorizontal)
        moveLeft.timingMode = .easeInEaseOut
        
        let randomNuber = Int(arc4random_uniform(2))
        let moveRight = SKAction.moveTo(x: screenSize.width - 50, duration: timeHorizontal)
        moveRight.timingMode = .easeInEaseOut
        
        
        let sideMovementSequense = randomNuber == EnemyDirection.left.rawValue ? SKAction.sequence([moveLeft,moveRight]) : SKAction.sequence([moveRight,moveLeft])

        let foreverSideMovement = SKAction.repeatForever(sideMovementSequense)
        
        let forwardMovement = SKAction.moveTo(y: -105, duration: timeViertical)
        let groupMovement = SKAction.group([foreverSideMovement, forwardMovement])
        self.run(groupMovement)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

enum EnemyDirection: Int {
    case left = 0
    case right
}
