
c = get_config() 

c.ServerApp.allow_origin = '*'
c.ServerApp.allow_remote_access = True
c.ServerApp.allow_root = True
c.ServerApp.token = ""
c.ServerApp.ip = '0.0.0.0'
c.ServerApp.port = 8888 # default port
