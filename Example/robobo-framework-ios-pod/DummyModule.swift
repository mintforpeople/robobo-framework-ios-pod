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

import robobo_framework_ios_pod

public class DummyModule : NSObject, IModule {
    var manager:RoboboManager!
    
    public func startup(_ manager: RoboboManager) throws {
        self.manager = manager
        manager.log("Starting DummyModule 1")
    }
    
    public func shutdown() throws {
        manager.log("Shutting down DummyModule 1")

    }
    
    public func getModuleInfo() -> String {
        return "DummyModule1"
    }
    
    public func getModuleVersion() -> String {
        return "1.0"
    }
    
    public func dummyFunc1(){
        manager.log("Function called on Dummy module 1")
    }
    
    
}
