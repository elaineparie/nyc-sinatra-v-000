class FiguresController < ApplicationController

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  get '/figures' do
    @figures = Figure.all
   erb :'figures/index'
   end


  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
    @figure.titles << Title.create(:name => params["title"]["name"])
    @figure.save
  end
    if !params[:landmark][:name].empty?
    @figure.landmarks << Landmark.create(:name => params["landmark"]["name"])
  end
    erb :'figures/show'
  end

  get '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    erb :'/figures/show'
  end

get '/figures/:id/edit' do
  @figure = Figure.find(params[:id])
  @titles = Title.all
  @landmarks = Landmark.all
  erb :'/figures/edit'
end

post '/figures/:id' do
  @figure = Figure.find(params[:id])
  @figure.update(params[:figure])
  @figure.save
  if !params[:title][:name].empty?
  @figure.titles << Title.create(:name => params["title"]["name"])
  @figure.save
end
  if !params[:landmark][:name].empty?
  @figure.landmarks << Landmark.create(:name => params["landmark"]["name"])
end
  redirect to "/figures/#{@figure.id}"
end



end
