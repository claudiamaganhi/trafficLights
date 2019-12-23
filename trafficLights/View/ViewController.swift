//
//  ViewController.swift
//  trafficLights
//
//  Created by Claudia Maganhi on 19/12/19.
//  Copyright © 2019 Claudia Maganhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
    }
    
    @IBAction func manualButton(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ManualViewController") else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func apiOne(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "APIViewController") else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func apiTwo(_ sender: UIButton) {
    }
    
}
