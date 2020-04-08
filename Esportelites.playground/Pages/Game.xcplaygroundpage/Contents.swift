import UIKit
import PlaygroundSupport
import SceneKit
class MenuViewController : UIViewController {
    
    let quiz = QuizViewController(screenType: .mac, isPortrait: true)
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
        //        let spin = CABasicAnimation(keyPath: "rotation.w")
        //        spin.toValue = 1000*Double.pi
        //        spin.duration = 10.0
        //        spin.repeatCount = HUGE
        //        self.globe.rotation = SCNVector4(x: 0.0, y: -1000.0, z: 0.0, w: 0.0)
        //        self.globe.addAnimation(spin, forKey: "spin around")
        
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.pushViewController(quiz, animated: true)
        
        //        spin.toValue = 2*Double.pi
        //        spin.duration = 10.0
        //        spin.repeatCount = HUGE
        //        self.globe.rotation = SCNVector4(x: 0.0, y: -1.0, z: 0.0, w: 0.0)
        //        self.globe.addAnimation(spin, forKey: "spin around")
    }
    
    @IBAction func touchedScoreView(){
        print("Você é um perdedor, Matheus!")
    }
    
}
class ChooseViewController : UIViewController{
    
    let background = UIImageView()
    let instructionLabel = UILabel()
    
    override func loadView(){
        
    }
}

class QuizViewController : UIViewController {
    
    
    let inform = InformViewController(screenType: .mac, isPortrait: true)
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
        
