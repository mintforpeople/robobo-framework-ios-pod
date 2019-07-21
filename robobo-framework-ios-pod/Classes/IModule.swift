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
//  IModule.swift
//  robobo-framework-ios
//
//  Created by Luis Felipe Llamas Luaces on 21/02/2019.
//  Copyright © 2019 mintforpeople. All rights reserved.
//


public protocol IModule{
    func startup(_ manager :RoboboManager) throws
    func shutdown() throws
    func getModuleInfo() -> String
    func getModuleVersion() -> String
    
}
