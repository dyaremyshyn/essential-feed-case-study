//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by User on 22/12/2022.
//

import XCTest

protocol HTTPClient {
    func get(from url: URL)
}

class RemoteFeedLoader {
    let url: URL
    let client: HTTPClient

    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    func load() {
        client.get(from: url)
    }
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let (_, client) = makeSUT()

        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let url = URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)

        sut.load()

        XCTAssertEqual(client.requestedURL, url)
    }
    
    // MARK: - Helpers
        
        private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
            let client = HTTPClientSpy()
            let sut = RemoteFeedLoader(url: url, client: client)
            return (sut, client)
        }

        private class HTTPClientSpy: HTTPClient {
            var requestedURL: URL?

            func get(from url: URL) {
                requestedURL = url
            }
        }
}
