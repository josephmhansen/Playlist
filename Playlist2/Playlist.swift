//
//  Playlist.swift
//  Playlist2
//
//  Created by Joseph Hansen on 7/7/16.
//  Copyright © 2016 Joseph Hansen. All rights reserved.
//

import Foundation

class Playlist: Equatable {
    private let kPlaylistTitle = "playlistTitleKey"
    private let kSongs = "songsKey"
    
    let title: String
    var songsArray: [Song]
    
    var dictionaryCopy: [String: AnyObject] {
        return [kPlaylistTitle: title, kSongs: songsArray.map{$0.dictionaryCopy}] //[[String: AnyObject]]
    }
    
    
    init (title: String, songs: [Song] = []) {
        self.title = title
        self.songsArray = songs
        
        
        
    }
}

func ==(lhs: Playlist, rhs: Playlist) -> Bool {
    
    return lhs.title == rhs.title && lhs.songsArray == rhs.songsArray
}
