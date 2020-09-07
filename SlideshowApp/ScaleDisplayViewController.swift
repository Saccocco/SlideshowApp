//
//  ScaleDisplayViewController.swift
//  SlideshowApp
//
//  Created by 新宅 千晶 on 2020/09/07.
//  Copyright © 2020 sachiko.nakagiri. All rights reserved.
//

import UIKit

class ScaleDisplayViewController: UIViewController {
    
    @IBOutlet weak var displayImageView: UIImageView!
    
    var imageName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        displayImageView.image = UIImage(named: imageName)
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
