//
//  User.swift
//  HWS-C-5
//
//  Created by Vaibhav Ranga on 11/06/24.
//

import Foundation
import SwiftData

@Model
class User: Codable, Identifiable {
    let id : String
    let isActive : Bool
    let name : String
    let age : Int
    let company : String
    let email : String
    let address : String
    let about : String
    let registered : String
    let tags : [String]
//    @Relationship(inverse: \Friend.owner)
    var friends: [Friend]
    
    enum CodingKeys: String, CodingKey {
        case id
        case isActive
        case name
        case age
        case company
        case email
        case address
        case about
        case registered
        case tags
        case friends
    }
    
    required init(from decoder: any Decoder) throws {
        let container: KeyedDecodingContainer<User.CodingKeys> = try decoder.container(keyedBy: User.CodingKeys.self)
        self.id = try container.decode(String.self, forKey: User.CodingKeys.id)
        self.isActive = try container.decode(Bool.self, forKey: User.CodingKeys.isActive)
        self.name = try container.decode(String.self, forKey: User.CodingKeys.name)
        self.age = try container.decode(Int.self, forKey: User.CodingKeys.age)
        self.company = try container.decode(String.self, forKey: User.CodingKeys.company)
        self.email = try container.decode(String.self, forKey: User.CodingKeys.email)
        self.address = try container.decode(String.self, forKey: User.CodingKeys.address)
        self.about = try container.decode(String.self, forKey: User.CodingKeys.about)
        self.registered = try container.decode(String.self, forKey: User.CodingKeys.registered)
        self.tags = try container.decode([String].self, forKey: User.CodingKeys.tags)
        self.friends = try container.decode([Friend].self, forKey: User.CodingKeys.friends)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container: KeyedEncodingContainer<User.CodingKeys> = encoder.container(keyedBy: User.CodingKeys.self)
        try container.encode(self.id, forKey: User.CodingKeys.id)
        try container.encode(self.isActive, forKey: User.CodingKeys.isActive)
        try container.encode(self.name, forKey: User.CodingKeys.name)
        try container.encode(self.age, forKey: User.CodingKeys.age)
        try container.encode(self.company, forKey: User.CodingKeys.company)
        try container.encode(self.email, forKey: User.CodingKeys.email)
        try container.encode(self.address, forKey: User.CodingKeys.address)
        try container.encode(self.about, forKey: User.CodingKeys.about)
        try container.encode(self.registered, forKey: User.CodingKeys.registered)
        try container.encode(self.tags, forKey: User.CodingKeys.tags)
        try container.encode(self.friends, forKey: User.CodingKeys.friends)
    }
}

@Model
class Friend: Codable, Identifiable {
    let id: String
    let name: String
    var owner: User?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
//        case _owner = "owner"
    }
    
    required init(from decoder: any Decoder) throws {
        let container: KeyedDecodingContainer<Friend.CodingKeys> = try decoder.container(keyedBy: Friend.CodingKeys.self)
        self.id = try container.decode(String.self, forKey: Friend.CodingKeys.id)
        self.name = try container.decode(String.self, forKey: Friend.CodingKeys.name)
//        self.owner = try container.decode(User?.self, forKey: Friend.CodingKeys._owner)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container: KeyedEncodingContainer<Friend.CodingKeys> = encoder.container(keyedBy: Friend.CodingKeys.self)
        try container.encode(self.id, forKey: Friend.CodingKeys.id)
        try container.encode(self.name, forKey: Friend.CodingKeys.name)
//        try container.encode(self.owner, forKey: Friend.CodingKeys._owner)
    }
}
