class Admin::StoredImagesController < AdminController
    def create
        @stored_image = Admin::StoredImage.new(stored_image_params)
        respond_to do |format|
            if @stored_image.save
                format.js {
                    render body: nil}
            else
                flash.now[:error] = @stored_image.errors
            end
        end
    end

    def update
        respond_to do |format|
            if @email_template.update(email_template_params)
                flash.now[:notice] = 'successfully_updated'
                format.js {
                    render body: nil}
                format.json {
                    render :show,
                           status: :ok,
                           location: @email_template }
            else
                format.html {
                    render :edit
                }
                format.json {
                    render json: @email_template.errors }
            end
        end
    end

    def destroy
        @email_template.destroy
        respond_to do |format|
            format.json {
                render json: @email_template
            }
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