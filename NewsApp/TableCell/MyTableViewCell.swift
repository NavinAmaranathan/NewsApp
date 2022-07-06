//
//  MyTableViewCell.swift
//  NewsApp
//
//  Created by Navi on 05/07/22.
//

import UIKit
import SDWebImage

class MyTableViewCell: UITableViewCell {

    // MARK: - Static properties
    
    static let identifier: String = "MyTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyTableViewCell", bundle: .main)
    }
    
    // MARK: - Properties

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var cellImageView: UIImageView! {
        didSet {
            cellImageView.layer.masksToBounds = true
            cellImageView.layer.cornerRadius = 8
        }
    }
    @IBOutlet private var dateLabel: UILabel!
    
    // MARK: - Lifecycle methods

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Implementation methods

    func configure(with model: CellModel) {
        titleLabel.text = model.title
        descriptionLabel.text = model.subtitle
        dateLabel.text = model.date ?? ""
        guard let image = model.imageURL else { return }
        cellImageView.sd_setImage(with: URL(string: image),
                                   placeholderImage: UIImage(systemName: "photo"),
                                   options: .continueInBackground,
                                   context: nil)
    }
}
