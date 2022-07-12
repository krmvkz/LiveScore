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

enum API {
    case football
    case news
}

private enum ConstantURL {
    static let baseFootball = "https://v3.football.api-sports.io/"
    static let baseNews = "https://newsapi.org/v2/"
}

private enum ConstantHeader {
    static let footballAPI = HTTPHeaders([
        HTTPHeader(name: "x-apisports-key", value: "4c055592a7bea77e020e7b83af206c25")
    ])
    static let newsAPI = HTTPHeaders([
        HTTPHeader(name: "X-Api-Key", value: "8792a95d44d14244b2e11ea3f3d0ecb4")
    ])
}

final class NetworkManager {
    // MARK: - Shared instance
    static let shared = NetworkManager()
    
    private init() { }
    
    // MARK: - Methods:
    func performGetRequest<T: Decodable>(api: API, model: T.Type, path: String = "", params: Parameters, completion: @escaping (Result<T, Error>) -> Void) {
        let status = NetworkReachabilityManager.default?.status
        if status != .unknown && status != .notReachable {
            print("Network is Reachable")
            var headers: HTTPHeaders
            var url: URL?
            
            if api == .football {
                url = URL(string: "\(ConstantURL.baseFootball)\(path)")
                headers = ConstantHeader.footballAPI
            } else {
                url = URL(string: "\(ConstantURL.baseFootball)\(path)")
                headers = ConstantHeader.footballAPI
            }
            
            guard let url = url else { return }
            
            AF.request(url, parameters: params, headers: headers).responseDecodable(of: T.self) { response in
                switch response.result {
                case .failure(let error):
                    completion(.failure(error))
                case .success(let data):
                    completion(.success(data))
                }
            }
        } else {
            print("\(status ?? .unknown)")
        }
    }
}
