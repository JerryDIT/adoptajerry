class PagesController < ApplicationController

  def start
    fetch_pages
  end

  def show
    @page = Page.find params[:id]
    fetch_pages
    render :start
  end

  private

  def fetch_pages
    @page_0 = Page.find_by_step "0"
    @page_1 = Page.find_by_step "1"
    @page_2 = Page.find_by_step "2"
    @page_3 = Page.find_by_step "3"
    @page_4a = Page.find_by_step "4a"
    @page_4b = Page.find_by_step "4b"
    @page_4c = Page.find_by_step "4c"
    @page_4d = Page.find_by_step "4d"
    @page_5 = Page.find_by_step "5"
    @page_6 = Page.find_by_step "6"
  end

end
