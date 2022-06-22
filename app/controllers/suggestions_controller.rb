class SuggestionsController < ApplicationController

    def new
        @suggestion = Suggestion.new
    end

    def create
        @suggestion = Suggestion.new(suggestion_params)
        @suggestion.user_id = current_user.id
        if @suggestion.save
            redirect_to root_path
        else
            render 'new'
        end
    end

    private
    
    def suggestion_params
        params.require(:suggestion).permit(:body)
    end

end