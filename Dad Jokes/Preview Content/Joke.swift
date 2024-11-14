//
//  Joke.swift
//  Dad Jokes
//
//  Created by keith Talbot on 11/12/24.
//

import Foundation

//struct Joke: Codable {
//    let status: Int
//    let response: String
//    let joke: String
//    let type: String
//}

struct Joke: Codable {
    let error: Bool
    let category, type, joke: String
    let flags: Flags
    let id: Int
    let safe: Bool
    let lang: String
}

// MARK: - Flags
struct Flags: Codable {
    let nsfw, religious, political, racist: Bool
    let sexist, explicit: Bool
}
