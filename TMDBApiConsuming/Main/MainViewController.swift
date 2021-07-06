//
//  MainViewController.swift
//  TMDBApiConsuming
//
//  Created by João Brentano on 01/07/21.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let tmdbService: TMDBService = TMDBService()
    var page: Int = 1
    var popularMovies: [Movie] = [] { //
        didSet { //
            DispatchQueue.main.async { //
                self.tableView.isHidden = self.popularMovies.isEmpty //
                self.activityIndicator.isHidden = !self.popularMovies.isEmpty //
            } //
        } //
    } //
    
    var nowPlayingMovies: [Movie] = [] { //
        didSet { //
            DispatchQueue.main.async { //
                self.tableView.isHidden = self.popularMovies.isEmpty //
                self.activityIndicator.isHidden = !self.popularMovies.isEmpty //
            } //
        } //
    } //
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Header/Title
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = UIColor(named: "NavBarGray")
        navigationItem.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        
        // Search bar
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search"
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        
        // Fetches data from the API to compose the screen
        tableView.dataSource = self //
        tableView.isHidden = self.popularMovies.isEmpty //
        activityIndicator.isHidden = !self.popularMovies.isEmpty //
        
        tmdbService.getPopularMovies(completionHandler: { popularMovies in
            self.popularMovies = popularMovies
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }, page: page)
        
        tmdbService.getNowPlaying(completionHandler: { nowPlayingMovies in
            self.nowPlayingMovies = nowPlayingMovies
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }, page: page)
        
        page += 1
        
        // Table view tweaks
        tableView.estimatedRowHeight = 120.0;
        tableView.rowHeight = UITableView.automaticDimension;
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail", let cell = sender as? MainTableViewCell {
            let destination = segue.destination as? DetailViewController
            destination?.movie = cell.movie
        }
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

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popularMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath) as! MainTableViewCell
        let movie = indexPath.section == 0 ? popularMovies[indexPath.row] : nowPlayingMovies[indexPath.row]
        cell.movie = movie
        cell.titleLabel.text = movie.original_title
//        cell.detailTextLabel?.text = "\(movie.id)"
//        let url: URL = URL(string: "https://image.tmdb.org/t/p/original\(movie.poster_path)")!
//        cell.cellImage.load(url: url)
        cell.cellImage.image = movie.poster
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        section == 0 ? "Popular Movies" : "Now Playing"
    }
    
}
