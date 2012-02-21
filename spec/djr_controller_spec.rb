# encoding: UTF-8
#require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'spec_helper'

describe DjrController, :type => :controller do
  
  context "When simple Controller" do
    
    before do
      routes = Rails.application.routes
      routes.disable_clear_and_finalize = true
      routes.clear!
      Rails.application.routes_reloader.paths.each { |path| load(path) }
      routes.draw do
        match "/products" => "products#index"
      end
      routes.disable_clear_and_finalize = false
      routes.finalize!

      @generated_javascript = ";DjrController = function(){DJR.call(this);}; DjrController.prototype.routes = {};ProductsController = function(){DJR.call(this);}; ProductsController.prototype.routes = {}; DjrController.prototype.routes['djr'] = {url: \"/djr(.:format)\", method: \"GET\" }; ProductsController.prototype.routes['index'] = {url: \"/products(.:format)\", method: \"GET\" };"
    end

    describe "#djr" do

      it "Generate js" do
        get :djr
        response.body.should ==  @generated_javascript
      end

    end
    
  end
  
  
  context "When Controller has module" do
    
    before do
      routes = Rails.application.routes
      routes.disable_clear_and_finalize = true
      routes.clear!
      Rails.application.routes_reloader.paths.each { |path| load(path) }
      routes.draw do
        match "/users(.:format)" => "devise/registrations#destroy", :via => :DELETE
      end
      routes.disable_clear_and_finalize = false
      routes.finalize!

      @generated_javascript = ";DjrController = function(){DJR.call(this);}; DjrController.prototype.routes = {};if(!Devise) { var Devise = {}; }; Devise.RegistrationsController = function(){DJR.call(this);}; Devise.RegistrationsController.prototype.routes = {}; DjrController.prototype.routes['djr'] = {url: \"/djr(.:format)\", method: \"GET\" }; Devise.RegistrationsController.prototype.routes['destroy'] = {url: \"/users(.:format)\", method: \"DELETE\" };"
    end
    
    describe "#djr" do

      it "Generate js" do
        get :djr
        response.body.should ==  @generated_javascript
      end

    end
    
  end

end