//
//  ViewController.swift
//  TERUMIN
//
//  Created by IkukoHiraga on 2018/06/16.
//  Copyright © 2018年 IkukoHiraga. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let imagePickerController = UIImagePickerController()
    var videoURL: URL?
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func selectImage(_ sender: Any) {
        
        print("UIBarButtonItem。カメラロールから動画を選択")
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        //imagePickerController.mediaTypes = ["public.image", "public.movie"]
        //動画だけ
        imagePickerController.mediaTypes = ["public.movie"]
        //画像だけ
        //imagePickerController.mediaTypes = ["public.image"]
        present(imagePickerController, animated: true, completion: nil)
    }

    @IBAction func matomeruButtonTapped(_ sender: Any) {
        let matomeruView = storyboard?.instantiateViewController(withIdentifier: "matomeru") as! MatomeruViewController
        self.present(matomeruView, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        videoURL = info["UIImagePickerControllerReferenceURL"] as? URL
        print(videoURL!)
        imagePickerController.dismiss(animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

