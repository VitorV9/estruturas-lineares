class NoEstatico
  attr_accessor :informacao, :elop, :eloa
  def initialize
    @informacao = nil
    @elop = -1
    @eloa = -1
  end
end

class LdeEstatico
  def initialize(capacidade = 5)
    @capacidade = capacidade
    inicializar
  end

  def inicializar
    @vetor = Array.new(@capacidade) { NoEstatico.new }
    @comeco = -1
    @fim = -1

    @pnd = 0

    (0...@capacidade).each do |i|
      @vetor[i].elop = i + 1
    end
    @vetor[@capacidade - 1].elop = -1
  end

  def obter_no
    raise "Overflow: A PND está vazia (Lista cheia)!" if @pnd == -1

    livre = @pnd
    @pnd = @vetor[@pnd].elop
    livre
  end

  def devolver_no(indice)
    @vetor[indice].elop = @pnd
    @pnd = indice
  end

  def inserir(info)
    novo = obter_no

    @vetor[novo].informacao = info
    @vetor[novo].elop = -1
    @vetor[novo].eloa = @fim

    if @comeco == -1
      @comeco = novo
    else
      @vetor[@fim].elop = novo
    end

    @fim = novo
  end

  def remover
    raise "Underflow: A Lista está vazia!" if @comeco == -1

    removido = @comeco
    valor = @vetor[removido].informacao

    @comeco = @vetor[removido].elop

    if @comeco == -1
      @fim = -1
    else
      @vetor[@comeco].eloa = -1
    end

    devolver_no(removido)
    valor
  end

  def listar
    return "[]" if @comeco == -1

    elementos = []
    atual = @comeco

    while atual != -1
      elementos << @vetor[atual].informacao
      atual = @vetor[atual].elop
    end

    "[Início -> #{elementos.join(' <-> ')} <- Fim]"
  end
end