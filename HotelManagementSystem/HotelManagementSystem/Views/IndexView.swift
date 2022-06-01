//
//  IndexView.swift
//  PageViewer
//
//   Created by 童存善 on 2022/5/24.

import SwiftUI
import CoreData

var uniqueKey: String {
    UUID().uuidString
}

let options: [DropdownOption] = [
    DropdownOption(key: uniqueKey, value: "America"),
    DropdownOption(key: uniqueKey, value: "Australia"),
    DropdownOption(key: uniqueKey, value: "Britain"),
    DropdownOption(key: uniqueKey, value: "China"),
    DropdownOption(key: uniqueKey, value: "Japan"),
]
let AmericaAreas: [DropdownOption] = [
    DropdownOption(key: uniqueKey, value: "Austin"),
    DropdownOption(key: uniqueKey, value: "New York"),
    DropdownOption(key: uniqueKey, value: "Los Angeles"),
    DropdownOption(key: uniqueKey, value: "Chicago"),
]
let AustraliaAreas: [DropdownOption] = [
    DropdownOption(key: uniqueKey, value: "Canberra"),
    DropdownOption(key: uniqueKey, value: "Sydney"),
    DropdownOption(key: uniqueKey, value: "Melbourne"),
    DropdownOption(key: uniqueKey, value: "Perth"),
]
let BritainAreas: [DropdownOption] = [
    DropdownOption(key: uniqueKey, value: "London"),
    DropdownOption(key: uniqueKey, value: "Liverpool"),
    DropdownOption(key: uniqueKey, value: "Birmingham"),
    DropdownOption(key: uniqueKey, value: "Manchester"),
]
let ChinaAreas: [DropdownOption] = [
    DropdownOption(key: uniqueKey, value: "Beijing"),
    DropdownOption(key: uniqueKey, value: "Shanghai"),
    DropdownOption(key: uniqueKey, value: "Hangzhou"),
    DropdownOption(key: uniqueKey, value: "Hongkong"),
]
let JapanAreas: [DropdownOption] = [
    DropdownOption(key: uniqueKey, value: "Tokyo"),
    DropdownOption(key: uniqueKey, value: "Nara-ken"),
    DropdownOption(key: uniqueKey, value: "Osaka"),
    DropdownOption(key: uniqueKey, value: "Yokohama"),
]


struct IndexView: View {
    
    let pages: [PageViewData] = [
        PageViewData(imageNamed: "1"),
        PageViewData(imageNamed: "2"),
        PageViewData(imageNamed: "3")
    ]
    
    @ObservedObject var viewModel = ViewModel()
    
    @State private var index: Int = 0
    
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    @State var areaFilter = "America"
    
    @State var options1: [DropdownOption] = [
        DropdownOption(key: uniqueKey, value: "Please Select Country"),
    ]
    
    var body: some View {
        if !viewModel.toListing {
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
                        // MARK: -SelectView
                        ZStack(alignment: .leading){
                            RoundedRectangle(cornerRadius: 10)
                                .background(Color.black)
                                .opacity(0.6)
                                .frame(width: 390, height: 292.5)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            VStack(alignment: .leading){
                                VStack{
                                    Text("Enjoy Your Holiday").font(.title)
                                    Text("Search and Book Hotel").font(.subheadline)
                                }
                                .offset(x:10,y:-20)
                                

                                Group {
                                    DropdownSelector(
                                        placeholder: "Country",
                                        options: options,
                                        onOptionSelected: { option in
                                            if option.value == "America" {
                                                options1 = [
                                                    DropdownOption(key: uniqueKey, value: "Austin"),
                                                    DropdownOption(key: uniqueKey, value: "New York"),
                                                    DropdownOption(key: uniqueKey, value: "Los Angeles"),
                                                    DropdownOption(key: uniqueKey, value: "Chicago"),
                                                ]
                                            } else if option.value == "Australia" {
                                                options1 = [
                                                    DropdownOption(key: uniqueKey, value: "Canberra"),
                                                    DropdownOption(key: uniqueKey, value: "Sydney"),
                                                    DropdownOption(key: uniqueKey, value: "Melbourne"),
                                                    DropdownOption(key: uniqueKey, value: "Perth"),
                                                ]
                                            } else if option.value == "Britain" {
                                                options1 = [
                                                    DropdownOption(key: uniqueKey, value: "London"),
                                                    DropdownOption(key: uniqueKey, value: "Liverpool"),
                                                    DropdownOption(key: uniqueKey, value: "Birmingham"),
                                                    DropdownOption(key: uniqueKey, value: "Manchester"),
                                                ]
                                            } else if option.value == "China" {
                                                options1 = [
                                                    DropdownOption(key: uniqueKey, value: "Beijing"),
                                                    DropdownOption(key: uniqueKey, value: "Shanghai"),
                                                    DropdownOption(key: uniqueKey, value: "Hangzhou"),
                                                    DropdownOption(key: uniqueKey, value: "Hongkong"),
                                                ]
                                            } else if option.value == "Japan" {
                                                options1 = [
                                                    DropdownOption(key: uniqueKey, value: "Tokyo"),
                                                    DropdownOption(key: uniqueKey, value: "Nara-ken"),
                                                    DropdownOption(key: uniqueKey, value: "Osaka"),
                                                    DropdownOption(key: uniqueKey, value: "Yokohama"),
                                                ]
                                            }
                                            print(option)
                                    })
                                    .padding(.horizontal)
                                }.zIndex(3.0)
                                
                                Group {
                                    DropdownSelector(
                                        placeholder: "Area",
                                        options: options1,
                                        onOptionSelected: { option in
                                            viewModel.choseArea(area: option.value)
                                            print(option)
                                    })
                                    .padding(.horizontal)
                                }.zIndex(2.0)
                                
                                Divider()
                                //MenuView()
                                Divider()
                                ZStack{
                                    Rectangle()
                                        .fill(Color(hue: 0.34, saturation: 0.404, brightness: 0.638))
                                        .frame(width: UIScreen.main.bounds.size.width-20, height: 50)
                                    Button("Search"){
                                        viewModel.toggleToListing()
                                    }
                                    .foregroundColor(.white)
                            
                                }
                                    .zIndex(1.0)
                                    .offset(x:10)
                                
                            }
                            .foregroundColor(.white)
                        }
                        .offset(y:40)
                    }
                    .offset(y:-72)
                    ButtonsView()
                }
            }
        } else {
            ListingView(areaName: viewModel.areaFilter)
                .environmentObject(viewModel)
        }
    }
}

struct IndexView_Previews: PreviewProvider {
    static var previews: some View {
        IndexView()
    }
}
