//
//  ContentView.swift
//  DuushFlix
//
//  Created by Antonio Orozco on 2/16/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      
        NavigationView {
           
            ScrollView(.vertical, showsIndicators: true) {
              
                VStack {
                    
                    HeroImage(mainVideos: MockData.heroVideos)
                    
                    PlaylistRow(playlist: MockData.playlist, title: "Popular now")
                    
                    PlaylistRow(playlist: MockData.playlist, title: "Last Releases")
                    
                    PlaylistRow(playlist: MockData.playlist, title: "Random")
                }
                
            }.frame(maxHeight: .infinity)
            .navigationTitle("DuushFlix")
            
        }
        .preferredColorScheme(.dark)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}




