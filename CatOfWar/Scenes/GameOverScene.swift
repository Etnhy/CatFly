//
//  GameOverScene.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 14.05.2022.
//

import SpriteKit

class GameOverScene: PauseScene {

    override func didMove(to view: SKView) {
        
        setHeader(with: "game over", background: "header_background")
        
        let titles = ["restart","options", "score"]
        
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
            sceneManager.gameScene = nil
            let transition = SKTransition.doorsOpenHorizontal(withDuration: 1)
            let gameScene = GameScene(size: self.size)
            gameScene.scaleMode = .aspectFill
            self.scene?.view?.presentScene(gameScene, transition: transition)
            
        } else if node.name == "score" {
            let transition = SKTransition.doorsOpenHorizontal(withDuration: 1)
            let scoreScene = ScoreScene(size: self.size)
            scoreScene.backScene = self
            scoreScene.scaleMode = .aspectFill
            self.scene?.view?.presentScene(scoreScene, transition: transition)
            
        } else if node.name == "options" {
            let transition = SKTransition.fade(withDuration: 1)
            let optionScene = OptionsScene(size: self.size)
            optionScene.backScene = self
            optionScene.scaleMode = .aspectFill
            self.scene?.view?.presentScene(optionScene, transition: transition)
        }
        
    }

}
