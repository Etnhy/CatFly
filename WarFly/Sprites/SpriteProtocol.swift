//
//  SpriteProtocol.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 12.05.2022.
//

import Foundation
import SpriteKit
import GameplayKit


protocol GameBackgroundSpriteabale {
    static func populateSprite(at point: CGPoint) -> Self
}
