//
//  Incendio.swift
//  DirectionFire-Desenvolvimento_mobile_IOS_GS
//
//  Created by Usuário Convidado on 08/06/26.
//

import Foundation

class Incendio{
    var regiao: Regiao
    var seriedade: Int
    var tipoIncendio: String
    var direcaoVento: String
    var nivelVento: Int

    init(regiao: Regiao, seriedade: Int, tipoIncendio: String,
        direcaoVento: String, nivelVento: Int) {
        self.regiao = regiao
        self.seriedade = seriedade
        self.tipoIncendio = tipoIncendio
        self.direcaoVento = direcaoVento
        self.nivelVento = nivelVento
    }

    /*
     o peso de cada coisa esta correta, quanto maior o score pior é para a situação
     porem o numeros não são especificos, uma pesquisa de quanto realmete cada sutuação pesa no score ia ser demorando
     com a ideia 100% concretizada o programa ia "aprender" e adaptar esses pontos conforme é entregado informaçoes para ele
     */
    func situacao() -> String {
        var score = seriedade * 25

        // Vento
        if nivelVento >= 10 { score += 25 }
        else if nivelVento >= 7 { score += 15 }
        else if nivelVento >= 4 { score += 8  }

        // Tipo de incêndio
        switch tipoIncendio {
        case "Copa": score += 20
        case "Subterrâneo": score += 10
        case "Superficial": score += 5
        default: break
        }

        // Herda risco da região
        let chanceRegiao = Int(regiao.chanceFogo().replacingOccurrences(of: "%", with: "")) ?? 0
        score += chanceRegiao / 5

        let total = min(100, max(0, score))

        switch total {
        case 0..<30:
            return "Situação controlada (\(total)%) — monitoramento padrão"
        case 30..<60:
            return "Risco moderado (\(total)%) — aumentar vigilância"
        case 60..<80:
            return "Risco alto (\(total)%) — acionar brigada imediatamente"
        default:
            return "CRÍTICO (\(total)%) — evacuação recomendada"
            }
        }
    }
