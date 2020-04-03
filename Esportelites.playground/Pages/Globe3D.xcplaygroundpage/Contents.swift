import SceneKit
import UIKit
import PlaygroundSupport

class Earth: UIViewController{
    
    override func loadView() {
        let scene = SCNScene()

        let globe = SCNNode()
        globe.geometry = SCNSphere(radius: 0.01)
        scene.rootNode.addChildNode(globe)

         globe.geometry?.firstMaterial?.normal.contents = UIImage(imageLiteralResourceName: "earth_normalmap.jpg")

        globe.geometry?.firstMaterial?.diffuse.contents = UIImage(imageLiteralResourceName: "alt_earth_texture.jpg")

        let view = SCNView(frame: CGRect(x: 0, y: 0, width: 800, height: 600))

        view.allowsCameraControl = true
        view.autoenablesDefaultLighting = true
        view.showsStatistics = false
        view.scene = scene
        view.backgroundColor = #colorLiteral(red: 0.0470588244497776, green: 0.0, blue: 0.129411771893501, alpha: 1.0)
        
        self.view = view
    }
    
}

let menu = Earth(screenType: .mac, isPortrait: true)

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = menu.scale(to: 0.3)



