//
//  ApiRequest.swift
//  Movie
//
//  Created by Alican Aycil on 14.01.2021.
//

import Foundation

protocol ApiRequesProtocol {
    func request() throws -> URLRequest
}

protocol NetworkConfiguration {
    static var shared: NetworkConfiguration { get }
    var headers: HTTPHeaders? { get }
    var host: String { get }
    init()
}

public typealias HTTPHeaders = [String: String]
public typealias QueryItems = [String: String]

final class ApiRequest<Configuration: NetworkConfiguration>: ApiRequesProtocol {
    
    private let httpMethod: HTTPMethod
    private let path: String
    private let parameters: [String:String]?
    private let body: Data?
    private let configuration = Configuration.shared
   
    public init(httpMethod: HTTPMethod, path: String, parameters: QueryItems? = nil, body: Data? = nil) {
        self.httpMethod = httpMethod
        self.path = path
        self.parameters = parameters
        self.body = body
    }
    
    func request() throws -> URLRequest {
        
        guard let url = asURL() else { throw NetworkError.invalidUrl }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.timeoutInterval = 60
        
        if let body = body {
            urlRequest.httpBody = body
        }
        
        
        configuration.headers?.forEach({
            urlRequest.addValue($0.value, forHTTPHeaderField: $0.key)
        })
        
        return urlRequest
    }
    
    private func asURL() -> URL? {
        var component = URLComponents()
        component.scheme = "https"
        component.host = configuration.host
        component.path = path
        
        let urlQueryItems: [URLQueryItem]? = parameters?.compactMap({ (key,value) -> URLQueryItem? in
            return URLQueryItem(name: key, value: value)
        })
        component.queryItems = urlQueryItems
        
        return component.url
        
    }
}

