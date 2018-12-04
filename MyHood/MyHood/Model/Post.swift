//
//  Post.swift
//  MyHood
//
//  Created by Anna Kaukh on 12/4/18.
//  Copyright © 2018 Anna Kaukh. All rights reserved.
//

import Foundation

class Post {
    private(set) public var imagePath: String
    private(set) public var title: String
    private(set) public var postDescrip: String
    
    init(imagePath: String, title: String, postDescrip: String) {
        self.imagePath = imagePath
        self.title = title
        self.postDescrip = postDescrip
    }
}
