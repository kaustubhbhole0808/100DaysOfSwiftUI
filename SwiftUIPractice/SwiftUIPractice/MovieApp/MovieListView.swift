//
//  MovieListView.swift
//  SwiftUIPractice
//
//  Created by Bhole, Kaustubh Satish on 04/08/20.
//  Copyright © 2020 Bhole, Kaustubh Satish. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieListView: View {
    var categories = ["In Theater"]
    @State private var selectedCategoryIndex = 0
    var movieTypes = ["Action", "Drama", "Comedy", "Horror", "Crime"]
    @ObservedObject var viewModel = ListObservable()
    @State var isAnimating: Bool = true

    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack {
                    ForEach(0..<categories.count, id: \.self) { categoryIndex in
                        SegmentedBarButton(buttonIndex: self.$selectedCategoryIndex, title: self.categories[categoryIndex], currentButtonIndex: categoryIndex)
                            .padding(.leading, 20)
                            .font(Font.system(.title))
                    }
                }
            }).padding(.top, 40)
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack {
                    ForEach (movieTypes, id: \.self) { movieType in
                        CategoryButton(title: movieType)
                    }
                }
                }).padding()
            List {
                ForEach(viewModel.movies, id: \.self) { movie in
                    VStack {
                        WebImage(url: URL(string: movie.poster_path ?? ""),
                                 options: [.progressiveLoad, .delayPlaceholder],
                                 isAnimating: self.$isAnimating)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width - 40,
                                   height: UIScreen.main.bounds.width/2)
                            .cornerRadius(5)
                        Text(movie.title ?? "")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(Font(UIFont.boldSystemFont(ofSize: 12)))
                        Text(movie.overview ?? "")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(Font(UIFont.systemFont(ofSize: 12)))
                    }
                }
            }
            Spacer()
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .navigationBarItems(leading: NavigationButton(imageTitle: "bird"),
                            trailing: NavigationButton(imageTitle: "bird"))
    }
}

struct CategoryButton: View {
    var title: String
    var body: some View {
        Button(action: {
        }) {
            Text(title)
                .foregroundColor(Color.black)
                .font(Font.system(.body))
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 1)
                )
        }
    }
}

struct SegmentedBarButton: View {
    @Binding var buttonIndex: Int
    var title: String
    var currentButtonIndex: Int

    init(buttonIndex: Binding<Int>, title: String, currentButtonIndex: Int) {
        self._buttonIndex = buttonIndex
        self.title = title
        self.currentButtonIndex = currentButtonIndex
    }
    var body: some View {
        Button(action: {
            self.buttonIndex = 1
        }) {
            Text(title)
                .foregroundColor(Color.black)
                .foregroundColor(Color.black).bold()
        }
        .padding(Edge.Set.vertical, 5)
    }
}

struct NavigationButton: View {
    var imageTitle: String
    var body: some View {
        Button(action: {}) {
            Image(imageTitle)
            .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20, alignment: .center)
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
