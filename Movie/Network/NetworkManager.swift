//
//  NetworkManager.swift
//  Movie
//
//  Created by Alican Aycil on 14.01.2021.
//

import Foundation

protocol CancelableSessionProtokol {
    func cancel()
}

final class NetworkManager: CancelableSessionProtokol {
    
    private let session: URLSession
    private var dataTask: URLSessionDataTask?
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func loadData<ResponseModel: Decodable>(urlRequest: ApiRequesProtocol, responseModel: ResponseModel.Type, completionHandler: @escaping (Result<ResponseModel,NetworkError>) -> Void) -> CancelableSessionProtokol {
        
        do {
            let urlRequest = try urlRequest.request()
            
            let task = session.dataTask(with: urlRequest) { [weak self ](data, _, _) in
                guard let self = self else { return }
                if let data = data {
                    do {
                        let response = try self.decode(data: data, responseModel: ResponseModel.self)
                        DispatchQueue.main.async {
                            completionHandler(.success(response))
                        }
                    } catch {
                        DispatchQueue.main.async {
                            completionHandler(.failure(NetworkError.invalidJson))
                        }
                    }
                    if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                        print(json)
                    }
                }
            }
            
            dataTask = task
            task.resume()
        } catch {
            completionHandler(.failure(NetworkError.invalidUrl))
        }
        
        return self
    }
    
    private func decode<T: Decodable>(data: Data, responseModel: T.Type) throws -> T {
        do {
            let decoder = JSONDecoder()
            let object = try decoder.decode(responseModel, from: data)
            return object
        } catch  {
            throw NetworkError.invalidJson
        }
    }
    
    func cancel() {
        dataTask?.cancel()
    }
}
