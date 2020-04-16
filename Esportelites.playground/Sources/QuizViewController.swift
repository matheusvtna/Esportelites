import UIKit
import SceneKit
import SpriteKit
import PlaygroundSupport

public class QuizViewController : UIViewController {
    
    let buttonChangeColor = UIButton()
    let backgroundQuiz = UIImageView()
    let backButton = UIButton()
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
    
    let game : Quiz = Quiz()
    
    public var sport = String()
    public var sportIndex = 0
    public var questionIndex = 0
    public var isLast = false
    public var isCorrect = false
    
    public override func viewDidLoad() {
        let view = UIView()
        
        game.quiz = Quiz.createQuiz()
        
        backgroundQuiz.contentMode = .scaleToFill
        backgroundQuiz.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        backgroundQuiz.image = UIImage(imageLiteralResourceName: "BackgroundQuiz.png")
        
        sportLabel.frame = CGRect(x: 90, y: 10, width: 1210, height: 100)
        sportLabel.textAlignment = .center
        sportLabel.font = fontTitle
        sportLabel.textColor = #colorLiteral(red: 0.8823529412, green: 0.6470588235, blue: 0.2745098039, alpha: 1)
        
        sportImage.contentMode = .scaleToFill
        sportImage.frame = CGRect(x: 650, y: 125, width: 110, height: 115)
        
        backButton.frame = CGRect(x: 25, y: 25, width: 100, height: 100)
        backButton.setImage(UIImage(imageLiteralResourceName: "ArrowBack.png"), for: .normal)
        backButton.addTarget(self, action: #selector(touchedBack), for: .touchUpInside)
        
        question.frame = CGRect(x: 390, y: 300, width: 640, height: 90)
        question.numberOfLines = 2
        question.textAlignment = .center
        question.font = fontLabel
        question.textColor = .black
        
        answerA.frame = CGRect(x: 430, y: 382, width: 530, height: 30)
        answerA.titleLabel?.font = fontLabel
        answerA.setTitleColor(.black, for: .normal)
        answerA.titleLabel?.textAlignment = .left
        answerA.addTarget(self, action: #selector(selectAnswer), for: .touchUpInside)
        
        answerB.frame = CGRect(x: 430, y: 427, width: 530, height: 30)
        answerB.titleLabel?.font = fontLabel
        answerB.setTitleColor(.black, for: .normal)
        answerB.titleLabel?.textAlignment = .left
        answerB.addTarget(self, action: #selector(selectAnswer), for: .touchUpInside)
        
        answerC.frame = CGRect(x: 430, y: 475, width: 530, height: 30)
        answerC.titleLabel?.font = fontLabel
        answerC.setTitleColor(.black, for: .normal)
        answerC.titleLabel?.textAlignment = .left
        answerC.addTarget(self, action: #selector(selectAnswer), for: .touchUpInside)
        
        answerD.frame = CGRect(x: 430, y: 517, width: 530, height: 30)
        answerD.titleLabel?.font = fontLabel
        answerD.setTitleColor(.black, for: .normal)
        answerD.titleLabel?.textAlignment = .left
        answerD.addTarget(self, action: #selector(selectAnswer), for: .touchUpInside)
        
        view.addSubview(backgroundQuiz)
        view.addSubview(sportLabel)
        view.addSubview(sportImage)
        view.addSubview(backButton)
        view.addSubview(question)
        view.addSubview(answerA)
        view.addSubview(answerB)
        view.addSubview(answerC)
        view.addSubview(answerD)
        
        self.view = view
    }
    
    public override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)

        sportIndex = game.getIndexFromSport(sport: sport)
        print("\(sport) \(sportIndex) :: Questão \(questionIndex)")
        
        sportLabel.text = game.quiz[sportIndex].name
        sportImage.image = UIImage(imageLiteralResourceName: game.quiz[sportIndex].name+"Image.png")
        question.text = game.quiz[sportIndex].questions[questionIndex].asking
        answerA.setTitle("a. "+game.quiz[sportIndex].questions[questionIndex].alternativeA, for: .normal)
        answerB.setTitle("b. "+game.quiz[sportIndex].questions[questionIndex].alternativeB, for: .normal)
        answerC.setTitle("c. "+game.quiz[sportIndex].questions[questionIndex].alternativeC, for: .normal)
        answerD.setTitle("d. "+game.quiz[sportIndex].questions[questionIndex].alternativeD, for: .normal)
        
    }
    
    @objc func touchedBack(){
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func selectAnswer(_ sender: UIButton){
        
        if(sender.titleLabel?.text == game.quiz[sportIndex].questions[questionIndex].answer){
            sender.setTitleColor(#colorLiteral(red: 0.231372549, green: 0.9294117647, blue: 0.4588235294, alpha: 1), for: .normal)
            isCorrect = true
        }
        else{
            sender.setTitleColor(#colorLiteral(red: 0.7843137255, green: 0.1215686275, blue: 0.3098039216, alpha: 1), for: .normal)
            isCorrect = false
        }
        
        if(questionIndex == game.quiz[sportIndex].questions.count - 1){
            isLast = true
        }
        
        let inform = InformViewController()
        inform.sport = sport
        inform.sportIndex = sportIndex
        inform.questionIndex = questionIndex
        inform.isLast = isLast
        inform.isCorrect = isCorrect
                
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.navigationController?.navigationBar.isHidden = true
            self.navigationController?.pushViewController(inform, animated: true)
            
            self.answerA.setTitleColor(.black, for: .normal)
            self.answerB.setTitleColor(.black, for: .normal)
            self.answerC.setTitleColor(.black, for: .normal)
            self.answerD.setTitleColor(.black, for: .normal)
        }
    }
}
