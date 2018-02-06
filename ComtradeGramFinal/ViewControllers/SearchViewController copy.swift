//
//  ViewController.swift
//  ComtradeGramFinal
//
//  Created by Predrag Jevtic on 1/10/18.
//  Copyright © 2018 com.comtrade.Gram. All rights reserved.
//

import UIKit
import SwiftInstagram

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var instagramPosts: [InstagramMedia] = []
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view,
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
     self.loadPosts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 370
    }
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return instagramPosts.count
        return instagramPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SearchTableViewCell else {
    fatalError ("error")
    }
      
        cell.profilePicture.layer.cornerRadius = (cell.profilePicture.frame.width)/2
        
        cell.layer.cornerRadius = 15
        cell.layer.borderWidth = 6
        cell.layer.borderColor = UIColor.init(red:204/255.0, green:21/255.0, blue:34/255.0, alpha: 1.0).cgColor
        
        let post = instagramPosts[indexPath.row]
        
        cell.usernameLbl.text = post.user.username
        
        cell.profilePicture.downloadedFrom(url: post.user.profilePicture)
        cell.locationLbl.text = post.location?.name
        
        cell.postImage.downloadedFrom(url: post.images.standardResolution.url, contentMode: .scaleAspectFill)
        cell.numberOfLikesLbl.text = String(post.likes.count)
       
        cell.likeBtn.tag = indexPath.row
        
    
      return cell
}
   
    func loadPosts() {
        
        Instagram.shared.recentMedia(fromUser: "self", count: 10, success: { mediaList in
            
            self.instagramPosts = mediaList
            self.tableView.reloadData()
            
            return
        }, failure: { error in
            print(error.localizedDescription)
        })
        
    }

}
