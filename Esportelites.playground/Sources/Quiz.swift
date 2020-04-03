import Foundation

class Quiz{
    
    var quiz: QuestionsBank
    
    public init(){
        self.quiz = QuestionsBank()
    }
    
    public func createQuiz(){
        self.quiz = QuestionsBank()
    }
    
    
}
