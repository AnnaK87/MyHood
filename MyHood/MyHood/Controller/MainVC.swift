//
//  ViewController.swift
//  MyHood
//
//  Created by Anna Kaukh on 12/4/18.
//  Copyright © 2018 Anna Kaukh. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
   // var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        DataService.instance.loadPost()
        
        NotificationCenter.default.addObserver(self, selector: #selector(MainVC.onPostsLoaded(_:)), name: NSNotification.Name(rawValue: "postsLoaded"), object: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = DataService.instance.posts[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell {
            cell.configureCell(post)
            
            return cell
        }
            return PostCell()
    }
    
    @objc func onPostsLoaded(_ notif: AnyObject) {
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

