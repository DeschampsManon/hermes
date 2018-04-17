# frozen_string_literal: true

class Admin::StoredImagesController < AdminController
    skip_before_action :verify_authenticity_token

    def create
        # binding.pry
        @stored_image = Admin::StoredImage.new(stored_image_params)
        @stored_image.title = params[:file].original_filename
        # respond_to do |format|
        @stored_image.save
        # respond_to js: {render body: nil}
        # else
        # flash.now[:error] = @stored_image.errors
        # end
        # end
    end

    def update
        respond_to do |format|
            if @email_template.update(email_template_params)
                flash.now[:notice] = 'successfully_updated'
                format.js do
                    render body: nil
                end
                format.json do
                    render :show,
                           status: :ok,
                           location: @email_template
                end
            else
                format.html do
                    render :edit
                end
                format.json do
                    render json: @email_template.errors
                end
            end
        end
    end

    def destroy
        @email_template.destroy
        respond_to do |format|
            format.json do
                render json: @email_template
            end
        end
    end

    private

    def set_email_template
        @email_template = Admin::EmailTemplate.friendly.find(params[:id])
    end

    def stored_image_params
        params.require(:admin_stored_image).permit(:title,
                                                   :alt,
                                                   :url)
    end
end
