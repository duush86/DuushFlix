//
//  ContentView.swift
//  DuushFlix
//
//  Created by Antonio Orozco on 2/16/21.
//

import SwiftUI



struct MainContentView: View {
    
    
    @ObservedObject var viewModel: MainContentViewModel
    
    //properties for hero images
    let screenWitdthSize = UIScreen.main.bounds.width
    let screenHeightSize = UIScreen.main.bounds.height
    

    
    
    var body: some View {
        
    NavigationView {

            ZStack {
                
//                Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).ignoresSafeArea(.all)


                ScrollView(.vertical, showsIndicators: false) {


                    if self.viewModel.isLoading {
                        
                        LoadingView()
                            .position(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/4)
                        
                    } else {
                        
                        
                        if viewModel.mainVideos.count > 0 {
                            
                            
                            HStack(spacing: 20){
                                
                                TabView {
                                    ForEach(viewModel.mainVideos, id:\.self){  video in
                                        
                                        
                                        VStack {
                                            HeroImage(video: video)
                                   
                                        }.onTapGesture {
                                            
                                            viewModel.selectedVideo = video
                                            viewModel.isShowingDetail = true
                                        }
                                        
                                    }
                                    
                                }.padding(.top, 20)
                                .tabViewStyle(PageTabViewStyle())
                                .id(viewModel.mainVideos)
                                
                                
                            }
                            .frame(width: screenWitdthSize, height: screenHeightSize/2)
                            
                            Spacer()
                            
                            Text("Popular")
                                .font(.system(size: 30, weight: .medium, design: .rounded))
                                .frame(width: screenWitdthSize, height:40, alignment: .leading)
                                .padding(.leading, 20)
                                .padding(.top, 50)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 10) {
                                    
                                    ForEach(viewModel.rowOneVideos) { video in
                                        
                                        HStack{
                                        
                                            PlaylistVideo(video: video)
                                        
                                        }.onTapGesture {
                                            
                                            viewModel.selectedVideo = video
                                            viewModel.isShowingDetail = true
                                        }
                                        
                                    }
                                }.frame(height:screenHeightSize/3)
                                .padding(.leading, 20)
                                .padding(.trailing, 20)
                                
                            
                            }

                        } else {
                            //Text("Loading.....")
                        }
                    }
                    
                }
                
            }
            .onAppear {
                
                viewModel.getMainVideos()
                
                viewModel.getRowOneVideos()
                
            }
            .navigationTitle("duushFlix")
            .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
            .accentColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
            .fullScreenCover(isPresented: $viewModel.isShowingDetail, content: {
                
                DetailMovieView(video: viewModel.selectedVideo!, viewModel: viewModel)
                
            })
            .colorScheme(.dark)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            
        }
        
        
        
        
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           MainContentView(viewModel: MainContentViewModel())
            .colorScheme(.dark)
        }
        
    }
}




