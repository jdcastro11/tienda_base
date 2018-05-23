Rails.application.routes.draw do
  get 'inicio/index'

  get 'inicio/noacceso'

  get 'seguridad/login'
  post '/auth', to:'seguridad#autenticar'
  get '/login', to:'seguridad#login'
  get '/inicio', to:'inicio#index'
  get '/admin', to:'inicio#admin'
  get '/noacceso', to:'inicio#noacceso'
  get '/logout', to:'seguridad#logout'
  resources :parametros
  resources :valorparametros
  resources :users
  resources :clientes
  get 'prueba/index'

  get '/valp/:id', to: "valorparametros#index"
  get '/valp/:id/new', to:'valorparametros#new'
  post '/productos/agregar', to:'productos#agregarCarrito' 
  get '/productos/mostrar', to:'productos#mostrarCarrito'
  get '/productos/eliminar', to:'productos#eliminarDelCarrito'
  get '/productos/listar', to:'productos#listar'
  resources :productos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
