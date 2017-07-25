//
//  ViewController.swift
//  UIImagePickerLeakTest
//
//  Created by David Golightly on 7/25/17.
//  Copyright © 2017 David Golightly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var camera: Camera = CameraReal()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        camera.takePictures(from: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

