//
//  NomeRmNotaViewController.swift
//  DirectionFire-Desenvolvimento_mobile_IOS_GS
//
//  Created by Usuário Convidado on 09/06/26.
//

import UIKit

class NomeRmNotaViewController: UIViewController {

    @IBOutlet weak var notaAnalise: UILabel!
    @IBOutlet weak var notaNumero: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func MostrarAnaliseNota(_ sender: UIButton) {
        notaNumero.text = "8"
        notaAnalise.text = "    Se nada der errado tudo que foi pedido foi entregue, mas mesmo assim pode existir a chance de eu ter entendiodo algo errado e isso seria bem ruim.\n    Eu acredito ter tirado um 8, não por estar faltando algo, mas que talvez seja descontado nota pela aparencia das telas, codigo ruim ou justificativas insuficientes/incoerentes."
        
        notaAnalise.isHidden = false
        notaNumero.isHidden = false
    }
    
}
