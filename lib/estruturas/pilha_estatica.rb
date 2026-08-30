class PilhaEstatica
  def initialize(capacidade = 5)
    @capacidade = capacidade
    inicializar
  end

  def inicializar
    @vetor = Array.new(@capacidade)
    @topo = -1
  end

  def inserir(info)
    raise "Overflow: A Pilha Estática está cheia (limite de #{@capacidade})!" if @topo == @capacidade - 1

    @topo += 1
    @vetor[@topo] = info
  end

  def remover
    raise "Underflow: A Pilha Estática está vazia!" if @topo == -1

    dado = @vetor[@topo]
    @topo -= 1

    dado
  end

  def listar
    return "[]" if @topo == -1

    elementos = []
    (0..@topo).each do |i|
      elementos << @vetor[i]
    end

    "[Topo -> #{elementos.reverse.join(', ')}]"
  end
end