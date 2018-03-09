# frozen_string_literal: true

# frozen_string_literal: true.

class Admin::EmailTemplatesController < AdminController
  before_action :set_email_template, only: %i[show edit update destroy]
  before_action :create_snapshot, only: [:update]

  def index
    @email_templates = Admin::EmailTemplate.all
    @email_template = Admin::EmailTemplate.new
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
        format.html do
          redirect_to edit_admin_email_template_path(@email_template)
        end
      else
        flash.now[:error] = @email_template.errors
        format.html do
          render :index
        end
      end
    end
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

  def create_snapshot
    kit = IMGKit.new(@email_template.source)
    img   = kit.to_img(:png)
    file  = Tempfile.new(["template_#{@email_template.id}", 'png'],
                         'tmp',
                         encoding: 'ascii-8bit')
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
