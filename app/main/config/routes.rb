get '/settings', _action: 'settings'

# The main route, this should be last. It will match any params not
# previously matched.
get '/', {}
