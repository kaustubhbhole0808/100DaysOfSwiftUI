//
//  GeometryReaderView.swift
//  SwiftUIPractice
//
//  Created by Bhole, Kaustubh Satish on 10/09/20.
//  Copyright © 2020 Bhole, Kaustubh Satish. All rights reserved.
//

import SwiftUI

struct GeometryReaderView: View {

    @State private var showAlert = false
    var body: some View {
        HStack {
            Text("Left")
                .background(Color.purple)
            VStack {
                Text("Top View ")
                    .background(Color.blue)
                GeometryReader { geometry in
                    VStack(spacing: 5) {
                        Button(action: {
                            self.showAlert = true
                        }) {
                            Text("SHOW ALERT")
                                .foregroundColor(Color.black)
                                .padding()
                        }.alert(isPresented: self.$showAlert, content: { () -> Alert in
                            Alert(title: Text("Alert"), message: Text("This is  Alert"), dismissButton: .default(Text("OK")))
                        }).background(Color(.red))
                            .cornerRadius(10)
                            .frame(width: geometry.size.width / 1.5, height: 40, alignment: .leading)
                            .padding()
                        HStack(spacing: 0) {
                            Text("Left View in Geometry Reader")
                                .frame(width: geometry.size.width / 2, height: 50)
                                .background(Color.red)
                            Text("Right View in Geometry Reader")
                                .frame(width: geometry.size.width / 2, height: 50)
                                .background(Color.green)
                        }
                        Text("Middle View in Geometry Reader")
                            .frame(width: geometry.size.width * 0.5)
                            .background(Color.yellow)
                        Text("Bottom View in Geometry Reader")
                            .frame(width: geometry.size.width * 0.9, height: 60)
                            .background(Color.blue)
                    }
                }
                .background(Color.gray)
                Text("Bottom View not in Geometry Reader")
                    .background(Color.purple)
            }
            Text("Right")
                .background(Color.purple)
        }
    }}

struct GeometryReaderView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderView()
    }
}
