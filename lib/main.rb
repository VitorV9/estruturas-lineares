require_relative 'no'
require_relative 'estruturas/pilha_dinamica'

def menu_operacoes(estrutura, nome_estrutura)
  loop do
    puts "\nOPERAÇÕES: #{nome_estrutura}"
    puts "a) Inicializar / Reiniciar"
    puts "b) Inserir Elemento"
    puts "c) Remover Elemento"
    puts "d) Listar Estrutura"
    puts "e) Voltar ao Menu Principal"
    print "Escolha: "

    opcao = gets.chomp.downcase

    case opcao
    when 'a'
      estrutura.inicializar
      puts "Estrutura inicializada (esvaziada) com sucesso!"
    when 'b'
      print "Digite o dado para inserir: "
      dado = gets.chomp

      begin
        estrutura.inserir(dado)
        puts "Elemento '#{dado}' inserido."
      rescue StandardError => e
        puts "Erro (Overflow): #{e.message}"
      end
    when 'c'
      begin
        removido = estrutura.remover
        puts "Dado removido: #{removido}"
      rescue StandardError => e
        puts "Erro: #{e.message}"
      end
    when 'd'
      puts "Conteúdo lógico: #{estrutura.listar}"
    when 'e'
      break
    else
      puts "Opção inválida!"
    end
  end
end