//
//  Network.swift
//  HW_Networking
//
//  Created by Iryna Zubrytska on 01.11.2022.
//

import Foundation

final class Network<T: Endpoint> {

    private let host: String
    private let headers: [String : String]
    private let session = URLSession.shared

    init(_ host: String, headers: [String : String] = [:]) {
        self.host = host
        self.headers = headers
    }

    func perform(_ method: Method, _ endpoint: T, _ parameters: NetworkRequestBodyConvertible? = nil, completion: @escaping (Result) -> ()) {
        guard let request = makeRequest(method, endpoint, parameters) else {
            return
        }

        session.dataTask(with: request) { data, _, error in
            if let error {
                completion(.error(error))
            } else {
                completion(.data(data))
            }
        }.resume()
    }

    func perform(_ method: Method, _ endpoint: T, _ parameters: NetworkRequestBodyConvertible? = nil) async throws -> Data {
        guard let request = makeRequest(method, endpoint, parameters) else {
            return Data()
        }
        let (data, _) = try await session.data(for: request)
        return data
    }

    // MARK: Private methods
    
    private func makeRequest(_ method: Method,
                             _ endpoint: T,
                             _ parameters: NetworkRequestBodyConvertible?) -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = endpoint.pathComponent

        if method == .get {
            urlComponents.queryItems = parameters?.queryItems
        }

        guard let url = urlComponents.url else {
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers

        if method == .post {
            request.httpBody = parameters?.data
        }

        return request
    }
}
