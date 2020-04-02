import Foundation

public class Question{
    
    public let asking: String
    public let alternativeA: String
    public let alternativeB: String
    public let alternativeC: String
    public let alternativeD: String
    public let information: String
    
    public init(asking: String, labelA: String, labelB: String, labelC: String, labelD: String, inform: String){
        self.asking = asking
        self.alternativeA = labelA
        self.alternativeB = labelB
        self.alternativeC = labelC
        self.alternativeD = labelD
        self.information = inform
    }
    
}