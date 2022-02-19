//
//  HomeViewController.swift
//  Netflix-Clone
//
//  Created by Abdirizak Hassan on 2/16/22.
//

import UIKit
import SDWebImage

enum Sections: Int {
    case TrendingMovies = 0
    case TrendingTvs    = 1
    case Populars       = 2
    case UpComing       = 3
    case TopRated       = 4
}


class HomeViewController: UIViewController {
    
    let sectionTitles:[String] = ["Trending Movies", "Popular Movies", "Trending Tv", "Up Comming Movies", "Top rated"]
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableCell.self , forCellReuseIdentifier: CollectionViewTableCell.identifier)
        return table
    }()
    
     override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        congigureNavBar()
        let headerView = HeroHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeedTable.tableHeaderView = headerView
         
         fetchData()
    }
    
    private func fetchData() {
        
        APICaller.shared.getTopRated { _ in
            
        }
        
        
    }

    
    private func congigureNavBar() {
        var logo =  UIImage(named: "netflix_logo")
        logo = logo?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: logo, landscapeImagePhone: logo, style: .plain, target: self, action: nil)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.fill"), style: .plain, target: self, action: nil)
        ]
        
        navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableCell.identifier, for: indexPath) as! CollectionViewTableCell
        
        switch indexPath.section {
            case Sections.TrendingMovies.rawValue:
                APICaller.shared.getTrendingMovies { result in
                    switch result {
                    case .success(let movies):
                        cell.configure(with: movies)
                    case .failure(let err):
                        print(err.localizedDescription)
                    }
                }
            case Sections.TrendingTvs.rawValue:
                APICaller.shared.getTrendingTvs { result in
                    switch result {
                    case .success(let tvs):
                        cell.configure(with: tvs)
                    case .failure(let err):
                        print(err.localizedDescription)
                    }
                }
            case Sections.Populars.rawValue:
                APICaller.shared.getPopular { result in
                    switch result {
                    case .success(let popular):
                        cell.configure(with: popular)
                    case .failure(let err):
                        print(err.localizedDescription)
                    }
                }
            case Sections.UpComing.rawValue:
                APICaller.shared.getUpComingMovies { result in
                    switch result {
                    case .success(let upcoming):
                        cell.configure(with: upcoming)
                    case .failure(let err):
                        print(err.localizedDescription)
                    }
                }
            case Sections.TopRated.rawValue:
                APICaller.shared.getTopRated { result in
                    switch result {
                    case .success(let topRated):
                        cell.configure(with: topRated)
                    case .failure(let err):
                        print(err.localizedDescription)
                    }
                }
        default:
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y + 20, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.capitalizingFirstLetter()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // this will do to Hide the navigation
        let defaultScroller = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultScroller
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
        
    }
    
}
