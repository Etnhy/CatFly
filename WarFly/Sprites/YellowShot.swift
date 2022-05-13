//
//  YellowShot.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 13.05.2022.
//

import UIKit
import SpriteKit

class YellowShot: Shot {

    init() {
        let textureAtlas = AssetsStorage.shared.yellowShotAtlas
        super.init(textureAtlas: textureAtlas)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