        // Botão de voltar
        backButton.frame = CGRect(x: 50, y: 25, width: 100, height: 100)
        backButton.setImage(UIImage(imageLiteralResourceName: "ArrowBack.png"), for: .normal)
        backButton.addTarget(self, action: #selector(touchedBack), for: .touchUpInside)
        
        // Sport Label
        sportLabel.frame = CGRect(x: 90, y: 10, width: 1210, height: 100)
        sportLabel.textAlignment = .center
        sportLabel.text = game.quiz[sportIndex].name
        sportLabel.font = fontTitle
        sportLabel.textColor = #colorLiteral(red: 0.8823529412, green: 0.6470588235, blue: 0.2745098039, alpha: 1)
        
        // Sport Image
        sportImage.contentMode = .scaleToFill
        sportImage.frame = CGRect(x: 655, y: 125, width: 110, height: 115)
        sportImage.image = UIImage(imageLiteralResourceName: game.quiz[sportIndex].name+"Image.png")
        
        // Botão de voltar
        backButton.frame = CGRect(x: 50, y: 25, width: 100, height: 100)
        backButton.setImage(UIImage(imageLiteralResourceName: "ArrowBack.png"), for: .normal)
        backButton.addTarget(self, action: #selector(touchedBack), for: .touchUpInside)
        
        // Quiz
        question.frame = CGRect(x: 400, y: 300, width: 580, height: 70)
        question.numberOfLines = 2
        question.textAlignment = .center
        question.text = game.quiz[sportIndex].questions[questionIndex].asking
        question.font = fontLabel
        question.textColor = .black
        
        answerA.frame = CGRect(x: 485, y: 382, width: 382, height: 30)
        answerA.setTitle("a. "+game.quiz[sportIndex].questions[questionIndex].alternativeA, for: .normal)
        answerA.titleLabel?.font = fontLabel
        answerA.setTitleColor(.black, for: .normal)
        answerA.titleLabel?.textAlignment = .left
        answerA.addTarget(self, action: #selector(selectAnswer), for: .touchUpInside)
        
        answerB.frame = CGRect(x: 485, y: 427, width: 382, height: 30)
        answerB.setTitle("b. "+game.quiz[sportIndex].questions[questionIndex].alternativeB, for: .normal)
        answerB.titleLabel?.font = fontLabel
        answerB.setTitleColor(.black, for: .normal)
        answerB.titleLabel?.textAlignment = .left
        answerB.addTarget(self, action: #selector(selectAnswer), for: .touchUpInside)
        
        answerC.frame = CGRect(x: 485, y: 475, width: 382, height: 30)
        answerC.setTitle("c. "+game.quiz[sportIndex].questions[questionIndex].alternativeC, for: .normal)
        answerC.titleLabel?.font = fontLabel
        answerC.setTitleColor(.black, for: .normal)
        answerC.titleLabel?.textAlignment = .left
        answerC.addTarget(self, action: #selector(selectAnswer), for: .touchUpInside)
        
        answerD.frame = CGRect(x: 485, y: 517, width: 382, height: 30)
        answerD.setTitle("d. "+game.quiz[sportIndex].questions[questionIndex].alternativeD, for: .normal)
        answerD.titleLabel?.font = fontLabel
        answerD.setTitleColor(.black, for: .normal)
        answerD.titleLabel?.textAlignment = .left
        answerD.addTarget(self, action: #selector(selectAnswer), for: .touchUpInside)
        
        view.addSubview(backgroundQuiz)
        view.addSubview(backButton)
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.popToViewController(menu, animated: true)
        
        sport = ""
        sportIndex = 0
        questionIndex = 0
        isCorrect = false
        isLast = false
        
    }
    
    @objc func selectAnswer(_ sender: UIButton){
        answerA.setTitleColor(.black, for: .normal)
        answerB.setTitleColor(.black, for: .normal)
        answerC.setTitleColor(.black, for: .normal)
        answerD.setTitleColor(.black, for: .normal)
        
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
        
        let inform = InformViewController(screenType: .mac, isPortrait: true)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.navigationController?.navigationBar.isHidden = true
            self.navigationController?.pushViewController(inform, animated: true)
            self.navigationController?.pushViewController(self.inform, animated: true)
            
            self.answerA.setTitleColor(.black, for: .normal)
            self.answerB.setTitleColor(.black, for: .normal)
            self.answerC.setTitleColor(.black, for: .normal)
            self.answerD.setTitleColor(.black, for: .normal)
            
            questionIndex += 1
        }
    }
}

class InformViewController : UIViewController {
    
    let quiz = QuizViewController(screenType: .mac, isPortrait: true)
    let background = UIImageView()
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
        background.contentMode = .scaleToFill
        background.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        if(isCorrect){
            background.image = UIImage(imageLiteralResourceName: "BackgroundCorrect.png")
        }
        else{
            background.image = UIImage(imageLiteralResourceName: "BackgroundIncorrect.png")
        }
        
        // Sport Label
        sportLabel.frame = CGRect(x: 90, y: 10, width: 1210, height: 100)
        sportLabel.textAlignment = .center
        sportLabel.text = game.quiz[sportIndex].name
        sportLabel.font = fontTitle
        sportLabel.textColor = #colorLiteral(red: 0.8823529412, green: 0.6470588235, blue: 0.2745098039, alpha: 1)
        
        // Sport Image
        sportImage.contentMode = .scaleToFill
        sportImage.frame = CGRect(x: 655, y: 125, width: 110, height: 115)
        sportImage.image = UIImage(imageLiteralResourceName: game.quiz[sportIndex].name+"Image.png")
        
        
        // Mensage label
        msglabel.font = fontButton
        msglabel.frame = CGRect(x: 430, y: 300, width: 585, height: 80)
        msglabel.textAlignment = .center
        
        if(isCorrect){
            msglabel.text = "Você acertou!!!"
        }
        else{
            msglabel.text = "Você errou..."
        }
        
        
        informLabel.numberOfLines = 6
        informLabel.font = fontLabel
        informLabel.frame = CGRect(x: 450, y: 250, width: 585, height: 400)
        informLabel.textAlignment = .justified
        informLabel.text = game.quiz[sportIndex].questions[questionIndex].information
        
        // Next Button
        nextButton.frame = CGRect(x: 558, y: 703, width: 319, height: 67)
        
        if(isLast){
            nextButton.setTitle(" Finalizar Quiz ", for: .normal)
        }
        else{
            nextButton.setTitle("Próxima Pergunta", for: .normal)
        }
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        sportLabel.text = game.quiz[sportIndex].name
        sportImage.image = UIImage(imageLiteralResourceName: game.quiz[sportIndex].name+"Image.png")
        informLabel.text = game.quiz[sportIndex].questions[questionIndex].information
        nextButton.setBackgroundImage(UIImage(imageLiteralResourceName: "proxPergunta.png"), for: .normal)
        
        if(isCorrect){
            background.image = UIImage(imageLiteralResourceName: "BackgroundCorrect.png")
        }
        else{
            background.image = UIImage(imageLiteralResourceName: "BackgroundIncorrect.png")
        }
        
        if(isCorrect){
            msglabel.text = "Você acertou!!!"
        }
        else{
            msglabel.text = "Você errou..."
        }
        
        if(isLast){
            nextButton.setTitle(" Finalizar Quiz ", for: .normal)
        }
        else{
            nextButton.setTitle("Próxima Pergunta", for: .normal)
        }
        
    }
    
    @objc func touchedNext(){
        
        if(questionIndex == game.quiz[sportIndex].questions.count){
            questionIndex = 0
            self.navigationController?.popToViewController(menu, animated: true)
        }
        else{
            let quiz = QuizViewController(screenType: .mac, isPortrait: true)
            self.navigationController?.navigationBar.isHidden = true
            self.navigationController?.pushViewController(quiz, animated: true)
        }
        
    }
}
var game: Quiz = Quiz()
game.quiz = Quiz.createQuiz()

var sport: String = "Futebol"
var sportIndex: Int = game.getIndexFromSport(sport: sport, bank: game)
var questionIndex: Int = 0
var isCorrect: Bool = false
var isLast: Bool = false
let menu = MenuViewController(screenType: .mac, isPortrait: true)
let navigation = UINavigationController(screenType: .mac, isPortrait: true)
navigation.navigationBar.isHidden = true
navigation.pushViewController(menu, animated: true)
PlaygroundPage.current.liveView = navigation.scale(to: 0.3)
