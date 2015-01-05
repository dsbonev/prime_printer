require 'prime'

class PrimePrinter::PositionalPrinter
  def initialize(position:)
    local_variables.each do |var|
      instance_variable_set "@#{var}", binding.local_variable_get(var)
      self.class.class_eval do
        attr_reader var
      end
    end
  end

  def print_output
    generator = Prime::EratosthenesGenerator.new
    position.pred.times { generator.next }
    puts generator.next
  end
end
