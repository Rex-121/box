//
//  RooboUsersController.swift
//  
//
//  Created by Tyrant on 2022/6/18.
//

import Fluent
import Vapor
import NIOCore

struct RooboUsersController: RouteCollection {
    
    
    func boot(routes: RoutesBuilder) throws {
        let roobo = routes.grouped("roobo")
        
        roobo.get("ggg", use: index)
        roobo.get(use: index)
        roobo.post(use: create)
        roobo.put(use: update)
    }
    
    func index(req: Request) throws -> EventLoopFuture<[RooboUsersModel]> {
        return RooboUsersModel.query(on: req.db).all()
    }
    
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let roobo = try req.content.decode(RooboUsersModel.self)
        return roobo.save(on: req.db).transform(to: .ok)
    }
    
    
    func update(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let roobo = try req.content.decode(RooboUsersModel.self)
        return RooboUsersModel.find(roobo.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {
                $0.name = roobo.name
                return $0.update(on: req.db).transform(to: .ok)
            }
        
    }
    
}
