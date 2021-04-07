class LessonsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pagy, @lessons = pagy(current_user.lessons, items: 10)
  end

  def show
    @lesson = Lesson.find_by(id: params[:id])
    if @lesson.nil?
      flash[:danger] = 'erro. not lesson'
      redirect_to root_path
    else
      @category = @lesson.category
      @lesson_words = @lesson.lesson_words
    end
  end

  def new
    @lesson = Lesson.new
    @category = Category.find_by(id: params[:category_id])
    if @category.nil?
      flash[:danger] = 'erro. not category'
      redirect_to root_path
    else
      @words = @category.words.limit(Lesson::WORDS_NUMBER)

      @words.each do |word|
        @lesson.lesson_words.build word_id: word.id
      end
    end
  end

  def create
    @lesson = current_user.lessons.new lesson_params
    point = 0
    @lesson.lesson_words.each do |lesson_word|
          @lesson.result = point
      if lesson_word.word_answer.present? && lesson_word.word_answer.correct?
          point += 1
          @lesson.result = point
        end
    end



    if @lesson.save
      flash[:success] = "lesson created!"
      redirect_to lessons_path
    else
      render 'new'
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit :user_id, :category_id,
      lesson_words_attributes: [:id, :word_id, :word_answer_id]
  end

end
