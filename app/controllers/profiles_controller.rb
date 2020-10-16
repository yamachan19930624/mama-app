class ProfilesController < ApplicationController
  before_action :authenticate_user! #ログインしてないとこれらできない
  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.prepare_profile     
  end

  def update
    @profile = current_user.prepare_profile
    @profile.assign_attributes(profile_params)
    if @profile.save
      redirect_to profile_path, notice: '更新したよ'
    else
      flash.now[:error] = '更新できなかった'
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :nickname,
      :introduction,
      :gender,
      :birthday,
      :subscribed,
      :avatar
    )
  end
end