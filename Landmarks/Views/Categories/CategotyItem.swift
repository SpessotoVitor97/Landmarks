//
//  CategotyItem.swift
//  Landmarks
//
//  Created by Vitor Spessoto on 28/07/21.
//

import SwiftUI

struct CategotyItem: View {
    var landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading, content: {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        })
        .padding(.leading, 15)
    }
}

struct CategotyItem_Previews: PreviewProvider {
    static var previews: some View {
        CategotyItem(landmark: ModelData().landmarks[0])
    }
}
