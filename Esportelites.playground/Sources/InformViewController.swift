import UIKit
import SceneKit
import SpriteKit
import PlaygroundSupport

public class InformViewController : UIViewController {
    
    let background = UIImageView()
    let sportLabel = UILabel()
    let sportImage = UIImageView()
    let msglabel = UILabel()
    let informLabel = UILabel()
    let nextButton = UIButton()
    
    let fontTitle = UIFont(name: "ChalkboardSE-Light", size: 96)
    let fontLabel = UIFont(name: "ChalkboardSE-Light", size: 22)
    let fontButton = UIFont(name: "ChalkboardSE-Light", size: 28)
    
    let game : Quiz = Quiz()
    
    var sport = ""
    var sportIndex = 0
    var questionIndex = 0
    var isCorrect = false
    var isLast = false
    
    public override func viewDidLoad(){
        let view = UIView()
        
        game.quiz = Quiz.createQuiz()
        
        // Background
        background.contentMode = .scaleToFill
        background.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
                
        // Sport Label
        sportLabel.frame = CGRect(x: 90, y: 10, width: 1210, height: 100)
        sportLabel.textAlignment = .center
        sportLabel.font = fontTitle
        sportLabel.textColor = #colorLiteral(red: 0.8823529412, green: 0.6470588235, blue: 0.2745098039, alpha: 1)
        
        // Sport Image
        sportImage.contentMode = .scaleToFill
        sportImage.frame = CGRect(x: 655, y: 125, width: 110, height: 115)
        
        msglabel.font = fontButton
        msglabel.frame = CGRect(x: 430, y: 300, width: 585, height: 80)
        msglabel.textAlignment = .center
                
        informLabel.numberOfLines = 6
        informLabel.font = fontLabel
        informLabel.frame = CGRect(x: 450, y: 250, width: 585, height: 400)
        informLabel.textAlignment = .justified
        
        // Next Button
        nextButton.frame = CGRect(x: 558, y: 703, width: 319, height: 67)
        nextButton.titleLabel?.font = fontButton
        nextButton.titleLabel?.textAlignment = .center
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.setBackgroundImage(UIImage(imageLiteralResourceName: "proxPergunta.png"), for: .normal)
        nextButton.addTarget(self, action: #selector(touchedNext), for: .touchUpInside)
        
        view.addSubview(background)
        view.addSubview(sportLabel)
        view.addSubview(sportImage)
        view.addSubview(msglabel)
        view.addSubview(informLabel)
        view.addSubview(nextButton)
        
        self.view = view
    }
    
    public override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        if(isCorrect){
            background.image = UIImage(imageLiteralResourceName: "BackgroundCorrect.png")
            msglabel.text = "Você acertou!!!"
        }
        else{
            background.image = UIImage(imageLiteralResourceName: "BackgroundIncorrect.png")
            msglabel.text = "Você errou..."
        }
        
        if(isLast){
            nextButton.setTitle(" Finalizar Quiz ", for: .normal)
        }
        else{
            nextButton.setTitle("Próxima Pergunta", for: .normal)
        }
        
        sportLabel.text = game.quiz[sportIndex].name
        sportImage.image = UIImage(imageLiteralResourceName: game.quiz[sportIndex].name+"Image.png")
        informLabel.text = game.quiz[sportIndex].questions[questionIndex].information

        
        
    }
    
    @objc func touchedNext(){
        
        if(isLast){
            sportIndex = 0
            questionIndex = 0
            isCorrect = false
            isLast = false
            
            self.navigationController?.popToRootViewController(animated: true)
        }
        else{
            let quiz = QuizViewController()
            quiz.sport = sport
            quiz.sportIndex = sportIndex
            quiz.questionIndex = questionIndex + 1
            
            self.navigationController?.navigationBar.isHidden = true
            self.navigationController?.pushViewController(quiz, animated: true)
        }
        
    }
}
