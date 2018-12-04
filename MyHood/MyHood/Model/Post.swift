//
//  Post.swift
//  MyHood
//
//  Created by Anna Kaukh on 12/4/18.
//  Copyright © 2018 Anna Kaukh. All rights reserved.
//

import Foundation

class Post {
    
    private var _imagePath: String
    private var _title: String
    private var _postDescrip: String
    
    var imagePath: String {
        return _imagePath
    }
    
    var title: String {
        return _title
    }
    
    var postDescrip: String {
        return _postDescrip
    }
    
    
    init(imagePath: String, title: String, postDescrip: String) {
        self._imagePath = imagePath
        self._title = title
        self._postDescrip = postDescrip
    }
}
