class PledgesController < ApplicationController

  before_action :set_project

  def index
    @pledges = @project.pledges
  end

  def new
    @pledge = @project.pledges.new
  end

  def create
    @pledge = @project.pledges.new(pledge_params)
    if @pledge.save
      redirect_to project_pledges_path(@project), notice: "Thank you for your pledge!"
    else
      render :new
    end
  end

private

  def pledge_params
    params.required(:pledge).permit(:name, :email, :amount, :comment)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

end
