class UsersController < ApplicationController

  # GET /users/show
  def show
	@user = User.find(params[:id])
  end

  # GET /users/new
  def new
	@user = User.new
  end

  def create
	@user = User.new(user_params)
	if @user.save
		flash[:notice] = 'Cadastro realizado com sucesso!'
		redirect_to @user
	else
	  	render action: :new
	end 
  end

  # GET /users/edit
  def edit
	@user = User.find(params[:id])
  end

  def update
	@user = User.find(params[:id])
	if @user.update(user_params)
		redirect_to @user,
		notice: 'Cadastro realizado com sucesso!'
	else
		reder action: :edit
	end
  end

  #controle de atributos
  private
  def user_params
  	# os "pontos" no final da linha não sao opcionais
	params.require(:user).permit(:full_name, :email, :location, :password, :password_confirmation, :bio)
  end
end
