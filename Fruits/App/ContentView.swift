//
//  ContentView.swift
//  Fruits
//
//  Created by minkyuLee on 2022/08/09.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @State private var isShowingSettings: Bool = false
    
    var fruits: [Fruit] = fruitsData
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fruits.shuffled()) { item in
                    NavigationLink(destination: FruitDetailView(fruit: item)) {
                        FruitRowView(fruit: item)
                            .padding(.vertical, 4)
                    }
                    
                }
                
            }.navigationTitle("Fruits")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            isShowingSettings = true
                        }, label: {
                            Image(systemName: "slider.horizontal.3")
                        }) //: Button
                        .sheet(isPresented: $isShowingSettings) {
                            SettingsView()
                        }
                    }
                }
        }//: NAVIGATION
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
    }
}
