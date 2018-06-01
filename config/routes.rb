Rails.application.routes.draw do
  
  root to: "inicio#index"
  get 'inicio', to: "inicio#index"
  get 'inicio/noacceso'

  get 'seguridad/login'
  post '/auth', to:'seguridad#autenticar'
  get '/login', to:'seguridad#login'
  get '/inicio', to:'inicio#index'
  get '/admin', to:'admin#admin'
  get '/noacceso', to:'inicio#noacceso'
  get '/logout', to:'seguridad#logout'
  resources :parametros
  resources :valorparametros
  post '/users/traer', to:'users#traer'
  resources :users

  resources :clientes
  get 'prueba/index'
  get  '/productos1', to:'productos#index'
  get '/valp/:id', to: "valorparametros#index"
  get '/valp/:id/new', to:'valorparametros#new'
  post '/agregarCarrito', to:'productos#agregarCarrito' 
  get '/mostrarCarrito', to:'productos#mostrarCarrito'
  get '/eliminarCarrito', to:'productos#eliminarDelCarrito'
  get '/listarProductos', to:'productos#listar'
  resources :productos
  resources :empleados
  resources :role_option_operations
  resources :options
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
