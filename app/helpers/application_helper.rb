module ApplicationHelper

  def profile_image(user, options = {size: 200})
    email_address = user.email.downcase
    size = options[:size]
    hash = Digest::MD5.hexdigest(email_address)
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block mt-3")
  end
end
