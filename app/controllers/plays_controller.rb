class PlaysController < ApplicationController
before_action :find_play, only:[:show,:edit,:update,:destroy]
before_action :authenticate_user!,only:[:new,:edit] 

	def index
    if params[:category].blank?
     @plays = Play.all
     else 
     @category_id = Category.find_by(name: params[:category]).id
     @plays = Play.where(:category_id => @category_id)
   end 
	end 


	def new       
     @play = current_user.plays.build  
     # @play = Play.new  
     @categories = Category.all.map{|c| [c.name,c.id]}
	end 



	 def show  
    
   end 


    def edit 
     @categories = Category.all.map{|c| [c.name,c.id]}
    end 
    

    def update 
      @play.category_id = params[:category_id] 
    	if @play.update(play_params)
    	redirect_to play_path(@play)
    	else 
    	render 'edit'
    	end 	
    end 


    def destroy 
      @play.destroy
      redirect_to root_path 
    end 	

   def create
   @play = current_user.plays.build(play_params)   
   @play.category_id = params[:category_id]
     if @play.save 
       redirect_to root_path
   else
   	render 'new' 
     end 	
   end  


 private 
 def play_params    
   params.require(:play).permit(:title,:description,:director,:category_id,:play_img,:videourl)

 end 

 def find_play
  @play = Play.find(params[:id]) 
 end 

end

