//
//  File.swift
//  
//
//  Created by Tyrant on 2022/6/18.
//

import Foundation
import FluentKit
import Vapor

final class RooboUsersModel: Model, Content {

    static let schema: String = "RooboUsers"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
//
//    @Field(key: "age")
//    var age: Int?
    
    init() { }
    
    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
//        self.age = age
    }
}
