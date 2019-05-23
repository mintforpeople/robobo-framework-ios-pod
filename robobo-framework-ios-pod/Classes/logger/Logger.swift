//
//  Logger.swift
//  robobo-framework-ios
//
//  Created by Luis Felipe Llamas Luaces on 06/03/2019.
//  Copyright © 2019 mintforpeople. All rights reserved.
//



class Logger: NSObject {

    public func log(_ text:String , _ logLevel: LogLevel = LogLevel.DEBUG){
        switch logLevel {
        case LogLevel.VERBOSE:
            print("❕ \(text)")
        case LogLevel.INFO:
            print("✔️ \(text)")
        case LogLevel.DEBUG:
            print("🔷 \(text)")
        case LogLevel.WARNING:
            print("🔶 \(text)")
        case LogLevel.ERROR:
            print("❌ \(text)")
        
        }
    }
}
