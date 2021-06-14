//
//  MockData.swift
//  DuushFlix
//
//  Created by Antonio Orozco on 2/16/21.
//

import Foundation

struct Video: Decodable, Identifiable {
    
    let id: String
    let name: String
    let description: String
    let duration: Int
    let published_at: String
    let thumbnail: String
    let poster: String
    
}

struct BrightcoveRespose: Decodable {
    let videos: [Video]
}

struct MockData {
    
    static let sampleVideo = Video(id: "6054852576001",
                                   name: "The Goodfather 2",
                                   description: "My sample description",
                                   duration: 60075,
                                   published_at: "2019-07-02T21:17:49.833Z",
                                   thumbnail: "thumbnail",
                                   poster:"poster")
//                                   thumbnail: "https://cf-images.us-east-1.prod.boltdns.net/v1/static/6030890615001/1a687ee7-f2c7-4866-994f-3272fa6617d0/fc0481b3-29ca-4004-bce7-3e9de0c6142b/160x90/match/image.jpg",
//                                   poster: "https://cf-images.us-east-1.prod.boltdns.net/v1/static/6030890615001/1a687ee7-f2c7-4866-994f-3272fa6617d0/d8c3afdd-9e1d-4a68-8400-dd03ebe4f408/1280x720/match/image.jpg")
    
    static let sampleVideo2 = Video(id: "6054855886001",
                                   name: "Parasite",
                                   description: "my custom description",
                                   duration: 26167,
                                   published_at: "2019-07-02T21:17:49.721Z",
                                   thumbnail: "thumbnail_2",
                                   poster: "poster_2")
//                                   thumbnail: "https://cf-images.us-east-1.prod.boltdns.net/v1/static/6030890615001/1a687ee7-f2c7-4866-994f-3272fa6617d0/fc0481b3-29ca-4004-bce7-3e9de0c6142b/160x90/match/image.jpg",
//                                   poster: "https://cf-images.us-east-1.prod.boltdns.net/v1/static/6030890615001/1a687ee7-f2c7-4866-994f-3272fa6617d0/d8c3afdd-9e1d-4a68-8400-dd03ebe4f408/1280x720/match/image.jpg")
    
    static let playlist = [sampleVideo, sampleVideo2, sampleVideo, sampleVideo2, sampleVideo]
    static let heroVideos = [sampleVideo, sampleVideo2, sampleVideo, sampleVideo2]

    
}
