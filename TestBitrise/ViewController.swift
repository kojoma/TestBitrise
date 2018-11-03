//
//  ViewController.swift
//  TestBitrise
//
//  Created by masaru.kojo on 2018/11/01.
//  Copyright © 2018年 kojoma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    var picker: UIImagePickerController! = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGesture()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func setupGesture() {
        let gesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.onTapImageView(_:)))
        gesture.delegate = self
        self.imageView.addGestureRecognizer(gesture)
        self.imageView.isUserInteractionEnabled = true
    }

    @objc private func onTapImageView(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            self.picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            self.picker.delegate = self
            
            self.picker.navigationBar.tintColor = UIColor.white
            self.picker.navigationBar.barTintColor = UIColor.gray
            
            present(self.picker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageView.image = image
        } else {
            print("Error")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}
