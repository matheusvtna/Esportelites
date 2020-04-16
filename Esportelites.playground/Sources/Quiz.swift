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
        
        let basketQuestions = [Question(asking: "Como se inicia uma partida de basquete?", labelA: "O time anfitrião recebe a bola", labelB: "O time visitante recebe a bola", labelC: "Árbitro decide quem inicia", labelD: "Com uma disputa pela bola", answer: "d. Com uma disputa pela bola", inform: "\nO primeiro período do jogo inicia-se oficialmente por uma bola ao ar no círculo central, quando a bola é legalmente tocada por um dos saltadores e a toca para o seu lado da quadra."), Question(asking: "O nome da área destinada para lances livres é...", labelA: "Pequena área", labelB: "Marca do pênalti", labelC: "Garrafão", labelD: "Linha dos três", answer: "c. Garrafão", inform: "\nO garrafão está relacionado a uma área da quadra de basquete que tem uma finaliade de cobrança de penalidade ou faltas. Ela pode ser encontrada nas duas extremidades da quadra e localiza-se na parte de baixo da cesta."), Question(asking: "Qual foi o maior jogador de basquete do Brasil?", labelA: "Oscar Schmidt", labelB: "Anderson Varejão", labelC: "Raulzinho", labelD: "Marcelinho Huertas", answer: "a. Oscar Schmidt", inform: "\nOscar Daniel Bezerra Schmidt é um ex-jogador brasileiro de basquetebol, considerado o maior jogador brasileiro e um dos maiores do mundo em todos os tempos. Oscar é considerado o maior pontuador da história do basquete, com 49.737 pontos, superando a marca de Kareem Abdul Jabbar. ")]
        
        let voleiQuestions = [Question(asking: "A China é uma jogada de que fundamento?", labelA: "Passe", labelB: "Ataque", labelC: "Defesa", labelD: "Recepção", answer: "b. Ataque", inform: "\nNo voleibol, China é uma jogada de ataque quase exclusiva do vôlei feminino, em que a atacante (normalmente a central) finta a marcação adversária com o movimento de pernas, fingindo correr para o meio e seguindo para as costas de sua levantadora."), Question(asking: "Qual destes NÃO é um fundamento do volei?", labelA: "Passe", labelB: "Ataque", labelC: "Drible", labelD: "Recepção", answer: "c. Drible", inform: "\nO voleibol é composto por um conjunto de seis habilidades básicas: saque, passe, levantamento, ataque, bloqueio e defesa. A cada um destes fundamentos compreende um certo número de habilidades e técnicas que foram introduzidas ao longo da história do voleibol e são hoje consideradas prática comum no esporte."), Question(asking: "Qual destas NÃO é uma posição do volei?", labelA: "Ponteiro Passador", labelB: "Oposto", labelC: "Central", labelD: "Defensor", answer: "d. Defensor", inform: "\nCada equipe de voleibol é constituída por 12 jogadores: seis efetivos (sendo um líbero) e seis suplentes. Em quadra, portanto, ficam dois times de seis jogadores. As principais posições do vôlei são: Ponteiro Passador, Oposto, Central, Líbero e Levantador")]
        
        let quiz = [QuestionsBank(sport: "Baseball", questions: baseballQuestions), QuestionsBank(sport: "Futebol", questions: soccerQuestions), QuestionsBank(sport:"Basquete", questions: basketQuestions), QuestionsBank(sport: "Volei", questions: voleiQuestions)]
        
        return quiz
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
