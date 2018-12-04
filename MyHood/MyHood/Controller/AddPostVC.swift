//
//  AddPostVC.swift
//  MyHood
//
//  Created by Anna Kaukh on 12/4/18.
//  Copyright © 2018 Anna Kaukh. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var titleTxtField: UITextField!
    @IBOutlet weak var descripTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postImage.layer.cornerRadius = postImage.frame.height / 2        
    }
    
    @IBAction func makePostBtnPressed(_ sender: UIButton) {
       
    }
    @IBAction func addPicBtnPressed(_ sender: UIButton) {
         sender.setTitle("", for: .normal)
    }
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
