require_relative '../no'

class FilaCircularDinamica
  def initialize
    inicializar
  end

  def inicializar
    @atual = nil
  end

  def inserir(info)
    novo_no = No.new(info)

    if @atual.nil?
      novo_no.elop = novo_no
      @atual = novo_no
    else
      posterior = @atual.elop
      novo_no.elop = posterior
      @atual.elop = novo_no

      @atual = novo_no
    end
  end

  def remover
    raise "Underflow: A Fila Circular Dinâmica está vazia!" if @atual.nil?

    removido = @atual.elop
    valor = removido.informacao

    if removido == @atual
      @atual = nil
    else
      @atual.elop = removido.elop
    end

    valor
  end

  def listar
    return "[]" if @atual.nil?

    elementos = []

    posicao = @atual.elop
    partida = @atual.elop

    loop do
      elementos << posicao.informacao
      posicao = posicao.elop
      break if posicao == partida
    end

    "[Frente -> #{elementos.join(', ')} <- Trás]"
  end
end