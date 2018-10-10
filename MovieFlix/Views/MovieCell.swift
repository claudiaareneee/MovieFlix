//
//  MovieCell.swift
//  MovieFlix
//
//  Created by Claudia Nelson on 9/8/18.
//  Copyright © 2018 Claudia Nelson. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    var title: String!
    var overview: String!
    var posterUrl: URL?
    
    
    
    var movie: Movie?{
        didSet{
            if let movie = movie{
                title = movie.title
                overview = movie.overview
                
                titleLabel.text = title
                overviewLabel.text = overview
                
                
                if let posterURL = movie.posterUrl{
                    posterImageView.af_setImage(withURL: posterURL)
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
