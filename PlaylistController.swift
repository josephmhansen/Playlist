//
//  PlaylistController.swift
//  Playlist2
//
//  Created by Joseph Hansen on 7/7/16.
//  Copyright © 2016 Joseph Hansen. All rights reserved.
//

import Foundation

class PlaylistController {
    
    static let sharedController = PlaylistController()
    
    //CRUD (CREATE, READ, UPDATE, DELETE)
    //    READ
    var playlists: [Playlist] = []
    //    CREATE
    func addPlaylist(name: String) {
        let playlist = Playlist(title: name)
        playlists.append(playlist)
    }
    
    //    DELETE
    func deletePlaylist(playlist: Playlist) {
        if let index = playlists.indexOf(playlist){
            playlists.removeAtIndex(index)
        }
    }
    func addSongToPlaylist(song: Song, playlist: Playlist) {
        playlist.songsArray.append(song)
    }
    func removeSongFromPlaylist(song: Song, playlist: Playlist) {
        guard let index = playlist.songsArray.indexOf(song) else {
            return
        }
        playlist.songsArray.removeAtIndex(index)
    }
    
}