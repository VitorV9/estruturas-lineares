require_relative 'no'
require_relative 'estruturas/pilha_dinamica'
require_relative 'estruturas/pilha_estatica'
require_relative 'estruturas/fila_estatica'
require_relative 'estruturas/fila_dinamica'
require_relative 'estruturas/fila_circular_estatica'
require_relative 'estruturas/fila_circular_dinamica'

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

loop do
  puts "\nMENU PRINCIPAL (ESTRUTURAS LINEARES)"
  puts "1. Pilha Estática (Vetor)"
  puts "2. Pilha Dinâmica (Heap)"
  puts "3. Fila Linear Estática (Vetor)"
  puts "4. Fila Linear Dinâmica (Heap)"
  puts "5. Fila Circular Estática (Vetor Circular)"
  puts "6. Fila Circular Dinâmica (Cursor/Anel)"
  puts "7. LDE Estática (Matricial com PND)"
  puts "8. LDE Dinâmica (Heap)"
  puts "9. Sair do Programa"
  print "Escolha a estrutura: "

  escolha = gets.chomp.to_i
  break if escolha == 9

  estrutura_ativa = nil
  nome = ""

  case escolha
  when 1
    estrutura_ativa = PilhaEstatica.new(5)
    nome = "Pilha Estática"
  when 2
    estrutura_ativa = PilhaDinamica.new
    nome = "Pilha Dinâmica"
  when 3
    estrutura_ativa = FilaEstatica.new(5)
    nome = "Fila Linear Estática"
  when 4
    estrutura_ativa = FilaDinamica.new
    nome = "Fila Linear Dinâmica"
  when 5
    estrutura_ativa = FilaCircularEstatica.new(5)
    nome = "Fila Circular Estática"
  when 6
    estrutura_ativa = FilaCircularDinamica.new
    nome = "Fila Circular Dinâmica"
  else
    puts "Estrutura ainda não implementada. Digite 2 para testar a Pilha Dinâmica."
    next
  end

  menu_operacoes(estrutura_ativa, nome)
end