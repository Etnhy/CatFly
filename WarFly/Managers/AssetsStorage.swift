//
//  Assets.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 13.05.2022.
//

import SpriteKit

class AssetsStorage {

    static let shared = AssetsStorage()
    
    let yellowShotAtlas      = SKTextureAtlas(named: "YellowShot")
    let greenPowerUpAtlas    = SKTextureAtlas(named: "GreenPowerUp")
    let bluePowerUpAtlas     = SKTextureAtlas(named: "BluePowerUp")
    let enemy_1Atlas          = SKTextureAtlas(named: "Enemy_2")
    let enemy_2Atlas          = SKTextureAtlas(named: "Enemy_1")
    let playerPlaneAtlas     = SKTextureAtlas(named: "PlayerPlane")
    
    func preloadAssets() {
        yellowShotAtlas.preload     { print("yellow shot atlas preloaded")}
        greenPowerUpAtlas.preload   { print("greenPowerUpAtlas atlas preloaded")}
        bluePowerUpAtlas.preload    { print("bluePowerUpAtlas atlas preloaded")}
        enemy_1Atlas.preload        { print("enemy1Atlas atlas preloaded")}
        enemy_2Atlas.preload        { print("enemy2Atlas atlas preloaded")}
        playerPlaneAtlas.preload    { print("playerPlaneAtlas atlas preloaded")}
    }
}
