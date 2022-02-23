//
//  YouTubeTitleResponse.swift
//  Netflix-Clone
//
//  Created by Abdirizak Hassan on 2/21/22.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
