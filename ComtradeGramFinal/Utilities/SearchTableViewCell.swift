//
//  SearchTableViewCell.swift
//  ComtradeGramFinal
//
//  Created by Marija Grujic on 2/4/18.
//  Copyright © 2018 com.comtrade.Gram. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var usernameLbl: UILabel!
    
    @IBOutlet weak var commentsBtn: UIButton!
    
    @IBOutlet weak var numberOfLikesLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var locationBtn: UIButton!
    
    @IBOutlet weak var likeBtn: UIButton!
    
    
    @IBOutlet weak var addFriendBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var numberOfCommentsLbl: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func findLocation(_ sender: Any) {
        print ("Find user location")
    }
    
    @IBAction func addFriend(_ sender: Any) {
        
        print ("Add me")
    }
    
    @IBAction func likeMe(_ sender: UIButton) {
        
        let isLiked = sender.isSelected
        sender.isSelected = !isLiked
        // call api, here you are POST ID and new status
        let newStatus = !isLiked // :: sender.isSelected
    }
    @IBAction func commentMe(_ sender: Any) {
        
        print ("Write a comment")
    }
}
