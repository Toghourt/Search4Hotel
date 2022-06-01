//
//  SignInView.swift
//  PageViewer
//
//  Created by 童存善 on 2022/5/24.
//  Copyright © 2022 Grzegorz Przybyła. All rights reserved.
//

import SwiftUI
import CoreData

struct SignInView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<User>
    
    @ObservedObject var viewModel = ViewModel()
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State private var correct = false
    @State private var wrong = false

    
    var body: some View {
        if !viewModel.isJump {
            NavigationView {
                VStack {
                    ZStack(alignment: .leading) {
                        Image("SignInBackground")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Rectangle()
                            .foregroundColor(Color.black.opacity(0.6))
                            .frame(width: 390, height: 140)
                        Text("Sign In")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .font(.system(size:40))
                            .padding(.leading)
                    }.offset(y:-95)
                    
                    ZStack(alignment: .leading){
                        GeometryReader { geo in
                            RoundedRectangle(cornerRadius: 10)
                                //.opacity(0.6)
                                .frame(width: geo.size.width, height: geo.size.width)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .shadow(radius: 15)
                        }.padding(.horizontal, 10).foregroundColor(Color.white)
                        VStack {
                            Text("Enter your e-mail and password below to log in to your account and use the benefits of our website.")
                                .padding([.leading, .trailing], 22)
                                .foregroundColor(Color.gray)
                                .offset(y:-15)
                            VStack{
                                TextField ("Email", text: $email,
                                            onEditingChanged: { isEditing in
                                    print( "onEditingChanged::\(email)")
                                    },
                                    onCommit: {
                                    print("onCommit::\(email)")
                                    })
                                .padding(7)
                                .padding(.horizontal, 10)
                                .background (Color (.systemGray6))
                                .cornerRadius(8)
                                .padding (.horizontal, 20)
                                TextField ("Password", text: $password,
                                            onEditingChanged: { isEditing in
                                    print( "onEditingChanged::\(password)")
                                    },
                                    onCommit: {
                                    print("onCommit::\(password)")
                                    })
                                .padding(7)
                                .padding(.horizontal, 10)
                                .background (Color (.systemGray6))
                                .cornerRadius(8)
                                .padding (.horizontal, 20)
                            }
                            FilteredList1(filter: email, password: password)
                        }
                    }
                    .offset(y:-105)
                }
            }
        } else {
            RegisterView()
                .environmentObject(viewModel)
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
