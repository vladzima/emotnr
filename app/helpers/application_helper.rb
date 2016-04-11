module ApplicationHelper
    def title(page_title)
  content_for(:title) { page_title }
    end
    def meta(meta_title)
  content_for(:meta) { meta_title }
    end
end
