//
//  SearchTableViewCell.swift
//  ComtradeGramFinal
//
//  Created by Marija Grujic on 2/4/18.
//  Copyright © 2018 com.comtrade.Gram. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var commentsBtn: UIButton!
    @IBOutlet weak var numberOfLikesLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var locationBtn: UIButton!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var addFriendBtn: UIButton!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var numberOfCommentsLbl: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 15
        layer.borderWidth = 6
        layer.borderColor = UIColor.init(red:204/255.0, green:21/255.0, blue:34/255.0, alpha: 1.0).cgColor
        }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

   
    

}
