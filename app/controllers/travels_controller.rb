class TravelsController < ApplicationController
  def estimate
  end

  def converter
    @estimate = params[:estimate]
    destiny = params[:destiny]

    @country = Travels::UpdateEstimate.country(destiny)
    @estimate_updated = Travels::UpdateEstimate.convert_estimate(@estimate, @country[:currencies][0][:code])
  end
end
