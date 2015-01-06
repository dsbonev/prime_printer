module PrimePrinter
  require "prime_printer/positional_printer"
  require "prime_printer/prime_generator"
  require "prime_printer/table_printer"
  require "prime_printer/utils"
  require "prime_printer/version"

  def self.print_output(**args)
    if args.key? :position
      PositionalPrinter.new(position: args[:position].to_i).print_output
    elsif args.size > 0
      puts ["Unexpected arguments #{args}",
           "Usage examples: ",
           "\t prime_printer",
           "\t prime_printer position n # where n is a positive integer"].join("\n")
    else
      TablePrinter.new.print_output
    end
  end
end
