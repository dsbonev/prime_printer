module PrimePrinter
  require "prime_printer/positional_printer"
  require "prime_printer/table_printer"
  require "prime_printer/version"

  def self.print_output(**args)
    if args.key? :position
      PositionalPrinter.new(position: args[:position].to_i).print_output
    else
      TablePrinter.new.print_output
    end
  end
end
