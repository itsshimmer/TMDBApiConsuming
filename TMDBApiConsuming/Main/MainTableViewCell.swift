//
//  MainTableViewCell.swift
//  TMDBApiConsuming
//
//  Created by João Brentano on 04/07/21.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    var movie: Movie?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cellImage: DetailUIImageView!
    
}
