class RatingsController < ApplicationController
  # GET /ratings
  # GET /ratings.xml
  def index
    @ratings = Rating.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ratings }
    end
  end

  # GET /ratings/1
  # GET /ratings/1.xml
  def show
    @rating = Rating.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rating }
    end
  end

  # GET /ratings/new
  # GET /ratings/new.xml
  def new
    @rating = Rating.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rating }
    end
  end

  # GET /ratings/1/edit
  def edit
    @rating = Rating.find(params[:id])
  end

  # POST /ratings
  # POST /ratings.xml
  def create
    @rating = Rating.new(params[:rating])

    respond_to do |format|
      if @rating.save
        format.html { redirect_to(@rating, :notice => 'Rating was successfully created.') }
        format.xml  { render :xml => @rating, :status => :created, :location => @rating }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rating.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ratings/1
  # PUT /ratings/1.xml
  def update
    @rating = Rating.find(params[:id])

    respond_to do |format|
      if @rating.update_attributes(params[:rating])
        format.html { redirect_to(@rating, :notice => 'Rating was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rating.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.xml
  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy

    respond_to do |format|
      format.html { redirect_to(ratings_url) }
      format.xml  { head :ok }
    end
  end
  
  def vote (idea_id,rating_type)
    # check to see if user already rated
    check = Rating.where(:idea_id => idea_id, :user_id => current_user.id) 
        
    error = false
    
    if check.count > 0
      error = true
    end  
    
    # check to see if its the same user
    if Idea.find(idea_id).user.id == current_user.id
      error = true
    end
    
    if error == false
      @rating = Rating.new
      @rating.idea_id = params[:idea_id]
      @rating.user_id = current_user.id
      @rating.rating_type = rating_type
      @rating.save
    end 
  end
  
  # vote up
  def voteup 
    vote(params[:idea_id],1)
        
    respond_to do |format|
      format.html { redirect_to(idea_path(params[:idea_id])) }
    end
  end
  
  # vote down
  def votedown
    vote(params[:idea_id],2)
        
    respond_to do |format|
      format.html { redirect_to(idea_path(params[:idea_id])) }
    end
  end
  
end
