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
//  DelegateManager.swift
//  robobo-framework-ios
//
//  Created by Luis Felipe Llamas Luaces on 08/03/2019.
//  Copyright © 2019 mintforpeople. All rights reserved.
//


open class DelegateManager {
    public var delegates: [IModuleDelegate]!
    
    public init() {
        delegates = []
    }
    
    
    public func suscribe(_ delegate: IModuleDelegate){
        delegates.append(delegate)
    }
    public func unsuscribe(_ delegate: IModuleDelegate){
        delegates = delegates.filter {!($0 === delegate)}
    }
}
