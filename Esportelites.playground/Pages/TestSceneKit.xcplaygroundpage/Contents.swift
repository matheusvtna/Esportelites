//: [Previous](@previous)
import PlaygroundSupport
//import QuartzCore
//import XCPlayground
import SceneKit
import UIKit

class Scene : UIViewController{
    
    override func viewDidLoad(){
        super.viewDidLoad()
        let scene = SCNScene()
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
                
        scene.rootNode.addChildNode(cameraNode)
        
        let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))

        sceneView.showsStatistics = true
        sceneView.backgroundColor = UIColor.white
        sceneView.allowsCameraControl = true
        
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
        
}

let menu = Scene(screenType: .iphone8, isPortrait: false)
PlaygroundPage.current.liveView = menu.scale(to: 1)


//: [Next](@next)
