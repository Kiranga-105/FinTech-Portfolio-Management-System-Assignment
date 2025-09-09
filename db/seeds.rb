# Basic seed data
org = Organization.create!(name: 'Acme Corp', email: 'info@acme.example')
contact = Contact.create!(name: 'Alice Example', email: 'alice@example.com', organization: org)
contact.portfolios.create!(balance: 10000.00, performance: 12.5)
contact.portfolios.create!(balance: 5000.00, performance: -3.2)

contact2 = Contact.create!(name: 'Bob Sample', email: 'bob@example.com', organization: org)
contact2.portfolios.create!(balance: 20000.00, performance: 5.75)
contact2.portfolios.create!(balance: 15000.00, performance: -1.5)

EmailTemplate.create!(name: 'Welcome', subject: 'Welcome {Contact.name}', body: "Hello {Contact.name},\nYour best performance: {Portfolio.best_performance}\nRegards, {Organization.name}")
EmailTemplate.create!(name: 'Alert', subject: 'Alert for {Contact.name}', body: "Dear {Contact.name},\nYour worst performance: {Portfolio.worst_performance}\nContact us: {Organization.email}")
EmailTemplate.create!(name: 'Portfolio Summary', subject: 'Hi {Contact.name} - Portfolio Update', body: "{Contact.name},\nYour top performance: {Portfolio.best_performance}\nLowest performance: {Portfolio.worst_performance}\nThanks, {Organization.name}")
