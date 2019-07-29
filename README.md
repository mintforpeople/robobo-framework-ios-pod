# robobo-framework-ios-pod


The robobo framework is the base library to build applications with the Robobo Robot. The framework is designed in a modular way, new functionalities are added through modules that implement the protocol defined by the ```IModule.swift``` class. The core of the framework manages the lifecycle of the Robobo application, loading all the modules defined (in order) in the ```modules.plist``` file and stopping them when the app shuts down. The manager also provides a logging system with different log levels that can be accessed by another classes implementing the ```IRoboboLogDelegate``` protocol.


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

The example shows how the robobo framework is instanced and how the modules are loaded.

In the ```ViewController.swift``` file is demonstrated how the framework is instantiated:

```swift
override func viewDidLoad() {
super.viewDidLoad()
// Do any additional setup after loading the view, typically from a nib.
manager = RoboboManager()
do{
try manager.startup()
} catch {
print(error)
}
}
```

There are two dummy modules to show how to implement the Robobo modules and how to require other modules from inside a module.

```swift

public class DummyModule2: NSObject, IModule {
var manager: RoboboManager!
var dummy1: DummyModule!

    public func startup(_ manager: RoboboManager) throws {
        self.manager = manager

        manager.log("Starting DummyModule 2")
        do{
            var module = try manager.getModuleInstance("DummyModule")
            dummy1 = module as? DummyModule
            manager.log("Calling funcion from dummy 1 from dummy 2")
            dummy1.dummyFunc1()
        }
        catch{
        manager.log(error.localizedDescription, .ERROR)

        }
    }

    public func shutdown() throws {
        manager.log("Shutting down DummyModule 2")

    }

    public func getModuleInfo() -> String {
        return "DummyModule1"
    }

    public func getModuleVersion() -> String {
        return "1.0"
    }

    public func dummyFunc2(){
        manager.log("Function called on Dummy module 2")
    }
}

```

To load the modules from the manager, they must be defined on the ```modules.plist``` file with the following convention:

Key: LoadNumber + dot + Name to be referenced on load

Value: package name + name of the class implementing the module (not the interface)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
<key>2.DummyModule2</key>
<string>robobo_framework_ios_pod_Example.DummyModule2</string>
<key>1.DummyModule</key>
<string>robobo_framework_ios_pod_Example.DummyModule</string>
</dict>
</plist>
```

## Installation

robobo-framework-ios-pod is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'robobo-framework-ios-pod'
```

Also add the following lines to the beginning of your Podfile, to allow the download of dependencies through our private Podspec repository:

```ruby
source "https://github.com/mintforpeople/mint-podspec-repo.git"
source "https://github.com/CocoaPods/Specs.git"
```

When importing it in your code, be aware that the dashes on the module name are converted to underscores:

```swift
import robobo_framework_ios_pod
```

## Author

Luis Felipe Llamas Luaces, lfllamas93@gmail.com

## License

robobo-framework-ios-pod is available under the Apache 2.0 license. See the LICENSE file for more info.

## Acknowledgement
<!-- 
    ROSIN acknowledgement from the ROSIN press kit
    @ https://github.com/rosin-project/press_kit
-->

<a href="http://rosin-project.eu">
  <img src="http://rosin-project.eu/wp-content/uploads/rosin_ack_logo_wide.png" 
       alt="rosin_logo" height="60" >
</a>

Supported by ROSIN - ROS-Industrial Quality-Assured Robot Software Components.  
More information: <a href="http://rosin-project.eu">rosin-project.eu</a>

<img src="http://rosin-project.eu/wp-content/uploads/rosin_eu_flag.jpg" 
     alt="eu_flag" height="45" align="left" >  

This project has received funding from the European Union’s Horizon 2020  
research and innovation programme under grant agreement no. 732287. 
