//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    let buttonChangeColor = UIButton()
    
    override func loadView() {
        let view = UIView()
        
        let backgroundQuiz = UIImageView()
        backgroundQuiz.contentMode = .scaleToFill
        backgroundQuiz.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        backgroundQuiz.image = UIImage(imageLiteralResourceName: "Background.png")
        
        let label = UILabel()
        label.frame = CGRect(x: 105, y: 56, width: 1229, height: 92)
        label.textAlignment = .center
        label.text = "Baseball"
        label.font = UIFont(name: "Marker Felt Amplo", size: 72)
        label.textColor = #colorLiteral(red: 0.8823529412, green: 0.6470588235, blue: 0.2745098039, alpha: 1)

        view.addSubview(backgroundQuiz)
        view.addSubview(label)
        
        buttonChangeColor.addTarget(self, action: #selector(touchedButton), for: .touchUpInside)
        
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
//

let mvc = MyViewController(screenType: .mac, isPortrait: true)

PlaygroundPage.current.liveView = mvc.scale(to: 0.4)
