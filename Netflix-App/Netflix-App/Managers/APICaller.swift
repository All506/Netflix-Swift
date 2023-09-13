//
//  APICaller.swift
//  Netflix-App
//
//  Created by Allan Trejos Salazar on 13/9/23.
//

import Foundation

struct Constants{
    static let API_KEY = "6b26fb02c01bb5a4b4f5cb08302a6a99"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller{
    static let shared = APICaller()
    
    //Get movies and if there is a mistake just send an error
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void){
        
        guard let url = URL(string:"\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) { data, _,error in
            //Convert it to variable if exists
            guard let data = data, error == nil else {
                return
            }
            
            do{
                //Asigns values from api to an object
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
                
            } catch {
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
}
