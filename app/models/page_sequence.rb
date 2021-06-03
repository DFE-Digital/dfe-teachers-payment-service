# frozen_string_literal: true

# Used to model the sequence of pages that make up the claim process.
class PageSequence
  attr_reader :claim, :current_slug

  def initialize(claim, slug_sequence, current_slug)
    @claim = claim
    @current_slug = current_slug
    @slug_sequence = slug_sequence
  end

  def slugs
    @slug_sequence.slugs
  end

  def next_slug
    Rails.logger.debug("PageSequence#next_slug")
    return "ineligible" if claim.eligibility.ineligible? #&& claim.eligibility.not_eligible?
    return "check-your-answers" if claim.submittable?

    slugs[current_slug_index + 1]
  end

  def in_sequence?(slug)
    slugs.include?(slug)
  end

  private

  def current_slug_index
    slugs.index(current_slug) || 0
  end
end
