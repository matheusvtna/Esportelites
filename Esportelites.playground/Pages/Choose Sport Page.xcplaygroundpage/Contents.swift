import UIKit
import SceneKit
import SpriteKit
import PlaygroundSupport

let choose = ChooseSportViewController(screenType: .mac, isPortrait: true)
PlaygroundPage.current.liveView = choose.scale(to: 0.3)
PlaygroundPage.current.needsIndefiniteExecution = true

