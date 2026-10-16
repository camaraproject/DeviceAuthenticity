# Changelog DeviceAuthenticity

<!-- TOC:START -->
## Table of Contents
- [r1.1](#r11)
<!-- TOC:END -->

**Please be aware that the project will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until it has been released. For example, changes may be reverted before a release is published. For the best results, use the latest published release.**

The below sections record the changes for each API version in each release as follows:

* for an alpha release, the delta with respect to the previous release
* for the first release-candidate, all changes since the last public release
* for subsequent release-candidate(s), only the delta to the previous release-candidate
* for a public release, the consolidated changes since the previous public release

# r1.1

## Release Notes

This pre-release contains the definition and documentation of
* device-authenticity 0.1.0-alpha.1

The API definition(s) are based on
* Commonalities r4.4 (0.9.0)
* Identity and Consent Management r4.2 (0.5.0)

## device-authenticity 0.1.0-alpha.1

**device-authenticity 0.1.0-alpha.1 is the first alpha version of this API.**

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/DeviceAuthenticity/r1.1/code/API_definitions/device-authenticity.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/DeviceAuthenticity/r1.1/code/API_definitions/device-authenticity.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/DeviceAuthenticity/blob/r1.1/code/API_definitions/device-authenticity.yaml)

### Breaking changes

* N/A

### Added

* Initial API definition for IMEI-based device status verification via `POST /check-status`
* Register model covering three operator-managed lists: allowed list, prohibited list (lost, stolen, blacklisted, blocked, fraud, non-payment, regulatory), and tracked list (gray list)
* `operationalStatus` response field covering all register outcomes including the `allowed` status
* `reportedDate` field indicating when a device was reported with its current negative status — present when applicable
* `lastChecked` timestamp in all responses showing when the register information was last verified
* Basic test definitions covering all nine operational status paths and IMEI validation scenarios
* API documentation

### Changed

* N/A

### Fixed

* Corrected duplicate step numbering in the Status Determination Logic (steps 8 and 9 were both labelled 4)
* Broadened `reportedDate` description to cover all negative statuses, not just blacklisted devices
* Removed undefined `prohibitedReason` reference from the API description
* Made `reportedDate` optional in the `ImeiStatus` schema — it is conditionally present, not included in every response
* Added missing `type: object` declaration to the `CommonResponseBody` schema
* Standardised `x-correlator` header casing to lowercase per CAMARA common spec
* Flattened the `operationalStatus` schema to align with the 200 response examples

### Removed

* N/A

**Full Changelog**: https://github.com/camaraproject/DeviceAuthenticity/commits/r1.1
