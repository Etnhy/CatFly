//
//  MenuScene.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 13.05.2022.
//

import SpriteKit

class MenuScene: ParentScene {

    override func didMove(to view: SKView) {
        if !AssetsStorage.shared.isLoaded {
            AssetsStorage.shared.preloadAssets()
            AssetsStorage.shared.isLoaded = true
        }
        
        
        setHeader(with: nil, background: "header")

//        let header = SKSpriteNode(imageNamed: "header")
//        header.position = CGPoint(x: self.frame.midX, y: self.frame.maxY - 80)
//        self.addChild(header)
        
        let titles = ["play","options", "scores"]
        
        for (index,title) in titles.enumerated() {
            let button = ButtonNode(title: title, backgoundName: "button_background")
            button.position = CGPoint(x: self.frame.midX, y: self.frame.midY - CGFloat(120 * index))
            button.name = title
            button.label.name = title
            self.addChild(button)

        }
        
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
