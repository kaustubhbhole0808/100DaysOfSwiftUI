//
//  LoginScreenView.swift
//  SwiftUIPractice
//
//  Created by Bhole, Kaustubh Satish on 31/07/20.
//  Copyright © 2020 Bhole, Kaustubh Satish. All rights reserved.
//

import SwiftUI

struct LoginScreenView: View {
    @State var email = ""
    @State var password = ""
    @State var loginBittonClick: Int? = nil

    var body: some View {

    NavigationView {
            VStack(alignment: .leading) {
                 Text("Let's Login.")
                   .bold()
                   .font(.system(size: 40))
                   .multilineTextAlignment(.leading)
                   .frame(width: 300, height: 100, alignment: .topLeading)
                   .padding(Edge.Set.bottom, 50)

                   Text("Email address:")
                       .font(.headline)
                                  TextField("Email", text: $email)
                                   .frame(height:44)
                                   .accentColor(Color.white)
                                   .background(Color(UIColor.lightGray))
                                   .cornerRadius(4.0)

                   Text("Password:")
                                  .font(.headline)

                    SecureField("Password", text: $password)
                               .frame(height:44)
                               .accentColor(Color.white)
                               .background(Color(UIColor.lightGray))
                               .cornerRadius(4.0)
                HStack {
                    Spacer()
                    Button(action: {
                        print("Forgot password tapped")
                    }) {
                        Text("Forgot Password?").foregroundColor(Color.gray).bold()
                    }
                    .accentColor(Color.black)
                    .padding(Edge.Set.vertical, 5)
                }
                    Spacer()
                NavigationLink(destination: SegmentedControlView(), tag: 1, selection: $loginBittonClick) {
                   Button(action: {
                    self.loginBittonClick = 1
                   }) {
                       HStack {
                           Spacer()
                           Text("Login").foregroundColor(Color.white).bold()
                           Spacer()
                       }
                   }
                   .accentColor(Color.black)
                   .padding()
                   .background(Color(UIColor.red))
                   .cornerRadius(20.0)
                   .padding(Edge.Set.vertical, 20)
                }
                Spacer()
               }
               .padding(.horizontal,30)
           }
            .navigationBarTitle(Text("Login"))
        }
}

struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView()
    }
}
