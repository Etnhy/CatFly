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
    
    var isSound = true
    
    var highScore: [Int] = []
    var currentScore = 0
    
    override init() {
        super.init()
        
        loadGameSettings()
        loadScores()
    }
    
    func saveScores() {
        highScore.append(currentScore)
        highScore = Array(highScore.sorted { $0 > $1 }.prefix(7))
        ud.set(highScore, forKey: GameSettingsKeys.highScoreKey)
        ud.synchronize()
    }
    
    func loadScores() {
        guard ud.value(forKey: GameSettingsKeys.highScoreKey) != nil else { return }
        highScore = ud.array(forKey: GameSettingsKeys.highScoreKey) as! [Int]
    }
    
    
    
    
    
    func saveGaneSettings() {
        ud.set(isMusic, forKey: GameSettingsKeys.musicKey)
        ud.set(isSound, forKey: GameSettingsKeys.soundKey)
    }
    
    func loadGameSettings() {
        guard ud.value(forKey: GameSettingsKeys.musicKey) != nil && ud.value(forKey: GameSettingsKeys.soundKey) != nil else { return }
        isMusic = ud.bool(forKey: GameSettingsKeys.musicKey)
        isSound = ud.bool(forKey: GameSettingsKeys.soundKey)
    }
}

