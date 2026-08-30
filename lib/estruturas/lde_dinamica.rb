require_relative '../no'

class LdeDinamica
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
      novo_no.eloa = @fim
    end

    @fim = novo_no
  end

  def remover
    raise "Underflow: A LDE Dinâmica está vazia!" if @comeco.nil?

    valor = @comeco.informacao
    @comeco = @comeco.elop

    if @comeco.nil?
      @fim = nil
    else
      @comeco.eloa = nil
    end

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

    "[Início -> #{elementos.join(' <-> ')} <- Fim]"
  end
end