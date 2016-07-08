//
//  PlaylistController.swift
//  Playlist2
//
//  Created by Joseph Hansen on 7/7/16.
//  Copyright © 2016 Joseph Hansen. All rights reserved.
//

import Foundation

class PlaylistController {
    
    private let kPlaylists = "storedPlaylistsKey"
    
    
    static let sharedController = PlaylistController()
    
    //CRUD (CREATE, READ, UPDATE, DELETE)
    //    READ
    var playlists: [Playlist] = []
    
    init() {
        loadFromPersistentStorage()
    }
    
    
    //    CREATE
    func addPlaylist(name: String) {
        let playlist = Playlist(title: name)
        playlists.append(playlist)
        saveToPersistentStorage()
    }
    
    //    DELETE
    func deletePlaylist(playlist: Playlist) {
        if let index = playlists.indexOf(playlist){
            playlists.removeAtIndex(index)
            saveToPersistentStorage()
        }
    }
    func addSongToPlaylist(song: Song, playlist: Playlist) {
        playlist.songsArray.append(song)
        saveToPersistentStorage()
    }
    func removeSongFromPlaylist(song: Song, playlist: Playlist) {
        guard let index = playlist.songsArray.indexOf(song) else {
            return
        }
        playlist.songsArray.removeAtIndex(index)
        saveToPersistentStorage()
    }
    
    func saveToPersistentStorage() {
        NSUserDefaults.standardUserDefaults().setObject(playlists.map{$0.dictionaryCopy}, forKey: kPlaylists)
        
        
    }
    func loadFromPersistentStorage() {
        guard let playlistsDictionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(kPlaylists) as? [[String:AnyObject]] else {
            return
        }
        playlists = playlistsDictionaryArray.flatMap{Playlist(dictionary:$0)}
        
    }
    
}