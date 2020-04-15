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
        
        let baseballQuestions = [Question(asking: "Qual o país de origem do Baseball?", labelA: "Estados Unidos", labelB: "Inglaterra", labelC: "Brasil", labelD: "África do Sul", answer: "a. Estados Unidos", inform: "O jogo foi criado nos Estados Unidos em 1839. Porém, as regras foram feitas em 1845, pelo norte-americano Alexander Cartwright. O primeiro jogo oficial foi disputado em 19 de junho de 1846, na cidade de Nova Iorque."), Question(asking: "Quantas bases tem um campo de baseball?", labelA: "1", labelB: "2", labelC: "3", labelD: "4", answer: "d. 4", inform: "O campo é no formato de um diamante, sendo o centro a área do arremessador, o raio varia entre 305 pés (92m) e 355 pés (108,2m). Cada aresta do diamante (quadrado onde ficam as 4 bases) possui 90 pés (27,4m), a área de areia possui raio de 95 pés (28,9m)."), Question(asking: "Um Home Run acontece quando...", labelA: "a bola é rebatida para fora do campo", labelB: "o time da casa marca ponto", labelC: "o time da casa corre todo o campo", labelD: "um time não marca nenhum ponto", answer: "a. a bola é rebatida para fora do campo", inform: "\nEssa jogada consiste em rebater a bola para além dos limites do campo de jogo. O atleta que consegue esse feito anota para sua equipe de 1 a 4 pontos, dependendo do número de jogadores de sua equipe que estiverem ocupando as três bases do campo.")]
        
        let soccerQuestions = [Question(asking: "Qual o país de origem do Futebol?", labelA: "Estados Unidos", labelB: "Inglaterra", labelC: "Brasil", labelD: "África do Sul", answer: "b. Inglaterra", inform: "\nFoi na Inglaterra que o futebol realmente começou a tomar forma. Tudo começou em 1863, quando duas associações de jogos de bola (futebol association e futebol tipo rugby) se separaram, porque os partidários do rugby não aceitavam um jogo em que era proibido segurar a bola com as mãos."), Question(asking: "Quantos jogadores participam de uma partida?", labelA: "10", labelB: "12", labelC: "11", labelD: "9", answer: "c. 11", inform: "\nA partida será jogada por duas equipes formadas por no máximo 11 jogadores e no mínimo 7. A partida não pode ser iniciada se um dos times estiver com menos de sete jogadores, dos quais um será o goleiro. Em competições oficiais organizadas: pela FIFA, o máximo de substituições num jogo é de três jogadores."), Question(asking: "Quais cartões são utilizados no futebol?", labelA: "Amarelo e Verde", labelB: "Amarelo e Azul", labelC: "Amarelo e Vermelho", labelD: "Verde e Vermelho", answer: "c. Amarelo e Vermelho", inform: "\nNo futebol é mostrado a um jogador o cartão amarelo como aviso que tenha cometido algum tipo de infração como uma falta, servindo-lhe de advertência. Para levar um cartão amarelo basta cometer a falta quando machuca de leve a pessoa; quando marca falta machucando muito a pessoa, será cartão vermelho.")]
        
        let basketQuestions = [Question(asking: "Quem começa com a bola no basquete?", labelA: "O time anfitrião", labelB: "O time visitante", labelC: "Decidido no par ou ímpar", labelD: "Ocorre uma disputa no início", answer: "d. Ocorre uma disputa no início", inform: "\nO primeiro período do jogo inicia-se oficialmente por uma bola ao ar no círculo central, quando a bola é legalmente tocada por um dos saltadores e a toca para o seu lado da quadra.")]
        
        let voleiQuestions = [Question(asking: "A China é uma jogada de que fundamento?", labelA: "Passe", labelB: "Ataque", labelC: "Defesa", labelD: "Recepção", answer: "b. Ataque", inform: "\nNo voleibol, China é uma jogada de ataque quase exclusiva do vôlei feminino, em que a atacante (normalmente a central) finta a marcação adversária com o movimento de pernas, fingindo correr para o meio e seguindo para as costas de sua levantadora.")]
        
        return [QuestionsBank(sport: "Baseball", questions: baseballQuestions), QuestionsBank(sport: "Futebol", questions: soccerQuestions), QuestionsBank(sport:"Basquete", questions: basketQuestions), QuestionsBank(sport: "Volei", questions: voleiQuestions)]
    }
    
    public func getIndexFromSport(sport: String) -> Int{
        
        for (i, item) in self.quiz.enumerated() {
            if(item.name == sport){
                return i
            }
        }
        
        return 0
    }
}
