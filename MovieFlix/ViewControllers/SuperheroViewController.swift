//
//  SuperheroViewController.swift
//  MovieFlix
//
//  Created by Claudia Nelson on 9/14/18.
//  Copyright © 2018 Claudia Nelson. All rights reserved.
//

import UIKit

class SuperheroViewController: UIViewController, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self

        let layout =  collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellsPerLine: CGFloat = 2
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = layout.minimumInteritemSpacing
        let interItemSpacing = layout.minimumInteritemSpacing * (cellsPerLine - 1)
        let width = collectionView.frame.size.width/cellsPerLine - interItemSpacing/cellsPerLine
        
        layout.itemSize = CGSize(width: width, height: width * 3/2)
        




        fetchMovies()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        let movie  = movies[indexPath.item]
        if let posterPathString = movie["poster_path"] as? String{
            let baseURlString = "https://image.tmdb.org/t/p/w500"
            let posterURL = URL(string: baseURlString + posterPathString)!
            cell.posterImageView.af_setImage(withURL: posterURL)
        }
        
        // https://courses.codepath.com/course_videos/ios_university/youtu/hnZ9nhkqGhg?title=Collection+View+Setup 9:47
        return cell
    }
    
    func fetchMovies() {
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run whten the network request returns
            // Network request are asynchronus
            // Thread - Pipe sort of the same thing
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                //json parsing
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                let movies = dataDictionary["results"] as! [[String: Any]]
                self.movies = movies
                self.collectionView.reloadData()
//                self.refreshControl.endRefreshing()
            }
        }
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
