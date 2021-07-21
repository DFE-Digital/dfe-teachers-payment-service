require "rails_helper"

module OrdnanceSurvey
  class Api
    class V1
      describe SearchPlaces do
        subject(:search_places) { described_class.new(client: Client.new(base_url: "https://api.os.uk")) }

        describe "#index" do
          subject(:index) { search_places.index(params: params_args) }

          let(:claim) { build(:claim, :submittable, postcode: "SO16 9FX") }

          let(:params_args) do
            {
              postcode: claim.postcode
            }
          end

          let!(:index_endpoint) do
            stub_search_places_index(claim: claim)
          end

          it "makes correct request" do
            index

            expect(index_endpoint).to have_been_requested
          end

          it "returns an array of address details" do
            expect(index).to eq(
              [
                {
                  address: "FLAT 1, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 1, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 10, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 10, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 11, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 11, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 12, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 12, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 13, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 13, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 14, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 14, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 15, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 15, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 16, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 16, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 17, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 17, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 18, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 18, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 19, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 19, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 2, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 2, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 20, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 20, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 21, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 21, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 22, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 22, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 23, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 23, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 24, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 24, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 25, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 25, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 26, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 26, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 27, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 27, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 28, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 28, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 29, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 29, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 3, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 3, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 30, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 30, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 31, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 31, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 32, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 32, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 33, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 33, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 34, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 34, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 35, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 35, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 36, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 36, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 37, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 37, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 38, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 38, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 39, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 39, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 4, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 4, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 40, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 40, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 41, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 41, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 42, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 42, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 43, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 43, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 44, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 44, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 45, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 45, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 46, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 46, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 47, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 47, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 48, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 48, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 49, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 49, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 5, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 5, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 50, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 50, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 6, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 6, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 7, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 7, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 8, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 8, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                },
                {
                  address: "FLAT 9, MILLBROOK TOWER, WINDERMERE AVENUE, SOUTHAMPTON, SO16 9FX",
                  address_line_1: "FLAT 9, MILLBROOK TOWER",
                  address_line_2: "WINDERMERE AVENUE",
                  address_line_4: "SOUTHAMPTON",
                  postcode: "SO16 9FX"
                }
              ]
            )
          end
        end

        describe "#show" do
          subject(:show) { search_places.show(params: params_args) }

          let(:claim) { build(:claim, :submittable, address_line_1: 19, postcode: "BD7 3BE") }

          let(:params_args) do
            {
              address_line_1: claim.address_line_1,
              postcode: claim.postcode
            }
          end

          let!(:show_endpoint) do
            stub_search_places_show(claim: claim)
          end

          it "makes correct request" do
            show

            expect(show_endpoint).to have_been_requested
          end

          it "returns a single address" do
            expect(show).to eq(
              {
                address: "19, TURNER PLACE, BRADFORD, BD7 3BE",
                address_line_1: "19",
                address_line_2: "TURNER PLACE",
                address_line_4: "BRADFORD",
                postcode: "BD7 3BE"
              }
            )
          end
        end
      end
    end
  end
end
