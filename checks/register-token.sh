#!/bin/sh
# Register a user, then trade its credentials for an access token: the API writes to and reads
# from its database.
e="check$$@example.test"
curl -s -o /dev/null -H 'Content-Type: application/json' \
  -d "{\"name\":\"Check\",\"email\":\"$e\",\"password\":\"check-pass\",\"passwordConfirmation\":\"check-pass\"}" \
  http://api:5000/api/registrations
curl -s -H 'Content-Type: application/json' -d "{\"email\":\"$e\",\"password\":\"check-pass\"}" \
  http://api:5000/api/authorizations | grep -q 'accessToken'
