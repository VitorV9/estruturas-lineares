# lib/no.rb
class No
  attr_accessor :informacao, :elop, :eloa

  def initialize(informacao)
    @informacao = informacao
    @elop = nil
    @eloa = nil
  end
end