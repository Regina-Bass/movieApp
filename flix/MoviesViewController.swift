//
//  MoviesViewController.swift
//  flix
//
//  Created by Regina Bass on 10/14/19.
//  Copyright © 2019 Regina Bass. All rights reserved.
//

import UIKit
import AlamofireImage

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Properties
    @IBOutlet var tableView: UITableView!
    var movies = [[String: Any]]()    //type of key: type of value is syntax for dictionary () = creation of something
    //var movies: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        print("Printing API pulled data: ")

        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            
            self.movies = dataDictionary["results"] as! [[String:Any]]     // instantiates variable movies as results then casts as dictionary
            
            self.tableView.reloadData()
                print(dataDictionary)
                print(" \n Number of Dictionaries/Hashes: ", dataDictionary.count, "\n")
                
            
              // TODO: Get the array of movies
              // TODO: Store the movies in a property to use elsewhere
              // TODO: Reload your table view data

           }
        }
        task.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let description = movie["overview"] as! String
        
        let baseUrl = "http://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        //print(posterUrl)  //debug
        cell.posterView.af_setImage(withURL: posterUrl!)
        
        
        //cell.textLabel!.text = title
        cell.titleLabel.text = title
        cell.descriptionLabel.text = description
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // think that you're 'preparing' the next screen by sending data etc
        
        print("Loading up the details screen")
        //Two tasks - find the selected movie
        //cast
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let movie = movies[indexPath.row]
        //Pass the selected movie to the details view Controller
        //sender is cell (that was tapped on)
        //segueway
        let detailsViewController = segue.destination as!MovieDetailsViewController
        detailsViewController.movie = movie
        //cast
        
        //deselects the table cell when you go from one screen then back
        tableView.deselectRow(at:indexPath, animated: true)
        
        
    }
    
    

}
