#I will make a patient and doctor class
#Doctor can see 2 patients in 8 hour day
#patient: has a name, has appointments(1 per day)
# for now 6 patients, each patient can book an appointment, for starters they all want to book on one day
#doctor: has a name, has appointments(<16 per day)
# for now 1 doctor 
#Real world, I go in as a patient to the system. I select my doctor, i select a date. System will tell me avaiable or not available.
#i can model key, value? Per date, how many patients. 
#When i make an appointment, it should update both the patient, and the doctor objects
#before appointment made, need to check if doctor is available

module Appointment
  def add_appointment(date, person)
    @appointments[date] ||= [] 
    @appointments[date] << person.name
  end
end

class Patient
  attr_reader :name
  include Appointment
  def initialize(name)
    @name = name
    @appointments = {}
  end

  def make_appt(date, doctor, patient)
    if doctor.available?(date)
      doctor.add_appointment(date,patient)
      patient.add_appointment(date,doctor)
      puts "Congrats, appointment booked"
    else
      puts "Sorry, Doctor is not available"
    end
  end
end

class Doctor
  attr_reader :appointments, :name
  include Appointment
  def initialize(name)
    @name = name
    #appointment key = date, value = patient
    @appointments = {}
  end

  #instance method
  def available?(date)
    val = @appointments[date]
    
    return true if @appointments.empty? || val.nil? || val.length < 2
    return false
  end
end


class Start
  steve = Doctor.new('steve')
  barb = Patient.new('barb')
  carrie = Patient.new('carrie')
  liz = Patient.new('liz')
  james = Patient.new('james')
  barb.make_appt('5/12/18',steve,barb)
  carrie.make_appt('5/12/18',steve,carrie)
  puts steve.appointments
  liz.make_appt('5/13/18',steve,liz)
  puts steve.appointments
  james.make_appt('5/12/18',steve,james)
  puts steve.appointments

end

