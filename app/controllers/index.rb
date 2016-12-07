enable :sessions

get '/' do
  session.clear
  erb :index
end

# Manda a la vista de create
get "/create" do 
  erb :create
end 

#Muestra todos los posts 
get "/show" do 
  session.clear
  @all_post = Post.all
  erb :show
end 

#Muestra el post seleccionado por el usuario
get "/show_post/:post_id" do
  post_id = params[:post_id]
  @show_post = Post.find(post_id)
  erb :showpost
end  


#muestra el post seleccionado por el usuario para editar
get "/update/:post_id" do 
  post_id = params[:post_id]
  @show_post = Post.find(post_id)
  erb :update
end 


get "/search" do 
  erb :search
end  

get "/found/:title" do 
   @all_post = Post.where(title: params[:title])
end  

#Elimina permanentemente un registro en la base de datos
get "/delete/:post_id" do
  post = Post.find(params[:post_id])
  post.destroy
  #session[:message] = "Has borrado tu post exitosamente" AUN NO FUNCIONA
  redirect to "/" 
 end 


#Este metodo crea un post
post "/create" do 
  @title = params[:title]
  @body = params[:body]
  @tags = params[:tags]
  post = Post.create(title: @title, body: @body)
  verify_tag = Tag.find_by(name: @tags)
  #Se crea el tag nuevo solo si no existe en la base
  if verify_tag == nil  
    tag = Tag.create(name: @tags) 
    PostTag.create(post_id: post.id, tag_id: tag.id) 
  else 
    PostTag.create(post_id: post.id, tag_id: verify_tag.id) 
  end   
  redirect to "/"
end

#Metodo que guarda los cambios a un post en la base de datos
post '/update/:post_id' do
  post_id = params[:post_id]
  @show_post = Post.find(post_id)
  @title = params[:post_title]
  @body = params[:body]
  @show_post.update_attributes(title: @title, body: @body)
  redirect to "/show"
end



#Encuentra el post solicitado por el usuario
post '/find' do 
  title_to_find = params[:post_title]
  tag_to_find = params[:post_tags] 
  if title_to_find
    @all_post = Post.where(title: title_to_find)
    erb :show
  end 
  if tag_to_find 
    tag = Tag.find_by(name: tag_to_find)
    posts = PostTag.where(tag_id: tag.id)
    @all_post = []  
      posts.each do |post|
        @all_post <<  Post.find(post.post_id)
      end 
  end  
  @all_post  
  erb :show 
end   
