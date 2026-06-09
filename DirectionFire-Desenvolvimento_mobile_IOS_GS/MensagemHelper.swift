//
//  MensagemHelper.swift
//  DirectionFire-Desenvolvimento_mobile_IOS_GS
//
//  Created by Usuário Convidado on 09/06/26.
//

import UIKit

class MensagemHelper{
    // Alert simples (OK)
    static func alerta(titulo: String, mensagem: String, em vc: UIViewController) {
        let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        vc.present(alert, animated: true)
    }

    // Alert com confirmação (OK / Cancelar)
    static func confirmacao(titulo: String, mensagem: String,
                            em vc: UIViewController,
                            onConfirmar: @escaping () -> Void) {
        let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        alert.addAction(UIAlertAction(title: "OK", style: .destructive) { _ in onConfirmar() })
        vc.present(alert, animated: true)
    }

    // ActionSheet (menu de opções)
    static func actionSheet(titulo: String, mensagem: String,
                            opcoes: [String], em vc: UIViewController,
                            onEscolha: @escaping (String) -> Void) {
        let sheet = UIAlertController(title: titulo, message: mensagem, preferredStyle: .actionSheet)
        for opcao in opcoes {
            sheet.addAction(UIAlertAction(title: opcao, style: .default) { _ in onEscolha(opcao) })
        }
        sheet.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        vc.present(sheet, animated: true)
    }

    // Alerta de campo obrigatório
    static func campoObrigatorio(campo: String, em vc: UIViewController) {
        alerta(titulo: "Campo obrigatório", mensagem: "O campo \"\(campo)\" não pode ficar vazio.", em: vc)
    }

    // Alerta de valor inválido
    static func valorInvalido(campo: String, em vc: UIViewController) {
        alerta(titulo: "Valor inválido", mensagem: "O campo \"\(campo)\" deve conter apenas números.", em: vc)
    }
}

