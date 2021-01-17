# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
include ActionView::Helpers::TextHelper

MANAGER = ['Joey P', 'Sean S', 'Matt M', 'Tony B', 'Allyson H', 'Rob S', 'Doug G', 'Robbie R']
FOREMAN = ['Adam S', 'Allen B', 'Chris D', 'Dustin P', 'Jesse S', 'Joel T', 'Josh G','RD L','Marcus P','Mark B', 'Jeff J' ]
LINER = ['', '0.5 - R2.2', '1.0 - R4.2', '2.0 - R6.3', '1.0 - ArmaFlex','1.5 - ArmaFlex','2.0 - ArmaFlex', '1.0 - K-Flex','Neoprene', 'Spiracoustic']
DEPT = ['Specialty','Industrial','HVAC','Laser']

UM = ['box', 'pallet','roll','piece','lb','crate','skid']

50.times {
    Job.create(job_number: rand(4000..21250),name: (Faker::Lorem.word).capitalize, manager: MANAGER[rand(0..(MANAGER.size - 1))], foreman: FOREMAN[rand(0..(FOREMAN.size - 1))])
}

DATA = {
    :statuses => ['ASAP', 'Cancelled', 'Charged', 'Complete', 'Delivered', 'Picked Up', 'In Progress', 'Partial', 'Loaded', 'OnSite', 'Ready', 'Staged', 'Trash', 'On Hold'],
    :locations => ['Welding', 'Angle', 'Duct', 'Break', 'Laser', 'Shop Office', 'Rcv Office', 'Outside', 'Bldg A', 'Bldg B', 'Bdlg C', 'Bldg D', 'Cage 1', 'Cage 2', 'Cage 3', 'Cage 4', 'Cage 5', 'Cage 6', 'Cage 7', 'Cage 8', 'Cage 9', 'Cage 10', 'Cage 11', 'Cage 12'],
    :truck_keys => ['description', 'make', 'model', 'accepts_cage'],
    :trucks => [
        ['Truck 5', 'International', '7400', true],
        ['Truck 11', 'GMC', 'C6500', true],
        ['Truck 12', 'Ford', 'F-350'],
        ['Truck 13', 'Ford', 'F-550'],
        ['Truck 14', 'Chevrolet', 'Colorado'],
        ['Truck 17', 'GMC', 'Sierra 1500'],
        ['Truck 19', 'Ford', 'F-150'],
        ['Truck 20', 'Chevrolet', 'Colorado'],
        ['Truck 23', 'Chevrolet', 'Kodiak C7500'],
        ['Truck 24', 'Ford', 'F-150'],
        ['Truck 35', 'Mack', 'RD688S', true],
        ['Truck 25', 'Ford', 'F-150'],
        ['Truck 39', 'International', '4200', true],
        ['Flatbed', 'Chevrolet', 'W3500'],
        ['Box Truck 3', 'GMC', 'Savana g33903'],
        ['Box Truck 9', 'Ford', 'E350'],
        ['Conway','Freightliner',''],
        ['Landstar','Freightliner',''],
        ['Metro','Freightliner',''],
        ['Old Dominion','Freightliner',''],
        ['SWT','Freightliner','']
    ]
}

DATA[:locations].each { |location| Location.create(name: location)}
DATA[:statuses].each { |status| Status.create(description: status)}

DATA[:trucks].each do |truck|
    new_truck = Truck.new
    truck.each_with_index do |attribute, i|
        new_truck.send(DATA[:truck_keys][i] + "=", attribute)
    end
    new_truck.save
end

vendor = []
10.times {
    vendor << Faker::Company.industry
    vendor << Faker::Space.galaxy
    vendor << Faker::IndustrySegments.sector
    vendor <<  Faker::Company.name
}

vendor = vendor.uniq

1000.times {
    Build.create(
        date_received: Faker::Date.between(from: 1.year.ago, to: Date.today),
        job_id: rand(0..49),
        subjob_code: rand(0..10).to_s.rjust(3,'0'),
        description: Faker::Hipster.sentence(word_count: rand(1..3), supplemental: false, random_words_to_add: rand(1..4)),
        location_id: rand(0..(DATA[:locations].size - 1)),
        status_id: rand(0..(DATA[:statuses].size - 1)),
        notes: Faker::Hipster.sentences(number: rand(0..3)).join(''),
        to_number:"TO-#{6.times.map{rand(6)}.join}",
        weight: rand(1..15000),
        liner: LINER[rand(0..(LINER.size - 1))],
        sq_ft: rand(0..2543),
        dept: DEPT[rand(0..(DEPT.size - 1))]
    )
    
    Order.create(
        date_received: Faker::Date.between(from: 1.year.ago, to: Date.today),
        job_id: rand(0..49),
        subjob_code: rand(0..10).to_s.rjust(3,'0'),
        description: Faker::Hipster.sentence(word_count: rand(1..3), supplemental: false, random_words_to_add: rand(1..4)),
        po_number:"PO-#{5.times.map{rand(5)}.join}",
        ticket_number:"LX_#{6.times.map{rand(6)}.join}",
        location_id: rand(0..(DATA[:locations].size - 1)),
        vendor: vendor[rand(0..(vendor.size - 1))],
        pc_ct: "#{rand(1..15)} #{UM[rand(0..(UM.size - 1))]}",
        notes: Faker::Hipster.sentences(number: rand(0..3)).join('')
    )
}



