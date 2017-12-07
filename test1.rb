require 'weka'
# puts Weka::Classifiers::Trees::RandomForest.description
instances = Weka::Core::Instances.from_arff('fin.arff')
instances.class_attribute = :yield_ton_hect

classifier = Weka::Classifiers::Trees::RandomForest.build do
    # use_options '-depth 3 -S 0'
    train_with_instances instances
end

evaluation = classifier.cross_validate(folds: 10)

puts evaluation.summary + "\n"
# puts classifier.distribution_for([1, :Orissa, 1, 1, 2012, :NULL, 20, 5, 122.2017, '?']).first.fetch(1)

puts classifier.distribution_for([1, :'Arunachal Pradesh', 1, 1, 2017, 12345, 20, 123.0, '?'])

# instances.map do |instance|
#     puts classifier.classify(instance)
# end