class Admin::CategoriesController < ApplicationController
  layout 'admin'

  def index
    @categories = Category.only_categories
  end

  def show
    # If found Category has any value for "category_id" then it is a subcategory, redirect it to its parent's page
    category = Category.find(params[:id])
    if category.category_id?
      redirect_to [:admin, category.category]
    else
      @subcategories = category.subcategories
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
  end

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category].permit(:name, :category_id))

    if @category.save
      redirect_to [:admin, @category]
    end
  end

  def destroy
    @category = Category.find(params[:id])
    
    path = admin_categories_path
    if @category.category_id
      path = admin_category_path(@category.category_id)
    end

    if @category.destroy
      redirect_to path
    end
  end
end
