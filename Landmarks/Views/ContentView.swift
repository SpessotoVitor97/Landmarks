//
//  ContentView.swift
//  Landmarks
//
//  Created by Vitor Spessoto on 02/06/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection,
                content:  {
                    CategoryHome()
                        .tabItem {
                            Label("Featured", systemImage: "star")
                        }
                    
                    LandmarkList()
                        .tabItem {
                            Label("List", systemImage: "list.bullet")
                        }
                })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
