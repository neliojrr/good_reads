module GoodReads
  module Auth

    # auth.user
    #
    # Get an xml response with the Goodreads user_id for the user who authorized
    # access using OAuth
    #
    # No params required
    #
    def auth_user
      data = request("/auth_user")
      data
    end
  end
end
