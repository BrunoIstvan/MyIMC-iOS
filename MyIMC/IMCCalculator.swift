
import Foundation

class IMCCalculator {
    
    class func calculate(weight: Double, height: Double) -> IMC {
        let value = getIMCValue(weight: weight, height: height)
        var result: String = ""
        var image: String = ""
        switch value {
        case 0..<16:
            result = "Magreza"
            image = "abaixo"
        case 16..<18.5:
            result = "Abaixo do peso"
            image = "abaixo"
        case 18.5..<25:
            result = "Peso ideal"
            image = "ideal"
        case 25..<30:
            result = "Sobrepeso"
            image = "sobre"
        default:
            result = "Obesidade"
            image = "obesidade"
        }
        return IMC(value: value, result: result, image: image)
    }
    
    private class func getIMCValue(weight: Double, height: Double) -> Double  {
        return weight / (height*height)
    }
}

struct IMC {
    let value: Double
    let result: String
    let image: String
}
