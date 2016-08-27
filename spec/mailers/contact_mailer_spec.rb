require "rails_helper"

RSpec.describe ContactMailer, type: :mailer do
  let(:name) {'Ethan'}
  let(:return_email) {'test@example.com'}
  let(:message) {'Hello, world!'}

  let(:mail) {ContactMailer.contact_email(name, return_email, message)}

  it 'has correct From info' do
    expect(mail.from).to eq(['no-reply@mail.cgbc-nc.com'])
    expect(mail.header['From'].to_s).to eq('CGBC-Web <no-reply@mail.cgbc-nc.com>')
  end

  it 'sends to correct addresses' do
    expect(mail.to).to eq(['emb1234@gmail.com'])
  end

  it 'has the correct subject' do
    expect(mail.subject).to eq('New question/comment from CGBC website')
  end

  it 'renders the body' do
    expect(mail.body.encoded).to match("Comment submitted by #{name}")
    expect(mail.body.encoded).to match("Return email: #{return_email}")
    expect(mail.body.encoded).to match(message)
  end
end
