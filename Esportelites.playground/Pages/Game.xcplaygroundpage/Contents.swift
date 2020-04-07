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
    let scene = SCNScene()
    let globe = SCNNode()

    let fontLabel = UIFont(name: "ChalkboardSE-Light", size: 96)
    let fontButton = UIFont(name: "ChalkboardSE-Light", size: 30)

    override func loadView() {
        let view = UIView()

        globe.geometry = SCNSphere(radius: 1.0)
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

        // Background
        backgroundMenu.contentMode = .scaleToFill
        backgroundMenu.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        backgroundMenu.image = UIImage(imageLiteralResourceName: "BackgroundStars.png")

        // Title Label
        titleLabel.frame = CGRect(x: 120, y: 10, width: 1210, height: 100)
        titleLabel.textAlignment = .center
        titleLabel.text = "Bem-vindo ao Esportélites!"
        titleLabel.font = fontLabel
        titleLabel.textColor = #colorLiteral(red: 0.8823529412, green: 0.6470588235, blue: 0.2745098039, alpha: 1)

//        instructionLabel.frame = CGRect(x: 90, y: 110, width: 1230, height: 90)
//        instructionLabel.textAlignment = .center
//        instructionLabel.text = "Swipe the sports satellites and choose the mode to start the quiz."
//        instructionLabel.font = fontButton
//        instructionLabel.textColor = #colorLiteral(red: 0.8823529412, green: 0.6470588235, blue: 0.2745098039, alpha: 1)

        // Start Button
        buttonStart.frame = CGRect(x: 621, y: 803, width: 219, height: 67)
        buttonStart.setTitle("Começar", for: .normal)
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
        scoreLabel.text = "Pontuação"
        scoreLabel.font = fontButton
        scoreLabel.textColor = #colorLiteral(red: 0.8823529412, green: 0.6470588235, blue: 0.2745098039, alpha: 1)

        view.addSubview(backgroundMenu)
        view.addSubview(viewEarth)
        view.addSubview(titleLabel)
        //view.addSubview(instructionLabel)
        view.addSubview(buttonStart)
        view.addSubview(trophyButton)
        view.addSubview(scoreLabel)

        self.view = view
    }

    @objc func touchedStart(){
        let spin = CABasicAnimation(keyPath: "rotation.w")
//        spin.toValue = 1000*Double.pi
//        spin.duration = 4.0
//        spin.repeatCount = 1.0
//        self.globe.rotation = SCNVector4(x: 0.0, y: -1000.0, z: 0.0, w: 0.0)
//        self.globe.addAnimation(spin, forKey: "spin around")

//        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.navigationController?.navigationBar.isHidden = true
            self.navigationController?.pushViewController(quiz, animated: true)

            spin.toValue = 2*Double.pi
            spin.duration = 10.0
            spin.repeatCount = HUGE
            self.globe.rotation = SCNVector4(x: 0.0, y: -1.0, z: 0.0, w: 0.0)
            self.globe.addAnimation(spin, forKey: "spin around")
        //}
    }

    @IBAction func touchedScoreView(){
        print("Você é um perdedor, Matheus!")
    }

}

class QuizViewController : UIViewController {

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

