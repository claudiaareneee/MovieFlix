//
//  DetailViewController.swift
//  MovieFlix
//
//  Created by Claudia Nelson on 9/10/18.
//  Copyright © 2018 Claudia Nelson. All rights reserved.
//

import UIKit

enum MovieKeys {
    static let title = "title"
    static let releaseDate = "release_date"
    static let overview = "overview"
    static let backdropPath = "backdrop_path"
    static let posterPath = "poster_path"
    static let baseURL = "https://image.tmdb.org/t/p/w500"
}

class DetailViewController: UIViewController {

    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewTextView: UITextView!
    
    var movie: [String: Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let movie = movie{
            titleLabel.text = movie[MovieKeys.title] as? String
            releaseDateLabel.text = "Release date: \(movie[MovieKeys.releaseDate] as? String ?? "")"

            overviewTextView.text = movie[MovieKeys.overview] as? String
            
            let backdropPathString = movie[MovieKeys.backdropPath] as! String
            let posterPathString = movie[MovieKeys.posterPath] as! String
            let baseURLString = MovieKeys.baseURL
            
            let backdropURL = URL(string: baseURLString + backdropPathString)!
            backDropImageView.af_setImage(withURL: backdropURL)
            
            let posterURL = URL(string: baseURLString + posterPathString)!
            posterImageView.af_setImage(withURL: posterURL)
            
            
        
            //
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
