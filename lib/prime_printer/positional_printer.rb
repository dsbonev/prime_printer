class PrimePrinter::PositionalPrinter
  def initialize(position:)
    PrimePrinter::Utils.keyword_args_to_instance_vars_setter.call binding
  end

  def print_output
    generator = PrimePrinter::PrimeGenerator.new
    position.pred.times { generator.next }
    puts generator.next
  end
end
