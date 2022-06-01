//
//  PageView.swift
//  PageViewer
//


import SwiftUI



struct PageViewData: Identifiable {
    let id: String = UUID().uuidString
    let imageNamed: String
}

struct PageView: View {
    let viewData: PageViewData
    
    init( viewData: PageViewData) {
        self.viewData = viewData
    }
    
    var body: some View {
        
        Image(viewData.imageNamed)
            .resizable()
            .clipped()
            .frame(width: 390)
                //.offset(x:0, y:geo.size.height*1/8)
                
    }
}
