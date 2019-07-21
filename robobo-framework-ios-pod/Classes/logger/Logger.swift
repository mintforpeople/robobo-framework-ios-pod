/*******************************************************************************
 *
 *   Copyright 2019, Manufactura de Ingenios Tecnológicos S.L. 
 *   <http://www.mintforpeople.com>
 *
 *   Redistribution, modification and use of this software are permitted under
 *   terms of the Apache 2.0 License.
 *
 *   This software is distributed in the hope that it will be useful,
 *   but WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND; without even the implied
 *   warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *   Apache 2.0 License for more details.
 *
 *   You should have received a copy of the Apache 2.0 License along with    
 *   this software. If not, see <http://www.apache.org/licenses/>.
 *
 ******************************************************************************/
 
//
//  Logger.swift
//  robobo-framework-ios
//
//  Created by Luis Felipe Llamas Luaces on 06/03/2019.
//  Copyright © 2019 mintforpeople. All rights reserved.
//



class Logger: NSObject {

    public var delegates: [IRoboboLogDelegate]!
    
    override init() {
        delegates = [IRoboboLogDelegate]()
    }

    public func log(_ text:String , _ logLevel: LogLevel = LogLevel.DEBUG){
        var logmsg:String = ""
        switch logLevel {
        case .VERBOSE:
            logmsg = "❕ \(text)"
        case .INFO:
            logmsg = "✔️ \(text)"
        case .DEBUG:
            logmsg = "🔷 \(text)"
        case .WARNING:
            logmsg = "🔶 \(text)"
        case .ERROR:
            logmsg = "❌ \(text)"
        
        }
        print(logmsg)
        for delegate in delegates{
            delegate.onLog(logmsg)
        }
    }
    
    public func suscribe(_ delegate: IRoboboLogDelegate){
        delegates.append(delegate)
    }
    public func unsuscribe(_ delegate: IRoboboLogDelegate){
        delegates = delegates.filter {!($0 === delegate)}
    }
}
