class Public::SearchsController < ApplicationController
def search
  @range = params[:range]
	search = params[:search]
	word = params[:word]
	if
		@product = Product.search(search,word)
	else
		@user = User.search(search,word)
	end
end

end
