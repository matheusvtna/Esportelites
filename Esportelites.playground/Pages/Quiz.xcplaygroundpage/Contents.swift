//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    let buttonChangeColor = UIButton()
    let backgroundQuiz = UIImageView()
    let sportLabel = UILabel()
    let sportImage = UIImageView()
    var question = UILabel()
    var answerA = UIButton()
    var answerB = UIButton()
    var answerC = UIButton()
    var answerD = UIButton()
    
    let fontTitle = UIFont(name: "ChalkboardSE-Light", size: 96)
    let fontLabel = UIFont(name: "ChalkboardSE-Light", size: 26)
    let fontButton = UIFont(name: "ChalkboardSE-Light", size: 30)
    
    override func loadView() {
        let view = UIView()

        // Background
        backgroundQuiz.contentMode = .scaleToFill
        backgroundQuiz.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        backgroundQuiz.image = UIImage(imageLiteralResourceName: "BackgroundQuiz.png")
        
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
        
        // Quiz
        question.frame = CGRect(x: 400, y: 300, width: 580, height: 70)
        question.numberOfLines = 2
        question.textAlignment = .center
        question.text = "What is the original country of Baseball?"
        question.font = fontLabel
        question.textColor = .black
        
        answerA.frame = CGRect(x: 487, y: 382, width: 382, height: 30)
        answerA.setTitle("a. United States", for: .normal)
        answerA.titleLabel?.font = fontLabel
        answerA.setTitleColor(.black, for: .normal)
        answerA.titleLabel?.textAlignment = .left
        answerA.addTarget(self, action: #selector(selectAnswer), for: .touchUpInside)
        
        answerB.frame = CGRect(x: 454, y: 427, width: 382, height: 30)
        answerB.setTitle("b. England", for: .normal)
        answerB.titleLabel?.font = fontLabel
        answerB.setTitleColor(.black, for: .normal)
        answerB.titleLabel?.textAlignment = .left
        answerB.addTarget(self, action: #selector(selectAnswer), for: .touchUpInside)
        
        answerC.frame = CGRect(x: 444, y: 475, width: 382, height: 30)
        answerC.setTitle("c. Brazil", for: .normal)
        answerC.titleLabel?.font = fontLabel
        answerC.setTitleColor(.black, for: .normal)
        answerC.titleLabel?.textAlignment = .left
        answerC.addTarget(self, action: #selector(selectAnswer), for: .touchUpInside)
        
        answerD.frame = CGRect(x: 485, y: 517, width: 382, height: 30)
        answerD.setTitle("d. South Africa", for: .normal)
        answerD.titleLabel?.font = fontLabel
        answerD.setTitleColor(.black, for: .normal)
        answerD.titleLabel?.textAlignment = .natural
        answerD.addTarget(self, action: #selector(selectAnswer), for: .touchUpInside)
        
        view.addSubview(backgroundQuiz)
        view.addSubview(sportLabel)
        view.addSubview(sportImage)
        view.addSubview(question)
        view.addSubview(answerA)
        view.addSubview(answerB)
        view.addSubview(answerC)
        view.addSubview(answerD)
        
        self.view = view
    }
    
    @IBAction func selectAnswer(_ sender: UIButton){
        answerA.setTitleColor(.black, for: .normal)
        answerB.setTitleColor(.black, for: .normal)
        answerC.setTitleColor(.black, for: .normal)
        answerD.setTitleColor(.black, for: .normal)
        
        if(sender == answerB){
            sender.setTitleColor(#colorLiteral(red: 0.231372549, green: 0.9294117647, blue: 0.4588235294, alpha: 1), for: .normal)
        }
        else{
            sender.setTitleColor(#colorLiteral(red: 0.7843137255, green: 0.1215686275, blue: 0.3098039216, alpha: 1), for: .normal)
        }
    }
    
}

let mvc = MyViewController(screenType: .mac, isPortrait: true)

PlaygroundPage.current.liveView = mvc.scale(to: 0.4)
