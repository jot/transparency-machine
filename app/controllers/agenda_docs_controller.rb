class AgendaDocsController < ApplicationController
  # GET /agenda_docs
  # GET /agenda_docs.xml
  def index
    @agenda_docs = AgendaDoc.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @agenda_docs }
    end
  end

	def search

		@query, @page = params[:q], (params[:page] or 1)	
		#@products = Product.paginate_search params[:q], :page => @page, :per_page => 5
		#@products = Product.find_by_contents(params[:q])
		
		#@search = Search.new params[:q], params[:page]
    @agenda_docs = AgendaDoc.find_with_ferret(params[:q], :page => @page, :per_page => 2)		
		
	end

  # GET /agenda_docs/1
  # GET /agenda_docs/1.xml
  def show
    @agenda_doc = AgendaDoc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @agenda_doc }
    end
  end

  # GET /agenda_docs/new
  # GET /agenda_docs/new.xml
  def new
    @agenda_doc = AgendaDoc.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @agenda_doc }
    end
  end

  # GET /agenda_docs/1/edit
  def edit
    @agenda_doc = AgendaDoc.find(params[:id])
  end

  # POST /agenda_docs
  # POST /agenda_docs.xml
  def create
    @agenda_doc = AgendaDoc.new(params[:agenda_doc])

    respond_to do |format|
      if @agenda_doc.save
        flash[:notice] = 'AgendaDoc was successfully created.'
        format.html { redirect_to(@agenda_doc) }
        format.xml  { render :xml => @agenda_doc, :status => :created, :location => @agenda_doc }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @agenda_doc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /agenda_docs/1
  # PUT /agenda_docs/1.xml
  def update
    @agenda_doc = AgendaDoc.find(params[:id])

    respond_to do |format|
      if @agenda_doc.update_attributes(params[:agenda_doc])
        flash[:notice] = 'AgendaDoc was successfully updated.'
        format.html { redirect_to(@agenda_doc) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @agenda_doc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /agenda_docs/1
  # DELETE /agenda_docs/1.xml
  def destroy
    @agenda_doc = AgendaDoc.find(params[:id])
    @agenda_doc.destroy

    respond_to do |format|
      format.html { redirect_to(agenda_docs_url) }
      format.xml  { head :ok }
    end
  end
end
