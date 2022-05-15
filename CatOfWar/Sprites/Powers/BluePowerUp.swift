//
//  BluePowerUp.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 13.05.2022.
//

import SpriteKit

class BluePowerUp: MainPowerUp {
    init() {
        let textureAtlas = AssetsStorage.shared.bluePowerUpAtlas
        super.init(textureAtlas: textureAtlas)
        self.name = PowerUpNames.bluePowerUp
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
