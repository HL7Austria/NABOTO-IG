/*##############################################################################
# Type:       FSH-File for an FHIR® Profile
# About:      Naboto Profile for Patient.
# Created by: Naboto Software GmbH
##############################################################################*/

Profile:        NabotoPatient
Parent:         HL7ATCorePatient
// Parent:         http://hl7.at/fhir/HL7ATCoreProfiles/4.0.1/StructureDefinition/at-core-patient
Id:             naboto-patient
Title:          "Naboto Patient Profile"
Description:    "Naboto Profile for patient data. The Naboto Patient is based upon the HL7ATCorePatient Profile."

// Disable fields and extensions
* contained 0..0
* language 0..0
* contact 0..0
* deceased[x] 0..0
* maritalStatus 0..0
* multipleBirth[x] 0..0
* photo 0..0
* communication 0..0
* generalPractitioner 0..0
* managingOrganization 0..0
* link 0..0
* extension[citizenship] 0..0
* extension contains PatientReligion named PatientReligion 0..0

// Required fields
* active 1..1 MS
* gender 1..1 MS

// Slice for usual name
* name ^slicing.rules = #open
* name ^slicing.discriminator.type = #value
* name ^slicing.discriminator.path = "use"
* name ^slicing.ordered = false
* name contains usualName 1..1 MS
* name[usualName].use = http://hl7.org/fhir/name-use#usual (exactly)

// Slice for telecom
* telecom ^slicing.rules = #open
* telecom ^slicing.discriminator.type = #value
* telecom ^slicing.discriminator.path = "system"
* telecom ^slicing.ordered = false
* telecom contains email 0..1 MS and sms 0..1 MS
* telecom[email].system = http://hl7.org/fhir/contact-point-system#email (exactly)
* telecom[sms].system = http://hl7.org/fhir/contact-point-system#sms (exactly)
