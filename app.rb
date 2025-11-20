require 'sinatra'
require 'sqlite3'
require 'slim'
require 'sinatra/reloader'





# Routen /
get '/todo' do
    db = SQLite3::Database.new("db/todos.db")

    db.results_as_hash = true




    

    slim(:index)
end


