//
//  ViewController.swift
//  Stevie
//
//  Created by Phillip Caudell on 03/12/2016.
//  Copyright © 2016 Founders Factory. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CameraViewDelegate {
    
    let cameraView = CameraView()
    let imagePreview = UIImageView()
    let overlayView = OverlayView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(cameraView)
        cameraView.delegate = self
        cameraView.start()
        
        self.view.backgroundColor = UIColor.white

        let gesture = UITapGestureRecognizer(target: self, action:#selector(self.capture))
        self.view.addGestureRecognizer(gesture)
        
        self.view.addSubview(overlayView)
        
        overlayView.state = .thinking
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        cameraView.frame = self.view.bounds
        overlayView.frame = self.view.bounds
    }

    func capture() {
        cameraView.requestImage()
    }
    
    func cameraView(_: CameraView, image: UIImage) {
        print("got an image!")
        print(image)
    }
}

