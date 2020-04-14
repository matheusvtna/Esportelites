import UIKit
import SceneKit
import SpriteKit
import PlaygroundSupport

let inform = InformViewController(screenType: .mac, isPortrait: true)
PlaygroundPage.current.liveView = inform.scale(to: 0.3)
PlaygroundPage.current.needsIndefiniteExecution = true
