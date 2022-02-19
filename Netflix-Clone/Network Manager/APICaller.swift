//
//  APICaller.swift
//  Netflix-Clone
//
//  Created by Abdirizak Hassan on 2/17/22.
//

import Foundation

enum APIErrors: Error {
    case failedTogetData
}

final class APICaller {
    static let shared = APICaller()
    
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: Constants.baseUrl + "/3/trending/movie/day?api_key=\(Constants.API_KEY)" ) else { return }
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let trendingMovies = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(trendingMovies.results))
                
            } catch  {
                completion(.failure(APIErrors.failedTogetData))
            }
        }.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: Constants.baseUrl + "/3/trending/tv/day?api_key=\(Constants.API_KEY)" ) else {
            return
            
        }
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let trendingTvs = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(trendingTvs.results))
            } catch {
                completion(.failure(APIErrors.failedTogetData))
            }
        }.resume()
    }
    
    
    func getUpComingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: Constants.baseUrl + "/3/ movie/upcoming?api_key=\(Constants.API_KEY)" ) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let upComming = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(upComming.results))
            } catch {
                completion(.failure(APIErrors.failedTogetData))
            }
        }.resume()
    }
    
    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: Constants.baseUrl + "/3/movie/popular?api_key=\(Constants.API_KEY)" ) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let popular = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(popular.results))
            } catch {
                completion(.failure(APIErrors.failedTogetData))
            }
        }.resume()
    }
    
    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: Constants.baseUrl + "/3/movie/top_rated?api_key=\(Constants.API_KEY)" ) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let topRated = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(topRated.results))
            } catch {
                completion(.failure(APIErrors.failedTogetData))
            }
        }.resume()
    }
    
}

