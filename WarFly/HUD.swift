//
//  HUD.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 14.05.2022.
//

import SpriteKit

class HUD: SKScene {

    let scoreBackgound = SKSpriteNode(imageNamed: "scores")
    let scoreLabes = SKLabelNode(text: "10000")
    let menuButton =  SKSpriteNode(imageNamed: "menu")
    
    let life1 = SKSpriteNode(imageNamed: "life")
    let life2 = SKSpriteNode(imageNamed: "life")
    let life3 = SKSpriteNode(imageNamed: "life")

    
    func configureUI(screenSize: CGSize) {
        /* score  */
        scoreBackgound.position = CGPoint(x: scoreBackgound.size.width + 20,
                                          y: screenSize.height - scoreBackgound.size.height / 2 - 40 )
        scoreBackgound.anchorPoint = CGPoint(x: 1.0, y: 0.5)
        scoreBackgound.zPosition = 99
        addChild(scoreBackgound)
        
        /* label */
        scoreLabes.horizontalAlignmentMode = .right
        scoreLabes.verticalAlignmentMode = .center
        scoreLabes.position = CGPoint(x: -10, y: 3)
        scoreLabes.zPosition = 100
        scoreLabes.fontName = "AmericanTypewriter-Bold"
        scoreLabes.fontSize = 30
        scoreBackgound.addChild(scoreLabes)
        
        menuButton.position = CGPoint(x: 20, y: 20)
        menuButton.anchorPoint = CGPoint(x: 0, y: 0)
        menuButton.zPosition = 100
        addChild(menuButton)
        
        let lifes = [life1,life2,life3]
        for (index, life) in lifes.enumerated() {
            life.position = CGPoint(x: screenSize.width - CGFloat(index + 1) * (life.size.width + 3),
                                    y: screenSize.height - scoreBackgound.size.height / 2 - 40)
            life.zPosition = 100
            life.anchorPoint = CGPoint(x: 1.0, y: 0.5)
            addChild(life)
        }
    }

    
}
