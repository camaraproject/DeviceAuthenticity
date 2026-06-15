@Device_Authenticity
Feature: CAMARA DeviceAuthenticity API, vwip - Operation checkImeiStatus
  # Input to be provided by the implementation to the tester
  #
  # Implementation indications:
  # * None
  #
  # Testing assets:
  # * A valid IMEI known to be on the allowed list
  # * A valid IMEI known to be on the lost list
  # * A valid IMEI known to be on the stolen list (with a known reportedDate)
  # * A valid IMEI known to be blacklisted
  # * A valid IMEI known to be blocked
  # * A valid IMEI known to be flagged for fraud
  # * A valid IMEI known to be blocked for non-payment
  # * A valid IMEI known to be restricted for regulatory reasons
  # * A valid IMEI not present in any register (status: unknown)
  # * A valid IMEI for which the fraud check service is not applicable
  # * A valid IMEI that is not found in any accessible database
  #
  # References to OAS spec schemas refer to schemas specified in device-authenticity.yaml

  Background: Common checkImeiStatus setup
    Given the resource "{api-root}/device-authenticity/vwip/check-status" set as base-url
    And the header "Content-Type" is set to "application/json"
    And the header "Authorization" is set to a valid access token
    And the header "x-correlator" is set to a UUID value
    And the request body is set by default to a request body compliant with the schema "#/components/schemas/RequestBody"

##########################
# Happy path scenarios
##########################

  @device_authenticity_01_allowed_imei
  Scenario: Check status of a device on the allowed list
    Given the request body property "$.imei" is set to a valid IMEI known to be on the allowed list
    When the request "checkImeiStatus" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "#/components/schemas/ImeiStatus"
    And the response property "$.imei" is the same value as the request body property "$.imei"
    And the response property "$.operationalStatus" is "allowed"
    And the response property "$.reportedDate" is not present

  @device_authenticity_02_lost_imei
  Scenario: Check status of a device reported as lost
    Given the request body property "$.imei" is set to a valid IMEI known to be on the lost list
    When the request "checkImeiStatus" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "#/components/schemas/ImeiStatus"
    And the response property "$.imei" is the same value as the request body property "$.imei"
    And the response property "$.operationalStatus" is "lost"

  @device_authenticity_03_stolen_imei
  Scenario: Check status of a device reported as stolen
    Given the request body property "$.imei" is set to a valid IMEI known to be on the stolen list
    When the request "checkImeiStatus" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "#/components/schemas/ImeiStatus"
    And the response property "$.imei" is the same value as the request body property "$.imei"
    And the response property "$.operationalStatus" is "stolen"

  @device_authenticity_04_blacklisted_imei
  Scenario: Check status of a blacklisted device
    Given the request body property "$.imei" is set to a valid IMEI known to be blacklisted
    When the request "checkImeiStatus" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "#/components/schemas/ImeiStatus"
    And the response property "$.imei" is the same value as the request body property "$.imei"
    And the response property "$.operationalStatus" is "blacklisted"

  @device_authenticity_05_blocked_imei
  Scenario: Check status of a blocked device
    Given the request body property "$.imei" is set to a valid IMEI known to be blocked
    When the request "checkImeiStatus" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "#/components/schemas/ImeiStatus"
    And the response property "$.imei" is the same value as the request body property "$.imei"
    And the response property "$.operationalStatus" is "blocked"

  @device_authenticity_06_fraud_imei
  Scenario: Check status of a device flagged for fraud
    Given the request body property "$.imei" is set to a valid IMEI known to be flagged for fraud
    When the request "checkImeiStatus" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "#/components/schemas/ImeiStatus"
    And the response property "$.imei" is the same value as the request body property "$.imei"
    And the response property "$.operationalStatus" is "fraud"

  @device_authenticity_07_non_payment_imei
  Scenario: Check status of a device blocked due to non-payment
    Given the request body property "$.imei" is set to a valid IMEI known to be blocked for non-payment
    When the request "checkImeiStatus" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "#/components/schemas/ImeiStatus"
    And the response property "$.imei" is the same value as the request body property "$.imei"
    And the response property "$.operationalStatus" is "non-payment"

  @device_authenticity_08_regulatory_imei
  Scenario: Check status of a device restricted for regulatory reasons
    Given the request body property "$.imei" is set to a valid IMEI known to be restricted for regulatory reasons
    When the request "checkImeiStatus" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "#/components/schemas/ImeiStatus"
    And the response property "$.imei" is the same value as the request body property "$.imei"
    And the response property "$.operationalStatus" is "regulatory"

  @device_authenticity_09_unknown_imei
  Scenario: Check status of a device not present in any register
    Given the request body property "$.imei" is set to a valid IMEI not present in any register
    When the request "checkImeiStatus" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "#/components/schemas/ImeiStatus"
    And the response property "$.imei" is the same value as the request body property "$.imei"
    And the response property "$.operationalStatus" is "unknown"
    And the response property "$.reportedDate" is not present

  @device_authenticity_10_reported_date_for_negative_status
  Scenario Outline: reportedDate may be present for devices with a negative operational status
    Given the request body property "$.imei" is set to a valid IMEI with operational status "<status>"
    When the request "checkImeiStatus" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response body complies with the OAS schema at "#/components/schemas/ImeiStatus"
    And the response property "$.operationalStatus" is "<status>"
    And if the response property "$.reportedDate" is present, then the value has a valid RFC 3339 date-time format with timezone

    Examples:
      | status      |
      | lost        |
      | stolen      |
      | blacklisted |
      | blocked     |
      | fraud       |
      | non-payment |
      | regulatory  |

  @device_authenticity_11_last_checked_format
  Scenario: lastChecked field has a valid RFC 3339 date-time format when present
    Given the request body property "$.imei" is set to a valid IMEI
    When the request "checkImeiStatus" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And if the response property "$.lastChecked" is present, then the value has a valid RFC 3339 date-time format with timezone

  @device_authenticity_12_imei_echoed_in_response
  Scenario: The IMEI in the response matches the IMEI in the request
    Given the request body property "$.imei" is set to a valid IMEI
    When the request "checkImeiStatus" is sent
    Then the response status code is 200
    And the response property "$.imei" is the same value as the request body property "$.imei"

  @device_authenticity_13_request_without_x_correlator
  Scenario: Request without x-correlator header is accepted
    Given the header "x-correlator" is not set
    And the request body property "$.imei" is set to a valid IMEI
    When the request "checkImeiStatus" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response body complies with the OAS schema at "#/components/schemas/ImeiStatus"

  @device_authenticity_14_x_correlator_echoed
  Scenario: x-correlator provided in request is echoed back in the response
    Given the header "x-correlator" is set to a UUID value
    And the request body property "$.imei" is set to a valid IMEI
    When the request "checkImeiStatus" is sent
    Then the response status code is 200
    And the response header "x-correlator" has same value as the request header "x-correlator"

