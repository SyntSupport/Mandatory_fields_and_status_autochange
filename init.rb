require 'redmine'
require 'date'
require 'active_support'

require File.dirname(__FILE__) + '/lib/issues_controller_patch.rb'

require 'dispatcher'
Dispatcher.to_prepare :mandatory_fields_and_status_autochange do
  require_dependency 'issues_controller'
  IssuesController.send(:include, MandatoryFieldsAndStatusAutochange::Patches::IssuesControllerPatch)  
end

Redmine::Plugin.register :mandatory_fields_and_status_autochange do
  name 'Mandatory fields and status autochange'
  author 'Ilya Turkin'
  description 'Set mandatory fields for the statuses and status autochange'
  version '0.0.1'
  author_url 'https://github.com/SyntSupport'
end
