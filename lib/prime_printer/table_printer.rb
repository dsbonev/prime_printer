class PrimePrinter::TablePrinter
  def initialize(primes: PrimePrinter::PrimeGenerator.new.next(10), cell_width: 4, col_delimiter: '|', row_delimiter: '—', empty_value: ' ' * cell_width)
    PrimePrinter::Utils.keyword_args_to_instance_vars_setter.call binding
  end

  def print_output
    header = print_row empty_value, primes.map(){ |p| int_to_cell(p) }.join
    puts row_delimiter * header.length

    primes.each do |p_row|
      print_row int_to_cell(p_row), primes.map(){ |p_col| int_to_cell(p_row * p_col) }.join
    end
  end

  private

  def print_row(header_col_value, body)
    "#{header_col_value}#{col_delimiter}#{body}".tap { |row| puts row }
  end

  def int_to_cell(int)
    "%#{cell_width}d" % int
  end
end
