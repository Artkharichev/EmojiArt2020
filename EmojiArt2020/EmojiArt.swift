//
//  EmojiArt.swift
//  EmojiArt2020
//
//  Created by Артём Харичев on 24.06.2020.
//  Copyright © 2020 Artem Kharichev. All rights reserved.
//
//  Model

import Foundation

struct EmojiArt: Codable {
    
    var backgroundUrl: URL?
    var emojis = [Emoji]()
    
    struct Emoji: Identifiable, Codable, Hashable{
        let text: String
        var x: Int
        var y: Int
        var size: Int
        let id: Int
        
        fileprivate init(text: String, x: Int, y: Int, size: Int, id: Int) {
            self.text = text
            self.x = x
            self.y = y
            self.size = size
            self.id = id
        }
    }
    
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    init?(json: Data?){
        if json != nil, let newEmojiArt = try? JSONDecoder().decode(EmojiArt.self, from: json!) {
            self = newEmojiArt
        } else {
            return nil
        }
    }
    
    init() {  } // Free init, if init? = nil, we should to use this init
    
    private var uniqueEmoji = 0
    
    mutating func addEmoji(_ text: String, x: Int, y: Int, size: Int) {
        uniqueEmoji += 1
        emojis.append(Emoji(text: text, x: x, y: y, size: size, id: uniqueEmoji))
    }
}
