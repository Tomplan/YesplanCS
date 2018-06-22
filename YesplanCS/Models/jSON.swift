////
////  jSON.swift
////  YesplanCS
////
////  Created by Techcc - FOH - Video on 30/03/18.
////  Copyright © 2018 Yesplan. All rights reserved.
////
//
//import Foundation
//
//
//enum JSONValue {
//    case events(EventsResult?)
//    case statuses(StatusesResult?)
//    //    case tasks(TasksResult)
//    
//    
//    
////    case bool(Bool)
////    case double(Double)
////    case string(String)
////    indirect case array([JSONValue])
////    indirect case dictionary([String: JSONValue])
//}
//
//extension JSONValue: Decodable {
//    
////    enum Key: CodingKey {
////        case rawValue
////        case associatedValue
////    }
//    
//    private enum CodingKeys : CodingKey {
//        case events
//        case statuses
//    }
//    
//    
//    init(from decoder: Decoder) throws {
//        print(decoder)
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        
//        print(container)
//        let x = try container.decode(EventsResult.self, forKey: .events)
//            self = .events(x)
//        print("self: ", self)
//        let y = try container.decode(StatusesResult.self, forKey: .statuses)
//            self = .statuses(y)
//        print("self: ", self)
//
//    }
//    enum CodingError: Error {
//        case unknownValue
//    }
//    
////    init(from decoder: Decoder) throws {
////        let container = try decoder.container(keyedBy: Key.self)
////        print("container: ", container)
////        print("allKeys: ", container.allKeys)
////        let rawValue = try container.decode(Int.self, forKey: .rawValue)
////        print("rawValue :", rawValue)
////        switch rawValue {
////        case 0:
////            let associatedTypeValue = try container.decodeIfPresent(EventsResult.self, forKey: .associatedValue)
////            self = .events(associatedTypeValue)
////        case 1:
////            let associatedTypeValue = try container.decodeIfPresent(StatusesResult.self, forKey: .associatedValue)
////            self = .statuses(associatedTypeValue)
////        default:
////            throw CodingError.unknownValue
////        }
////    }
//}
////        } else if let container = try? decoder.container(keyedBy: JSONCodingKeys.self) {
////            self = JSONValue(from: container)
////        } else if let container = try? decoder.unkeyedContainer() {
////            self = JSONValue(from: container)
////
//////        } else if let value = try decoder.container(keyedBy: EventsResult.self) {
//////            self = JSONValue(from: container)
////
////        } else {
////            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: ""))
////        }
////    }
////
////    private init(from container: KeyedDecodingContainer<JSONCodingKeys>) {
////        let container = container
////        var dict: [String: JSONValue] = [:]
////        for key in container.allKeys {
////            if let value = try? container.decode(Bool.self, forKey: key) {
////                dict[key.stringValue] = .bool(value)
////            } else if let value = try? container.decode(Double.self, forKey: key) {
////                dict[key.stringValue] = .double(value)
////            } else if let value = try? container.decode(String.self, forKey: key) {
////                dict[key.stringValue] = .string(value)
////            } else if let value = try? container.nestedContainer(keyedBy: JSONCodingKeys.self, forKey: key) {
////                dict[key.stringValue] = JSONValue(from: value)
////            } else if let value = try? container.nestedUnkeyedContainer(forKey: key) {
////                dict[key.stringValue] = JSONValue(from: value)
////            }
////        }
////        self = .dictionary(dict)
////    }
////
////    private init(from container: UnkeyedDecodingContainer) {
////        var container = container
////        var arr: [JSONValue] = []
////        while !container.isAtEnd {
////            if let value = try? container.decode(Bool.self) {
////                arr.append(.bool(value))
////            } else if let value = try? container.decode(Double.self) {
////                arr.append(.double(value))
////            } else if let value = try? container.decode(String.self) {
////                arr.append(.string(value))
////            } else if let value = try? container.nestedContainer(keyedBy: JSONCodingKeys.self) {
////                arr.append(JSONValue(from: value))
////            } else if let value = try? container.nestedUnkeyedContainer() {
////                arr.append(JSONValue(from: value))
////            }
////        }
////        self = .array(arr)
////    }
////}
////
////struct JSONCodingKeys: CodingKey {
////
////
//////    static let events = JSONCodingKeys(stringValue: "EventsResult")!
//////    static let statuses = JSONCodingKeys(stringValue: "statuses")!
////
////    var stringValue: String
////
////    init?(stringValue: String) {
////        self.stringValue = stringValue
////    }
////
////    var intValue: Int?
////
////    init?(intValue: Int) {
////        self.init(stringValue: "\(intValue)")
////        self.intValue = intValue
////    }
////}
//
