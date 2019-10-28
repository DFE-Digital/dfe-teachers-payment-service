require "rails_helper"

RSpec.describe ClaimMailer, type: :mailer do
  describe "#submitted" do
    let(:claim) { create(:claim, :submittable, first_name: "Abraham", surname: "Lincoln") }
    let(:mail) { ClaimMailer.submitted(claim) }

    it "renders the headers" do
      expect(mail.subject).to eq("Your claim was received")
      expect(mail.to).to eq([claim.email_address])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Dear Abraham Lincoln,")
      expect(mail.body.encoded).to match("We've received your application to claim back your student loan repayments for the time you spent at #{claim.eligibility.claim_school.name}.")
      expect(mail.body.encoded).to match("Your unique reference is #{claim.reference}. You will need this if you contact us about your claim.")
    end
  end

  describe "#approved" do
    let(:claim) { create(:claim, :submitted, first_name: "John", middle_name: "Fitzgerald", surname: "Kennedy") }
    let(:mail) { ClaimMailer.approved(claim) }

    it "renders the headers" do
      expect(mail.subject).to match("approved")
      expect(mail.subject).to match("reference number: #{claim.reference}")
      expect(mail.to).to eq([claim.email_address])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Dear John Kennedy,")
      expect(mail.body.encoded).to match("been approved")
    end
  end

  describe "#rejected" do
    let(:claim) { create(:claim, :submitted, first_name: "John", middle_name: "Fitzgerald", surname: "Kennedy") }
    let(:mail) { ClaimMailer.rejected(claim) }

    it "renders the headers" do
      expect(mail.subject).to match("rejected")
      expect(mail.subject).to match("reference number: #{claim.reference}")
      expect(mail.to).to eq([claim.email_address])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Dear John Kennedy,")
      expect(mail.body.encoded).to match("been rejected")
    end
  end

  describe "#payment_confirmation" do
    let(:payment) { create(:payment, :with_figures, net_pay: 500.00, claim: claim) }
    let(:claim) { create(:claim, :submitted, first_name: "John", middle_name: "Fitzgerald", surname: "Kennedy") }
    let(:payment_date_timestamp) { Time.new(2019, 1, 1).to_i }
    let(:mail) { ClaimMailer.payment_confirmation(payment.claim, payment_date_timestamp) }

    it "renders the headers" do
      expect(mail.subject).to match("paying")
      expect(mail.subject).to match("reference number: #{claim.reference}")
      expect(mail.to).to eq([claim.email_address])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include("Dear John Kennedy,")
      expect(mail.body.encoded).to include("We’re paying your claim")
      expect(mail.body.encoded).to include("You will receive £500.00 on or after 1 January 2019")
    end

    context "when student loan repayment is nil" do
      let(:payment) { create(:payment, :with_figures, student_loan_repayment: nil, claim: claim) }

      it "shows not applicable" do
        expect(mail.body.encoded).to include("Student loan (deducted): Not applicable")
      end
    end
  end
end
