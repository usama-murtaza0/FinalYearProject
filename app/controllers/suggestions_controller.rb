class SuggestionsController < ApplicationController

    def new
        @suggestion = Suggestion.new
    end

    def create
        @suggestion = Suggestion.create(body: params.require(:body))
        flash[:notice] = "Your suggestion was submitted successfully!"
        redirect_to root_path
    end
end