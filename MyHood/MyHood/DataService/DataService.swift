//
//  DataService.swift
//  MyHood
//
//  Created by Anna Kaukh on 12/4/18.
//  Copyright © 2018 Anna Kaukh. All rights reserved.
//

import Foundation

class DataService {
    
    static let instance = DataService()
    
    private var posts = [Post(imagePath: "", title: "Post 1", postDescrip: "Post 1 Desription"),
                         Post(imagePath: "", title: "Post 2", postDescrip: "Post 2 Description"),
                         Post(imagePath: "", title: "Post 3", postDescrip: "Post 3 Description")]
    
    func getPosts() -> [Post] {
        return posts
    }
    
}
