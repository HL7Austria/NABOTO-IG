/*##############################################################################
# Type:       FSH-File for an FHIR® Profile
# About:      Naboto Profile for Appointment.
# Created by: Naboto Software GmbH
##############################################################################*/

Profile:        NabotoAppointment
Parent:         Appointment
Id:             naboto-appointment
Title:          "Naboto Appointment Profile"
Description:    "Naboto Profile for appointment data. The Naboto Appointment is based upon the Appointment Resource."

/*##############################################################################
# Mark ignored fields
##############################################################################*/

* language 0..0
* contained 0..0
* cancelationReason 0..0
* serviceCategory 0..0
* serviceType 0..0
* specialty 0..0
* appointmentType 0..0
* reasonCode 0..0
* reasonReference 0..0
* priority 0..0
* supportingInformation 0..0
* minutesDuration 0..0
* slot 0..0
* comment 0..0
* patientInstruction 0..0
* basedOn 0..0
* requestedPeriod 0..0

/*##############################################################################
# Require start, end and status
##############################################################################*/
* start 1..1 MS
* end 1..1 MS
* status 1..1 MS

/*##############################################################################
# Define Participants
##############################################################################*/
* participant 2..* MS
// All Participants are scheduled for entire duration of appointment
* participant.period 0..0

// Reduce participants to Practitioners and Patients
* participant.actor only Reference(Patient or Practitioner) 
* participant.actor ^short = "Practitioner and/or Patient participating in appointment. Exactly one Patient and at least 1 Practitioner is required"
// Slices for individual cardinalities for Practitioners and Patient
* participant ^slicing.rules = #open
* participant ^slicing.discriminator.type = #value
* participant ^slicing.discriminator.path = "actor.type"
* participant ^slicing.ordered = false
// An appointment must have 1 Patient and at least 1 Practitioner
* participant contains patient 1..1 and practitioner 1..* MS
// Slice for Patient
* participant[patient].actor ^short = "Patient participating in appointment. Exactly 1 Patient is required"
* participant[patient].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#SBJ (exactly)
* participant[patient].status = https://hl7.org/fhir/R4/codesystem-participationstatus#accepted (exactly)
* participant[patient].actor 1..1
* participant[patient].actor.type = "Patient" (exactly)
* participant[patient].actor only Reference(Patient)
// Slice for Practitioner
* participant[practitioner].actor ^short = "Practitioner participating in appointment. A default practitioner will be automatically assigned to the Appointment if none is present."
* participant[practitioner].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#PPRF (exactly)
* participant[practitioner].required = http://hl7.org/fhir/participantrequired#required (exactly)
* participant[practitioner].status = https://hl7.org/fhir/R4/codesystem-participationstatus#accepted (exactly)
* participant[practitioner].actor 0..1
* participant[practitioner].actor.type = "Practitioner" (exactly)
* participant[practitioner].actor only Reference(Practitioner)

/*##############################################################################
# Custom ValueSets
##############################################################################*/
* status from NabotoAppointmentStatus
* status ^short = "pending | booked | arrived | fulfilled | cancelled | noshow | entered-in-error | checked-in"

/*##############################################################################
# Extensions
##############################################################################*/

// VirtualServiceContactDetails (based on https://jira.hl7.org/browse/FHIR-33341)
* participant.extension contains VirtualServiceContactDetail named virtualService 0..1

// Comments with 0..* and Annotation type
// * extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-Appointment.note named note 0..1
// backport of R5 appointment.note is not ready for usage yet. See https://chat.fhir.org/#narrow/stream/179166-implementers/topic/R5.20Appointment.2Enote.20in.20FHIR.204.2E0.2E1 
* extension contains NabotoNote named note 0..*
