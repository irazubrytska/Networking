//
//  AlamoNetwork.swift
//  HW_Networking
//
//  Created by Iryna Zubrytska on 01.11.2022.
//

import Foundation
import Alamofire

final class AlamoNetworking<T: Endpoint> {

    private let host: String
    private let headers: [String : String]

    init(_ hostString: String, headers: [String : String] = [:]) {
        self.host = hostString
        self.headers = headers
    }

    func perform(_ method: HTTPMethod, _ endpoint: T, _ parameters: NetworkRequestBodyConvertible, completion: @escaping (Result) -> ()) {

        AF
            .request(host + "/\(endpoint.pathComponent)", method: method, parameters: parameters.data, headers: HTTPHeaders(headers))
            .response { response in
                if let error = response.error {
                    completion(.error(error))
                } else {
                    completion(.data(response.data))
                }
            }
    }

    func perform(_ method: HTTPMethod, _ endpoint: T, _ parameters: NetworkRequestBodyConvertible) async throws -> Data? {
        return try await withCheckedThrowingContinuation { continuation in
            perform(method, endpoint, parameters) { result in
                switch result {
                case .data(let data):
                    continuation.resume(returning: data)
                case .error(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
