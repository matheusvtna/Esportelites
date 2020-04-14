import UIKit
import SceneKit
import SpriteKit
import PlaygroundSupport

let quiz = QuizViewController(screenType: .mac, isPortrait: true)
PlaygroundPage.current.liveView = quiz.scale(to: 0.5)
PlaygroundPage.current.needsIndefiniteExecution = true
