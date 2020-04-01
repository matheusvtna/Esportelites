import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    let buttonStart = UIButton()
    let backgroundMenu = UIImageView()
    let titleLabel = UILabel()
    let instructionLabel = UILabel()
    let trophyButton = UIButton()
    let scoreLabel = UILabel()
    
    let fontLabel = UIFont(name: "ChalkboardSE-Light", size: 96)
    let fontButton = UIFont(name: "ChalkboardSE-Light", size: 30)
    
    override func loadView() {
        let view = UIView()

        // Background
        backgroundMenu.contentMode = .scaleToFill
        backgroundMenu.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        backgroundMenu.image = UIImage(imageLiteralResourceName: "BackgroundMenu.png")
        
        // Title Label
        titleLabel.frame = CGRect(x: 90, y: 10, width: 1210, height: 100)
        titleLabel.textAlignment = .center
        titleLabel.text = "Welcome to Sportellites!"
        titleLabel.font = fontLabel
        titleLabel.textColor = #colorLiteral(red: 0.8823529412, green: 0.6470588235, blue: 0.2745098039, alpha: 1)
            
        instructionLabel.frame = CGRect(x: 90, y: 110, width: 1230, height: 90)
        instructionLabel.textAlignment = .center
        instructionLabel.text = "Swipe the sports satellites and choose the mode to start the quiz."
        instructionLabel.font = fontButton
        instructionLabel.textColor = #colorLiteral(red: 0.8823529412, green: 0.6470588235, blue: 0.2745098039, alpha: 1)
        
        // Start Button
        buttonStart.frame = CGRect(x: 621, y: 803, width: 219, height: 67)
        buttonStart.setTitle("Start", for: .normal)
        buttonStart.titleLabel?.font = fontButton
        buttonStart.titleLabel?.textAlignment = .center
        buttonStart.setTitleColor(.black, for: .normal)
        buttonStart.setBackgroundImage(UIImage(imageLiteralResourceName: "proxPergunta.png"), for: .normal)
        buttonStart.addTarget(self, action: #selector(touchedStart), for: .touchUpInside)
        
        // Score
        trophyButton.frame = CGRect(x: 1157, y: 724, width: 178, height: 86)
        trophyButton.setBackgroundImage(UIImage(imageLiteralResourceName: "trofeu.png"), for: .normal)
        trophyButton.addTarget(self, action: #selector(touchedScoreView), for: .touchUpInside)
        
        scoreLabel.frame = CGRect(x: 1162, y: 833, width: 168, height: 36)
        scoreLabel.textAlignment = .center
        scoreLabel.text = "Score"
        scoreLabel.font = fontButton
        scoreLabel.textColor = #colorLiteral(red: 0.8823529412, green: 0.6470588235, blue: 0.2745098039, alpha: 1)

        
        view.addSubview(backgroundMenu)
        view.addSubview(titleLabel)
        view.addSubview(instructionLabel)
        view.addSubview(buttonStart)
        view.addSubview(trophyButton)
        view.addSubview(scoreLabel)
                
        self.view = view
    }
    
    @IBAction func touchedStart(){
        print("Start")
    }
    
    @IBAction func touchedScoreView(){
        print("You are a loser!")
    }
    
}

let mvc = MyViewController(screenType: .mac, isPortrait: true)

PlaygroundPage.current.liveView = mvc.scale(to: 0.2)

