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
    @IBOutlet weak var cameraView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGesture()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func setupGesture() {
        let imageGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.onTapImageView(_:)))
        imageGesture.delegate = self
        self.imageView.addGestureRecognizer(imageGesture)
        self.imageView.isUserInteractionEnabled = true
        
        let cameraGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.onTapCameraView(_:)))
        cameraGesture.delegate = self
        self.cameraView.addGestureRecognizer(cameraGesture)
        self.cameraView.isUserInteractionEnabled = true
    }

    @objc private func onTapImageView(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            let sourceType: UIImagePickerController.SourceType = UIImagePickerController.SourceType.photoLibrary
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
                let photoPicker = UIImagePickerController()
                photoPicker.sourceType = sourceType
                photoPicker.delegate = self
                photoPicker.navigationBar.tintColor = UIColor.white
                photoPicker.navigationBar.barTintColor = UIColor.gray
                
                self.present(photoPicker, animated: true, completion: nil)
            }
        }
    }

    @objc private func onTapCameraView(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            let sourceType: UIImagePickerController.SourceType = UIImagePickerController.SourceType.camera
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
                let cameraPicker = UIImagePickerController()
                cameraPicker.sourceType = sourceType
                cameraPicker.delegate = self
                cameraPicker.navigationBar.tintColor = UIColor.white
                cameraPicker.navigationBar.barTintColor = UIColor.gray

                self.present(cameraPicker, animated: true, completion: nil)
            }
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            switch picker.sourceType {
            case UIImagePickerController.SourceType.photoLibrary:
                self.imageView.image = image
            case UIImagePickerController.SourceType.camera:
                self.cameraView.image = image
            default:
                break
            }
        } else {
            print("Error")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}
