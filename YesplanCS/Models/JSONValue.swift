//
//  JSONValue.swift
//  YesplanCS
//
//  Created by Techcc - FOH - Video on 29/03/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//


import UIKit
//import XCTest


//public indirect enum JSONValue: Decodable {
indirect enum JSONValue: Decodable {

    case event(Event)
    case status(Status)
    
    case double(Double)
    case string(String)
    case bool(Bool)
    case dictionary([String: JSONValue])
    case array([JSONValue])
    case `nil`
    }

extension JSONValue {
    
    private enum CodableKeys: CodingKey {
        case event
        case status
//        case task

    }

    public init(from decoder: Decoder) throws {
        let singleValueContainer = try decoder.singleValueContainer()
     
            if let value = try? singleValueContainer.decode(Event.self) {
            self = .event(value)
            return
        } else if let value = try? singleValueContainer.decode(Status.self) {
            self = .status(value)
            return
//        }
//                else if let value = try? container.decode(TasksResult.self) {
//            self = .tasks(value)
////            return
        
        
        } else
    if let value = try? singleValueContainer.decode(Double.self) {
            self = .double(value)
            return
        } else if let value = try? singleValueContainer.decode(String.self) {
            self = .string(value)
            return
        } else if let value = try? singleValueContainer.decode(Bool.self) {
            self = .bool(value)
            return
        } else if let value = try? singleValueContainer.decode([String: JSONValue].self) {
            self = .dictionary(value)
            return
        } else if let value = try? singleValueContainer.decode([JSONValue].self) {
            self = .array(value)
            return
        } else if singleValueContainer.decodeNil() {
            self = .nil
            return
        }
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Could not find reasonable type to map to JSONValue"))
    }
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        switch self {
////        case .events(let x):
////            try container.encode(x)
////        case .statuses(let x):
////            try container.encode(x)
////        case .tasks(let x):
////            try container.encode(x)
//        case .double(let x):
//            try container.encode(x)
//        case .string(let x):
//            try container.encode(x)
//        case .bool(let x):
//            try container.encode(x)
//        case .dictionary(let x):
//            try container.encode(x)
//        case .dictionary(let x):
//            try container.encode(x)
//        case .null:
//            try container.encodeNil()
//        }
//    }
}

// MARK: - Convenience
//
extension JSONValue {

//    public var statuses: StatusesResult? {
//        switch self {
//        case .statuses(let value):
//            return value
//        default:
//            return nil
//        }
//    }
//    public var events: EventsResult? {
//        switch self {
//        case .events(let value):
//            return value
//        default:
//            return nil
//        }
//    }
//    public var string: String? {
//        switch self {
//        case .string(let value):
//            return value
//        default:
//            return nil
//        }
//    }
    
    public var double: Double? {
        switch self {
        case .double(let value):
            return value
        default:
            return nil
        }
    }
    public var bool: Bool? {
        switch self {
        case .bool(let value):
            return value
        default:
            return nil
        }
    }
    public var dictionary: [String: JSONValue]? {
        switch self {
        case .dictionary(let value):
            return value
        default:
            return nil
        }
    }
    public var array: [JSONValue]? {
        switch self {
        case .array(let value):
            return value
        default:
            return nil
        }
    }
    public var isNil: Bool {
        switch self {
        case .nil:
            return true
        default:
            return false
        }
    }
}


