//
//  ViewController.swift
//  DirectionFire-Desenvolvimento_mobile_IOS_GS
//
//  Created by Usuário Convidado on 08/06/26.
//

import UIKit

class RegiaoViewController: UIViewController {
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
        configurarPopUpButtonVegetacao()
        configurarPopUpButtonDirecaoVento()
        
        // Região pronta para teste da tableview
        let r = Regiao(nome: "Teste", vegetacao: "Tundra", umidade: 41, temperaturaMedia: 23, chuvaRecente: false, importanteProximo: false, direcaoImportante: "Suldeste")
        ArryMemoria.regioes.append(r)
    }

    
    @IBAction func cadastrarArea(_ sender: Any) {

        // ── Validação: nome vazio ──────────────────────────────
        let nome = txtNomeLocal.text ?? ""
        guard !nome.trimmingCharacters(in: .whitespaces).isEmpty else {
            MensagemHelper.campoObrigatorio(campo: "Nome do Local", em: self)
            return
        }

        // Validação: umidade vazia
        let umidadeStr = txtUmidade.text ?? ""
        guard !umidadeStr.trimmingCharacters(in: .whitespaces).isEmpty else {
            MensagemHelper.campoObrigatorio(campo: "Umidade", em: self)
            return
        }

        // Validação: umidade numérica
        guard let umidade = Int(umidadeStr) else {
            MensagemHelper.valorInvalido(campo: "Umidade", em: self)
            return
        }

        // Validação: temperatura vazia
        let tempStr = txtTempMedia.text ?? ""
        guard !tempStr.trimmingCharacters(in: .whitespaces).isEmpty else {
            MensagemHelper.campoObrigatorio(campo: "Temperatura Média", em: self)
            return
        }

        // Validação: temperatura numérica
        guard let temperatura = Int(tempStr) else {
            MensagemHelper.valorInvalido(campo: "Temperatura Média", em: self)
            return
        }

        // Tudo válido: cadastrar
        let vegetacao = tipVegetacao.currentTitle ?? ""
        let chuva = chuva.isOn
        let regImportante = importanteProximo.isOn
        let dirImportante = dirAreaImportante.currentTitle ?? ""

        let regiao = Regiao(
            nome: nome, vegetacao: vegetacao,
            umidade: umidade, temperaturaMedia: temperatura,
            chuvaRecente: chuva, importanteProximo: regImportante,
            direcaoImportante: dirImportante
        )

        ArryMemoria.regioes.append(regiao)

        MensagemHelper.alerta(titulo: "Cadastrado!", mensagem: "\"\(nome)\" foi adicionada com sucesso.", em: self)
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

