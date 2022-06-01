//
//  UserView.swift
//  HotelManagementSystem
//
//  Created by 童存善 on 2022/5/28.
//

import SwiftUI

struct UserView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<User>
    

    @State private var showingAddScreen = false
    
    var body: some View {
        VStack {
            /*List(users) { user in
                Text(user.username ?? "Unknown")
            }*/
            List {
                ForEach(users) { user in
                    Text(user.username ?? "Unknown")
                }.onDelete(perform: deleteUsers)
            }
            
            
            
            
            Button("Add") {
                let Names = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let Email = ["111@111.com", "222@222.com"]
                let password = ["111", "222", "333"]
                let chosenName = Names.randomElement()!
                let chosenEmail = Email.randomElement()!
                let chosenPassword = password.randomElement()!

                // more code to come
                let user = User(context: moc)
                user.username = chosenName
                user.email = chosenEmail
                user.password = chosenPassword
                if moc.hasChanges {
                    try? moc.save()
                }
            }
            /*Button("Delete") {
                moc.delete(user in users)
                
                try? moc.save()
            }*/
            
        }
    }
    func deleteUsers(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our fetch request
            let user = users[offset]

            // delete it from the context
            moc.delete(user)
        }

        // save the context
        if moc.hasChanges {
            try? moc.save()
        }
        
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
