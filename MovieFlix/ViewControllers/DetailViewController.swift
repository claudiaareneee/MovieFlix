//
//  DetailViewController.swift
//  MovieFlix
//
//  Created by Claudia Nelson on 9/10/18.
//  Copyright © 2018 Claudia Nelson. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
//    @IBOutlet weak var overviewTextView: UITextView!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let movie = movie{
            titleLabel.text = movie.title
            releaseDateLabel.text = "Release date: \(String(describing: movie.releaseDate!))"
            overviewLabel.text = movie.overview
            
            if let backdropURL = movie.backdropURL{
                backDropImageView.af_setImage(withURL: backdropURL)
            }
            
            if let posterURL = movie.posterUrl{
                posterImageView.af_setImage(withURL: posterURL)
            }

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
