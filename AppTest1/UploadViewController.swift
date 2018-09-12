//
//  UploadViewController.swift
//  AppTest1
//
//  Created by TsengBoKai on 2018/8/4.
//  Copyright © 2018年 crazyknow. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    let picker = UIImagePickerController()
    var storage = Storage.storage()
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        statusLabel.text = "Tap pics to select from photo library"
        if let _ = imageView.image{
            
        }else{
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true, completion: nil)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UploadViewController.imagePressed))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGesture)
    }
    @objc func imagePressed() {
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    @IBAction func share(_ sender: Any) {
        statusLabel.text = "Beginning Upload"
        if let image = imageView.image {
            guard let imageData = UIImageJPEGRepresentation(image, 0.8) else {return}
            
            let imagePath = Auth.auth().currentUser!.uid + "/media/\(Int(Date.timeIntervalSinceReferenceDate * 1000)).jpg"
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpeg"
            let storageRef = self.storage.reference(withPath: imagePath)
            storageRef.putData(imageData, metadata: metadata) { (metadata, error) in
                if let error = error {
                    self.statusLabel.text = "Upload Failed"
                    print(error.localizedDescription)
                    return
                }
                self.statusLabel.text = "Upload Succeeded"
            }
            
    }
    }
    @IBAction func Camera(_ sender: Any) {
    }
    

    

}
