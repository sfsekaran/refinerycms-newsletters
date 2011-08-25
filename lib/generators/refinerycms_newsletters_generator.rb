require 'refinery/generators'

class RefinerycmsNewslettersGenerator < Refinery::Generators::EngineInstaller

  source_root File.expand_path('../../../', __FILE__)
  engine_name "newsletters"

end
