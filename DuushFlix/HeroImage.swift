//
//  HeroImage.swift
//  DuushFlix
//
//  Created by Antonio Orozco on 2/16/21.
//

import SwiftUI

struct HeroImage: View {

    let screenWitdthSize = UIScreen.main.bounds.width
    let screenHeightSize = UIScreen.main.bounds.height
    
    @State var x: CGFloat = 0
    @State var count: CGFloat = 0
    @State var itemWidth: CGFloat = UIScreen.main.bounds.width - 20
    @State var op : CGFloat = 0


    
    let mainVideos: [Video]
    

    var body: some View {
        
        
        VStack {
            HStack(spacing: 20) {
                
                ForEach(mainVideos){ video in
                    
                    ZStack{
                        
                        
                        
                        Image(video.poster)
                            .resizable()
                            .scaleEffect()
                            .frame(width: screenWitdthSize - 20, height: screenHeightSize/3)
                            .cornerRadius(20)
                        
                        
                        Rectangle()
                            .frame(maxWidth: screenWitdthSize - 20, maxHeight: 60, alignment: .bottom)
                            .foregroundColor(Color.black.opacity(0.5))
                            .cornerRadius(20)
                            .offset(y: (screenHeightSize/7.5))
                          
                        
                        Text(video.name)
                            .font(.title)
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                            .frame(maxWidth: screenWitdthSize - 20, maxHeight: screenHeightSize/3,alignment: .bottomLeading)
                            .padding(.leading, 5)
                            .padding(.trailing, 15)
                            .padding(.bottom, 10)
                        
                    }
                    .offset(x: self.x)
                    .gesture(DragGesture(minimumDistance: 0.1)
                                .onChanged({ (value) in
                                
                                    if value.translation.width > 0 {
                                        
                                        self.x = value.location.x
                                        
                                    } else {
                                        
                                        self.x = value.location.x  - self.itemWidth

                                    }
                                    
                                })
                                .onEnded({ (value) in
                
                                    if value.translation.width > 0 {
                                        
                                        
                                        if  value.translation.width > ((self.itemWidth - 50) / 2) && Int(self.count) != 0 {
                                            
                                            self.count -= 1
                                            
                                            self.x = -((self.itemWidth + 20) * self.count)
                                            
                                        } else {
                                            
                                            
                                            self.x = -((self.itemWidth + 20) * self.count)

                                        }
                                        
                                    } else {
                                        
                                        if  -value.translation.width > ((self.itemWidth - 50) / 2) && Int(self.count) != (mainVideos.count - 1) {
                                            
                                            self.count += 1
                                            
                                            self.x = -((self.itemWidth + 20) * self.count)
                                            
                                        } else {
                                            
                                            
                                            self.x = -((self.itemWidth + 20) * self.count)

                                        }
                                        
                                        
                                    }
                                   
                                    
                                })
                              
                              
                    )
                    
                }
                
            }
            .frame(maxWidth: screenWitdthSize,maxHeight: screenHeightSize/3)
            .offset(x:self.op)
            .animation(.spring())
   
            
           
            
        }.frame(maxHeight: screenHeightSize/3)
        .onAppear{
           self.op = ((self.itemWidth + 20) * CGFloat(self.mainVideos.count / 2)) - (self.mainVideos.count % 2 == 0 ? ((self.itemWidth + 20) / 2) : 0)

        }
        
        
    }
    
}
struct HeroImage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeroImage(mainVideos: MockData.heroVideos)
            HeroImage(mainVideos: MockData.heroVideos)
        }
    }
}
