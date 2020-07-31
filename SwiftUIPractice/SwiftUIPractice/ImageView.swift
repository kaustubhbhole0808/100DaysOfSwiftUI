//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by Bhole, Kaustubh Satish on 11/07/20.
//  Copyright © 2020 Bhole, Kaustubh Satish. All rights reserved.
//

import SwiftUI

struct ImageView: View {
    @State var scale: CGFloat = 1.0
    @State private var half = false
    @State private var dim = false

    var body: some View {
        VStack(content: {
            Image("bird")
                .resizable()
                .frame(width: 160, height: 160, alignment: .center)
                .scaleEffect(half ? 0.5 : 1.0)
                .opacity(dim ? 0.2 : 1.0)
                .animation(.easeInOut(duration: 1.0))
                .onTapGesture {
                    self.dim.toggle()
                    self.half.toggle()
                }
            Image("Nature")
                .resizable()
                .scaleEffect(scale)
                .border(Color.red, width: 3.0)
                .cornerRadius(3.0)
                .clipShape(Rectangle())
                .padding(.top, 40)
                .padding(.bottom, 40)
            Slider(value: $scale, in: 1.0...10.0, step: 0.1)
                .padding(.bottom, 20)
            Image(systemName: "arrow.up")
                .font(.largeTitle)
                .padding(.bottom, 100)
                .scaleEffect(scale)
                .foregroundColor(Color.green)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
