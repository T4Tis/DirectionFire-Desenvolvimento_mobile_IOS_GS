//
//  PopUpHelper.swift
//  DirectionFire-Desenvolvimento_mobile_IOS_GS
//
//  Created by Usuário Convidado on 09/06/26.
//

import UIKit

class PopUpHelper: NSObject {
    
    /*
     eu queria usar algo que servise para colocar respostas pre determinadas e fose como uma lista, popupbuttom parecia o mais adequado
     mas tive problemas para implementalo, por algum motivo ele crashava completamente o xcode, então tentei achar alternativa ate chegar nessa soliução
     comprendo como o codigo funciona, mas não vou mentir, não sei o porque tem que ser feito para o PopUPButtom funcinar
     */
     
    static func configurar(
        botao: UIButton,
        opcoes: [String],
        aoSelecionar: ((String) -> Void)? = nil
    ) {
        let actions = opcoes.enumerated().map { (index, titulo) -> UIAction in
            UIAction(
                title: titulo,
                state: index == 0 ? .on : .off
            ) { action in
                aoSelecionar?(action.title)
            }
        }

        let menu = UIMenu(title: "", options: .singleSelection, children: actions)
        botao.menu = menu
        botao.showsMenuAsPrimaryAction = true
        botao.changesSelectionAsPrimaryAction = true
    }
}
