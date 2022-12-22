//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by User on 22/12/2022.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
