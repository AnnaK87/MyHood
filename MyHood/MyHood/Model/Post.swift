//
//  Post.swift
//  MyHood
//
//  Created by Anna Kaukh on 12/4/18.
//  Copyright © 2018 Anna Kaukh. All rights reserved.
//

import Foundation

class Post: NSObject, NSCoding {
    
    fileprivate var _imagePath: String!
    fileprivate var _title: String!
    fileprivate var _postDescrip: String!
    
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

    override init() {
       
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self._imagePath, forKey: "imagePath")
        aCoder.encode(self._title, forKey: "title")
        aCoder.encode(self._postDescrip, forKey: "description")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = aDecoder.decodeObject(forKey: "imagePath") as? String
        self._title = aDecoder.decodeObject(forKey: "title") as? String
        self._postDescrip = aDecoder.decodeObject(forKey: "description") as? String
    }
    
   
}
