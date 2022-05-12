//
//  Clouds.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 12.05.2022.
//

import SpriteKit
import GameplayKit

final class Cloud: SKSpriteNode, GameBackgroundSpriteabale {
    
    static func populate(at point: CGPoint?) -> Cloud {
        let cloudImageName = configureName()
        let cloud = Cloud(imageNamed: cloudImageName)
        cloud.setScale(randomScaleFactor)
        cloud.position = point ?? randomPoint()
        cloud.zPosition = 10
        cloud.name = "BackgroundSprite"
        cloud.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        cloud.run(move(from: cloud.position))
        return cloud
    }
    
   fileprivate static func configureName() -> String {
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 3)
        let randomNubmer = distribution.nextInt()
        let imageName = "cl" + "\(randomNubmer)"
        return imageName
    }
    
   fileprivate static var randomScaleFactor: CGFloat {
        let distribution = GKRandomDistribution(lowestValue: 15, highestValue: 25)
        let randomNubmer = CGFloat(distribution.nextInt())  / 10
        return randomNubmer
    }
    
    
    fileprivate static func move(from point: CGPoint) -> SKAction {
        let movePoint = CGPoint(x: point.x, y: -200)
        let moveDistance = point.y + 200
        let movementSpeed: CGFloat = 150.0
        let duration = moveDistance / movementSpeed
        return SKAction.move(to: movePoint, duration: TimeInterval(duration))
    }
}
