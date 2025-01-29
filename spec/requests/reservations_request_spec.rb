require "rails_helper"

RSpec.describe "Reservation Request", type: :request do
  describe "POST /reservations" do
    let(:payload) {}
    let!(:existing_guest) { create(:guest, id: 1) }

    subject(:endpoint) { post reservations_path, params: payload }

    before(:each) do |test|
      unless test.metadata[:requires_new_request]
        endpoint
      end
    end

    context "when no payload is given" do
      it "returns an unprocessable entity" do
        expect(response).to have_http_status 422
      end

      it "returns an error message 'Failed saving reservation'" do
        result = JSON.parse(response.body)["error"]

        expect(result).to eq("Failed saving reservation")
      end

      it "does not create a Guest data", :requires_new_request do
        expect { endpoint }.not_to change(Guest, :count)
      end

      it "does not create a Reservation data", :requires_new_request do
        expect { endpoint }.not_to change(Reservation, :count)
      end
    end

    context "when given payload is from source 1" do
      let!(:payload) do
        {
          "reservation": {
            "start_date": "2021-03-12",
            "end_date": "2021-03-16",
            "expected_payout_amount": "3800.00",
            "guest_details": {
              "localized_description": "4 guests",
              "number_of_adults": 2,
              "number_of_children": 2,
              "number_of_infants": 0
            },
            "guest_email": "wayne_woodbridge@bnb.com",
            "guest_first_name": "Wayne",
            "guest_id": 1,
            "guest_last_name": "Woodbridge",
            "guest_phone_numbers": [
              "639123456789",
              "639123456781"
            ],
            "listing_security_price_accurate": "500.00",
            "host_currency": "AUD",
            "nights": 4,
            "number_of_guests": 4,
            "status_type": "accepted",
            "total_paid_amount_accurate": "4500.00"
          }
        }
      end

      it "successfully creates a reservation" do
        result = JSON.parse(response.body)["data"]

        expect(Reservation.count).to eq(1)
        expect(result["start_date"]).to eq(payload[:reservation][:start_date])
        expect(result["end_date"]).to eq(payload[:reservation][:end_date])
        expect(result["guest_email"]).to eq(payload[:reservation][:guest_email])
      end

      it "successfully creates a new guest", :requires_new_request do
        expect { endpoint }.to change(Guest, :count).from(1).to(2)
      end

      context "when given guest in payload already exists in the system" do
        let(:guest) { create(:guest, email: "new@email.com", first_name: "New", last_name: "1") } 
        let!(:payload) do
          {
            "reservation": {
              "start_date": "2021-03-12",
              "end_date": "2021-03-16",
              "expected_payout_amount": "3800.00",
              "guest_details": {
                "localized_description": "4 guests",
                "number_of_adults": 2,
                "number_of_children": 2,
                "number_of_infants": 0
              },
              "guest_email": guest.email,
              "guest_first_name": guest.first_name,
              "guest_id": 1,
              "guest_last_name": guest.last_name,
              "guest_phone_numbers": guest.phone_numbers,
              "listing_security_price_accurate": "500.00",
              "host_currency": "AUD",
              "nights": 4,
              "number_of_guests": 4,
              "status_type": "accepted",
              "total_paid_amount_accurate": "4500.00"
            }
          }
        end

        it "successfully creates a reservation" do
          result = JSON.parse(response.body)["data"]

          expect(Reservation.count).to eq(1)
          expect(result["guest_email"]).to eq(payload[:reservation][:guest_email])
        end

        it "does NOT create a new Guest", :requires_new_request do
          expect { endpoint }.not_to change(Guest, :count)
        end
      end
    end

    context "when given payload is from source 2" do
      let!(:payload) do
        {
          "start_date": "2023-07-12",
          "end_date": "2023-07-13",
          "nights": 1,
          "guests": 1,
          "adults": 1,
          "children": 0,
          "infants": 0,
          "status": "accepted",
          "guest": {
            "id": 1,
            "first_name": "Wayne",
            "last_name": "Woodbridge",
            "phone": "639123456789",
            "email": "wayne_woodbridge@bnb.com"
          },
          "currency": "AUD",
          "payout_price": "1800.00",
          "security_price": "500",
          "total_price": "2500.00"
        }
      end

      it "successfully creates a reservation" do
        result = JSON.parse(response.body)["data"]

        expect(Reservation.count).to eq(1)
        expect(result["start_date"]).to eq(payload[:start_date])
        expect(result["end_date"]).to eq(payload[:end_date])
        expect(result["guest_email"]).to eq(payload[:guest][:email])
      end

      it "successfully creates a new guest", :requires_new_request do
        expect { endpoint }.to change(Guest, :count).from(1).to(2)
      end

      context "when given guest in payload already exists in the system" do
        let(:guest) { create(:guest, email: "new@email.com", first_name: "New", last_name: "1") }
        let!(:payload) do
          {
            "start_date": "2023-07-12",
            "end_date": "2023-07-13",
            "nights": 1,
            "guests": 1,
            "adults": 1,
            "children": 0,
            "infants": 0,
            "status": "accepted",
            "guest": {
              "id": 1,
              "first_name": guest.first_name,
              "last_name": guest.last_name,
              "phone": guest.phone_numbers.first,
              "email": guest.email
            },
            "currency": "AUD",
            "payout_price": "1800.00",
            "security_price": "500",
            "total_price": "2500.00"
          }
        end

        it "successfully creates a reservation" do
          result = JSON.parse(response.body)["data"]

          expect(Reservation.count).to eq(1)
          expect(result["guest_email"]).to eq(payload[:guest][:email])
        end

        it "does NOT create a new Guest", :requires_new_request do
          expect { endpoint }.not_to change(Guest, :count)
        end
      end
    end
  end
end

# TODO: test that a given guest id is similiar in payload and in the system but the email is different
# reason for this is that since the payloads are from different sources, the origin source
# may have different implementations of an id OR given that both sources uses
# the same id type but the value is entirely different. so in that case
# it made sense that email is the unique identifier across sources. so  in the parser
# do not map the id. map everything else. since we are checking for email presence
# we need to update the guest saving