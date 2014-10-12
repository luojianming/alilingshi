#encoding: utf-8
class AddressesController < ApplicationController
  before_filter :authenticate_user!
  def index
    authorize! :index, @address, :message => 'Not authorized as an administrator.'
    @addresses = Address.all

    respond_to do |format|
      format.html
      format.xml { render :xml => @addresses }
    end
  end
  def show
    authorize! :index, @address, :message => 'Not authorized as an administrator.'
    @address = Address.find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render :xml => @address }
    end
  end

  def new
    authorize! :index, @address, :message => 'Not authorized as an administrator.'
    @address = Address.new

    respond_to do |format|
      format.html
      format.xml { render :xml => @address }
    end
  end

  def edit
    authorize! :index, @address, :message => 'Not authorized as an administrator.'
    @address = Address.find(params[:id])
  end

  def create
    authorize! :index, @address, :message => 'Not authorized as an administrator.'
    @address = Address.new(params[:address])

    respond_to do |format|
      if @address.save
        flash[:notice] = "类别更新成功"
        format.html { redirect_to(@address) }
        format.xml { render :xml => @address, :status => :created, :location => @address }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    authorize! :index, @address, :message => 'Not authorized as an administrator.'
    @address = Address.find(params[:id])

    respond_to do |format|
      if @address.update_attributes(params[:address])
        flash[:notice] = "类别更新成功"
        format.html { redirect_to(@address) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize! :index, @address, :message => 'Not authorized as an administrator.'
    @address = Address.find(params[:id])
    @address.destroy

    respond_to do |format|
      format.html { redirect_to(addresses_url) }
      format.xml { head :ok }
    end
  end 
end
