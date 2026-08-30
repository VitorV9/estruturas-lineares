class FilaEstatica
  def initialize(capacidade = 5)
    @capacidade = capacidade
    inicializar
  end

  def inicializar
    @vetor = Array.new(@capacidade)
    @comeco = 0
    @fim = -1
  end

  def inserir(info)
    raise "Overflow (Falso Cheio): A Fila atingiu o limite final do vetor!" if @fim == @capacidade - 1

    @fim += 1
    @vetor[@fim] = info
  end

  def remover
    raise "Underflow: A Fila está vazia!" if @comeco > @fim

    valor = @vetor[@comeco]
    @comeco += 1

    valor
  end

  def listar
    return "[]" if @comeco > @fim

    elementos = []
    (@comeco..@fim).each do |i|
      elementos << @vetor[i]
    end

    "[Frente -> #{elementos.join(', ')} <- Trás]"
  end
end