//
//  HeroHeaderView.swift
//  Netflix-Clone
//
//  Created by Abdirizak Hassan on 2/16/22.
//

import UIKit

class HeroHeaderView: UIView {
    
    private let downloadBtn: UIButton = {
       let download = UIButton()
//        let boldConfig = UIImage.SymbolConfiguration(weight: .bold)
//        let boldSearch = UIImage(systemName: "arrow.down.circle", withConfiguration: boldConfig)
//        download.setImage(boldSearch, for: .normal)
        download.setTitle("Download", for: .normal)
        download.setTitleColor(UIColor.black, for: .normal)
        download.backgroundColor = .white
        download.layer.borderColor = UIColor.systemBackground.cgColor
        download.layer.borderWidth = 1
        download.layer.cornerRadius = 15
        download.translatesAutoresizingMaskIntoConstraints = false
        return download
    }()
    
    private let playButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Play", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.borderColor = UIColor.systemBackground.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 15
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let heroImageVIew: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "heroImage")
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageVIew)
        addGradient()
        addSubview(playButton)
        addSubview(downloadBtn)
        configration()
    }
    
    private func configration() {
        NSLayoutConstraint.activate([
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 90),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 120),

            downloadBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -90),
            downloadBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant:  -50),
            downloadBtn.widthAnchor.constraint(equalToConstant: 120)
            ])
    }
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageVIew.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
