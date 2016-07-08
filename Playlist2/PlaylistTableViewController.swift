//
//  PlaylistTableViewController.swift
//  Playlist2
//
//  Created by Joseph Hansen on 7/7/16.
//  Copyright © 2016 Joseph Hansen. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {
    
    
    @IBOutlet weak var playlistTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
//MARK: - ActionButtons
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        guard let playlistName = playlistTextField.text else {
            return
        }
        PlaylistController.sharedController.addPlaylist(playlistName)
        playlistTextField.text = ""
        tableView.reloadData()
    }
    
    
    

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlaylistController.sharedController.playlists.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("playlistCell", forIndexPath: indexPath)
        let playlist = PlaylistController.sharedController.playlists[indexPath.row]
        cell.textLabel?.text = playlist.title
        cell.detailTextLabel?.text = "\(playlist.songsArray.count) songs"
        

        return cell
    }
    

   

   
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let playlist = PlaylistController.sharedController.playlists[indexPath.row]
            PlaylistController.sharedController.deletePlaylist(playlist)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        how are we getting there?
        if segue.identifier == "toPlaylistDetailSegue" {
            //        where to?
            let songTVC = segue.destinationViewController as? SongTableViewController
//            what do i need to take? where is it currently?
            if let indexPath = tableView.indexPathForSelectedRow {
                let playlist = PlaylistController.sharedController.playlists[indexPath.row]
//                did i arrive? did i bring it?
                songTVC?.playlist = playlist
                
            }
        }

        
    }
    

}
