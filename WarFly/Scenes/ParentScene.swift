//
//  ParentScene.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 14.05.2022.
//

import SpriteKit

class ParentScene: SKScene {
    
    let sceneManager = SceneManager.shared
    var backScene: SKScene?
    
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor(red: 0.15, green: 0.15, blue: 0.3, alpha: 1)
    }
    
    func setHeader(with name: String?, background: String) {
        let header = ButtonNode(title: name, backgoundName: background)
        header.position = CGPoint(x: self.frame.midX, y: self.frame.maxY - 80)
        self.addChild(header)

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        let node = self.atPoint(location)
        
        if node.name == "play" {
            let transition = SKTransition.doorsOpenHorizontal(withDuration: 1)//crossFade(withDuration: 1)
            let gameScene = GameScene(size: self.size)
            gameScene.scaleMode = .aspectFill
            self.scene?.view?.presentScene(gameScene, transition: transition)
            
        } else if node.name == "options" {
            let transition = SKTransition.fade(withDuration: 1)
            let optionScene = OptionsScene(size: self.size)
            optionScene.backScene = self
            optionScene.scaleMode = .aspectFill
            self.scene?.view?.presentScene(optionScene, transition: transition)
            
        } else if node.name == "scores" {
            let transition = SKTransition.fade(withDuration: 1)
            let scoreScene = ScoreScene(size: self.size)
            scoreScene.backScene = self
            scoreScene.scaleMode = .aspectFill
            self.scene?.view?.presentScene(scoreScene, transition: transition)
        }
    }

}
