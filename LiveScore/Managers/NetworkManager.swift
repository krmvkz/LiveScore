//
//  NetworkManager.swift
//  LiveScore
//
//  Created by Arman Karimov on 11.06.2022.
//

import Alamofire

private enum NetworkError: String, Error {
    case noInternet = "Network Not Reachable"
    case invalidResponse = "Invalid Response"
    case decodingError = "Decoding error"
    case requestError = "Fetch request failed"
}

enum ConstantURL {
    static let baseFootball = "https://v3.football.api-sports.io/"
    static let baseNews = "https://newsapi.org/v2/"
}

class NetworkManager {
    // MARK: - Shared instance
    static let shared = NetworkManager()
    
    // MARK: - Properties
    private let reachabilityManager = NetworkReachabilityManager()
    
    // MARK: - Methods:
    func fetchRequest<T: Decodable>(type: T, urlString: String, path: String?, params: Parameters?, headers: HTTPHeaders?, completion: @escaping (Result<T, Error>) -> Void) {
        if reachabilityManager?.isReachable ?? false {
            print("Network is Reachable")
            if let url = URL(string: "\(urlString)\(path ?? "")") {
                AF.request(url, parameters: params, headers: headers).responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .failure(let error):
                        completion(.failure(error))
                    case .success(let data):
                        completion(.success(data))
                    }
                }
            }
        } else {
            print("\(NetworkError.noInternet)")
        }
    }
}
