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
    
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self

        //Adjusting the collection view layout to be dynamic
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
        
        if let posterPathURL = movie.posterUrl{
            cell.posterImageView.af_setImage(withURL: posterPathURL)
        }
        return cell
    }
    
    func fetchMovies() {
        
        MovieApiManager(endPoint: "363088/similar").nowPlayingMovies{(movies: [Movie]?, error: Error?) in
            if let movies = movies{
                self.movies = movies
                self.collectionView.reloadData()
            }}

        //Now playing end point: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"

        //Super Hero (from the Ant Man and the Wasp id) end point: "https://api.themoviedb.org/3/movie/363088/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell =  sender as! UICollectionViewCell
        if let indexPath = collectionView.indexPath(for: cell){
            let movie = movies[indexPath.row]
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.movie = movie
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
