module FiveSystem
  module Mac
    module LoadAverage

      def self.get # {{{
        info = FiveSystem::Helper.strip_spaces(%x[iostat].split("\n")[2]).split(' ')
        [info[12].to_f, info[13].to_f, info[14].to_f]
      end # }}}

    end
  end
end
