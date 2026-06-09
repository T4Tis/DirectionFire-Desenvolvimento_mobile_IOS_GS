//
//  IncendioViewController.swift
//  DirectionFire-Desenvolvimento_mobile_IOS_GS
//
//  Created by Usuário Convidado on 08/06/26.
//

import UIKit

class IncendioViewController: UIViewController {
    //popUpButtons
    @IBOutlet weak var tipoIncendio: UIButton!
    @IBOutlet weak var dirVento: UIButton!
    //label
    @IBOutlet weak var lblDetectada: UILabel!
    @IBOutlet weak var lblSituacao: UILabel!
    //segmented control
    @IBOutlet weak var seriedade: UISegmentedControl!
    //stepper
    @IBOutlet weak var steppNivel: UIStepper!
    //text fild
    @IBOutlet weak var txtNivel: UITextField!
    
    var regiaoSelecionada: Regiao?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let r = regiaoSelecionada {
            lblDetectada.text = "Regiao Detectada - \(r.nome)"
        }
        
        txtNivel.text = "0"
        txtNivel.isEnabled = false
        
        lblSituacao.text = "Situação..."

        configurarPopUpTipoIncendio()
        configurarPopUpDirecaoVento()
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        txtNivel.text = "\(Int(sender.value))"
    }

    @IBAction func concluirDeteccao(_ sender: Any) {
        guard let regiao = regiaoSelecionada else {
            lblSituacao.text = "Nenhuma região selecionada"
            return
        }

        let seriedadeVal = seriedade.selectedSegmentIndex + 1
        let tipo = tipoIncendio.currentTitle ?? ""
        let direcao = dirVento.currentTitle ?? ""
        let nivel = Int(steppNivel.value)

        let incendio = Incendio(regiao: regiao, seriedade: seriedadeVal, tipoIncendio: tipo, direcaoVento: direcao, nivelVento: nivel)

        lblSituacao.text = incendio.situacao()
    }
    
    
    
    
    func configurarPopUpTipoIncendio() {
        let opcoes = ["Superficial", "Subterrâneo", "Copa"]
        let actions = opcoes.enumerated().map { (index, titulo) -> UIAction in
            UIAction(title: titulo, state: index == 0 ? .on : .off) { _ in }
        }
        let menu = UIMenu(title: "", options: .singleSelection, children: actions)
        tipoIncendio.menu = menu
        tipoIncendio.showsMenuAsPrimaryAction = true
        tipoIncendio.changesSelectionAsPrimaryAction = true
    }

    func configurarPopUpDirecaoVento() {
        let opcoes = ["Norte", "Sul", "Leste", "Oeste", "Nordeste", "Noroeste", "Sudeste", "Sudoeste"]
        let actions = opcoes.enumerated().map { (index, titulo) -> UIAction in
            UIAction(title: titulo, state: index == 0 ? .on : .off) { _ in }
        }
        let menu = UIMenu(title: "", options: .singleSelection, children: actions)
        dirVento.menu = menu
        dirVento.showsMenuAsPrimaryAction = true
        dirVento.changesSelectionAsPrimaryAction = true
    }
}
