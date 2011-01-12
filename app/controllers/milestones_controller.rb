class MilestonesController < ApplicationController
  # GET /milestones
  # GET /milestones.xml
  def index
    @milestones = Milestone.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @milestones }
    end
  end

  # GET /milestones/1
  # GET /milestones/1.xml
  def show
    @milestone = Milestone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @milestone }
    end
  end

  # GET /milestones/new
  # GET /milestones/new.xml
  def new
    @milestone = Milestone.new
    @idea = Idea.find(params[:idea_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @milestone }
    end
  end

  # GET /milestones/1/edit
  def edit
    @milestone = Milestone.find(params[:id])
    @idea = Idea.find(params[:idea_id])
  end

  # POST /milestones
  # POST /milestones.xml
  def create
    @milestone = Milestone.new(params[:milestone])

    respond_to do |format|
      if @milestone.save
        format.html { redirect_to(idea_path(@milestone.idea.id), :notice => 'Milestone was successfully created.') }
        format.xml  { render :xml => @milestone, :status => :created, :location => @milestone }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @milestone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /milestones/1
  # PUT /milestones/1.xml
  def update
    @milestone = Milestone.find(params[:id])

    respond_to do |format|
      if @milestone.update_attributes(params[:milestone])
        format.html { redirect_to(idea_path(@milestone.idea.id), :notice => 'Milestone was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @milestone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /milestones/1
  # DELETE /milestones/1.xml
  def destroy
    @milestone = Milestone.find(params[:id])
    idea_id = @milestone.idea.id
    @milestone.destroy

    respond_to do |format|
      format.html { redirect_to(idea_path(idea_id)) }
      format.xml  { head :ok }
    end
  end
end
