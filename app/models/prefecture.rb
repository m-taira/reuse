class Prefecture < ActiveYaml::Base
  set_root_path Rails.root.join('config')
  set_filename 'prefecture'

end