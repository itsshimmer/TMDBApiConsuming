//
//  DetailViewController.swift
//  TMDBApiConsuming
//
//  Created by João Brentano on 04/07/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var movie: Movie?
//    {
//        didSet {
//            detailLabel.text = movie?.overview
//            print(movie!)
//        }
//    }

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = movie?.title
        detailLabel.text = movie?.overview
        // Do any additional setup after loading the view.
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
