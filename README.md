## DJR

DJR (Direct jQuery Remoting) will generate the JavaScript code from Rails Controllers to allow browsers to securely call into Ruby code almost as if it was running locally

## Getting started

Add it to your Gemfile with:

```ruby
gem 'djr'
```

Run the bundle command to install it.

Configure assets in app/assets/application.js file:

```javascript
//= require jquery
//= require djr
//= require_tree .
```

Import script in your pages:

```html
<script type="text/javascript" charset="utf-8" src="/djr"></script>
```

In javascript, call your Controller like:

```javascript
productsController = new ProductsController

productsController.save({
	name: "IPhone 4s",
	value: "500.00"
}, callbackFunction);
```

Your controller should be something like that:

```ruby
class ProductsController < ApplicationController
    
    respond_to :html, :json
    
    def index
        @products = Product.find params[:id] 
        respond_with @products
    end
    
end
```


## Conventions

```javascript
controller.action( dataAsJson, callbackFunction, errorHandler );
```

## License

MIT License. Copyright (c) 2012 Milfont Consulting. http://milfont.org
