class UsersController < ApplicationController

  before_filter :find_user, except: [:index, :new, :create]
  before_filter :authorize_user, except: [:new, :create]

  def find_user
    @user = User.find_by_id(session[:user_id])
  end

  def authorize_user
    logger.info "## authorize_user called. ##"
    logger.info "session[:user_id] = #{session[:user_id]}"
    logger.info "session[:user_id].class = #{session[:user_id].class}"
    logger.info "params[:user_id] = #{params[:id]}"
    logger.info "params[:user_id].class = #{params[:id].class}"
    logger.info "session[:user_id].blank? = #{session[:user_id].blank?}"
    logger.info "current_user = #{current_user.id}" if current_user

    if ! logged_in? || current_user.id.to_s != params[:id]
    # if session[:user_id].blank? || session[:user_id].to_s != params[:id]
      redirect_to root_url, notice: "Incorrect username or password."
    end
  end


  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    # @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    # @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    # @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
