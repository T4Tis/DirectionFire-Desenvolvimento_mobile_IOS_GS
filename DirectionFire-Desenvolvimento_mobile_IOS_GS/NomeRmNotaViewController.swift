//
//  NomeRmNotaViewController.swift
//  DirectionFire-Desenvolvimento_mobile_IOS_GS
//
//  Created by Usuário Convidado on 09/06/26.
//

import UIKit

class NomeRmNotaViewController: UIViewController {

    @IBOutlet weak var notaAnalise: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func MostrarAnaliseNota(_ sender: UIButton) {
        notaAnalise.text = "Eu acho que..."
        notaAnalise.isHidden = false
    }
    
}
