import Foundation

public class Question{
    
    public let asking: String
    public let alternativeA: String
    public let alternativeB: String
    public let alternativeC: String
    public let alternativeD: String
    public let answer: String
    public let information: String
    
    public init(asking: String, labelA: String, labelB: String, labelC: String, labelD: String, answer: String, inform: String){
        self.asking = asking
        self.alternativeA = labelA
        self.alternativeB = labelB
        self.alternativeC = labelC
        self.alternativeD = labelD
        self.answer = answer
        self.information = inform
    }
}

public class QuestionsBank{
    
    public let name: String
    public var questions: [Question]
    
    public init(){
        self.name = ""
        self.questions = []
    }
    
    public init(sport: String, questions: [Question]){
        self.name = sport
        self.questions = questions
    }
}

public class Quiz{
    
    public var quiz: [QuestionsBank]
    
    public init(){
        self.quiz = []
    }
    
    public static func createQuiz() -> [QuestionsBank]{
        
        let baseballQuestions = [Question(asking: "Qual o país de origem do Baseball?", labelA: "Estados Unidos", labelB: "Inglaterra", labelC: "Brasil", labelD: "África do Sul", answer: "a. Estados Unidos", inform: "O jogo foi criado nos Estados Unidos em 1839. Porém, as regras foram feitas em 1845, pelo norte-americano Alexander Cartwright. O primeiro jogo oficial foi disputado em 19 de junho de 1846, na cidade de Nova Iorque."), Question(asking: "Oi galhera?", labelA: "Oi", labelB: "E aí", labelC: "Dale", labelD: "Olá", answer: "d. Olá", inform: "Bla bla bla")]
        
        let soccerQuestions = [Question(asking: "Qual o país de origem do Futebol?", labelA: "Estados Unidos", labelB: "Inglaterra", labelC: "Brasil", labelD: "África do Sul", answer: "c. Brasil", inform: "Os brasileiros são pika!")]
        
        return [QuestionsBank(sport: "Baseball", questions: baseballQuestions), QuestionsBank(sport: "Futebol", questions: soccerQuestions)]
    }
    
    public func getIndexFromSport(sport: String, bank: Quiz) -> Int{
        
        for (i, item) in bank.quiz.enumerated() {
            if(item.name == sport){
                return i
            }
        }
        
        return 0
    }
}
