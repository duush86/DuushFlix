//
//  MainContentViewModel.swift
//  DuushFlix
//
//  Created by Antonio Orozco on 2/24/21.
//

import SwiftUI

final class MainContentViewModel: ObservableObject {

    @Published var isShowingDetail = false
    @Published var isShowingVideo = false
    @Published var isLoading = false
    @Published var alertItem: AlertItem?

    @Published var selectedVideo: Video?
    
    @Published var mainVideos: [Video] = []
    @Published var rowOneVideos: [Video] = []
    @Published var rowTwoVideos: [Video] = []
    @Published var rowThreeVideos: [Video] = []
    
    func getMainVideos(){
        
        isLoading = true
        
        NetworkManager.shared.getVideos(searchString: "hd") { [self] result in
            
            DispatchQueue.main.async {
             
                switch result {
                
                case .success(let videos):
                    
                    self.mainVideos = videos
                    isLoading = false
                    
                case .failure(let error):
                    
                    switch error {
                    case .invalidData:
                        
                        alertItem = AlertContext.invalidData
                        
                    case .invalidResponse:
                        
                        alertItem = AlertContext.invalidResponse
                        
                    case .invalidURL:
                        
                        alertItem = AlertContext.invalidURL
                        
                    case .unableToComplete:
                        
                        alertItem = AlertContext.invalidToComplete
                        
                    }
                    
                }
            }
        }
        
    }
    
    func getRowOneVideos(){
        
        isLoading = true
        
        NetworkManager.shared.getVideos(searchString: "nature") { [self] result in
            
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                
                case .success(let videos):
                    
                    self.rowOneVideos = videos
                    
                case .failure(let error):
                    
                    switch error {
                    case .invalidData:
                        
                        alertItem = AlertContext.invalidData
                        
                    case .invalidResponse:
                        
                        alertItem = AlertContext.invalidResponse
                        
                    case .invalidURL:
                        
                        alertItem = AlertContext.invalidURL
                        
                    case .unableToComplete:
                        
                        alertItem = AlertContext.invalidToComplete
                        
                    }
                    
                }
            }
        }
        
    }

    func getRowtwoVideos(){
        
        isLoading = true
        
        NetworkManager.shared.getVideos(searchString: "colors") { [self] result in
            
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                
                case .success(let videos):
                    
                    self.rowTwoVideos = videos
                    
                case .failure(let error):
                    
                    switch error {
                    case .invalidData:
                        
                        alertItem = AlertContext.invalidData
                        
                    case .invalidResponse:
                        
                        alertItem = AlertContext.invalidResponse
                        
                    case .invalidURL:
                        
                        alertItem = AlertContext.invalidURL
                        
                    case .unableToComplete:
                        
                        alertItem = AlertContext.invalidToComplete
                        
                    }
                    
                }
            }
        }
        
    }
}

