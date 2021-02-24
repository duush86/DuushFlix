//
//  PlaylistRow.swift
//  DuushFlix
//
//  Created by Antonio Orozco on 2/16/21.
//

import SwiftUI

struct PlaylistRow: View {
    
    let screenWitdthSize = UIScreen.main.bounds.width
    let screenHeightSize = UIScreen.main.bounds.height
  
    var playlist: [Video]
    
    var title: String
    
    var body: some View {
      
        Text(title)
            .font(.title)
            .fontWeight(.light)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 30)
        
        ScrollView(.horizontal, showsIndicators: true) {
         
            
            
            HStack {
                
                
                
                ForEach(playlist){ video in
                    
                    ZStack{
                        
                        Image(video.thumbnail)
                            .resizable()
                            .frame(width: screenWitdthSize/2.5, height: screenHeightSize/3)
                            .cornerRadius(20)
                        
                        Rectangle()
                            .frame(maxWidth: screenWitdthSize/2.5, maxHeight: screenHeightSize/24, alignment: .bottomLeading)
                            .foregroundColor(Color.black.opacity(0.5))
                            .cornerRadius(20)
                            .offset(y: (screenHeightSize/6.8))

                        
                        Text(video.name)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: screenWitdthSize/2.5, maxHeight: screenHeightSize/3,alignment: .bottomLeading)
                            .padding(.leading, 15)
                            .padding(.trailing, 15)
                            .padding(.bottom, 10)
                            
                        
                    }
                }
                
            }.frame(maxHeight: screenHeightSize/3)
             .padding()
            
        }.frame(maxHeight: screenHeightSize/3)
        
    }
    
    
}

struct PlaylistRow_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistRow(playlist: MockData.playlist, title: "This is a test title")
    }
}
