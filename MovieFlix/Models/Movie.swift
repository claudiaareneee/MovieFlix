//
//  Movie.swift
//  MovieFlix
//
//  Created by Claudia Nelson on 10/9/18.
//  Copyright © 2018 Claudia Nelson. All rights reserved.
//

import Foundation

class Movie {
    
    enum MovieKeys {
        static let title = "title"
        static let releaseDate = "release_date"
        static let overview = "overview"
        static let backdropPath = "backdrop_path"
        static let posterPath = "poster_path"
        static let baseURL = "https://image.tmdb.org/t/p/w500"
    }
    
    var title: String
    var overview: String?
    var posterUrl: URL?
    var releaseDate: String?
    var backdropURL: URL?

    
    let baseUrlString = "https://image.tmdb.org/t/p/w500"
    
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        overview = dictionary ["overview"] as? String ?? "No overview"
        releaseDate = dictionary["release_date"] as? String ?? "No release date"
        let posterPath = dictionary["poster_path"] as? String
        let backdropPath = dictionary["backdrop_path"] as? String
        
        if let posterPath = posterPath {
            let completePath = baseUrlString + posterPath
            posterUrl = URL(string: completePath)
        }
        
        if let backdropPath = backdropPath{
            let completePath = baseUrlString + backdropPath
            backdropURL = URL(string: completePath)
        }
        
        // Set the rest of the properties
    }
}
