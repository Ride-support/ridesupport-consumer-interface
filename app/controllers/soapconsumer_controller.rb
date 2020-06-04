class SoapconsumerController < ApplicationController
  def respuesta
    @soap_request = ZipCode.new("49")
    respond_to do |format|
      format.json { render :json => @soap_request, status: :ok}
      format.html { render :respuesta}
    end
  end
end
