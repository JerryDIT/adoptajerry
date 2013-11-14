class OrgansController < ApplicationController
  
  http_basic_authenticate_with name: "emak", password: "jerry", only: :destroy

  def create
    @jerry = Jerry.find(params[:jerry_id])
    @organ = @jerry.organs.create(params[:organ].permit(:role, :quantifier, :unit, :quantity, :technology))
    redirect_to jerry_path(@jerry)
  end
  def destroy
    @jerry = Jerry.find(params[:jerry_id])
    @organ = @jerry.organs.find(params[:id])
    @organ.destroy
    redirect_to jerry_path(@jerry)
  end
end
