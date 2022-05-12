//
//  Island.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 12.05.2022.
//

import SpriteKit
import GameplayKit

class Island: SKSpriteNode {
    
    static func populateIsland(at point: CGPoint) -> Island {
        let islandImageName = configureIslandName()
        let island = Island(imageNamed: islandImageName)
        island.setScale(randomScaleFactor)
        island.position = point
        island.zPosition = 1
        island.run(rotateForRandomAngle())
        return island
    }
    
    static func configureIslandName() -> String {
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 4)
        let randomNubmer = distribution.nextInt()
        let imageName = "is" + "\(randomNubmer)"
        return imageName
    }
    
    static var randomScaleFactor: CGFloat {
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 10)
        let randomNubmer = CGFloat(distribution.nextInt())  / 10
        return randomNubmer
    }
    
    static func rotateForRandomAngle() -> SKAction {
        let distribution = GKRandomDistribution(lowestValue: 0, highestValue: 360)
        let randomNubmer = CGFloat(distribution.nextInt())
        return SKAction.rotate(byAngle: randomNubmer * CGFloat(Double.pi / 180) , duration: 0)
    }
}
