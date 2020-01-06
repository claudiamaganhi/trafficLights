//
//  APIViewController.swift
//  trafficLights
//
//  Created by Claudia Maganhi on 18/12/19.
//  Copyright © 2019 Claudia Maganhi. All rights reserved.
//

import UIKit

class APIViewController: UIViewController {
    
    @IBOutlet var collectionView: [UIView]!

    enum State: String {
        case greenLight = "greenLight"
        case yellowLight = "yellowLight"
        case redLight = "redLight"
    }
    
    var trafficLightService = TrafficLightService()
    var trafficLights = TrafficLight()
    var timer = Timer()
    var time: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTrafficLights()
        roundViews()
        setupNavigationBar()
        title = "API"
    }
    
    @objc func start() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Stop", style: .plain, target: self, action: #selector(stopLights))
        guard let next = trafficLights.nextTimeCall else { return }
        guard let nextTimeCall = Double(next) else { return }
        let timeInterval = nextTimeCall / nextTimeCall
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(updateColor), userInfo: nil, repeats: true)
    }
    
    @objc func updateColor() {
        for view in collectionView {
            view.backgroundColor = .lightGray
        }
        time += 1
        
        switch time {
        case 1:
            state(.greenLight)
        case 2:
            state(.yellowLight)
        case 3:
            state(.redLight)
            time = 0
        default:
            break
        }
    }

    func state(_ state: State) {
        
        switch state {
        case .greenLight:
            trafficLights.currentState = state.rawValue
            collectionView[2].backgroundColor = .systemGreen
        case .redLight:
            trafficLights.currentState = state.rawValue
            collectionView[0].backgroundColor = .systemRed
        case .yellowLight:
            trafficLights.currentState = state.rawValue
            collectionView[1].backgroundColor = .systemYellow
        }
    }
    
    @objc func stopLights() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start", style: .plain, target: self, action: #selector(start))
        timer.invalidate()
        for view in collectionView {
            view.backgroundColor = .lightGray
            time = 0
        }
    }
    
    func fetchTrafficLights() {
          trafficLightService.trafficLightsRequest { (response) in
            switch response {
            case .success(let trafficLights):
                self.trafficLights = trafficLights
            case .failure(let error):
                print(error.localizedDescription)
            }
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
