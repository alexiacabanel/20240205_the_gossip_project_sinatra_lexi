require 'gossip'

class ApplicationController < Sinatra::Base
    get '/' do
        erb :index, locals: {gossips: Gossip.all}
  end
  
  post '/gossips/new/' do
    puts "Salut, je suis dans le serveur"
    puts "Ceci est le contenu du hash params : #{params}"
    puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
    puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
    puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/new/' do 
    erb :new_gossip
  end

  get '/gossips/:id' do
    erb :show, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
  end

  get '/gossips/:id/edit' do
    erb :edit, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
  end

  post '/gossips/edit/' do
    Gossip.update(params['id'].to_i,params["gossip_author"], params["gossip_content"])
    redirect '/'
  end

end