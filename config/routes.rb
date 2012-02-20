Rails.application.routes.draw do
  
  get "djr" => "djr#djr"
  #match '/djr' => 'djr#djr', :via => :get
    
end