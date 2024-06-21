//
//  ApiClient.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 18/06/24.
//

import Foundation
import OSLog

final class ApiClient {
    private let logger = Logger(subsystem: "leojportes.MeliChallenge", category: "ApiClient")
    private let session: URLSession

    static let shared = ApiClient()

    init(session: URLSession = .shared) {
        self.session = session
    }

    func fetch<T: Codable>(model: T.Type, request: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        var urlComponents = URLComponents(string: request.path)
        logger.info("🚀 Starting request: \(request.path)")
        urlComponents?.queryItems = request.query
        guard let url = urlComponents?.url else {
            logger.info("❌ Invalid URL: \(request.path) \(#file):\(#line)")
            completion(.failure(NSError(domain: "Invalid URL", code: -1)))
            return
        }
        let urlRequest = URLRequest(url: url)
        let task = session.dataTask(with: urlRequest) { data, response, error in
            
            if let httpResponse = response as? HTTPURLResponse {
                self.logger.info("📡 Status code: \(httpResponse.statusCode)")
            }
            guard let data = data, error == nil else {
                self.logger.info("❌ Request error: \(String(describing: error?.localizedDescription)) \(#file):\(#line)")
                completion(.failure(NSError(domain: "Data task: \(String(describing: error?.localizedDescription))", code: -1)))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try decoder.decode(T.self, from: data)
                self.logger.info("✅ Success request: \(request.path)")
                completion(.success(result))
            } catch let error as NSError {
                self.logger.info("❌ Request error: \(String(describing: error.localizedDescription)) \(#file):\(#line)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
