//
//  SpriteProtocol.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 12.05.2022.
//

import SpriteKit
import GameplayKit


protocol GameBackgroundSpriteabale {
    static func populate() -> Self
    static func randomPoint() -> CGPoint
}

extension GameBackgroundSpriteabale {
    static func randomPoint() -> CGPoint {
        let screen = UIScreen.main.bounds
        let distribution = GKRandomDistribution(lowestValue: Int(screen.size.height + 100), highestValue: Int(screen.size.height + 200))
        let y = CGFloat(distribution.nextUniform())
        let x = CGFloat(GKRandomSource.sharedRandom().nextInt(upperBound: Int(screen.size.width)))
        return CGPoint(x: x, y: y)
    }
}
