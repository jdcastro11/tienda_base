# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180516132409) do

  create_table "carritos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombres", limit: 100
    t.string "apellidos", limit: 100
    t.string "identificacion", limit: 50
    t.integer "idtipoidentificacion"
    t.string "razonSocial", limit: 200
    t.string "correo", limit: 100
    t.string "direccion", limit: 100
    t.string "telefonos"
    t.integer "idtipocliente"
    t.integer "idcategoriacliente"
    t.integer "idestado"
    t.integer "idgenero"
    t.boolean "eliminado", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detfacturas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "cant"
    t.decimal "precio", precision: 6, scale: 2
    t.decimal "iva", precision: 4, scale: 2
    t.integer "idestadodetfactura"
    t.bigint "factura_id"
    t.bigint "producto_id"
    t.boolean "eliminado", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["factura_id"], name: "index_detfacturas_on_factura_id"
    t.index ["producto_id"], name: "index_detfacturas_on_producto_id"
  end

  create_table "empleados", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "identificacion", limit: 50
    t.integer "idtipoidentificacion"
    t.string "nombres", limit: 100
    t.string "apellidos", limit: 100
    t.string "telefonos"
    t.string "correo", limit: 100
    t.string "direccion", limit: 100
    t.integer "idgenero"
    t.integer "idcargo"
    t.integer "idarea"
    t.integer "idestadoemp"
    t.boolean "eliminado", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facturas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "numfact", limit: 10
    t.datetime "fecha"
    t.string "direntrega", limit: 200
    t.integer "idestadofactura"
    t.integer "idtipofactura"
    t.bigint "cliente_id"
    t.bigint "empleado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_facturas_on_cliente_id"
    t.index ["empleado_id"], name: "index_facturas_on_empleado_id"
  end

  create_table "options", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "idpadre"
    t.string "opcion", limit: 100
    t.string "url", limit: 200
    t.string "estadoopcion", limit: 1, default: "A"
    t.string "orden", limit: 5
    t.boolean "eshoja"
    t.string "controller", limit: 100
    t.boolean "eliminado", default: false
  end

  create_table "parametros", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "atributo", limit: 50
    t.string "descripcion", limit: 300
    t.string "estadoparametro", limit: 1, default: "A"
    t.boolean "eliminado", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "productos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre", limit: 100
    t.string "descipcion", limit: 300
    t.string "ref", limit: 50
    t.decimal "precio", precision: 6, scale: 2
    t.integer "idtipoproducto"
    t.integer "idcategoriaproducto"
    t.integer "idestadoproducto"
    t.integer "stock", default: 0
    t.string "imagen", limit: 100
    t.boolean "eliminado", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "role_option_operations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "idrol"
    t.integer "idoperacion"
    t.string "estadorolop", limit: 1, default: "A"
    t.boolean "eliminado", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "options_id"
    t.index ["options_id"], name: "index_role_option_operations_on_options_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "usuario", limit: 50
    t.string "password", limit: 50
    t.integer "identidad"
    t.integer "idtipoentidad"
    t.integer "idestadousuario"
    t.integer "idrol"
    t.boolean "eliminado", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "valorparametros", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "valor", limit: 300
    t.string "estadovalorparametro", limit: 1, default: "A"
    t.string "orden", limit: 4
    t.boolean "eliminado", default: false
    t.bigint "parametro_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "idpadre"
    t.index ["parametro_id"], name: "index_valorparametros_on_parametro_id"
  end

  add_foreign_key "facturas", "clientes"
  add_foreign_key "facturas", "empleados"
  add_foreign_key "role_option_operations", "options", column: "options_id"
  add_foreign_key "valorparametros", "parametros"
end
