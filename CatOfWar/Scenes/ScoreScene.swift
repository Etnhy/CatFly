//
//  ScoreScene.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 14.05.2022.
//

import SpriteKit

class ScoreScene: ParentScene {

    var places: [Int]!
    
    override func didMove(to view: SKView) {
        gameSettings.loadScores()
        places = gameSettings.highScore
        setHeader(with: "scores", background: "header_background")
        setBackNode()
        
        
        
        for (index,value) in places.enumerated() {
            let l = SKLabelNode(text: value.description)
            l.fontColor = UIColor(red: 219 / 255, green: 226 / 255, blue: 215 / 255, alpha: 1)
            l.fontName = "AmericanTypewriter-Bold"
            l.fontSize = 30
            l.position = CGPoint(x: self.frame.midX, y: (self.frame.maxY - 180) - CGFloat(index * 60))
            addChild(l)
        }
    }
    
    fileprivate func setBackNode() {
        let backNode = ButtonNode(title: "back", backgoundName: "button_background")
//        backNode.setScale(0.8)
        backNode.position = CGPoint(x: self.frame.midX , y: self.frame.minY + 100 )
        backNode.name = "back"
        backNode.label.name = "back"
        self.addChild(backNode)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        let node = self.atPoint(location)
        
        if node.name == "back" {
            let transition = SKTransition.fade(withDuration: 1)
            guard let backScene = backScene else {return}
            backScene.scaleMode = .aspectFill
            self.scene?.view?.presentScene(backScene, transition: transition)
        }
    }
}
