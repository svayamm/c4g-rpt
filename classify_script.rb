require "java"
load "./weka.jar"

java_import "java.io.FileReader"
java_import "weka.core.Instances"
java_import "weka.core.Attribute"
java_import "weka.core.DenseInstance"
java_import "weka.classifiers.trees.RandomForest"
java_import "weka.classifiers.AbstractClassifier"
java_import "weka.classifiers.evaluation.Evaluation"

file = FileReader.new ARGV[0]
data = Instances.new file

# puts Weka::Classifiers::Trees::RandomForest.description
# instances = Weka::Core::Instances.from_arff('fin.arff')
data.setClass(data.attribute(8)) # 8 = index (col num) of yield_ton_hect
# puts data.classAttribute()
rFModel = RandomForest.new
rFModel.buildClassifier(data)

    # use_options '-depth 3 -S 0'
# train_with_instances data
# puts rFModel
# # print rFModel
# puts rFModel.getCapabilities()

eval = Evaluation.new data
eval.evaluateModel(rFModel, data)
puts eval.toSummaryString()


# rando = java.util.random.Random()
# # crossValidateModel(Classifier classifier, Instances data, int numFolds, java.util.Random random
# eval.crossValidateModel(rFModel, data, 10, rando)
# puts eval.toSummaryString()
# puts evaluation.summary + "\n"
 

inst = DenseInstance.new 9
inst.setValue(data.attribute(0), 1)
inst.setValue(data.attribute(1), 'Arunachal Pradesh')
inst.setValue(data.attribute(2), 1)
inst.setValue(data.attribute(3), 1)
inst.setValue(data.attribute(4), 2017)
inst.setValue(data.attribute(5), 12345)
inst.setValue(data.attribute(6), 20)
inst.setValue(data.attribute(7), 122.202)
# puts inst
# # puts classifier.distribution_for([1, :Orissa, 1, 1, 2012, :NULL, 20, 5, 122.2017, '?']).first.fetch(1)
inst.setDataset(data)
puts rFModel.distributionForInstance(inst)[0]
# puts classifier.distribution_for([1, :'Arunachal Pradesh', 1, 1, 2017, 12345, 20, 123.0, '?'])

# instances.map do |instance|
#     puts classifier.classify(instance)
# end
# data.numInstances.times do |i|
#     cluster = "UNKNOWN"
#     begin
#       cluster = kmeans.clusterInstance(data.instance(i))
#     rescue java.lang.Exception
#     end
#     puts "#{data.instance(i)},#{cluster}"
#   end