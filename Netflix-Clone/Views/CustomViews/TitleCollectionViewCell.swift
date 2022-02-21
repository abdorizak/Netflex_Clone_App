//
//  TitleCollectionViewCell.swift
//  Netflix-Clone
//
//  Created by Abdirizak Hassan on 2/19/22.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: CollectionViewTableCell.self)
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    public func configure(with model: String) {
        guard let image = URL(string: Constants.Poster_Image + "\(model)") else { return }
        posterImageView.sd_setImage(with: image, completed: nil)
//        print(model)
    }
    
}
