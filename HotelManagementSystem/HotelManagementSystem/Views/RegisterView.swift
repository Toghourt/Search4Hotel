//
//  RegisterView.swift
//  PageViewer
//
//  Created by 童存善 on 2022/5/24.
//  Copyright © 2022 Grzegorz Przybyła. All rights reserved.
//

import SwiftUI
import CoreData

struct RegisterView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<User>
    
    @ObservedObject var viewModel = ViewModel()
    
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    @State private var correct = false
    @State private var wrong = false

    
    var body: some View {
        if viewModel.toView == "Register" {
            NavigationView {
                VStack {
                    ZStack(alignment: .leading) {
                        Image("SignInBackground")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Rectangle()
                            .foregroundColor(Color.black.opacity(0.6))
                            .frame(width: 390, height: 140)
                        Text("Register")
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
                            Text("Don't have an account? Create your account, it takes less than a minute.")
                                .padding([.leading, .trailing], 22)
                                .foregroundColor(Color.gray)
                                .offset(y:-10)
                            VStack{
                                TextField ("Name", text: $name,
                                            onEditingChanged: { isEditing in
                                    print( "onEditingChanged::\(name)")
                                    },
                                    onCommit: {
                                    print("onCommit::\(name)")
                                    })
                                .padding(7)
                                .padding(.horizontal, 10)
                                .background (Color (.systemGray6))
                                .cornerRadius(8)
                                .padding (.horizontal, 20)
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
                                TextField ("Confirm Password", text: $confirmPassword,
                                            onEditingChanged: { isEditing in
                                    print( "onEditingChanged::\(confirmPassword)")
                                    },
                                    onCommit: {
                                    print("onCommit::\(confirmPassword)")
                                    })
                                    .padding(7)
                                    .padding(.horizontal, 10)
                                    .background (Color (.systemGray6))
                                    .cornerRadius(8)
                                    .padding (.horizontal, 20)
                            }
                            ZStack{
                                Rectangle()
                                    .fill(Color(hue: 0.34, saturation: 0.404, brightness: 0.638))
                                    .frame(width: UIScreen.main.bounds.size.width-40, height: 50)
                                Button("Create an Account") {
                                    if password == confirmPassword {
                                        let user = User(context: moc)
                                        user.username = name
                                        user.email = email
                                        user.password = password
                                        try? moc.save()
                                        correct = true
                                    } else {
                                        wrong = true
                                    }
                                }
                                    .foregroundColor(.white)
                                    .alert("two inputs of password are different", isPresented: $wrong) {
                                        Button("OK", role: .cancel) { }
                                    }
                                    .alert("registration success", isPresented: $correct) {
                                        Button("OK", role: .cancel) {
                                            //viewModel.toSignIn()
                                        }
                                    }

                            }
                            .padding(.vertical, 10)
                        }
                    }
                    .offset(y:-105)
                }
            }
        } else if viewModel.toView == "Index" {
            IndexView()
                .environmentObject(viewModel)
        }
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
