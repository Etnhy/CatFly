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
    
    func setHeader(with name: String?, background: String) {
        let header = ButtonNode(title: name, backgoundName: background)
        header.position = CGPoint(x: self.frame.midX, y: self.frame.maxY - 80)
        self.addChild(header)

    }
}
