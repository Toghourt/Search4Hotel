//
//  ButtonsView.swift
//  PageViewer
//
//  Created by 童存善 on 2022/5/24.
//  Copyright © 2022 Grzegorz Przybyła. All rights reserved.
//

import SwiftUI

struct ButtonsView: View {
    @State private var selection: String? = nil
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationLink(destination: SignInView(), tag: "SignIn", selection: $selection) { EmptyView() }
        NavigationLink(destination: RegisterView(), tag: "Register", selection: $selection) { EmptyView() }
        HStack(spacing:20){
            Spacer()
            ZStack{
                RoundedRectangle(cornerRadius: 40)
                    .frame(width: 90, height: 40)
                Button("> Sign in"){
                    self.selection = "SignIn"
                }
                .foregroundColor(Color.white)
            
            }
            ZStack{
                RoundedRectangle(cornerRadius: 40)
                    .frame(width: 90, height: 40)
                Button("> Register"){
                    //viewModel.toRegister()
                    self.selection = "Register"
                }
                .foregroundColor(Color.white)
                
            
            }
            
        }
        .padding(.horizontal)
        .foregroundColor(Color(hue: 0.34, saturation: 0.404, brightness: 0.638))
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}
