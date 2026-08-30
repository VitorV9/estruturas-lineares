class FilaCircularEstatica
  def initialize(capacidade = 5)
    @capacidade = capacidade
    inicializar
  end

  def inicializar
    @vetor = Array.new(@capacidade)
    @comeco = 0
    @fim = 0
    @cont = 0
  end

  def inserir(info)
    raise "Overflow: A Fila Circular está cheia!" if @cont == @capacidade

    @vetor[@fim] = info

    @fim = (@fim + 1) % @capacidade

    @cont += 1
  end

  def remover
    raise "Underflow: A Fila Circular está vazia!" if @cont == 0

    valor = @vetor[@comeco]

    @comeco = (@comeco + 1) % @capacidade

    @cont -= 1

    valor
  end

  def listar
    return "[]" if @cont == 0

    elementos = []
    indice_atual = @comeco

    @cont.times do
      elementos << @vetor[indice_atual]
      indice_atual = (indice_atual + 1) % @capacidade
    end

    "[Frente -> #{elementos.join(', ')} <- Trás]"
  end
end