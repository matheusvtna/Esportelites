import UIKit
import PlaygroundSupport
import SceneKit

class MenuViewController : UIViewController {
    
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
    
    @objc func touchedStart(){
        navigationController?.navigationBar.isHidden = true
        navigationController?.pushViewController(quiz, animated: true)
    }
    
    @IBAction func touchedScoreView(){
        print("You are a loser!")
    }
    
}

class QuizViewController : UIViewController {
    
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
    
    @objc func selectAnswer(_ sender: UIButton){
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
            self.navigationController?.navigationBar.isHidden = true
            self.navigationController?.pushViewController(correct, animated: true)
        }
        
    }
}

class CorrectViewController : UIViewController {
    
    let backgroundCongrats = UIImageView()
    let backgroundInform = UIImageView()
    let sportLabel = UILabel()
    let sportImage = UIImageView()
    let msglabel = UILabel()
    let informLabel = UILabel()
    let nextButton = UIButton()
    
    let fontTitle = UIFont(name: "ChalkboardSE-Light", size: 96)
    let fontLabel = UIFont(name: "ChalkboardSE-Light", size: 22)
    let fontButton = UIFont(name: "ChalkboardSE-Light", size: 28)
    
    override func loadView() {
        navigationController?.navigationBar.isHidden = true
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
        
        msglabel.font = fontButton
        msglabel.frame = CGRect(x: 430, y: 300, width: 585, height: 80)
        msglabel.textAlignment = .center
        msglabel.text = "You nailed it!"
        
        informLabel.numberOfLines = 6
        informLabel.font = fontLabel
        informLabel.frame = CGRect(x: 450, y: 250, width: 585, height: 400)
        informLabel.textAlignment = .justified
        informLabel.text = "Some believe it to be of English origin, and others, that it was created by Abner Doubleday in New York in 1839. The truth is that a similar game, called “rounders”, was already played in the 18th century in England."
        
        view.addSubview(backgroundCongrats)
        view.addSubview(sportLabel)
        view.addSubview(sportImage)
        view.addSubview(msglabel)
        view.addSubview(informLabel)
        
        self.view = view
    }
    
}
let menu = MenuViewController(screenType: .mac, isPortrait: true)
let quiz = QuizViewController(screenType: .mac, isPortrait: true)
let correct = CorrectViewController(screenType: .mac, isPortrait: true)

let navigation = UINavigationController(screenType: .mac, isPortrait: true)
navigation.navigationBar.isHidden = true
navigation.pushViewController(menu, animated: true)

PlaygroundPage.current.liveView = navigation.scale(to: 0.3)


