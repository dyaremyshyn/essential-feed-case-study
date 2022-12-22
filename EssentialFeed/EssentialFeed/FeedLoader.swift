//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by User on 22/12/2022.
//

import Foundation

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}
