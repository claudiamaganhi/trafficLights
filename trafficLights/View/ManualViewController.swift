//
//  ManualViewController.swift
//  trafficLights
//
//  Created by Claudia Maganhi on 17/12/19.
//  Copyright © 2019 Claudia Maganhi. All rights reserved.
//

import UIKit

class ManualViewController: UIViewController {
    
    @IBOutlet var collectionView: [UIView]!
    
    var timer = Timer()
    var time: Int = 0
    enum Colors {
        case red, yellow, green
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundViews()
        setupNavigationBar()
        title = "Manual"
    }
    
    @objc func start() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Stop", style: .plain, target: self, action: #selector(stopLights))
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateColor), userInfo: nil, repeats: true)
    }
    
    @objc func stopLights() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start", style: .plain, target: self, action: #selector(start))
        timer.invalidate()
        for view in collectionView {
            view.backgroundColor = .lightGray
            time = 0
        }
    }
    
    @objc func updateColor() {
        for view in collectionView {
            view.backgroundColor = .lightGray
        }
        time += 1
        
        switch time {
        case 1:
            color(.green)
        case 2:
            color(.yellow)
        case 3:
            color(.red)
            time = 0
        default:
            break
        }
    }
    
    func color(_ color: Colors) {
        switch color {
        case .red:
            collectionView[0].backgroundColor = .systemRed
        case .yellow:
            collectionView[1].backgroundColor = .systemYellow
        case .green:
            collectionView[2].backgroundColor = .systemGreen
        }
    }
    
    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start", style: .plain, target: self, action: #selector(start))
    }
    
    func roundViews() {
        for view in collectionView {
            view.layer.cornerRadius = view.frame.width / 2
        }
    }
    
}

