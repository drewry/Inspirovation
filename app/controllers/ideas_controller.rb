class IdeasController < ApplicationController
  # GET /ideas
  # GET /ideas.xml
  def index
    @ideas = Idea.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ideas }
    end
  end
  
  # update view when page is loaded
  def update_view (idea_id)
    # check to only update view once a day
    view = View.where(:user_id => current_user.id, :idea_id => idea_id).last
        
    go = false
    
    if view
      created_at = view.created_at
      time = Time.now
      difference = time - created_at
      
      if difference > 86400
        go = true
      end
    else
      go = true
    end    
    
    if go == true
      view = View.new
      view.idea_id = idea_id
      view.user_id = current_user.id
      view.save 
    end
    
  end

  # GET /ideas/1
  # GET /ideas/1.xml
  def show
    @idea = Idea.find(params[:id])
    update_view(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @idea }
    end
  end

  # GET /ideas/new
  # GET /ideas/new.xml
  def new
    @idea = Idea.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @idea }
    end
  end

  # GET /ideas/1/edit
  def edit
    @idea = Idea.find(params[:id])
  end

  # POST /ideas
  # POST /ideas.xml
  def create
    @idea = Idea.new(params[:idea])
    @idea.user_id = current_user.id

    respond_to do |format|
      if @idea.save
        format.html { redirect_to(@idea, :notice => 'Idea was successfully created.') }
        format.xml  { render :xml => @idea, :status => :created, :location => @idea }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @idea.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ideas/1
  # PUT /ideas/1.xml
  def update
    @idea = Idea.find(params[:id])

    respond_to do |format|
      if @idea.update_attributes(params[:idea])
        format.html { redirect_to(@idea, :notice => 'Idea was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @idea.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.xml
  def destroy
    @idea = Idea.find(params[:id])
    
    #kill everything else like subideas and maps
    subideas = Subidea.where(:idea_id => @idea.id)
    subideas.each do |si|
      si.map.destroy
      si.destroy
    end
    
    @idea.destroy  

    respond_to do |format|
      format.html { redirect_to(ideas_url) }
      format.xml  { head :ok }
    end
  end
end
