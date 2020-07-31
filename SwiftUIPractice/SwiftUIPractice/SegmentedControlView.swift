//
//  SegmentedControlView.swift
//  SwiftUIPractice
//
//  Created by Bhole, Kaustubh Satish on 19/07/20.
//  Copyright © 2020 Bhole, Kaustubh Satish. All rights reserved.
//

import SwiftUI

struct SegmentedControlView: View {
    @State private var selectedIndex = 0
    private let segmentItems = ["Nature","Birds","Cars"]
    private let images = ["Nature2","bird1","ferrari"]

    var body: some View {
        VStack {
            Picker("", selection: $selectedIndex) {
                ForEach(0 ..< segmentItems.count) {
                    Text(self.segmentItems[$0])
                }
            }.pickerStyle(SegmentedPickerStyle())
            .padding(.all, 20)
            .onReceive([self.selectedIndex].publisher.first())   { index in
                    switch index {
                    case 0:
                        print("First Tab selected")
                    case 1:
                        print("Second Tab selected")
                    default:
                        break
                    }
            }
            List {
                ForEach (0...4, id: \.self) { contact in
                    NavigationLink(destination: Image(self.images[self.selectedIndex])) {
                        CellRow(selectedIndex: self.selectedIndex)
                    }
                }
            }
        }
    }
}

struct CellRow: View {
    var selectedIndex = 0

    var body: some View {
        containViews()
    }

    func containViews() -> AnyView {
        switch self.selectedIndex {
        case 0:
            return AnyView(ListRow(text: "Colors are the smiles of Nature", image: "Nature2"))
        case 1:
            return AnyView(ListRow(text: "A bird who dares to fall is the bird who learn to fly", image: "bird1"))
        case 2:
            return AnyView(ListRow(text: "No road is long with Good Company", image: "ferrari"))
        default:
            return AnyView(ListRow(text: "cars are just Awesome", image: "ferrari"))
        }
    }
}

struct ListRow: View {
    var text: String
    var image: String

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(text)
            }
            Image(image)
            .resizable()
            .scaledToFit()
            .frame(height: 160, alignment: .center)
        }.background(Color(.lightGray))

    }
}

struct Car: View {
    var body: some View {
        Image("ferrari")
        .resizable()
        .scaledToFit()
        .frame(height: 160, alignment: .center)
    }
}

struct Nature: View {
    var body: some View {
        Image("Nature2")
        .resizable()
        .scaledToFit()
        .frame(height: 160, alignment: .center)
    }
}

struct SegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlView()
    }
}
