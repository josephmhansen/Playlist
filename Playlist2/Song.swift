//
//  Song.swift
//  Playlist2
//
//  Created by Joseph Hansen on 7/7/16.
//  Copyright © 2016 Joseph Hansen. All rights reserved.
//

import Foundation

class Song: Equatable {
    
    private let kTitle = "titleKey"
    private let kArtist = "artistKey"
    
    let title: String
    let artist: String
    
    var dictionaryCopy: [String: AnyObject] {
        return [kTitle: title, kArtist: artist]
    }
    
    init(title: String, artist: String) {
        self.title = title
        self.artist = artist
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let title = dictionary[kTitle] as? String,
            artist = dictionary[kArtist] as? String else{
                return nil
        }
        
        self.title = title
        self.artist = artist
    }
    
    
    
}

func == (lhs: Song, rhs: Song) -> Bool {
    return lhs.title == rhs.title && lhs.artist == rhs.artist

}