    override func loadView() {
        let view = UIView()

        // Background
        backgroundQuiz.contentMode = .scaleToFill
        backgroundQuiz.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        backgroundQuiz.image = UIImage(imageLiteralResourceName: "BackgroundQuiz.png")

        // Sport Label
        sportLabel.frame = CGRect(x: 90, y: 10, width: 1210, height: 100)
        sportLabel.textAlignment = .center
        sportLabel.text = "Baseball"
        sportLabel.font = fontTitle
        sportLabel.textColor = #colorLiteral(red: 0.8823529412, green: 0.6470588235, blue: 0.2745098039, alpha: 1)

        // Sport Image
        sportImage.contentMode = .scaleToFill
        sportImage.frame = CGRect(x: 655, y: 125, width: 110, height: 115)
        sportImage.image = UIImage(imageLiteralResourceName: "BaseballImage.png")

        // Botão de voltar
        backButton.frame = CGRect(x: 50, y: 25, width: 100, height: 100)
        backButton.setImage(UIImage(imageLiteralResourceName: "ArrowBack.png"), for: .normal)
        backButton.addTarget(self, action: #selector(touchedBack), for: .touchUpInside)

        // Quiz
        question.frame = CGRect(x: 400, y: 300, width: 580, height: 70)
        question.numberOfLines = 2
        question.textAlignment = .center
        question.text = "Qual o país de origem do Baseball?"
        question.font = fontLabel
        question.textColor = .black

        answerA.frame = CGRect(x: 487, y: 382, width: 382, height: 30)
        answerA.setTitle("a. Estados Unidos", for: .normal)
        answerA.titleLabel?.font = fontLabel
        answerA.setTitleColor(.black, for: .normal)
        answerA.titleLabel?.textAlignment = .left
        answerA.addTarget(self, action: #selector(selectAnswer), for: .touchUpInside)

        answerB.frame = CGRect(x: 454, y: 427, width: 382, height: 30)
        answerB.setTitle("b. Inglaterra", for: .normal)
        answerB.titleLabel?.font = fontLabel
        answerB.setTitleColor(.black, for: .normal)
        answerB.titleLabel?.textAlignment = .left
        answerB.addTarget(self, action: #selector(selectAnswer), for: .touchUpInside)

        answerC.frame = CGRect(x: 444, y: 475, width: 382, height: 30)
        answerC.setTitle("c. Brasil", for: .normal)
        answerC.titleLabel?.font = fontLabel
        answerC.setTitleColor(.black, for: .normal)
        answerC.titleLabel?.textAlignment = .left
        answerC.addTarget(self, action: #selector(selectAnswer), for: .touchUpInside)

        answerD.frame = CGRect(x: 485, y: 517, width: 382, height: 30)
        answerD.setTitle("d. África do Sul", for: .normal)
        answerD.titleLabel?.font = fontLabel
        answerD.setTitleColor(.black, for: .normal)
        answerD.titleLabel?.textAlignment = .natural
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

    @objc func touchedBack(){
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.popViewController(animated: true)
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

        questionIndex += 1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
            self.navigationController?.navigationBar.isHidden = true
            self.navigationController?.pushViewController(inform, animated: true)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
            self.answerA.setTitleColor(.black, for: .normal)
            self.answerB.setTitleColor(.black, for: .normal)
            self.answerC.setTitleColor(.black, for: .normal)
            self.answerD.setTitleColor(.black, for: .normal)
        }
        
    }
}

class InformViewController : UIViewController {

    let backgroundCorrect = UIImageView()
    let backgroundIncorrect = UIImageView()
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
        backgroundCorrect.contentMode = .scaleToFill
        backgroundCorrect.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        backgroundCorrect.image = UIImage(imageLiteralResourceName: "BackgroundCorrect.png")

        backgroundIncorrect.contentMode = .scaleToFill
        backgroundIncorrect.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        backgroundIncorrect.image = UIImage(imageLiteralResourceName: "BackgroundIncorrect.png")

        // Sport Label
        sportLabel.frame = CGRect(x: 90, y: 10, width: 1210, height: 100)
        sportLabel.textAlignment = .center
        sportLabel.text = "Baseball"
        sportLabel.font = fontTitle
        sportLabel.textColor = #colorLiteral(red: 0.8823529412, green: 0.6470588235, blue: 0.2745098039, alpha: 1)

        // Sport Image
        sportImage.contentMode = .scaleToFill
        sportImage.frame = CGRect(x: 655, y: 125, width: 110, height: 115)
        sportImage.image = UIImage(imageLiteralResourceName: "BaseballImage.png")

        msglabel.font = fontButton
        msglabel.frame = CGRect(x: 430, y: 300, width: 585, height: 80)
        msglabel.textAlignment = .center
        msglabel.text = "Você acertou!!!"

        informLabel.numberOfLines = 6
        informLabel.font = fontLabel
        informLabel.frame = CGRect(x: 450, y: 250, width: 585, height: 400)
        informLabel.textAlignment = .justified
        informLabel.text = game.quiz[sportIndex].questions[questionIndex].information

        // Next Button
        nextButton.frame = CGRect(x: 558, y: 703, width: 319, height: 67)
        nextButton.setTitle("Próxima Pergunta", for: .normal)
        nextButton.titleLabel?.font = fontButton
        nextButton.titleLabel?.textAlignment = .center
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.setBackgroundImage(UIImage(imageLiteralResourceName: "proxPergunta.png"), for: .normal)
        nextButton.addTarget(self, action: #selector(touchedNext), for: .touchUpInside)
        
        view.addSubview(backgroundIncorrect)
        view.addSubview(sportLabel)
        view.addSubview(sportImage)
        view.addSubview(msglabel)
        view.addSubview(informLabel)
        view.addSubview(nextButton)

        self.view = view
    }
    
    @objc func touchedNext(){
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.popViewController(animated: true)
    }
}

var sportIndex: Int = 0
var questionIndex: Int = 0
var sport: String = ""
var correct: Bool = false
var isLast: Bool = false

var game: Quiz = Quiz()
game.quiz = Quiz.createQuiz()

let menu = MenuViewController(screenType: .mac, isPortrait: true)
let quiz = QuizViewController(screenType: .mac, isPortrait: true)
let inform = InformViewController(screenType: .mac, isPortrait: true)

let navigation = UINavigationController(screenType: .mac, isPortrait: true)

navigation.navigationBar.isHidden = true
navigation.pushViewController(menu, animated: true)

PlaygroundPage.current.liveView = navigation.scale(to: 0.3)


