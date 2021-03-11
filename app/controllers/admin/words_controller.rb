class Admin::WordsController < Admin::ApplicationController
  def index
    @words = Word.all
  end

  def new
    @word = Word.new
    @categories = Category.all
    @word.word_answers.build
  end

  def create
    @word = Word.new word_params

    if @word.save
      flash[:success] = "word created!"
      redirect_to new_admin_word_path
    else
      word.word_answers || word.word_answers.build
      render :new
    end

  end

  private

  def word_params
    params.require(:word).permit(:content, :category_id, word_answers_attributes: [:id, :content, :correct, :_destroy])

  end
end
