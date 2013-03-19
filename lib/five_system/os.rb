module FiveSystem
  module OS

    def self.type
      %[uname].to_s case
      when 'Darwin'
        return FiveSystem::Mac
      when 'Linux'
        return FiveSystem::Linux
      end
    end

  end
end
