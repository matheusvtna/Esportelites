import UIKit
import SceneKit
import SpriteKit
import PlaygroundSupport

public class MenuViewController : UIViewController {
    
    let buttonStart = UIButton()
    let backgroundMenu = UIImageView()
    let titleLabel = UILabel()
    let instructionLabel = UILabel()
    let trophyButton = UIButton()
    let scoreLabel = UILabel()
    let scene = SCNScene()
    let globe = SCNNode()
    
    let fontLabel = UIFont(name: "ChalkboardSE-Light", size: 96)
    let fontButton = UIFont(name: "ChalkboardSE-Light", size: 30)
    
    public override func loadView() {
        let view = UIView()
        
        globe.geometry = SCNSphere(radius: 2.0)
        scene.rootNode.addChildNode(globe)
        
        globe.geometry?.firstMaterial?.normal.contents = UIImage(imageLiteralResourceName: "earth_normalmap.jpg")
        globe.geometry?.firstMaterial?.diffuse.contents = UIImage(imageLiteralResourceName: "alt_earth_texture.jpg")
        
        let spin = CABasicAnimation(keyPath: "rotation.w")
        spin.toValue = 2*Double.pi
        spin.duration = 10.0
        spin.repeatCount = HUGE
        globe.rotation = SCNVector4(x: 0.0, y: -1.0, z: 0.0, w: 0.0)
        globe.addAnimation(spin, forKey: "spin around")
        
        let viewEarth = SCNView(frame: CGRect(x: 0, y: 100, width: 1440, height: 700))
        viewEarth.allowsCameraControl = true
        viewEarth.autoenablesDefaultLighting = true
        viewEarth.showsStatistics = false
        viewEarth.scene = scene
        viewEarth.backgroundColor = .clear
        
        backgroundMenu.contentMode = .scaleToFill
        backgroundMenu.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        backgroundMenu.image = UIImage(imageLiteralResourceName: "BackgroundStars.png")
        
        titleLabel.frame = CGRect(x: 120, y: 10, width: 1210, height: 100)
        titleLabel.textAlignment = .center
        titleLabel.text = "Bem-vindo ao Esportélites!"
        titleLabel.font = fontLabel
        titleLabel.textColor = #colorLiteral(red: 0.8823529412, green: 0.6470588235, blue: 0.2745098039, alpha: 1)
                
        buttonStart.frame = CGRect(x: 621, y: 803, width: 219, height: 67)
        buttonStart.setTitle("Começar", for: .normal)
        buttonStart.titleLabel?.font = fontButton
        buttonStart.titleLabel?.textAlignment = .center
        buttonStart.setTitleColor(.black, for: .normal)
        buttonStart.setBackgroundImage(UIImage(imageLiteralResourceName: "proxPergunta.png"), for: .normal)
        buttonStart.addTarget(self, action: #selector(touchedStart), for: .touchUpInside)
        
        trophyButton.frame = CGRect(x: 1157, y: 724, width: 178, height: 86)
        trophyButton.setBackgroundImage(UIImage(imageLiteralResourceName: "trofeu.png"), for: .normal)
        trophyButton.addTarget(self, action: #selector(touchedScoreView), for: .touchUpInside)
        
        scoreLabel.frame = CGRect(x: 1162, y: 833, width: 168, height: 36)
        scoreLabel.textAlignment = .center
        scoreLabel.text = "Pontuação"
        scoreLabel.font = fontButton
        scoreLabel.textColor = #colorLiteral(red: 0.8823529412, green: 0.6470588235, blue: 0.2745098039, alpha: 1)
        
        view.addSubview(backgroundMenu)
        view.addSubview(viewEarth)
        view.addSubview(titleLabel)
        view.addSubview(buttonStart)
        view.addSubview(trophyButton)
        view.addSubview(scoreLabel)
        
        self.view = view
    }
    
    @objc func touchedStart(){
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.pushViewController(ChooseSportViewController(), animated: true)
    }
    
    @objc func touchedScoreView(){
        print("Você tocou no botão do trofeu XD")
    }
    
}
