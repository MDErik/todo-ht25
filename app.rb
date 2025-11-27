require 'sinatra'
require 'sqlite3'
require 'slim'
require 'sinatra/reloader'





# Routen /
get '/todo' do
    @db = SQLite3::Database.new("todos.db")
    @db.results_as_hash = true

    @todos = @db.execute("SELECT * FROM todos WHERE done = 0")
    @done = @db.execute("SELELCT * FROM todos WHERE done = 1")

    
    slim(:index)
end

post '/todo' do
    title = params[:title]
    description = params[:description]
    category = params[:category]

    @db.execute(
        "INSERT INTO todos (title, description, category) VALUES (?, ?, ?)",[title, description, category]
    )

end

post "/todo/:id/toggle" do 
    id = params[:id]
    
    todo = @db.execute("SELECT done FROM todos WHERE id = ?", [id]).first
    new_value = todo["done"] == 1 ? 0 : 1


end

