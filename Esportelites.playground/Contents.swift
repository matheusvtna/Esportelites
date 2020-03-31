//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    let buttonChangeColor = UIButton()
    let backgroundQuiz = UIImageView()
    let sportLabel = UILabel()
    let sportImage = UIImageView()

    let fontLabel = UIFont(name: "ChalkboardSE-Light", size: 96)
    let fontButton = UIFont(name: "ChalkboardSE-Light", size: 36)
    
    override func loadView() {
        let view = UIView()

        // Background
        backgroundQuiz.contentMode = .scaleToFill
        backgroundQuiz.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        backgroundQuiz.image = UIImage(imageLiteralResourceName: "Background.png")
        
        // Sport Label
        sportLabel.frame = CGRect(x: 90, y: 10, width: 1210, height: 100)
        sportLabel.textAlignment = .center
        sportLabel.text = "Baseball"
        sportLabel.font = fontLabel
        sportLabel.textColor = #colorLiteral(red: 0.8823529412, green: 0.6470588235, blue: 0.2745098039, alpha: 1)

        // Sport Image
        sportImage.contentMode = .scaleToFill
        sportImage.frame = CGRect(x: 650, y: 125, width: 110, height: 110)
        sportImage.image = UIImage(imageLiteralResourceName: "BaseballImage.png")
        
        // Next Question Button
        buttonChangeColor.frame = CGRect(x: 591, y: 503, width: 219, height: 67)
        buttonChangeColor.setTitle("Toque", for: .normal)
        buttonChangeColor.titleLabel?.font = fontButton
        buttonChangeColor.titleLabel?.textAlignment = .center
        buttonChangeColor.setTitleColor(.black, for: .normal)
        buttonChangeColor.setBackgroundImage(UIImage(imageLiteralResourceName: "proxPergunta.png"), for: .normal)
        buttonChangeColor.addTarget(self, action: #selector(touchedButton), for: .touchUpInside)
        
        view.addSubview(backgroundQuiz)
        view.addSubview(sportLabel)
        
        view.addSubview(sportImage)
        view.addSubview(buttonChangeColor)
                
        self.view = view
    }
    
    @IBAction func touchedButton(){
        print("Oi")
    }
    
}

//        var fontNames = [String]()
//
//        for name in UIFont.familyNames {
//            fontNames.append(contentsOf: UIFont.fontNames(forFamilyName: name) as [String])
//        }
//
//        fontNames.sorted()
//        for fonte in fontNames{
//            print(fonte)
//        }

let mvc = MyViewController(screenType: .mac, isPortrait: true)

PlaygroundPage.current.liveView = mvc.scale(to: 0.4)
