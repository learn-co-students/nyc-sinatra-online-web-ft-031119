class FiguresController < ApplicationController

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  post '/figures' do
    if !params[:title].empty?
      @title = Title.create(params[:title])
    end
    if !params[:landmark].empty?
      @landmark = Landmark.create(params[:landmark])
    end
    @figure = Figure.create(params[:figure])
    @figure.landmarks << @landmark
    @figure.titles << @title
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    if !params[:title].empty?
      @title = Title.create(params[:title])
    end
    if !params[:landmark].empty?
      @landmark = Landmark.create(params[:landmark])
    end
    @figure.titles << @title
    @figure.landmarks << @landmark
    @figure.save
    redirect "/figures/#{@figure.id}"
  end


end
