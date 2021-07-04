//
//  MainViewController.swift
//  TMDBApiConsuming
//
//  Created by João Brentano on 01/07/21.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    let tmdbService: TMDBService = TMDBService()
    var popularMovies: [Movie] = [] { //
        didSet { //
            DispatchQueue.main.async { //
                self.tableView.isHidden = self.popularMovies.isEmpty //
                self.activityIndicator.isHidden = !self.popularMovies.isEmpty //
            } //
        } //
    } //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
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
        }, page: 1)
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        
        let movie = popularMovies[indexPath.row]
        
        cell.textLabel?.text = movie.original_title
        cell.detailTextLabel?.text = "\(movie.id)"
        print("\(indexPath):\(cell)")
        return cell
    }
    
}
