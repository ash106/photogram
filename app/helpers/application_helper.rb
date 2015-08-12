module ApplicationHelper
  def alert_for(flash_type)  
    { success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end  

  def form_image_select(post)
    if post.image.exists?
      image_tag post.image.url(:medium), id: 'image-preview', class: 'img-responsive'
    else
      image_tag 'placeholder.jpg', id: 'image-preview', class: 'img-responsive'
    end
  end

  def current_location?(*args)
    options = args.extract_options!
    options.each do |key, val|
        return false unless eval("controller.#{key.to_s}_name") == val
    end
    true
  end

  def background_image
    return "login-bg" if current_location?(controller: "sessions", action: "new")
    return "registration-bg" if current_location?(controller: "registrations", action: "new") || current_location?(controller: "registrations", action: "create")
  end
end
