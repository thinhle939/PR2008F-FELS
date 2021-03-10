class Admin::CategoriesController  < Admin::ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Category created!"
      redirect_to new_admin_word_path
    end
  end

  private

  def category_params
    params[:category].permit(:name)
  end

end
