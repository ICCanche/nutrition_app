class FacebookService
  def self.fetch_data(access_token, &block)
    facebook = Koala::Facebook::API.new(access_token)
    facebook.get_object("me?fields=name,first_name,last_name,email") {|data| block.call(data)}
  end
end