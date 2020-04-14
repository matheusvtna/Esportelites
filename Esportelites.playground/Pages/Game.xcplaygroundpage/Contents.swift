import UIKit
import SceneKit
import SpriteKit
import PlaygroundSupport

public let menu = MenuViewController()

public let navigation = UINavigationController(screenType: .mac, isPortrait: true)
navigation.navigationBar.isHidden = true
navigation.pushViewController(menu, animated: true)

PlaygroundPage.current.liveView = navigation.scale(to: 0.5)
PlaygroundPage.current.needsIndefiniteExecution = true

