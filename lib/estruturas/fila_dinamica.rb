require_relative '../no'

class FilaDinamica
  def initialize
    inicializar
  end

  def inicializar
    @comeco = nil
    @fim = nil
  end

  def inserir(info)
    novo_no = No.new(info)

    if @comeco.nil?
      @comeco = novo_no
    else
      @fim.elop = novo_no
    end

    @fim = novo_no
  end

  def remover
    raise "Underflow: A Fila está vazia!" if @comeco.nil?

    valor = @comeco.informacao
    @comeco = @comeco.elop

    @fim = nil if @comeco.nil?

    valor
  end

  def listar
    return "[]" if @comeco.nil?

    elementos = []
    no_atual = @comeco

    while no_atual != nil
      elementos << no_atual.informacao
      no_atual = no_atual.elop
    end

    "[Frente -> #{elementos.join(', ')} <- Trás]"
  end
end