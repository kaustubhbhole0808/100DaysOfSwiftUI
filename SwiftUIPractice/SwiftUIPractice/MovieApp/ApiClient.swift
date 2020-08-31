//
//  ApiClient.swift
//  SwiftUIPractice
//
//  Created by Bhole, Kaustubh Satish on 31/08/20.
//  Copyright © 2020 Bhole, Kaustubh Satish. All rights reserved.
//

import Foundation
import Combine

enum MovieDB {
    static let apiClient = APIClient()
    static let baseUrl = URL(string: "https://api.themoviedb.org/3/")!
    static let imageBaseUrl = "https://image.tmdb.org/t/p/w500/"
}

enum APIPath: String {
    case popularMovies = "movie/popular"
}

struct APIClient {

    struct Response<T> {
        let value: T
        let response: URLResponse
    }

    func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                let value = try JSONDecoder().decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}

extension MovieDB {
    static func request(_ path: APIPath) -> AnyPublisher<MovieRoot, Error> {
        guard var components = URLComponents(url: baseUrl.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
            else { fatalError("Couldn't create URLComponents") }
        components.queryItems = [URLQueryItem(name: "api_key", value: "API_KEY")]

        let request = URLRequest(url: components.url!)

        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
