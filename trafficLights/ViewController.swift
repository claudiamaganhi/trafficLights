//
//  ViewController.swift
//  trafficLights
//
//  Created by Claudia Maganhi on 17/12/19.
//  Copyright © 2019 Claudia Maganhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var collectionView: [UIView]!

    override func viewDidLoad() {
        super.viewDidLoad()
        roundViews()
        
    }
    
    func roundViews() {
        for view in collectionView {
            view.layer.cornerRadius = view.frame.width / 2
        }
    }


}

