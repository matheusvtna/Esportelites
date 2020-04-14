import UIKit
import SceneKit
import SpriteKit
import PlaygroundSupport

public class SportCollectionViewCell: UICollectionViewCell {
    
    public let imageView: UIImageView = UIImageView(frame: CGRect(x: 0, y:0, width: 140, height: 145))
    public let labelSport: UILabel = UILabel(frame: CGRect(x:0, y: 140, width: 140,height: 30))
    
    public override init(frame: CGRect){
        super.init(frame:frame)
        self.addSubview(imageView)
        labelSport.font = UIFont.systemFont(ofSize: 30)
        labelSport.textAlignment = NSTextAlignment.center
        self.addSubview(labelSport)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public class ChooseSportViewController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var myCollectionView:UICollectionView?
    var sports: [Sport] = Model.shared
    
    let background = UIImageView()
    let instructionLabel = UILabel()
    let startLabel = UILabel()
    let backButton = UIButton()
    
    let sceneSatellite = SCNScene()
    let sportGlobe = SCNNode()

    let spriteView = SKView()
    let spriteScene = SKScene()
    let rocket = SKSpriteNode(imageNamed: "FogueteImage.png")
    
    let fontLabel = UIFont(name: "ChalkboardSE-Light", size: 54)
    let quizLabel = UIFont(name: "ChalkboardSE-Light", size: 164)
    
    var sport = String()
        
    public override func loadView() {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 1440, height: 900))
        
        sportGlobe.geometry = SCNSphere(radius: 0.1)
        sceneSatellite.rootNode.addChildNode(sportGlobe)
        
        sportGlobe.geometry?.firstMaterial?.normal.contents = UIImage(imageLiteralResourceName: "earth_normalmap.jpg")
        sportGlobe.geometry?.firstMaterial?.diffuse.contents = UIImage(imageLiteralResourceName: "alt_earth_texture.jpg")
        
        let spin = CABasicAnimation(keyPath: "rotation.w")
        spin.toValue = 2*Double.pi
        spin.duration = 10.0
        spin.repeatCount = HUGE
        sportGlobe.rotation = SCNVector4(x: 0.0, y: -1.0, z: 0.0, w: 0.0)
        sportGlobe.addAnimation(spin, forKey: "spin around")
        
        let sceneView = SCNView(frame: CGRect(x: 1000, y: 100, width: 300, height: 300))
        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        sceneView.showsStatistics = false
        sceneView.scene = sceneSatellite
        sceneView.backgroundColor = .clear
        
        spriteView.frame = CGRect(x: 0, y: 0, width: 1440, height: 600)
        spriteView.backgroundColor = .clear
        spriteScene.size = CGSize(width: 1440, height: 600)
        spriteScene.backgroundColor = .clear
        
        background.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        background.contentMode = .scaleToFill
        background.image = UIImage(named: "BackgroundStars.png")
        
        instructionLabel.frame = CGRect(x: 0, y: 580, width: 1440, height: 100)
        instructionLabel.text = "Selecione o esporte desejado para iniciar o quiz."
        instructionLabel.font = fontLabel
        instructionLabel.textAlignment = .center
        instructionLabel.textColor = #colorLiteral(red: 0.8823529412, green: 0.6470588235, blue: 0.2745098039, alpha: 1)
        
        startLabel.frame = CGRect(x: 0, y: 280, width: 1440, height: 300)
        startLabel.text = "QUIZ"
        startLabel.font = quizLabel
        startLabel.textAlignment = .center
        startLabel.textColor = #colorLiteral(red: 0.8823529412, green: 0.6470588235, blue: 0.2745098039, alpha: 1)
        startLabel.isHidden = true
        
        backButton.frame = CGRect(x: 25, y: 25, width: 100, height: 100)
        backButton.setImage(UIImage(imageLiteralResourceName: "ArrowBack.png"), for: .normal)
        backButton.addTarget(self, action: #selector(touchedBack), for: .touchUpInside)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 32, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 180, height: 165)
        
        myCollectionView = UICollectionView(frame: CGRect(x: 130, y: 680, width: 1200, height: 400), collectionViewLayout: layout)
        
        myCollectionView?.register(SportCollectionViewCell.self, forCellWithReuseIdentifier: "MinhaCellCustomizada")
        myCollectionView?.backgroundColor = UIColor.clear
        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self
        
        spriteView.presentScene(spriteScene)
        //spriteView.showsFPS
        
        rocket.setScale(1.0)
        rocket.anchorPoint = CGPoint.zero
        rocket.position = CGPoint(x: 80.0, y: 30.0)
        spriteScene.addChild(rocket)
        
        view.addSubview(background)
        view.addSubview(sceneView)
        view.addSubview(instructionLabel)
        view.addSubview(startLabel)
        view.addSubview(myCollectionView!)
        view.addSubview(spriteView)
        view.addSubview(backButton)
        
        self.view = view
    }
    
    @objc func touchedBack(){
        navigationController?.popViewController(animated: true)
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sports.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MinhaCellCustomizada", for: indexPath) as? SportCollectionViewCell
        
        myCell?.imageView.image = UIImage(named: sports[indexPath.section].image)
        
        myCell?.labelSport.text = sports[indexPath.section].name
        myCell?.labelSport.textColor = .white
        myCell?.labelSport.textAlignment = .center
        myCell?.labelSport.isHidden = false
        
        return myCell!
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
                
        sportGlobe.geometry?.firstMaterial?.normal.contents = UIImage(imageLiteralResourceName: sports[indexPath.section].name+"Texture.png")
        sportGlobe.geometry?.firstMaterial?.diffuse.contents = UIImage(imageLiteralResourceName: sports[indexPath.section].name+"Texture.png")
        
        rocket.position = CGPoint(x: 80.0, y: 30.0)
        instructionLabel.isHidden = false
        startLabel.isHidden = true
        myCollectionView?.isHidden = true
        
        animateRocket()
        
        sport = sports[indexPath.section].name
        
        let quiz = QuizViewController(screenType: .mac, isPortrait: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.navigationController?.navigationBar.isHidden = true
            self.navigationController?.pushViewController(quiz, animated: true)
        }
        
    }
    
    public func animateRocket(){
        let toSatellite = SKAction.moveBy(x: 1000, y: 150, duration: 4.0)
        
        rocket.run(toSatellite)
        
        instructionLabel.isHidden = true
        startLabel.isHidden = false
    }
}
