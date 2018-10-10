//
//  PopularViewController.swift
//  MovieFlix
//
//  Created by Claudia Nelson on 10/10/18.
//  Copyright © 2018 Claudia Nelson. All rights reserved.
//

import UIKit

class PopularViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        fetchMovies()
        tableView.reloadData()

        // Do any additional setup after loading the view.
    }
    
    func fetchMovies() {
        MovieApiManager(endPoint: "popular").nowPlayingMovies{ (movies: [Movie]?, error: Error?) in
            if let movies = movies{
                self.movies = movies
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopularMovieCell", for: indexPath) as! MovieCell
        
        cell.movie = movies[indexPath.row]
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
