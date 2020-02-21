class FacebookService
  def self.fetch_data(access_token, &block)
    facebook = Koala::Facebook::API.new(access_token)
    facebook.get_object("me?fields=name,first_name,last_name,email,picture.width(160).height(160)") { |data| block.call(data) }
  end
end