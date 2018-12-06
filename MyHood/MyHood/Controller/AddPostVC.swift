//
//  AddPostVC.swift
//  MyHood
//
//  Created by Anna Kaukh on 12/4/18.
//  Copyright © 2018 Anna Kaukh. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var titleTxtField: UITextField!
    @IBOutlet weak var descripTxtField: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        postImage.layer.cornerRadius = postImage.frame.height / 2        
    }
    
    @IBAction func makePostBtnPressed(_ sender: UIButton) {
        if let title = titleTxtField.text, let descrip = descripTxtField.text, let image = postImage.image {
            let imgPath = DataService.instance.saveImageAndCreatePath(image)
            
            let post = Post(imagePath: imgPath, title: title, postDescrip: descrip)
            DataService.instance.addPost(post: post)
           
            self.dismiss(animated: true, completion: nil)
        }
        
 }
    @IBAction func addPicBtnPressed(_ sender: UIButton) {
        sender.setTitle("", for: .normal)
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imagePicker.dismiss(animated: true, completion: nil)
        postImage.image = selectedImage
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       textField.resignFirstResponder()
    
        return true
    }
}
