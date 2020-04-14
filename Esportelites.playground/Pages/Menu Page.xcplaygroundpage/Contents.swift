import UIKit
import SceneKit
import SpriteKit
import PlaygroundSupport

let menu = MenuViewController(screenType: .mac, isPortrait: true)
PlaygroundPage.current.liveView = menu.scale(to: 0.5)
PlaygroundPage.current.needsIndefiniteExecution = true
