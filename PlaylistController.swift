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
}