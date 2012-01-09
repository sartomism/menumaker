# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110912161720) do

  create_table "etiquetaings", :force => true do |t|
    t.integer  "usuario"
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "etiquetarecetas", :force => true do |t|
    t.integer  "etiqueta"
    t.integer  "receta"
    t.integer  "usuario"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "etiquetas", :force => true do |t|
    t.integer  "usuario"
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredientes", :force => true do |t|
    t.string   "nombre"
    t.integer  "unidadmedia"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "usuario"
    t.integer  "tipo"
  end

  create_table "ingredientesrecetas", :force => true do |t|
    t.integer  "receta"
    t.integer  "ingrediente"
    t.float    "cantidad"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "packs", :force => true do |t|
    t.integer  "ingrediente"
    t.float    "cantidad"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "platorecetas", :force => true do |t|
    t.integer  "receta"
    t.integer  "plato"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "platos", :force => true do |t|
    t.integer  "usuario"
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recetas", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "usuario"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "unidadmedidaingredientes", :force => true do |t|
    t.integer  "ingrediente"
    t.integer  "unidadmedida"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unidadmedidas", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "usuario"
  end

end
