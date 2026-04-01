// 14-agregacao.dart  
// Agregação e Composição
import 'dart:convert';
//import 'dart:js_interop';

class Dependente {
    late String _nome;

    Dependente(String nome) {
        this._nome = nome;
    }
}

class Funcionario {
    late String _nome;
    late List<Dependente> _dependentes;

    Funcionario(String nome, List<Dependente> dependentes) {
        this._nome = nome;
        this._dependentes = dependentes;
    }
}

class EquipeProjeto {
    late String _nomeProjeto;
    late List<Funcionario> _funcionarios;

    EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
      _nomeProjeto = nomeprojeto;
      _funcionarios = funcionarios;
    }
}

void main() {
    // 1. Criar varios objetos Dependentes
    var samuel = Dependente("Samuel");
    var carlos = Dependente("Carlos");
    var rui = Dependente("Rui");
    var samira = Dependente("Samira");
    var caio = Dependente("Caio");
    // 2. Criar varios objetos Funcionario
    var nicolas = Funcionario("Nicolas", []);
    var gabriel = Funcionario("Gabriel", []);
    var miguel = Funcionario("Miguel", []);
    // 3. Associar os Dependentes criados aos respectivos
    //    funcionarios
    nicolas._dependentes = [caio, carlos];
    gabriel._dependentes = [samira, samuel];
    miguel._dependentes = [rui];
    // 4. Criar uma lista de Funcionarios
    List<Funcionario> funcionarios = [nicolas, gabriel, miguel];
    // 5. criar um objeto Equipe Projeto chamando o metodo
    //    contrutor que da nome ao projeto e insere uma
    //    coleção de funcionario
    var equipeProjeto = EquipeProjeto("projeto", funcionarios);
    // 6. Printar no formato JSON o objeto Equipe Projeto.
    var equipeProjetoJson = JsonEncoder.withIndent("    ").convert({
        "nomeProjeto" : equipeProjeto._nomeProjeto, 
        "funcionarios" : equipeProjeto._funcionarios.map((funcionario) => {
            "nome" : funcionario._nome,
            "dependentes" : funcionario._dependentes.map((dependente) => {
                "nome" : dependente._nome
            }).toList()
        }).toList()
    });
    print(equipeProjetoJson);
}