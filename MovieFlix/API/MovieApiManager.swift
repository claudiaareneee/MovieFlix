//
//  MovieApiManager.swift
//  MovieFlix
//
//  Created by Claudia Nelson on 10/9/18.
//  Copyright © 2018 Claudia Nelson. All rights reserved.
//

import Foundation


class MovieApiManager {
    static let baseURL = "https://api.themoviedb.org/3/movie/"
    static let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
    
    var session: URLSession
    var endPoint: String
    
    init(endPoint: String) {
        self.endPoint = endPoint
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func nowPlayingMovies(completion: @escaping ([Movie]?, Error?) -> ()) {
        let url = URL(string: MovieApiManager.baseURL + endPoint + "?api_key=\(MovieApiManager.apiKey)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run whten the network request returns
            // Network request are asynchronus
            // Thread - Pipe sort of the same thing
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                //json parsing
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                let movieDictionaries = dataDictionary["results"] as! [[String: Any]]
                
                let movies = Movie.movies(dictionaries: movieDictionaries)
                completion(movies, nil)
                }
            else{
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    
    
    
}


