//
//  PlayerView.swift
//  MyYoutubeClone
//
//  Created by Antonio Orozco on 1/9/20.
//  Copyright © 2020 Antonio Orozco. All rights reserved.
//

import UIKit
import BrightcovePlayerSDK


class VideoPlayerView: UIView, BCOVPlaybackControllerDelegate, BCOVPUIPlayerViewDelegate {
    
    let sharedSDKManager = BCOVPlayerSDKManager.shared()
    
    let playbackService = BCOVPlaybackService(accountId: "6030890615001", policyKey: "BCpkADawqM3qVZTm-MNloyI4BOAtyC9WwEhfWBYX1FNtA-kxbj1YiRBNVh12MyVMQ7lenoTgURE2Y0YNnuNm9Q381ftg1f4DYVeoYgmfCIkTDy6T3M9gMXcH2YmX13H9vrS5-2HUVzUTzlem")
    
    var playbackController :BCOVPlaybackController?
    
    var delegate: BCOVPUIPlayerViewDelegate?
    
    var isFullScreen: Bool = false
    
    
    override init(frame: CGRect) {
        
        playbackController = (sharedSDKManager?.createPlaybackController())!
        
        super.init(frame: frame)
        
        playbackController?.analytics.account = "6030890615001" // Optional
        
        playbackController!.delegate = self
        
        playbackController!.isAutoPlay = true
                                        
        let options = BCOVPUIPlayerViewOptions()

        
        guard let playerView = BCOVPUIPlayerView(playbackController: self.playbackController, options: options, controlsView: BCOVPUIBasicControlView.withVODLayout()) else {
            return
        }
        
        // Install in the container view and match its size.
        self.addSubview(playerView)
        
        playerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            playerView.topAnchor.constraint(equalTo: self.topAnchor),
            playerView.rightAnchor.constraint(equalTo: self.rightAnchor),
            playerView.leftAnchor.constraint(equalTo: self.leftAnchor),
            playerView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
        
        playerView.delegate = self
        
        
        // Associate the playerView with the playback controller.
        playerView.playbackController = playbackController
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init has not been implemented ")
    }
    
    
    
    
}

