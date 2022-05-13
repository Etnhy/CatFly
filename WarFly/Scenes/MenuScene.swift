//
//  MenuScene.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 13.05.2022.
//

import SpriteKit

class MenuScene: SKScene {

    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor(red: 0.15, green: 0.15, blue: 0.3, alpha: 1)
        
        
        let gachiTexture = SKTexture(imageNamed: "gachi1")
        let imageGachi = SKSpriteNode(texture: gachiTexture)
        imageGachi.position = CGPoint(x: self.frame.midX, y: self.frame.maxY - 200)
        imageGachi.name = "gachiFly"
        self.addChild(imageGachi)
        
        let texture = SKTexture(imageNamed: "play")
        let button = SKSpriteNode(texture: texture)
        button.size = CGSize(width: 80, height: 80)
        button.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        button.name = "runbutton"
        self.addChild(button)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        let node = self.atPoint(location)
        
        if node.name == "runbutton" {
            let transition = SKTransition.doorsOpenHorizontal(withDuration: 1)//crossFade(withDuration: 1)
            let gameScene = GameScene(size: self.size)
            gameScene.scaleMode = .aspectFill
            self.scene?.view?.presentScene(gameScene, transition: transition)
        }
    }
}
