//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    let backgroundCongrats = UIImageView()
    let backgroundInform = UIImageView()
    let sportLabel = UILabel()
    let sportImage = UIImageView()
    let informLabel = UILabel()
    
    let fontTitle = UIFont(name: "ChalkboardSE-Light", size: 96)
    let fontLabel = UIFont(name: "ChalkboardSE-Light", size: 24)
    let fontButton = UIFont(name: "ChalkboardSE-Light", size: 30)
    
    override func loadView() {
        let view = UIView()

        // Background
        backgroundCongrats.contentMode = .scaleToFill
        backgroundCongrats.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        backgroundCongrats.image = UIImage(imageLiteralResourceName: "BackgroundCongrats2.png")
        
        backgroundInform.contentMode = .scaleToFill
        backgroundInform.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        backgroundInform.image = UIImage(imageLiteralResourceName: "BackgroundCongrats2.png")
        
        // Sport Label
        sportLabel.frame = CGRect(x: 85, y: 10, width: 1210, height: 100)
        sportLabel.textAlignment = .center
        sportLabel.text = "Baseball"
        sportLabel.font = fontTitle
        sportLabel.textColor = #colorLiteral(red: 0.8823529412, green: 0.6470588235, blue: 0.2745098039, alpha: 1)

        // Sport Image
        sportImage.contentMode = .scaleToFill
        sportImage.frame = CGRect(x: 645, y: 125, width: 110, height: 115)
        sportImage.image = UIImage(imageLiteralResourceName: "BaseballImage.png")
        
        informLabel.numberOfLines = 10
        informLabel.font = fontLabel
        informLabel.frame = CGRect(x: 450, y: 250, width: 580, height: 400)
        informLabel.textAlignment = .justified
        informLabel.text = "You nailed it!\nSome believe it to be of English origin, and others, that it was created by Abner Doubleday in New York in 1839. The truth is that a similar game, called “rounders”, was already played in the 18th century in England."
        
        view.addSubview(backgroundCongrats)
        view.addSubview(sportLabel)
        view.addSubview(sportImage)
        view.addSubview(informLabel)
        
        self.view = view
    }
    
}

let mvc = MyViewController(screenType: .mac, isPortrait: true)

PlaygroundPage.current.liveView = mvc.scale(to: 0.4)
