#encoding: utf-8

module FiveSystem
  module Mac

    class Process

      attr_accessor :current_pid, :started_at, :cpu, :memory

      # (FiveSystem::Mac::Process)
      def self.pid(pid) # {{{
        process = self.new
        process.current_pid = pid.to_i
        process
      end # }}}

      def cli_info # {{{
        line = FiveSystem::Helper.strip_spaces(%x[ps aux -o lstart | grep #{self.current_pid}].to_s).split("\n").delete_if { |line| line =~ /grep/ }.first
      end # }}}

      def running? # {{{
        !::Process.getpgid(self.current_pid).nil? rescue(false)
      end # }}}

      def cpu_usage # {{{
        cli_info.split(' ')[2].gsub(',', '.').to_f
      end # }}}

      def memory_usage # {{{
        cli_info.split(' ')[3].gsub(',', '.').to_f
      end # }}}

      def started_at # {{{
        date = cli_info.split(' ').reverse[0..4].reverse.join(' ')
        date = date.gsub('fév', 'fev').gsub('avr', 'apr').gsub('mai', 'may').gsub('jui', 'jun').gsub('aou', 'aug')
        DateTime.parse(date).to_time rescue(nil)
      end # }}}

    end

  end
end

