
$KCODE = "UTF8" if RUBY_VERSION < "1.9"

module FiveSystem

  VERSION = "0.1.0"

  autoload :OS,          'five_system/os'
  autoload :Mac,         'five_system/mac'
  autoload :Linux,       'five_system/linux'
  autoload :Common,      'five_system/common'
  autoload :Helper,      'five_system/helper'

  include FiveSystem::OS.type
  include FiveSystem::Common

end
