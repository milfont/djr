function toMap(object) {
    var arr = [];
    for(var item in object)
        arr[arr.length] = {key: item, value: object[item]};
    return arr;
};

var DJR = function() {
    this.data   = "";
    this.error  = {};
    this.format = ".json";

    this.formatURL = function(url, params) {
        toMap(params).forEach( function(param) {
            url = url.replace((new RegExp(param.key)).source, param.value);
        });
        return url;
    };
    this.callbackDefault = function(data) {
        this.data = data;
    };
    this.errorDefault    = function(error) {
        this.error = error;
    };
    this.ajax = function(object, callback, error, method, url, scope) {
        var self = this;
        var params = [];
        params["\(.:format\)"] = this.format;

        if(method === "")
            method = "GET";

        toMap(object).forEach( function(param) {
            params[":" + param.key] = param.value;
        });
        if(method !== "GET") {
            object = JSON.stringify(object);
            if (object && object.length === 2)
                object = null;
        }
        if(method === "DELETE") object = null;

        jQuery.ajax({
            context     : scope || self,
            data        : object,
            cache       : false,
            dataType    : 'json',
            error       : error,
            success     : callback,
            contentType : "application/json",
            headers     : {"Content-Type":"application/json",  "Accept":"application/json"},
            type        : method,
            url         : this.formatURL(url, params) + "?authenticity_token=" + $("meta[name='csrf-token']").attr("content")
        });
    };
    for (var action in this.routes) {
        this[action] = function(act) {
            return function(object, callback, error, scope) {
                if(typeof object === "function") {
                    callback = object;
                    error = callback;
                    object = {};
                }
                var localCallback     = callback || this.callbackDefault;
                var localErrorHandler = error    || this.errorDefault;
                this.ajax(object,
                          localCallback,
                          localErrorHandler,
                          this.routes[act].method,
                          this.routes[act].url,
                          scope);
                return this;
            }
        }(action);
    }

};