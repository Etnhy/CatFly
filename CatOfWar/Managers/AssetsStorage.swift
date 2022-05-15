//
//  Assets.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 13.05.2022.
//

import SpriteKit

class AssetsStorage {

    static let shared = AssetsStorage()
    var isLoaded = false
    
    let yellowShotAtlas      = SKTextureAtlas(named: "YellowShot")
    let greenPowerUpAtlas    = SKTextureAtlas(named: "GreenPowerUp")
    let bluePowerUpAtlas     = SKTextureAtlas(named: "BluePowerUp")
    let enemy_1Atlas          = SKTextureAtlas(named: "Enemy_2")
    let enemy_2Atlas          = SKTextureAtlas(named: "Enemy_1")
    let playerPlaneAtlas     = SKTextureAtlas(named: "PlayerPlane")
    
    func preloadAssets() {
        yellowShotAtlas.preload     { }
        greenPowerUpAtlas.preload   { }
        bluePowerUpAtlas.preload    { }
        enemy_1Atlas.preload        { }
        enemy_2Atlas.preload        { }
        playerPlaneAtlas.preload    { }
        print("assets preload")
    }
}