#################
# Error scenarios - IMEI input validation (400)
#################

  @device_authenticity_C01.01_missing_imei
  Scenario: IMEI field is missing from the request body
    Given the request body property "$.imei" is not included
    When the request "checkImeiStatus" is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

  @device_authenticity_C01.02_imei_not_schema_compliant
  Scenario Outline: IMEI value does not comply with the schema
    Given the request body property "$.imei" is set to "<invalid_imei>"
    When the request "checkImeiStatus" is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

    Examples:
      | invalid_imei     | description                    |
      | 12345            | fewer than 15 digits           |
      | 1234567890123456 | more than 15 digits            |
      | 12345678901234A  | contains a non-numeric char    |
      | 123456789 12345  | contains a space               |
      | 12345-6789012345 | contains a hyphen              |

  @device_authenticity_C01.03_empty_request_body
  Scenario: Empty JSON object as request body is rejected
    Given the request body is set to: {}
    When the request "checkImeiStatus" is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

#################
# Error code 401
#################

  @device_authenticity_401.1_expired_access_token
  Scenario: Expired access token
    Given the header "Authorization" is set to an expired access token
    And the request body property "$.imei" is set to a valid IMEI
    When the request "checkImeiStatus" is sent
    Then the response status code is 401
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @device_authenticity_401.2_no_authorization_header
  Scenario: No Authorization header
    Given the header "Authorization" is removed
    And the request body property "$.imei" is set to a valid IMEI
    When the request "checkImeiStatus" is sent
    Then the response status code is 401
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @device_authenticity_401.3_malformed_access_token
  Scenario: Malformed access token
    Given the header "Authorization" is set to a malformed token
    And the request body property "$.imei" is set to a valid IMEI
    When the request "checkImeiStatus" is sent
    Then the response status code is 401
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

#################
# Error code 403
#################

  @device_authenticity_403_permission_denied
  Scenario: OAuth2 token does not have the required scope
    Given the header "Authorization" is set to a valid access token not including scope "device-authenticity:check-status"
    And the request body property "$.imei" is set to a valid IMEI
    When the request "checkImeiStatus" is sent
    Then the response status code is 403
    And the response property "$.status" is 403
    And the response property "$.code" is "PERMISSION_DENIED"
    And the response property "$.message" contains a user friendly text

#################
# Error code 404
#################

  @device_authenticity_404_identifier_not_found
  Scenario: Provided IMEI is not found in any accessible database
    Given the request body property "$.imei" is set to a valid IMEI that is not found in any accessible database
    When the request "checkImeiStatus" is sent
    Then the response status code is 404
    And the response property "$.status" is 404
    And the response property "$.code" is "IDENTIFIER_NOT_FOUND"
    And the response property "$.message" contains a user friendly text

#################
# Error code 422
#################

  @device_authenticity_422_service_not_applicable
  Scenario: IMEI fraud check service is not applicable for the provided IMEI
    Given that the fraud check service is not applicable for all IMEIs
    And the request body property "$.imei" is set to a valid IMEI for which the fraud check service is not applicable
    When the request "checkImeiStatus" is sent
    Then the response status code is 422
    And the response property "$.status" is 422
    And the response property "$.code" is "SERVICE_NOT_APPLICABLE"
    And the response property "$.message" contains a user friendly text

#################
# Error code 429
#################

  @device_authenticity_429.1_quota_exceeded
  Scenario: API consumer quota has been exceeded
    Given the API consumer has exceeded their allocated quota for this API
    And the request body property "$.imei" is set to a valid IMEI
    When the request "checkImeiStatus" is sent
    Then the response status code is 429
    And the response property "$.status" is 429
    And the response property "$.code" is "QUOTA_EXCEEDED"
    And the response property "$.message" contains a user friendly text

  @device_authenticity_429.2_too_many_requests
  Scenario: API rate limit has been exceeded
    Given the API consumer has exceeded the rate limit for this API
    And the request body property "$.imei" is set to a valid IMEI
    When the request "checkImeiStatus" is sent
    Then the response status code is 429
    And the response property "$.status" is 429
    And the response property "$.code" is "TOO_MANY_REQUESTS"
    And the response property "$.message" contains a user friendly text
