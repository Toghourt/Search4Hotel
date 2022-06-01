//
//  IndexView.swift
//  PageViewer
//
//   Created by 童存善 on 2022/5/24.

import SwiftUI

struct IndexView: View {
    
    let pages: [PageViewData] = [
        PageViewData(imageNamed: "1"),
        PageViewData(imageNamed: "2"),
        PageViewData(imageNamed: "3")
    ]
    
    @State private var index: Int = 0
    
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            VStack{
                ZStack{
                    ZStack(alignment: .bottom) {
                        SwiperView(pages: self.pages, index: self.$index)
                        HStack(spacing: 8) {
                            ForEach(0..<self.pages.count) { index in
                                CircleButton(isSelected: Binding<Bool>(get: { self.index == index }, set: { _ in })) {
                                    withAnimation {
                                        self.index = index
                                    }
                                }
                            }
                        }
                    }
                    .onReceive(timer) { time in
                        
                        self.index = (self.index+1) % 3
                        
                    }
                    SelectView().offset(y:40)
                }
                .offset(y:-72)
                ButtonsView()
            }
        }
    }
}

struct IndexView_Previews: PreviewProvider {
    static var previews: some View {
        IndexView()
    }
}
