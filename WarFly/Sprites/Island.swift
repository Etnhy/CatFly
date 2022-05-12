//
//  Island.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 12.05.2022.
//

import SpriteKit
import GameplayKit

final class Island: SKSpriteNode, GameBackgroundSpriteabale {
    
    static func populate() -> Island {
        let islandImageName = configureName()
        let island = Island(imageNamed: islandImageName)
        island.setScale(randomScaleFactor)
        island.position = randomPoint()
        island.zPosition = 1
        island.run(rotateForRandomAngle())
        island.run(move(from: island.position))
        return island
    }
    
    static func populate(at point: CGPoint) -> Island {
        let islandImageName = configureName()
        let island = Island(imageNamed: islandImageName)
        island.setScale(randomScaleFactor)
        island.position = point
        island.zPosition = 1
        island.run(rotateForRandomAngle())
        island.run(move(from: island.position))
        return island
    }
    
   fileprivate static func configureName() -> String {
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 4)
        let randomNubmer = distribution.nextInt()
        let imageName = "is" + "\(randomNubmer)"
        return imageName
    }
    
   fileprivate static var randomScaleFactor: CGFloat {
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 10)
        let randomNubmer = CGFloat(distribution.nextInt())  / 10
        return randomNubmer
    }
    
    static func rotateForRandomAngle() -> SKAction {
        let distribution = GKRandomDistribution(lowestValue: 0, highestValue: 360)
        let randomNubmer = CGFloat(distribution.nextInt())
        return SKAction.rotate(byAngle: randomNubmer * CGFloat(Double.pi / 180) , duration: 0)
    }
    
    fileprivate static func move(from point: CGPoint) -> SKAction {
        let movePoint = CGPoint(x: point.x, y: point.y - 200)
        let moveDistance = point.y + 200
        let movementSpeed: CGFloat = 100
        let duration = moveDistance / movementSpeed
        return SKAction.move(to: movePoint, duration: duration)
    }
}


