//
//  DetailViewController.swift
//  TMDBApiConsuming
//
//  Created by João Brentano on 04/07/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var movie: Movie?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var imageView: DetailUIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let movie = movie else {
            return
        }
        titleLabel.text = movie.original_title
        detailLabel.text = movie.overview
        let url: URL = URL(string: "https://image.tmdb.org/t/p/original\(movie.poster_path)")!
        self.imageView.load(url: url)
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
