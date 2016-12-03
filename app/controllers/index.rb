get '/' do
  erb :index
end

# Manda a la vista de create
get "/create" do 
  erb :create
end 


get "/show" do 
  
end 


get "/update" do 


end 


get "/delete" do 

end  


#ESTE METODO AUN NO SIRVE :( ME MARCA UN ERROR EN TAGS CREATE
post "/create" do 
  "=" * 50
  "ESTOY EN EL METODO POST"
  "=" * 50
  @title = params[:title]
  @body = params[:body]
  @tags = params[:name]
  Post.create(title: @title, body: @body)
  Tags.create(name: @tags)
 
end
