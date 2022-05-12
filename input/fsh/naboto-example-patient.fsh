/*##############################################################################
# Type:       FSH-File for an FHIR® Example
# About:      Example for the NabotoPatient Profile based on the HL7 Austria FHIR® Core Profile for Patient.
# Created by: Naboto Software GmbH
##############################################################################*/

Instance:    NabotoPatientExample
InstanceOf:  NabotoPatient
Description: "Example for the usage of the NabotoPatient Profile"
Usage:       #example

* identifier[0].use = #official
* identifier[=].type = http://terminology.hl7.org/CodeSystem/v2-0203#SS "Social Security Number"
* identifier[=].system = "urn:oid:1.2.40.0.10.1.4.3.1"
* identifier[=].value = "1111241261"
* identifier[=].assigner.display = "Dachverband der österreichischen Sozialversicherungsträger"

* identifier[+].use = #official
* identifier[=].type = http://terminology.hl7.org/CodeSystem/v2-0203#PI "Patient internal identifier"
* identifier[=].system = "https://third-party-system/Patients"
* identifier[=].value = "0815"
* identifier[=].assigner.display = "Ein GDA in Österreich"

* active = true

* name.use = http://hl7.org/fhir/name-use#usual
* name.family = "Mustermann"
* name.given = "Max"
* name.prefix = "DI"

* telecom[0].use = 	http://hl7.org/fhir/contact-point-use#home
* telecom[0].system = http://hl7.org/fhir/contact-point-system#email
* telecom[0].value = "notarealemail@naboto.com"
* telecom[1].use = 	http://hl7.org/fhir/contact-point-use#mobile
* telecom[1].system = http://hl7.org/fhir/contact-point-system#sms
* telecom[1].value = "+436641234567890"
 
* gender = http://hl7.org/fhir/administrative-gender#male

* birthDate = 1970-01-01

* address = HL7ATCoreAddressExample01
