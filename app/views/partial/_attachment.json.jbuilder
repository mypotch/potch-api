json.set!(key, object.send(key).attached? ? object.send(key).signed_id : '')
json.set!("#{key}_link", object.send(key).attached? ? polymorphic_url(object.send(key)) : '')

