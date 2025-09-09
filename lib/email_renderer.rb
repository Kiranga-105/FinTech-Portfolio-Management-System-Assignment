require 'cgi'

class EmailRenderer
  # Simple replacement of shortcodes
  def self.render_for_contact(template, contact)
    return "<p>No template or contact</p>" unless template && contact

    org = contact.organization
    best = contact.best_portfolio&.performance
    worst = contact.worst_portfolio&.performance

    text = ERB::Util.html_escape(template.body.to_s)
    substitutions = {
      '{Contact.name}' => ERB::Util.html_escape(contact.name.to_s),
      '{Contact.email}' => ERB::Util.html_escape(contact.email.to_s),
      '{Organization.name}' => ERB::Util.html_escape(org&.name.to_s),
      '{Organization.email}' => ERB::Util.html_escape(org&.email.to_s),
      '{Portfolio.best_performance}' => ERB::Util.html_escape(best.to_s),
      '{Portfolio.worst_performance}' => ERB::Util.html_escape(worst.to_s)
    }

    substitutions.each do |k,v|
      text.gsub!(k, v)
    end

    # simple subject replacement too
    subject = ERB::Util.html_escape(template.subject.to_s)
    substitutions.each { |k,v| subject.gsub!(k, v) }

    "<h3>\#{subject}</h3>\n<div>\#{text.gsub(/\n/, '<br/>')}</div>"
  end
end
