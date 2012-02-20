require "djr/version"

module Djr
  
  class DjrController < ApplicationController
    
    def djr
      
      routeSet = Rails.application.routes
      routes = routeSet.routes
      
      js = ""

      js << routes.map { |route| route.defaults[:controller]}.uniq.compact.map { |route|
        route_str = ""
        controller_name = "#{route.camelize.gsub(/\:\:/, '.')}Controller"
        if m = controller_name.match(/\./)
          route_str << "if(!#{m.pre_match}) { var #{m.pre_match} = {}; }; "
        end
        route_str << "#{controller_name} = function(){DJR.call(this);}; #{controller_name}.prototype.routes = {};" 
      }.compact.join
      
      js << routes.map { |route| 
        method = route.conditions[:request_method].present? ? route.conditions[:request_method].source[1..-2] : "GET"
        controller_name = "#{route.defaults[:controller].camelize.gsub(/\:\:/, '.')}Controller"
        " #{controller_name}.prototype.routes['#{route.defaults[:action]}'] = {url: \"#{route.path}\", method: \"#{method}\" };"
      }.compact.join
      
    end
    
  end
  
end
