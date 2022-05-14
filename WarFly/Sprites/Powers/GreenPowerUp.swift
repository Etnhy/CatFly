//
//  GreenPowerUp.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 13.05.2022.
//

import SpriteKit


class GreenPowerUp: MainPowerUp {
    init() {
        let textureAtlas = AssetsStorage.shared.greenPowerUpAtlas
        super.init(textureAtlas: textureAtlas)
        self.name = PowerUpNames.greenPowerUp

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
