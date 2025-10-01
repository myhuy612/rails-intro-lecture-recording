class PagesController < ApplicationController
  def about
  end

  def contact
    @members = ["claire", "john", "anna"]

    search = params[:member]
    
    if search
      @members = @members.select do |member|
        member == search.downcase
      end
    end
  end
end
