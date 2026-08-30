require_relative '../no'

class PilhaDinamica
  def initialize
    inicializar
  end

  def inicializar
    @topo = nil
  end

  def inserir(info)
    novo_no = No.new(info)

    novo_no.elop = @topo

    @topo = novo_no
  end

  def remover
    raise "A Pilha está vazia!" if @topo.nil?

    valor = @topo.informacao
    @topo = @topo.elop

    valor
  end

  def listar
    return "[]" if @topo.nil?

    elementos = []
    no_atual = @topo

    while no_atual != nil
      elementos << no_atual.informacao
      no_atual = no_atual.elop
    end

    "[Topo -> #{elementos.join(', ')}]"
  end
end