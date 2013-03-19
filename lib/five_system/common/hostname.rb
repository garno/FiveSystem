module FiveSystem
  module Common

    module Hostname

      def self.get # {{{
        %x[hostname].to_s.gsub("\n", '')
      end # }}}

    end

  end
end
