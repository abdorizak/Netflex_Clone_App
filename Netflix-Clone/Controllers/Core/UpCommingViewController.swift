//
//  UpCommingViewController.swift
//  Netflix-Clone
//
//  Created by Abdirizak Hassan on 2/16/22.
//

import UIKit
import ProgressHUD

class UpCommingViewController: UIViewController {
    
    private var titles:[Title] = [Title]()
    private let upComingTable: UITableView = {
        let tableView = UITableView( )
        tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Up Comming"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        view.addSubview(upComingTable)
        
        upComingTable.delegate   = self
        upComingTable.dataSource = self
        
        fetchUpComing()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upComingTable.frame = view.bounds
    }
    
    fileprivate func fetchUpComing() {
        APICaller.shared.getUpComingMovies { [weak self] result in
            switch result {
            case .success(let titles):
                self?.titles = titles
                DispatchQueue.main.async {
                    self?.upComingTable.reloadData()
                }
            case .failure(let err):
                print(err.localizedDescription )
            }
        }
    }
    
}


extension UpCommingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as! TitleTableViewCell
        let title = titles[indexPath.row]
        cell.configure(with: TitleViewModel(titleName: (title.original_name ?? title.original_title) ?? "Unknow Title" , posterURL: title.poster_path ?? "nil"))
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = titles[indexPath.row]
        
        guard let titleName = title.original_title ?? title.original_name else { return }
        
        APICaller.shared.getMovie(with: titleName) { [weak self] result in
            switch result {
            case .success(let vedioElement):
                ProgressHUD.show()
//                DispatchQueue.main.async {
//                    let vc = TitlePreviewViewController()
//                    vc.configure(with: TitlePreviewViewModel(title: titleName, youtubeView: vedioElement, titleOverview: title.overview ?? ""))
//                    self?.navigationController?.pushViewController(vc, animated: true)
//                    ProgressHUD.dismiss()
//                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    let vc = TitlePreviewViewController()
                    vc.configure(with: TitlePreviewViewModel(title: titleName, youtubeView: vedioElement, titleOverview: title.overview ?? ""))
                    self?.navigationController?.pushViewController(vc, animated: true)
                    ProgressHUD.dismiss()
                }
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
