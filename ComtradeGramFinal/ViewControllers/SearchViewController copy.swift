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
    
    //var instagramPosts: [InstagramMedia] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return instagramPosts.count
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SearchTableViewCell else {
    fatalError ("error")
    }
      
        cell.profilePicture.layer.cornerRadius = (cell.profilePicture.frame.width)/2
        
     
 return cell
}
    
   

}
