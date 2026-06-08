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
}
