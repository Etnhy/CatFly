//
//  OptionsScene.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 14.05.2022.
//

import SpriteKit

class OptionsScene: ParentScene {
    
    var isMusic: Bool!
    var isSound: Bool!
    
    override func didMove(to view: SKView) {
        
        isMusic = gameSettings.isMusic
        isSound = gameSettings.isSound
        
        setHeader(with: "options", background: "header_background")
        
//        let names = ["music", "sound"]
        
        let backgroundNameForMusic = isMusic ? "music" : "nomusic"
        let backgoriundNameSound = isSound ? "sound" : "nosound"
        let names = [backgroundNameForMusic, backgoriundNameSound]
        
        for (index,name) in names.enumerated() {
            let node = ButtonNode(title: nil, backgoundName: name)
            node.setScale(0.8)
            node.position = CGPoint(x: self.frame.midX + 50 + CGFloat(-100 * index)  , y: self.frame.midY )
            node.name = name
            node.label.isHidden = true
            self.addChild(node)
        }
        
        
//        let backgroundNameForMusic = isMusic ? "music" : "nomusic"
//        let music = ButtonNode(title: nil, backgoundName: backgroundNameForMusic)
//        music.setScale(0.8)
//        music.position = CGPoint(x: self.frame.midX - 50 , y: self.frame.minY )
//        music.name = "music"
//        music.label.isHidden = true
//        self.addChild(music)
//
//        let backgoriundNameSound = isSound ? "sound" : "nosound"
//        let sound = ButtonNode(title: nil, backgoundName: backgoriundNameSound)
//        sound.setScale(0.8)
//        sound.position = CGPoint(x: self.frame.midX + 50 , y: self.frame.minY )
//        sound.name = "sound"
//        sound.label.isHidden = true
//        self.addChild(sound)
        

        
        let backNode = ButtonNode(title: "back", backgoundName: "button_background")
        backNode.setScale(0.8)
        backNode.position = CGPoint(x: self.frame.midX , y: self.frame.midY - 100 )
        backNode.name = "back"
        backNode.label.name = "back"
        self.addChild(backNode)

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        let node = self.atPoint(location)
        
        if node.name == "music" {
            isMusic = !isMusic
            update(node: node as! SKSpriteNode, property: isMusic)
        } else if node.name == "sound" {
            isSound = !isSound
            update(node: node as! SKSpriteNode, property: isSound)
        } else if node.name == "back" {
            let transition = SKTransition.fade(withDuration: 1)
            guard let backScene = backScene else {return}
            backScene.scaleMode = .aspectFill
            self.scene!.view?.presentScene(backScene, transition: transition)
        }
        
    }
    
    func update(node: SKSpriteNode, property: Bool) {
        if let name = node.name {
            node.texture = property ? SKTexture(imageNamed: name) : SKTexture(imageNamed: "no" + name)
        }
    }
}
