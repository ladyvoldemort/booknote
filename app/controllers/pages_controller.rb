class PagesController < ApplicationController #rendering a view. no return needed.
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to pages_path
    else
      render :new
    end
  end

  private #everything below is only accessible within this file

  def page_params
    params.require(:page).permit(:title, :author, :body)
  end



end
