/*##############################################################################
# Type:       FSH-File for an FHIR® Example
# About:      Example for the NabotoAppointment Profile based on the HL7 Austria FHIR® Core Profile for Appointment.
# Created by: Naboto Software GmbH
##############################################################################*/

Instance:    NabotoAppointmentExample
InstanceOf:  NabotoAppointment
Description: "Example for the usage of the NabotoAppointment Profile"
Usage:       #example

* extension[naboto-note][0].url = "http://fhir.naboto.com/4.0.1/NabotoProfiles/StructureDefinition/naboto-note"
* extension[naboto-note][0].extension[note].valueAnnotation.authorReference.reference = "https://naboto.com/patient/12345"
* extension[naboto-note][0].extension[note].valueAnnotation.authorReference.type = "Patient"
* extension[naboto-note][0].extension[note].valueAnnotation.authorReference.display = "Naboto Patient 12345"
* extension[naboto-note][0].extension[note].valueAnnotation.time = "2022-01-01T08:00:00.000Z"
* extension[naboto-note][0].extension[note].valueAnnotation.text = "Is this treatment covered by my insurance?"

* extension[naboto-note][1].url = "http://fhir.naboto.com/4.0.1/NabotoProfiles/StructureDefinition/naboto-note"
* extension[naboto-note][1].extension[note].valueAnnotation.authorReference.reference = "https://naboto.com/practitioner/987654321"
* extension[naboto-note][1].extension[note].valueAnnotation.authorReference.type = "Practitioner"
* extension[naboto-note][1].extension[note].valueAnnotation.authorReference.display = "Naboto Practitioner 987654321"
* extension[naboto-note][1].extension[note].valueAnnotation.time = "2022-01-01T09:15:00.000Z"
* extension[naboto-note][1].extension[note].valueAnnotation.text = "Patient asked for discrete treatment"

* identifier[0].system = "https://third-party-system/appointment"
* identifier[0].value = "11223344"

* status = http://hl7.org/fhir/appointmentstatus#booked

* start = "2022-02-02T11:00:00Z"

* end = "2022-02-02T12:00:00Z"

* created = "2022-01-01T11:11:11.111Z"

* participant[0].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#PPRF
* participant[0].actor.reference = "https://naboto.com/practitioner/987654321"
* participant[0].actor.type = "Practitioner"
* participant[0].actor.display = "Naboto Practitioner 987654321"
* participant[0].required = http://hl7.org/fhir/participantrequired#required
* participant[0].status = https://hl7.org/fhir/R4/codesystem-participationstatus#accepted
* participant[0].extension[VirtualServiceContactDetail].url = "http://fhir.naboto.com/4.0.1/NabotoProfiles/StructureDefinition/virtual-service-contact-detail"
* participant[0].extension[VirtualServiceContactDetail].extension[channelType].valueCoding = naboto-vidcall-channel-type#visit-e
* participant[0].extension[VirtualServiceContactDetail].extension[address].valueUrl = "https://patient.visit-e.at/abcdefghijklmn"
* participant[0].extension[VirtualServiceContactDetail].extension[sessionKey].valueString = "abcdefghijklmn"

* participant[1].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#SBJ
* participant[1].actor.reference = "https://naboto.com/patients/1337"
* participant[1].actor.type = "Patient"
* participant[1].actor.display = "Naboto Patient 1337"
* participant[1].status = https://hl7.org/fhir/R4/codesystem-participationstatus#accepted
* participant[1].extension[VirtualServiceContactDetail].url = "http://fhir.naboto.com/4.0.1/NabotoProfiles/StructureDefinition/virtual-service-contact-detail"
* participant[1].extension[VirtualServiceContactDetail].extension[channelType].valueCoding = naboto-vidcall-channel-type#visit-e
* participant[1].extension[VirtualServiceContactDetail].extension[address].valueUrl = "https://patient.visit-e.at/1234567890"
* participant[1].extension[VirtualServiceContactDetail].extension[sessionKey].valueString = "1234567890"
