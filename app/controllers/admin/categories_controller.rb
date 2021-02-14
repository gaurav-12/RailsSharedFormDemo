class Admin::CategoriesController < ApplicationController
  layout 'admin'

  # GET admin_categories_path 'admin/categories'
  def index
    @categories = Category.only_categories
  end

  # GET admin_category_path(id) 'admin/categories/id'
  def show
    # If found Category has any value for "category_id" then it is a subcategory, redirect it to its parent's page
    # For situtation when new subcategory is added and redirected to show action
    category = Category.find(params[:id])
    if category.category_id?
      redirect_to [:admin, category.category]
    else
      @subcategories = category.subcategories
    end
  end

  # GET edit_admin_category_path(id) 'admin/categories/id/edit'
  def edit
    @category = Category.find(params[:id])
  end

  # Same as edit but with PATCH
  def update
    @category = Category.find(params[:id])

    path = admin_categories_path
    if @category.category_id
      path = admin_category_path(@category.category_id)
    end

    if @category.update(params[:category].permit(:name))
      redirect_to path
    end
  end

  # GET new_admin_category_path 'admin/categories/new'
  def new
    @category = Category.new
  end
  
  # Same as new but with POST
  def create
    @category = Category.new(params[:category].permit(:name, :category_id))

    if @category.save
      redirect_to [:admin, @category]
    end
  end

  # Same as index but with DELETE
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

  def search
    @categories = Category.where("name LIKE ?", "#{params[:query]}%")
  end
end
