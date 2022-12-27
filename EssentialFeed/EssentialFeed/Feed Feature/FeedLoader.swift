//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by User on 22/12/2022.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}

