class ApiVersionConstraint
  def matches?(req)
     @default || req.headers['Accept'].include?("application/vnd.escamboo")
  end
end