require 'prime'

class PrimePrinter::TablePrinter
  def initialize(primes: Prime.take(10), cell_width: 4, col_delimiter: '|', row_delimiter: '—', empty_value: ' ' * cell_width)
    local_variables.each do |var|
      instance_variable_set "@#{var}", binding.local_variable_get(var)
      self.class.class_eval do
        attr_reader var
      end
    end
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
