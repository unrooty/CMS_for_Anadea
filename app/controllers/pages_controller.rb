class PagesController < ApplicationController
  before_action :find_page, only: %i[show edit update destroy]
  # Doesn't work... Don't know why.
  # after_action :paginate_pages, only: %i[index published_pages unpublished_pages]

  def index
    @pages = @all
    paginate_pages
  end

  def published_pages
    @pages = @published_pages
    paginate_pages
  end

  def unpublished_pages
    @pages = @unpublished_pages
    paginate_pages
  end

  def show; end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to @page, notice: 'Page successfully created!'
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @page.update(page_params)
      redirect_to @page, notice: 'Page successfully updated!'
    else
      render 'edit'
    end
  end

  def destroy
    if @page.destroy
      redirect_to pages_path, notice: 'Page deleted!'
    else
      redirect_to pages_path,
                  notice: "Problems with server. Page wasn't deleted."
    end
  end

  def paginate_pages
    @pages = @pages.paginate(page: params[:page], per_page: 5)
  end

  private

  def find_page
    @page = Page.friendly.find(params[:id])
    @page ? @page : (redirect_to pages_path, notice: 'Page not found!')
  end

  def page_params
    params.require(:page).permit(:title, :description, :slug,
                                 :menu_label, :h1, :content,
                                 :published_at, :priority)
  end
end
