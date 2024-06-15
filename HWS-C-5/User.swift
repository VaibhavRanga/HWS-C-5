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
    
    @Relationship(inverse: \Friend.owner)
    var friends = [Friend]()
    
    enum CodingKeys: String, CodingKey {
        case _id = "id"
        case _isActive = "isActive"
        case _name = "name"
        case _age = "age"
        case _company = "company"
        case _email = "email"
        case _address = "address"
        case _about = "about"
        case _registered = "registered"
        case _tags = "tags"
        case _friends = "friends"
    }
    
    required init(from decoder: any Decoder) throws {
        let container: KeyedDecodingContainer<User.CodingKeys> = try decoder.container(keyedBy: User.CodingKeys.self)
        self.id = try container.decode(String.self, forKey: User.CodingKeys._id)
        self.isActive = try container.decode(Bool.self, forKey: User.CodingKeys._isActive)
        self.name = try container.decode(String.self, forKey: User.CodingKeys._name)
        self.age = try container.decode(Int.self, forKey: User.CodingKeys._age)
        self.company = try container.decode(String.self, forKey: User.CodingKeys._company)
        self.email = try container.decode(String.self, forKey: User.CodingKeys._email)
        self.address = try container.decode(String.self, forKey: User.CodingKeys._address)
        self.about = try container.decode(String.self, forKey: User.CodingKeys._about)
        self.registered = try container.decode(String.self, forKey: User.CodingKeys._registered)
        self.tags = try container.decode([String].self, forKey: User.CodingKeys._tags)
        self.friends = try container.decode([Friend].self, forKey: User.CodingKeys._friends)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container: KeyedEncodingContainer<User.CodingKeys> = encoder.container(keyedBy: User.CodingKeys.self)
        try container.encode(self.id, forKey: User.CodingKeys._id)
        try container.encode(self.isActive, forKey: User.CodingKeys._isActive)
        try container.encode(self.name, forKey: User.CodingKeys._name)
        try container.encode(self.age, forKey: User.CodingKeys._age)
        try container.encode(self.company, forKey: User.CodingKeys._company)
        try container.encode(self.email, forKey: User.CodingKeys._email)
        try container.encode(self.address, forKey: User.CodingKeys._address)
        try container.encode(self.about, forKey: User.CodingKeys._about)
        try container.encode(self.registered, forKey: User.CodingKeys._registered)
        try container.encode(self.tags, forKey: User.CodingKeys._tags)
        try container.encode(self.friends, forKey: User.CodingKeys._friends)
    }
}

@Model
class Friend: Codable, Identifiable {
    let id: String
    let name: String
    var owner: User?
    
    enum CodingKeys: String, CodingKey {
        case _id = "id"
        case _name = "name"
    }
    
    required init(from decoder: any Decoder) throws {
        let container: KeyedDecodingContainer<Friend.CodingKeys> = try decoder.container(keyedBy: Friend.CodingKeys.self)
        self.id = try container.decode(String.self, forKey: Friend.CodingKeys._id)
        self.name = try container.decode(String.self, forKey: Friend.CodingKeys._name)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container: KeyedEncodingContainer<Friend.CodingKeys> = encoder.container(keyedBy: Friend.CodingKeys.self)
        try container.encode(self.id, forKey: Friend.CodingKeys._id)
        try container.encode(self.name, forKey: Friend.CodingKeys._name)
    }
}
