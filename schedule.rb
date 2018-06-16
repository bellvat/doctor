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

class Patient
  def init(name)
    @name = name
    @appointments = []
  end
end

class Doctor
  def init(name)
    @name = name
    #appointment key = date, value = patient
    @appointments = {}
  end

  def add_appointment(date, patient)
    @appointments[date] = patient  
  end
  #instance method
  def available? 
    appointment
  end
end

class Appointment
  def check_available(doctor)
    doctor.check_available_method 
  end
end
