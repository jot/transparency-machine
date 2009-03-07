class MinutesDocsController < ApplicationController
  # GET /minutes_docs
  # GET /minutes_docs.xml
  def index
    @minutes_docs = MinutesDoc.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @minutes_docs }
    end
  end

  # GET /minutes_docs/1
  # GET /minutes_docs/1.xml
  def show
    @minutes_doc = MinutesDoc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @minutes_doc }
    end
  end

  # GET /minutes_docs/new
  # GET /minutes_docs/new.xml
  def new
    @minutes_doc = MinutesDoc.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @minutes_doc }
    end
  end

  # GET /minutes_docs/1/edit
  def edit
    @minutes_doc = MinutesDoc.find(params[:id])
  end

  # POST /minutes_docs
  # POST /minutes_docs.xml
  def create
    @minutes_doc = MinutesDoc.new(params[:minutes_doc])

    respond_to do |format|
      if @minutes_doc.save
        flash[:notice] = 'MinutesDoc was successfully created.'
        format.html { redirect_to(@minutes_doc) }
        format.xml  { render :xml => @minutes_doc, :status => :created, :location => @minutes_doc }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @minutes_doc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /minutes_docs/1
  # PUT /minutes_docs/1.xml
  def update
    @minutes_doc = MinutesDoc.find(params[:id])

    respond_to do |format|
      if @minutes_doc.update_attributes(params[:minutes_doc])
        flash[:notice] = 'MinutesDoc was successfully updated.'
        format.html { redirect_to(@minutes_doc) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @minutes_doc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /minutes_docs/1
  # DELETE /minutes_docs/1.xml
  def destroy
    @minutes_doc = MinutesDoc.find(params[:id])
    @minutes_doc.destroy

    respond_to do |format|
      format.html { redirect_to(minutes_docs_url) }
      format.xml  { head :ok }
    end
  end
end
