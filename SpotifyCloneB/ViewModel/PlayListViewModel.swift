//
//  PlayListViewModel.swift
//  SpotifyCloneB
//
//  Created by Juan Renato on 15/05/22.
//

import Foundation

class PlayListViewModel {
    
    let request: Request = Request()
    
    var playList: PlayList? = nil
    
    func getPlatList() async {
        let data = await request.getDataFromAPI(url: "me/playlists")
        
        if data != nil {
            if let decoder = try? JSONDecoder().decode(PlayList.self, from: data!) {
                DispatchQueue.main.async(execute: {
                    self.playList = decoder
                })
            }
        }
    }
    
}
