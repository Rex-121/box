//
//  RooboUsers.swift
//  
//
//  Created by Tyrant on 2022/6/18.
//

import Foundation
import FluentKit


struct RooboUsers: Migration {
    
    
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("RooboUsers").id()
            .field("name", .string, .required)
            .field("age", .int)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("RooboUsers").delete()
    }
    
}
