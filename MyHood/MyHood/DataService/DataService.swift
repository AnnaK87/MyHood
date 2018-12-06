//
//  DataService.swift
//  MyHood
//
//  Created by Anna Kaukh on 12/4/18.
//  Copyright © 2018 Anna Kaukh. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    
    static let instance = DataService()
    
    private var _posts = [Post]()
    
    var posts: [Post] {
        return _posts
    }
    
    func savePost() {
        do {
            let postData = try NSKeyedArchiver.archivedData(withRootObject: _posts, requiringSecureCoding: false)
            UserDefaults.standard.set(postData, forKey: "posts")
            UserDefaults.standard.synchronize()
            
        } catch {
            print("Couldn't archive file")
        }
    }
    
    func loadPost() {
        if let postData = UserDefaults.standard.object(forKey: "posts") as? Data {
            
            if let postArray = NSKeyedUnarchiver.unarchiveObject(with: postData) as? [Post] {
                _posts = postArray
                
            }
        }
        NotificationCenter.default.post(name: Notification.Name(rawValue: "postLoaded"), object: nil)
    }
    
    
    func saveImageAndCreatePath(_ image: UIImage) -> String {
        let imgData = image.pngData()
        let imgPath = "image\(Date.timeIntervalSinceReferenceDate).png"
        let fullPath = documentsPathForFileName(imgPath)
        try? imgData?.write(to: URL(fileURLWithPath: fullPath), options: [.atomic])
        
        return imgPath
    }
    
    
    func imageForPath(_ path: String) -> UIImage? {
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
       
        return image
    }
    
    func addPost(post: Post) {
        _posts.append(post)
        savePost()
        loadPost()
    }
    
    func documentsPathForFileName(_ name: String) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.appendingPathComponent(name)
    }
}
