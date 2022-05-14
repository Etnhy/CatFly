//
//  GameSettings.swift
//  WarFly
//
//  Created by Evhenii Mahlena on 14.05.2022.
//

import UIKit

class GameSettings: NSObject {

    let ud = UserDefaults.standard
    
    var isMusic = true
    let musicKey = "music"
    
    var isSound = true
    let soundKey = "sound"
    
    override init() {
        super.init()
        
        loadGameSettings()
    }
    
    func saveGaneSettings() {
        ud.set(isMusic, forKey: "music")
        ud.set(isSound, forKey: "sound")
    }
    
    func loadGameSettings() {
        guard ud.value(forKey: musicKey) != nil && ud.value(forKey: soundKey) != nil else { return }
        isMusic = ud.bool(forKey: musicKey)
        isSound = ud.bool(forKey: soundKey)
    }
}
