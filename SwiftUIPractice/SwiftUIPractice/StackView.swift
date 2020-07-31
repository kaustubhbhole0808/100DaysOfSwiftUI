//
//  StackView.swift
//  SwiftUIPractice
//
//  Created by Bhole, Kaustubh Satish on 18/07/20.
//  Copyright © 2020 Bhole, Kaustubh Satish. All rights reserved.
//

import SwiftUI

struct StackView: View {
    let dummyArray = 0...20
    @State private var selectedIndex = -1
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(dummyArray, id: \.self) { index in
                HStack{
                    if self.selectedIndex == index {
                        CellRow()
                            .blur(radius: 5)
                            .onTapGesture {
                                self.selectedIndex = index
                            }
                    } else {
                        CellRow()
                        .onTapGesture {
                            self.selectedIndex = index
                        }
                    }
                }
            }
        }
    }
}

struct StackView_Previews: PreviewProvider {
    static var previews: some View {
        StackView()
    }
}
