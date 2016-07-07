//
//  SongController.swift
//  Playlist2
//
//  Created by Joseph Hansen on 7/7/16.
//  Copyright © 2016 Joseph Hansen. All rights reserved.
//

import Foundation

class SongController {
    static func createSong(name: String, artist: String, playlist: Playlist) {
        let song = Song(title: name, artist: artist)
        PlaylistController.sharedController.addSongToPlaylist(song, playlist: playlist)
    }
    
}
