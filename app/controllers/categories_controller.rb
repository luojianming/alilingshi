#encoding: utf-8
class CategoriesController < ApplicationController
  before_filter :authenticate_user!
  def index
    authorize! :index, @category, :message => 'Not authorized as an administrator.'
    @categories = Category.all

    respond_to do |format|
      format.html
      format.xml { render :xml => @categories }
    end
  end

  def show
    authorize! :index, @category, :message => 'Not authorized as an administrator.'
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render :xml => @categories }
    end
  end

  def new
    authorize! :index, @category, :message => 'Not authorized as an administrator.'
    @category = Category.new

    respond_to do |format|
      format.html
      format.xml { render :xml => @categories }
    end
  end

  def edit
    authorize! :index, @category, :message => 'Not authorized as an administrator.'
    @category = Category.find(params[:id])
  end

  def create
    authorize! :index, @category, :message => 'Not authorized as an administrator.'
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        flash[:notice] = "类别更新成功"
        format.html { redirect_to(@category) }
        format.xml { render :xml => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    authorize! :index, @category, :message => 'Not authorized as an administrator.'
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        flash[:notice] = "类别更新成功"
        format.html { redirect_to(@category) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize! :index, @category, :message => 'Not authorized as an administrator.'
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to(categories_url) }
      format.xml { head :ok }
    end
  end 
end
