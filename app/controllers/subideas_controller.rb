class SubideasController < ApplicationController
  # GET /subideas
  # GET /subideas.xml
  def index
    @subideas = Subidea.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subideas }
    end
  end

  # GET /subideas/1
  # GET /subideas/1.xml
  def show
    @subidea = Subidea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @subidea }
    end
  end

  # GET /subideas/new
  # GET /subideas/new.xml
  def new
    @subidea = Subidea.new

    # parse the extra data
    p = params[:extra]
            
    @idea_id = p[4,255]
    @ico_type = p[0,1]
    @cellw = p[1,2]
    @cellh = p[2,3]
    @dir = p[3,4]
    @p = p
    
    @idea = Idea.find(@idea_id)
    
    @parent_id = params[:parent_id]
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subidea }
    end
  end

  # GET /subideas/1/edit
  def edit
    @subidea = Subidea.find(params[:id])
    @idea = @subidea.idea
    @parent_id = @subidea.parent_id
  end

  # POST /subideas
  # POST /subideas.xml
  def create
    @subidea = Subidea.new(params[:subidea])

    respond_to do |format|
      if @subidea.save
        
        # create map for idea
        map = Map.new
        map.cellw = params[:cellw]
        map.cellh = params[:cellh]
        map.dir = params[:dir]
        map.ico_type = params[:ico_type]
        map.subidea_id = @subidea.id
        map.save
        
        format.html { redirect_to(@subidea, :notice => 'Subidea was successfully created.') }
        format.xml  { render :xml => @subidea, :status => :created, :location => @subidea }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subidea.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /subideas/1
  # PUT /subideas/1.xml
  def update
    @subidea = Subidea.find(params[:id])

    respond_to do |format|
      if @subidea.update_attributes(params[:subidea])
        format.html { redirect_to(@subidea, :notice => 'Subidea was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subidea.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subideas/1
  # DELETE /subideas/1.xml
  def destroy
    @subidea = Subidea.find(params[:id])    
    @subidea.map.destroy 
    
    # kill all the sub subideas
    ssi = Subidea.where(:parent_id => @subidea.id)  
    ssi.each do |si|
      si.map.destroy
      si.destroy
    end
    
    @subidea.destroy

    respond_to do |format|
      format.html { redirect_to(idea_url(@subidea.idea)) }
      format.xml  { head :ok }
    end
  end
end
