//
//  TrafficLightService.swift
//  trafficLights
//
//  Created by Claudia Maganhi on 18/12/19.
//  Copyright © 2019 Claudia Maganhi. All rights reserved.
//

import Foundation

class TrafficLightService: Codable {
    
    func trafficLightsRequest(completion: @escaping (Result<TrafficLight, Error>) -> ()) {
        let urlString = "https://private-5165a-semaphoretest.apiary-mock.com/setup/traffic-light"
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                guard let data = data else { return }
                do {
                    let trafficLights = try JSONDecoder().decode(TrafficLight.self, from: data)
                    completion(.success(trafficLights))
                } catch let jsonError {
                    completion(.failure(jsonError))
                }
            }.resume()
        }
    }
    
}
