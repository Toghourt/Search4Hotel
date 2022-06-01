//
//  SearchBar.swift
//  hotel
//
//  Created by 童存善 on 2022/5/23.
//

import SwiftUI

struct SearchBar: View {
    @State var text: String
    var backText: String

    @State private var isEditing = false
    var body: some View {
        TextField (backText, text: $text,
                    onEditingChanged: { isEditing in
            print( "onEditingChanged::\(text)")
            },
            onCommit: {
            print("onCommit::\(text)")
            })
            .padding(7)
            .padding(.horizontal, 25)
            .background (Color (.systemGray6))
            .cornerRadius(8)
            .padding (.horizontal, 10)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: " ", backText: "Search")
    }
}
