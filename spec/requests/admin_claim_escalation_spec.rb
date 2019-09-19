require "rails_helper"

RSpec.describe "Admin claim escalations", type: :request do
  context "when signed in as a service operator" do
    before do
      stub_dfe_sign_in_with_role(AdminSession::SERVICE_OPERATOR_DFE_SIGN_IN_ROLE_CODE)
      post admin_dfe_sign_in_path
      follow_redirect!
    end

    describe "claim_escalations#create" do
      let(:claim) { create(:claim, :submitted) }

      it "escalates a claim" do
        freeze_time do
          post admin_claim_escalations_path(claim_id: claim.id, claim: {note: {body: "some reason."}})

          follow_redirect!

          expect(response.body).to include("Claim has been escalated successfully")

          claim.reload
          expect(claim.escalated_at).to eq(Time.zone.now)
          expect(claim.escalated_by).to eq("123")
          note = claim.notes.last
          expect(note.body).to eq("some reason.")
          expect(note.created_by).to eq("123")
        end
      end

      context "when the claim is already approved" do
        let(:claim) { create(:claim, :approved) }

        it "cannot be escalated when already approved" do
          post admin_claim_escalations_path(claim_id: claim.id)

          follow_redirect!

          expect(response.body).to include("Claim cannot be escalated")

          claim.reload
        end
      end
    end
  end
end
