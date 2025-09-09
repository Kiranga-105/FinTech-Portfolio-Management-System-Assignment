class ContactsController < ApplicationController
  def index
    @contacts = Contact.includes(:organization, :portfolios).all
    @templates = EmailTemplate.all
  end

  def show
    @contact = Contact.find(params[:id])
    @templates = EmailTemplate.all
  end

  # Simulate sending (create SendLog + flash message)
  def send_email_simulation
    contact = Contact.find(params[:id])
    template = EmailTemplate.find_by(id: params[:template_id])
    rendered = template ? EmailRenderer.render_for_contact(template, contact) : nil

    log = SendLog.create!(
      contact: contact,
      email_template: template,
      recipient_email: contact.email,
      subject: (template&.subject || '').to_s,
      body: rendered.to_s
    )

    flash[:notice] = "Simulated sending template '\#{template&.name || '—'}' to \#{contact.email}"
    redirect_back fallback_location: contacts_path
  end

  def preview_email
    contact = Contact.find(params[:id])
    template = EmailTemplate.find_by(id: params[:template_id])
    rendered = template ? EmailRenderer.render_for_contact(template, contact) : "No template selected"
    render html: rendered.html_safe
  end
end
