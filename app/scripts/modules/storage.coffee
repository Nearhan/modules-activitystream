define [
    '',
], () ->
    
    class Storage
        expDelim: "; expires="

        constructor: () ->
            console.log('AS Storage up...')
        #
        # Adds expiration param to localStorage
        #
        set: (key, val, expires) ->
            expDate = new Date()
            expires = parseInt(expires, 10) or 1000
            expDate.setTime expDate.getTime() + (expires*24*60*60*1000)
            localStorage.setItem key, "#{ val }#{ @expDelim }#{ expDate.getTime() }"

        get: (key) ->
            item = localStorage[key]
            return item if item is undefined
            item = item.split @expDelim
            val = item[0]
            exp = if item[1] then parseInt(item[1], 10) else 0
            now = new Date()
            isExpired = now.getTime() > exp
            if isExpired
                @remove key
                return undefined
            else
                return val

        remove: (key) ->
            localStorage.removeItem key

    return new Storage()