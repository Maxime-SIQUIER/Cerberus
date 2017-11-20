class AccessToken < OauthToken
  validates_presence_of :user, :secret
  before_create :set_authorized_at, :set_expires_at

  # Implement this to return a hash or array of the capabilities the access token has
  # This is particularly useful if you have implemented user defined permissions.
  # def capabilities
  #   {:invalidate=>"/oauth/invalidate",:capabilities=>"/oauth/capabilities"}
  # end

  protected

  def set_authorized_at
    self.authorized_at = Time.now
  end

  def set_expires_at
    self.expires_at = 1.day.from_now
  end
end
