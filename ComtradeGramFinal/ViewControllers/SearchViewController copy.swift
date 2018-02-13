//
//  ViewController.swift
//  ComtradeGramFinal
//
//  Created by Predrag Jevtic on 1/10/18.
//  Copyright © 2018 com.comtrade.Gram. All rights reserved.
//

import UIKit
import SwiftInstagram

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {
    
    //MARK: Properties
    
    var searchedElements:[InstagramMedia] = []
    var instagramPosts: [InstagramMedia] = []
    var isSearchingActive = false
    
    //MARK: Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.loadPosts()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: TableView functions
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 360
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return instagramPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SearchTableViewCell else {
            fatalError ("error")
        }
        
        //MARK: Post
        
        let post = instagramPosts[indexPath.row]
        
        //MARK: Profile photo
        
        cell.profilePicture.downloadedFrom(url: post.user.profilePicture)
        cell.profilePicture.layer.cornerRadius = (cell.profilePicture.frame.width)/2
        
        //MARK: Username
        
        cell.usernameLbl.text = post.user.username
        
        //Mark: Location
        
        cell.locationLbl.text = post.location?.name
        cell.locationBtn.isHidden = false
        if cell.locationLbl.text == nil {
            cell.locationBtn.isHidden = true
        }
        
        //MARK: Number of Likes
        
        cell.numberOfLikesLbl.text = (post.likes.count) == 1 ? "\(post.likes.count) like" : "\(post.likes.count) likes"
        
        //MARK: Post Image
        
        cell.postImage.downloadedFrom(url: post.images.standardResolution.url, contentMode: .scaleAspectFill)
        
        //MARK: Like Button
        
        cell.likeBtn.tag = indexPath.row
        
        return cell
    }
    //MARK: Search funcionalities
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar .resignFirstResponder()
        
        self.searchTags()
    }
    
    // MARK: Load Posts function
    
    func loadPosts() {
        
        Instagram.shared.recentMedia(fromUser: "self", count: 10, success: { mediaList in
            
            self.instagramPosts = mediaList
            self.tableView.reloadData()
            
            return
        }, failure: { error in
            print(error.localizedDescription)
        })
    }
    
    //MARK: Search Hashtags function
    
    func searchTags() {
        
        Instagram.shared.recentMedia(withTag: searchBar.text!
            , success: { mediaList in
                
                self.instagramPosts = mediaList
                self.tableView.reloadData()
                
                if mediaList.count < 1 {
                    
                    //Mark: Show Alert
                    
                    let alert = UIAlertController(title: "No posts", message: "There is no post with given tag ", preferredStyle: .alert)
                    
                    //We add buttons to the alert controller by creating UIAlertActions:
                    let actionOk = UIAlertAction(title:"ok" ,style: .default, handler: nil)
                    //
                    alert.addAction(actionOk)
                    
                    
                    self.present(alert, animated: true, completion: nil)
                }
                else {
                    
                    self.searchTags()
                }
                return
                
        },failure: { error in
            print(error.localizedDescription)
        })
        
    }
    
    //MARK: Actions
    
    @IBAction func findLocation(_ sender: Any) {
        
//        print ("Find location")
    }
    
    @IBAction func addFrined(_ sender: Any) {
        
//        print ("Add me")
    }
    
    @IBAction func likeMe(_ sender: UIButton) {
        
        let isLiked = sender.isSelected
        sender.isSelected = !isLiked
        _ = !isLiked
    }
    
    @IBAction func commentMe(_ sender: Any) {
    }
    
    @IBAction func realoadPosts(_ sender: Any) {
        searchBar.text = nil
        loadPosts()
    }
}
