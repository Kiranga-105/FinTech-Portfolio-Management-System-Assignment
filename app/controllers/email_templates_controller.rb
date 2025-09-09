class EmailTemplatesController < ApplicationController
  before_action :set_template, only: [:show, :edit, :update, :destroy, :preview]

  def index
    @templates = EmailTemplate.all
  end

  def show; end

  def new
    @template = EmailTemplate.new
  end

  def create
    @template = EmailTemplate.new(template_params)
    if @template.save
      redirect_to @template, notice: 'Template created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @template.update(template_params)
      redirect_to @template, notice: 'Template updated.'
    else
      render :edit
    end
  end

  def destroy
    @template.destroy
    redirect_to email_templates_path, notice: 'Template deleted.'
  end

  def preview
    # For previewing with a sample contact (first contact or provided contact_id)
    contact = Contact.find_by(id: params[:contact_id]) || Contact.first
    @rendered = EmailRenderer.render_for_contact(@template, contact)
  end

  private

  def set_template
    @template = EmailTemplate.find(params[:id])
  end

  def template_params
    params.require(:email_template).permit(:name, :subject, :body)
  end
end
