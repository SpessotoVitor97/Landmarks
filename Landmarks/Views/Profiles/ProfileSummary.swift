//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Vitor Spessoto on 05/08/21.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10, content: {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
                Text("Seasonal photo: \(profile.seasonalPhoto.rawValue)")
                Text("Goal date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack(alignment: .leading, content: {
                    Text("Completed Badges")
                        .font(.headline)
                    
                    ScrollView(.horizontal, content: {
                        HStack(content: {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        })
                        .padding()
                    })
                })
                
                Divider()
                
                VStack(alignment: .leading, content: {
                    Text("Recent Hikes")
                        .font(.headline)
                    
                    HikeView(hike: modelData.hikes[0])
                })
            })
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
