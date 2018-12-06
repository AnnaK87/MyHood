//
//  PostCell.swift
//  MyHood
//
//  Created by Anna Kaukh on 12/4/18.
//  Copyright © 2018 Anna Kaukh. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descripLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        postImage.layer.cornerRadius = 15 
    }

    func configureCell(_ post: Post) {
        titleLbl.text = post.title
        descripLbl.text = post.postDescrip
        postImage.image = DataService.instance.imageForPath(post.imagePath)
    }
}
