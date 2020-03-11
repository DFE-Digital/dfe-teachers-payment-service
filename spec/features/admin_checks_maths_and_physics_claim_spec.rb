require "rails_helper"

RSpec.feature "Admin checking a Maths & Physics claim" do
  let(:user) { create(:dfe_signin_user) }

  before do
    sign_in_to_admin_with_role(DfeSignIn::User::SERVICE_OPERATOR_DFE_SIGN_IN_ROLE_CODE, user.dfe_sign_in_id)
  end

  scenario "service operator checks and approves a Maths & Physics claim" do
    claim = create(:claim, :submitted, policy: MathsAndPhysics)

    visit admin_claims_path
    find("a[href='#{admin_claim_tasks_path(claim)}']").click

    expect(page).to have_content("1. Qualifications")
    expect(page).to have_content("2. Employment")
    expect(page).to have_content("3. Decision")

    click_on "Check qualification information"

    expect(page).to have_content(I18n.t("maths_and_physics.admin.tasks.qualifications.question"))
    expect(page).to have_content("Award year")
    expect(page).to have_content(claim.eligibility.qts_award_year_answer)

    choose "Yes"
    click_on "Save and continue"

    expect(claim.tasks.find_by!(name: "qualifications").passed?).to eq(true)

    expect(page).to have_content(I18n.t("maths_and_physics.admin.tasks.employment.question"))
    expect(page).to have_content("Current school")
    expect(page).to have_link(claim.eligibility.current_school.name)

    choose "Yes"
    click_on "Save and continue"

    expect(claim.tasks.find_by!(name: "employment").passed?).to eq(true)

    expect(page).to have_content("Claim decision")

    choose "Approve"
    fill_in "Decision notes", with: "All checks passed!"
    click_on "Confirm decision"

    expect(page).to have_content("Claim has been approved successfully")
    expect(claim.decision).to be_approved
    expect(claim.decision.created_by).to eq(user)
  end

  scenario "service operator sees an error if they don't choose a Yes/No option on a check" do
    claim = create(:claim, :submitted, policy: MathsAndPhysics)

    visit admin_claims_path
    find("a[href='#{admin_claim_tasks_path(claim)}']").click

    click_on "Check qualification information"

    click_on "Save and continue"

    expect(page).to have_content("You must select ‘Yes’ or ‘No’")
    expect(claim.tasks.find_by(name: "qualifications")).to be_nil
  end
end