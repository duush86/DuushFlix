//
//  PlaylistRow.swift
//  DuushFlix
//
//  Created by Antonio Orozco on 2/16/21.
//

import SwiftUI

struct PlaylistVideo: View {
    
    let screenWitdthSize = UIScreen.main.bounds.width
    let screenHeightSize = UIScreen.main.bounds.height
  
    var video: Video
    
//    var title: String
    
    var body: some View {
                          
                    ZStack{
                        
                        Image(video.thumbnail)
                            .resizable()
                            .cornerRadius(20)
                        
//                        Rectangle()
//                            .frame(maxHeight: screenHeightSize/3/6, alignment: .bottom)
//                            .foregroundColor(Color.black.opacity(0.5))
//                            .offset(y: (screenHeightSize/3/3))

                        
//                        Text(video.name)
//                            .font(.caption)
//                            .fontWeight(.semibold)
//                            .foregroundColor(.white)
//                            .frame(maxHeight: screenHeightSize/3,alignment: .bottomLeading)
//                            .padding(.leading, 15)
//                            .padding(.trailing, 15)
//                            .padding(.bottom, 10)
                            
                        
                    }.frame(width: screenWitdthSize/2.5, height: screenHeightSize/3)
                    .padding()

        
    }
    
    
}

struct PlaylistRow_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistVideo(video: MockData.sampleVideo)
    }
}
