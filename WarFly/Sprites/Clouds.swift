//
//  Clouds.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 12.05.2022.
//

import SpriteKit
import GameplayKit

final class Cloud: SKSpriteNode, GameBackgroundSpriteabale {
    
    static func populateSprite(at point: CGPoint) -> Cloud {
        let cloudImageName = configureName()
        let cloud = Cloud(imageNamed: cloudImageName)
        cloud.setScale(randomScaleFactor)
        cloud.position = point
        cloud.zPosition = 10
        cloud.run(move(from: point))
        return cloud
    }
    
   fileprivate static func configureName() -> String {
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 3)
        let randomNubmer = distribution.nextInt()
        let imageName = "cl" + "\(randomNubmer)"
        return imageName
    }
    
   fileprivate static var randomScaleFactor: CGFloat {
        let distribution = GKRandomDistribution(lowestValue: 20, highestValue: 30)
        let randomNubmer = CGFloat(distribution.nextInt())  / 10
        return randomNubmer
    }
    
    
    fileprivate static func move(from point: CGPoint) -> SKAction {
        let movePoint = CGPoint(x: point.x, y: point.y - 200)
        let moveDistance = point.y + 200
        let movementSpeed: CGFloat = 15.0
        let duration = moveDistance / movementSpeed
        return SKAction.move(to: movePoint, duration: duration)
    }
}
