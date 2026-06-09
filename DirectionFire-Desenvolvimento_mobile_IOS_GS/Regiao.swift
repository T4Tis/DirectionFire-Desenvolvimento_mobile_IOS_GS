//
//  Regiao.swift
//  DirectionFire-Desenvolvimento_mobile_IOS_GS
//
//  Created by Usuário Convidado on 08/06/26.
//

import Foundation

class Regiao{
    var nome: String
    var vegetacao: String
    var umidade: Int
    var temperaturaMedia: Int
    var chuvaRecente: Bool
    var importanteProximo : Bool
    var direcaoImportante : String
    
    init(nome: String, vegetacao: String, umidade: Int, temperaturaMedia: Int, chuvaRecente: Bool, importanteProximo: Bool, direcaoImportante: String) {
        self.nome = nome
        self.vegetacao = vegetacao
        self.umidade = umidade
        self.temperaturaMedia = temperaturaMedia
        self.chuvaRecente = chuvaRecente
        self.importanteProximo = importanteProximo
        self.direcaoImportante = direcaoImportante
        
        print(nome, vegetacao, umidade, temperaturaMedia, chuvaRecente, importanteProximo, direcaoImportante)
    }
    
    func chanceFogo() -> String {
        var score = 0

        // Umidade: menor = mais perigoso
        if umidade < 30      { score += 40 }
        else if umidade < 50 { score += 25 }
        else if umidade < 70 { score += 10 }

        // Temperatura: maior = mais perigoso
        if temperaturaMedia > 35      { score += 35 }
        else if temperaturaMedia > 25 { score += 20 }
        else if temperaturaMedia > 15 { score += 10 }

        // Chuva recente reduz risco
        if chuvaRecente { score -= 20 }

        // Vegetação
        switch vegetacao {
        case "Savana": score += 15
        case "Pradarias e Estepes": score += 10
        case "Taiga / Floresta Boreal": score += 5
        case "Floresta Temperada": score += 5
        case "Tundra": score -= 5
        case "Floresta Tropical/Equatorial":score -= 10
        default: break
        }

        return "\(max(0, min(100, score)))"
    }
}
