class Admin::EmailTemplatesController < AdminController
    before_action :set_email_template, only: [:show, :edit, :update, :destroy]
    before_action :create_snapshot, only: [:update]

    def index
        @email_templates = Admin::EmailTemplate.all
        @email_template  = Admin::EmailTemplate.new
    end

    def show
        render layout: false
    end

    def create
        @email_template = Admin::EmailTemplate.new(email_template_params)
        create_snapshot
        respond_to do |format|
            if @email_template.save
                flash.now[:succes] = 'successfully creates'
                format.html {
                    redirect_to edit_admin_email_template_path(@email_template)
                }
            else
                flash.now[:error] = @email_template.errors
                format.html {
                    render :index
                }
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

    def create_snapshot
        kit   = IMGKit.new(@email_template.source)
        img   = kit.to_img(:png)
        file  = Tempfile.new(["template_#{@email_template.id}", 'png'], 'tmp', encoding: 'ascii-8bit')
        file.write(img)
        file.flush
        @email_template.snapshot = file
        file.unlink
    end

    def default_email_template_source
        render layout: false
    end

    private
        def set_email_template
            @email_template = Admin::EmailTemplate.friendly.find(params[:id])
        end

        def email_template_params
            params.require(:admin_email_template).permit(:title,
                                                         :source,
                                                         :snapshot)
        end
end