# API Docs

## Saving Reservations

### POST localhost:<port_number>/reservations
This api saves reservation data that can come from different sources.

Currently the api supports 2 types of payloads.

**Supported Payloads**

Payload 1
```json
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
        "guest_email": "john_smith@bnb.com",
        "guest_first_name": "John",
        "guest_id": 1,
        "guest_last_name": "Smith",
        "guest_phone_numbers": [
            "639123456789",
            "639123456782"
        ],
        "listing_security_price_accurate": "500.00",
        "host_currency": "AUD",
        "nights": 4,
        "number_of_guests": 4,
        "status_type": "accepted",
        "total_paid_amount_accurate": "4500.00"
    }
}
```
**Optional keys:** localized_description, guest_id


Payload 2
```json
{
    "start_date": "2021-03-12",
    "end_date": "2021-03-16",
    "nights": 4,
    "guests": 4,
    "adults": 2,
    "children": 2,
    "infants": 0,
    "status": "accepted",
    "guest": {
        "id": 1,
        "first_name": "John",
        "last_name": "Smith",
        "phone": "639123456789",
        "email": "john_smith@bnb.com"
    },
    "currency": "AUD",
    "payout_price": "3800.00",
    "security_price": "500",
    "total_price": "4500.00"
}
```
**Optional keys:** id

**Example Response**
```json
{
    "data": {
        "start_date": "2021-03-12",
        "end_date": "2021-03-16",
        "nights": 4,
        "status": "accepted",
        "number_of_adults": 2,
        "number_of_children": 2,
        "number_of_infants": 0,
        "total_guests": 4,
        "payment_currency": "AUD",
        "payout_price": "3800.00",
        "security_price": "500.00",
        "total_price": "4500.00",
        "guest_email": "john_smith@bnb.com"
    }
}
```

**NOTES**
- If any of the required keys in the payload is null or does not exist, the api will fail to create the reservation. 

- When the api receives some other payload format from the above, the api will return an http status 422 with an error message of "Failed to save reservation". In those cases, Please notify the dev team in order to add the new payload format to the api
