class LinksController
  class LinkValidations

    def check_short_uniqueness_update
      @link = Link.find(params[:id])
      if check_short_uniqueness_update?
        flash[:error] = "Link already taken"
        new_create_redirect
      end
    end

    def check_short_uniqueness_create
      if Link.find_by(short_url: params[:link][:short_url])
        flash[:error] = "Link already taken"
        new_create_redirect
      end
    end

    def testing
      "ttsering"
    end

  end
end
