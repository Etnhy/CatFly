//
//  PauseScene.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 14.05.2022.
//

import SpriteKit

class PauseScene: SKScene {

    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor(red: 0.15, green: 0.15, blue: 0.3, alpha: 1)
        
        let header = ButtonNode(title: "pause", backgoundName: "header_background")
        header.position = CGPoint(x: self.frame.midX, y: self.frame.maxY - 80)
        self.addChild(header)
        
        let titles = ["restart","options", "resume"]
        
        for (index,title) in titles.enumerated() {
            let button = ButtonNode(title: title, backgoundName: "button_background")
            button.setScale(0.8)
            button.position = CGPoint(x: self.frame.midX, y: self.frame.midY - CGFloat(120 * index))
            button.name = title
            button.label.name = title
            self.addChild(button)

        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        let node = self.atPoint(location)
        
        if node.name == "restart" {
            let transition = SKTransition.doorsOpenHorizontal(withDuration: 1)//crossFade(withDuration: 1)
            let gameScene = GameScene(size: self.size)
            gameScene.scaleMode = .aspectFill
            self.scene?.view?.presentScene(gameScene, transition: transition)
        }
    }

    
}
