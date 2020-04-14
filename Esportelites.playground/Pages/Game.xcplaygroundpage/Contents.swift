import UIKit
import SceneKit
import SpriteKit
import PlaygroundSupport

let menu = MenuViewController(screenType: .mac, isPortrait: true)
let navigation = UINavigationController(screenType: .mac, isPortrait: true)

navigation.navigationBar.isHidden = true
navigation.pushViewController(menu, animated: true)
PlaygroundPage.current.liveView = navigation.scale(to: 0.3)
