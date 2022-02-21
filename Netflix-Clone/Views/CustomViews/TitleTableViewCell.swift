//
//  TitleTableViewCell.swift
//  Netflix-Clone
//
//  Created by Abdirizak Hassan on 2/19/22.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: TitleCollectionViewCell.self)
    
    private let playBtn: UIButton = {
        let playBtn = UIButton()
        let img = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        playBtn.setImage(img, for: .normal)
        playBtn.translatesAutoresizingMaskIntoConstraints = false
        return playBtn
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        return titleLabel
    }()
    
    private let titlesPosterUIImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlesPosterUIImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playBtn)
        applyConstraints()
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
//            titlesPosterUIImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
            titlesPosterUIImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlesPosterUIImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant:  10),
            titlesPosterUIImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titlesPosterUIImage.widthAnchor.constraint(equalToConstant: 100),
            
            titleLabel.leadingAnchor.constraint(equalTo: titlesPosterUIImage.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            playBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            playBtn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor  )
        ])
    }
    
    public func configure(with model: TitleViewModel) {
        guard let url = URL(string: Constants.Poster_Image + "\(model.posterURL)") else { return }
        titlesPosterUIImage.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
