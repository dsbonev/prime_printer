module PrimePrinter::Utils
  def self.keyword_args_to_instance_vars_setter
    proc do |bind|
      bind.eval 'local_variables.each do |var|
        instance_variable_set "@#{var}", binding.local_variable_get(var)
        self.class.class_eval do
          attr_reader var
        end
      end'
    end
  end
end
