//
//  PageView.swift
//  Landmarks
//
//  Created by Vitor Spessoto on 09/08/21.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    var pages: [Page]
    @State var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing, content: {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
        })
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3 / 2 , contentMode: .fit)
    }
}
