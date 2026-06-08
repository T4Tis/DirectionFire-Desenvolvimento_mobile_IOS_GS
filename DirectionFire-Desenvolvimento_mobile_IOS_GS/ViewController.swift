//
//  ViewController.swift
//  DirectionFire-Desenvolvimento_mobile_IOS_GS
//
//  Created by Usuário Convidado on 08/06/26.
//

import UIKit

class ViewController: UIViewController {
    //PopUpButtom
    @IBOutlet weak var tipVegetacao: UIButton!
    @IBOutlet weak var dirAreaImportante: UIButton!
    //textfild
    
    @IBOutlet weak var txtNomeLocal: UITextField!
    @IBOutlet weak var txtUmidade: UITextField!
    @IBOutlet weak var txtTempMedia: UITextField!
    //switch
    @IBOutlet weak var chuva: UISwitch!
    @IBOutlet weak var importanteProximo: UISwitch!
    //buttom
    @IBOutlet weak var cadastrar: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configurarPopUpButtonVegetacao()
        configurarPopUpButtonDirecaoVento()
    }

    
    @IBAction func cadastrarArea(_ sender: Any) {
        let nome = txtNomeLocal.text ?? ""
        let vegetacao = tipVegetacao.currentTitle ?? ""
        let umidade = txtUmidade.text ?? ""
        let temperatura = txtTempMedia.text ?? ""
        let chuva = chuva.isOn
        let regImportante = importanteProximo.isOn
        let dirImportante = dirAreaImportante.currentTitle ?? ""
        
        
        //print para testes, apagar depois de fizer a classe
        print("teste ==== \(nome), \(vegetacao), \(umidade), \(temperatura), \(chuva), \(regImportante),\(dirImportante) ====")
        
    }
    
    
    
    
    //------
    // fução de config do popUpButtom | lebrar: o ideal seria ser ter apenas 1 func que recebe o conteudo e configura
    //------
    func configurarPopUpButtonVegetacao() {
        let opcoes = ["Savana", "Pradarias e Estepes", "Taiga / Floresta Boreal", "Floresta Temperada", "Tundra", "Floresta Tropical/Equatorial"]

        let actions = opcoes.enumerated().map { (index, titulo) -> UIAction in
            UIAction(
                title: titulo,
                state: index == 0 ? .on : .off
            ) { action in
                print("Selecionado: \(action.title)")
                // lógica aqui
            }
        }

        let menu = UIMenu(title: "", options: .singleSelection, children: actions)

        tipVegetacao.menu = menu
        tipVegetacao.showsMenuAsPrimaryAction = true
        tipVegetacao.changesSelectionAsPrimaryAction = true
    }
    
    func configurarPopUpButtonDirecaoVento() {
        let opcoes = ["Norte", "Sul", "Leste", "Oeste", "Nordeste", "Noroeste", "Suldeste", "Suldoeste"]

        let actions = opcoes.enumerated().map { (index, titulo) -> UIAction in
            UIAction(
                title: titulo,
                state: index == 0 ? .on : .off
            ) { action in
                print("Selecionado: \(action.title)")
                // lógica aqui
            }
        }

        let menu = UIMenu(title: "", options: .singleSelection, children: actions)

        dirAreaImportante.menu = menu
        dirAreaImportante.showsMenuAsPrimaryAction = true
        dirAreaImportante.changesSelectionAsPrimaryAction = true
    }

}

