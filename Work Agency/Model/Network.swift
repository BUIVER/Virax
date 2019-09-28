//
//  Network.swift
//  Work Agency
//
//  Created by Ivan Ermak on 9/28/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import Foundation

class Network {
    let session = URLSession.shared
    var baseUrl = URL(string: "https://virax.herokuapp.com/api")
    func createGetRequest(_ path: String, completion: @escaping ([NSDictionary]?) -> Void) {
        baseUrl?.appendPathComponent(path)
        guard let url = baseUrl else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let dataTask = session.dataTask(with: request, completionHandler: {data, response, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
                completion(nil)
            }
            if response != nil {
                print(response ?? "")
            }
            do {
                let jsonData = try JSONSerialization.jsonObject(with: data ?? Data(), options: .mutableContainers) as? [NSDictionary]
                completion(jsonData)
            } catch {
                print(error.localizedDescription)
            }
        })
        dataTask.resume()
    }
    func createPostRequest(_ path: String, httpBody: User, completion: @escaping (NSDictionary?) -> Void) {
        var localUrl = baseUrl
        localUrl?.appendPathComponent(path)
        guard let url = localUrl else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
            do {
            let jsonEncoder = JSONEncoder()
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let jsonData = try jsonEncoder.encode(httpBody)
            request.httpBody = jsonData
            } catch {
                print(error.localizedDescription)
            }
        let dataTask = session.dataTask(with: request, completionHandler: {data, response, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
                completion(nil)
            }
            if response != nil {
                print(response ?? "")
            }
            do {
                let jsonData = try JSONSerialization.jsonObject(with: data ?? Data(), options: .mutableContainers) as? NSDictionary
                completion(jsonData)
            } catch {
                print(error.localizedDescription)
            }
        })
        dataTask.resume()
    }
    func createGetRequestWithHeader(_ path: String, _ token: String, completion: @escaping ([NSDictionary]?) -> Void) {
        var localUrl = baseUrl
        localUrl?.appendPathComponent(path)
        guard let url = localUrl else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        let dataTask = session.dataTask(with: request, completionHandler: {data, response, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
                completion(nil)
            }
            if response != nil {
                print(response ?? "")
            }
            do {
                let jsonData = try JSONSerialization.jsonObject(with: data ?? Data(), options: .mutableContainers) as? [NSDictionary]
                completion(jsonData)
            } catch {
                print(error.localizedDescription)
            }
        })
        dataTask.resume()
    }
}
