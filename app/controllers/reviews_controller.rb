class ReviewsController < ApplicationController
before_action :find_review, only:[:edit,:update,:destroy] 
before_action :authenticate_user!,only:[:new,:edit]  



 def new 
 # First finding the play on which we want to review 	
 @play = Play.find(params[:play_id])   
 @review = Review.new 
 end 

 def create
 @play = Play.find(params[:play_id])	
 @review = Review.new(review_params)
 @review.play_id = @play.id  
 @review.user_id = current_user.id 

  if @review.save 
  	redirect_to play_path(@play)
  else  
    render 'new'	
  end 
 end 


 def edit
 end 
 

 def update  
   if @review.update(review_params) 
    redirect_to play_path(@play)
  else 
    render 'edit' 
   end
 end 



 def destroy 
   @review.destroy
   redirect_to play_path(@play)  
 end 


private 

def review_params
  params.require(:review).permit(:rating,:comment)
end 	

def find_review
  @play = Play.find(params[:play_id]) if params[:play_id]
  @review = Review.find(params[:id]) 
end    


end
