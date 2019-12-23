//
//  TrafficLight.swift
//  trafficLights
//
//  Created by Claudia Maganhi on 18/12/19.
//  Copyright © 2019 Claudia Maganhi. All rights reserved.
//

import Foundation

struct TrafficLight: Codable {
    
    var currentState: String?
    var nextTimeCall: String?
    var order: [String]?
    
    enum CodingKeys: String, CodingKey {
        case currentState = "current_state"
        case nextTimeCall = "next_time_call"
        case order = "order"
    }
    
}



