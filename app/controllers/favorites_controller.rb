class FavoritesController < ApplicationController
  # GET /favorites
  # GET /favorites.xml
  def index
    @favorites = Favorite.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @favorites }
    end
  end

  # GET /favorites/1
  # GET /favorites/1.xml
  def show
    @favorite = Favorite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @favorite }
    end
  end

  # GET /favorites/new
  # GET /favorites/new.xml
  def new
    @favorite = Favorite.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @favorite }
    end
  end

  # GET /favorites/1/edit
  def edit
    @favorite = Favorite.find(params[:id])
  end

  # POST /favorites
  # POST /favorites.xml
  def create
    @favorite = Favorite.new(params[:favorite])

    respond_to do |format|
      if @favorite.save
        format.html { redirect_to(@favorite, :notice => 'Favorite was successfully created.') }
        format.xml  { render :xml => @favorite, :status => :created, :location => @favorite }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @favorite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /favorites/1
  # PUT /favorites/1.xml
  def update
    @favorite = Favorite.find(params[:id])

    respond_to do |format|
      if @favorite.update_attributes(params[:favorite])
        format.html { redirect_to(@favorite, :notice => 'Favorite was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @favorite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1
  # DELETE /favorites/1.xml
  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy

    respond_to do |format|
      format.html { redirect_to(favorites_url) }
      format.xml  { head :ok }
    end
  end
  
  # add it to my favorites
  def add_my_favorite
    favorites = Favorite.where(:idea_id => params[:idea_id], :user_id => current_user.id)
    
    # check if favorite exists
    if favorites.count > 0
    else
      f = Favorite.new
      f.user_id = current_user.id
      f.idea_id = params[:idea_id]
      f.save
    end
    
    respond_to do |format|
      format.html { redirect_to(idea_path(params[:idea_id])) }
    end
    
  end
end
