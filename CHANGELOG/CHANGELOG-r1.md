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

### Added

* Initial API definition for `POST /check-status` to verify the register status of a mobile device using its IMEI against operator-maintained allowed, prohibited, and tracked lists
* `operationalStatus` in the response covering all device statuses: `allowed`, `lost`, `stolen`, `blacklisted`, `blocked`, `fraud`, `non-payment`, `regulatory`, and `unknown`
* `reportedDate` field indicating when the IMEI was reported with a negative status, when available
* `lastChecked` field indicating when the status information was last verified by the service
* Test definitions (Gherkin feature file) covering status check scenarios, error handling, and security flows
* API documentation and inline OpenAPI description including authorization, error handling, and request body strictness templates

**Full Changelog**: https://github.com/camaraproject/DeviceAuthenticity/commits/r1.1
