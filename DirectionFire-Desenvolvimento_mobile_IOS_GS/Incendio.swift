//
//  Incendio.swift
//  DirectionFire-Desenvolvimento_mobile_IOS_GS
//
//  Created by Usuário Convidado on 08/06/26.
//

import Foundation

class Incendio{
    var regiao: Regiao
    var seriedade: Int        // 1 = baixa, 2 = média, 3 = alta
    var tipoIncendio: String
    var direcaoVento: String
    var nivelVento: Int       // escala Beaufort 0–12

    init(regiao: Regiao, seriedade: Int, tipoIncendio: String,
        direcaoVento: String, nivelVento: Int) {
        self.regiao       = regiao
        self.seriedade    = seriedade
        self.tipoIncendio = tipoIncendio
        self.direcaoVento = direcaoVento
        self.nivelVento   = nivelVento
    }

    func situacao() -> String {
        var score = seriedade * 25       // base: 25 / 50 / 75

        // Vento (Beaufort)
        if nivelVento >= 10     { score += 25 }
        else if nivelVento >= 7 { score += 15 }
        else if nivelVento >= 4 { score += 8  }

        // Tipo de incêndio
        switch tipoIncendio {
        case "Copa":         score += 20
        case "Subterrâneo":  score += 10
        case "Superficial":  score += 5
        default: break
        }

        // Herda risco da região
        let chanceRegiao = Int(regiao.chanceFogo().replacingOccurrences(of: "%", with: "")) ?? 0
        score += chanceRegiao / 5

        let total = min(100, max(0, score))

        switch total {
        case 0..<30:  return "Situação controlada (\(total)%) — monitoramento padrão"
        case 30..<60: return "Risco moderado (\(total)%) — aumentar vigilância"
        case 60..<80: return "Risco alto (\(total)%) — acionar brigada imediatamente"
        default:      return "CRÍTICO (\(total)%) — evacuação recomendada"
            }
        }
    }
