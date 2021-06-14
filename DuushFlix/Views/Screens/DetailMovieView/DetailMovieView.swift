//
//  DetailMovieView.swift
//  DuushFlix
//
//  Created by Antonio Orozco on 2/24/21.
//

import SwiftUI

struct DetailMovieView: View {
    
    let screenWitdthSize = UIScreen.main.bounds.width
    let screenHeightSize = UIScreen.main.bounds.height
    
    var video: Video
    
    
    @ObservedObject var viewModel:  MainContentViewModel
    
    var body: some View {
        

        ScrollView{
            
            ZStack {
                
                Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    XDismissButton(isShowingDetailView: $viewModel.isShowingDetail)
                    
                    VideoRemoteImage(urlString: video.poster)
                        .frame(maxWidth: screenWitdthSize, maxHeight: screenHeightSize/3)
                    
                    Text(video.name)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding(.leading, 20)
                        .frame(maxWidth: screenWitdthSize, alignment: .center)
                        .multilineTextAlignment(.center)
                    
                    
                    HStack {
                        
                        Text("Released at: " + video.published_at.yearOnTimeStamp!)
                            .font(.caption)
                        
                        Text("Runtime: \(video.duration.millisecondsToRuntime.hours) h \(video.duration.millisecondsToRuntime.leftMinutes) m")
                            .font(.caption)
                        
                        
                    }
                    .frame(maxWidth: screenWitdthSize, alignment: .center)
                    .padding(.leading, 20)
                    .padding(.bottom, 20)
                    
                    Spacer()
                    
                    APButton(title: "▶︎ Play")
                        .onTapGesture {
                            
                            print("Show Video")
                            viewModel.isShowingVideo = true
                        }
                    
                    Spacer()
                    
                    Text(video.long_description ?? "No description is available for this title")
                        .font(.body)
                        .fontWeight(.medium)
                        .frame(maxWidth: screenWitdthSize, alignment: .center)
                        .multilineTextAlignment(.center)
                        .padding(20)
                    
                }
                .fullScreenCover(isPresented: $viewModel.isShowingVideo, content: {
                    
                    ZStack {
                    
                        Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        
                        VStack {
                        
                            HStack {
                            
                                Text(video.name)
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                    .padding(.leading, 22)
                                
                                DismissVideoButton(isShowingVideo: $viewModel.isShowingVideo)
                            
                            }
                            VideoPlayerRepresentable(videoId: video.id)
                            
                            
                        }
                    }
                    
            })
            }
            
        }.colorScheme(.dark)
        .preferredColorScheme(.dark)
        
        
    }
}

struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovieView(video: MockData.sampleVideo, viewModel: MainContentViewModel())
        //.preferredColorScheme(.dark)
    }
}
