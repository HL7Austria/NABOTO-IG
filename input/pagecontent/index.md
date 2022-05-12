# Naboto Implementation Guide

This implementation guide was created by Naboto Software GmbH as documentation for their FHIR® based API.

The API allows integrating [Naboto][naboto-web] and the [Visit-e][visit-e-web] video consultation service into your software. This implementation guide (IG) serves as documentation of the possible workflows and datastructure of the exchanged JSON objects.

## Important notes
**Please note that this IG is still subject to review and minor changes might still occur. If you want to start implementing right away we recommend that you get in contact with us, so we can assist you. You can find our contact information at https://naboto.com. We are working on providing a test system for registered implementers.**

**Please also note that the HL7ATCorePatient and all related resources are currently linked incorrectly because they are not yet published on the FHIR registry. Therefor their URLs are displayed incorrectly. The correct documentation for all resources contained in `input/fsh/hl7-at` can be found at https://github.com/HL7Austria/HL7-AT-FHIR-Core-R4.**

[naboto-web]: https://naboto.com
[visit-e-web]: https://visit-e.at