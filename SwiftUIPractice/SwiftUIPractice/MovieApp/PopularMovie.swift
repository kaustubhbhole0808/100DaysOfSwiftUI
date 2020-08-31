//
//  PopularMovie.swift
//  SwiftUIPractice
//
//  Created by Bhole, Kaustubh Satish on 31/08/20.
//  Copyright © 2020 Bhole, Kaustubh Satish. All rights reserved.
//

import Combine
import Foundation

struct PopularMovie : Codable, Hashable {
    let poster_path : String?
    let title : String?
    let overview : String?

    enum CodingKeys: String, CodingKey {
        case poster_path = "poster_path"
        case title = "title"
        case overview = "overview"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let path = try values.decode(String.self, forKey: .poster_path)
        poster_path = MovieDB.imageBaseUrl + path
        title = try values.decodeIfPresent(String.self, forKey: .title)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
    }
}


struct MovieRoot : Codable {
    let page : Int?
    let total_results : Int?
    let total_pages : Int?
    let results : [PopularMovie]

    enum CodingKeys: String, CodingKey {

        case page = "page"
        case total_results = "total_results"
        case total_pages = "total_pages"
        case results = "results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        total_results = try values.decodeIfPresent(Int.self, forKey: .total_results)
        total_pages = try values.decodeIfPresent(Int.self, forKey: .total_pages)
        results = try values.decode([PopularMovie].self, forKey: .results)
    }

}
