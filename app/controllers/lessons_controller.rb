class LessonsController < ApplicationController
    before_action :set_action, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
  
    def index
      @lessons = Lesson.order('created_at DESC')
    end
  
    def new
      @lesson = Lesson.new
    end
  
    def create
      @lesson = Lesson.new(lesson_params)
      if @lesson.save
        redirect_to root_path
      else
        render :new
      end
    end
  
    def show
      @message = Message.new
      @messages = @lesson.messages.includes(:user).order("created_at DESC")
    end
  
    def edit
      redirect_to action: :index unless @lesson.user_id == current_user.id
    end
  
    def update
      if current_user.id == @lesson.user.id
        if @lesson.update(lesson_params)
          redirect_to action: :show
        else
          render :edit
        end
      else
        redirect_to root_path
      end
    end
  
    def destroy
      if current_user.id == @lesson.user.id
        @lesson.destroy
        redirect_to root_path
      end
    end
  
    private
  
    def lesson_params
      params.require(:lesson).permit( :name, :introduction,:delivery,:bring,:recipe,:flow,:eventday, :deadline,:prefecture_id, :capacity_id, :price, :image).merge(user_id: current_user.id)
    end
  
    def set_action
      @lesson = Lesson.find(params[:id])
    end
  

  end
  