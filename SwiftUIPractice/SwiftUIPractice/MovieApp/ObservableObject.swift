//
//  ObservableObject.swift
//  SwiftUIPractice
//
//  Created by Bhole, Kaustubh Satish on 31/08/20.
//  Copyright © 2020 Bhole, Kaustubh Satish. All rights reserved.
//

import Foundation
import Combine

class ListObservable: ObservableObject {

    /// Cancellable Object
    private var cancellable: AnyCancellable?

    /// Movies Array
    var movies = [PopularMovie]() {
        didSet {
            self.objectWillChange.send()
        }
    }

    /// Intialiser method
    init() {
        getMovies()
    }

    // Subscriber implementation
    func getMovies() {
        cancellable = MovieDB.request(.popularMovies)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                receiveValue: {
                    self.movies = $0.results
            })
    }
}
