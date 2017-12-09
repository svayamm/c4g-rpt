require "java"
load "./weka.jar"

java_import "java.io.FileReader"
java_import "weka.core.Instances"
java_import "weka.core.Attribute"
java_import "weka.core.DenseInstance"
java_import "weka.classifiers.trees.RandomForest"
java_import "weka.classifiers.AbstractClassifier"
java_import "weka.classifiers.evaluation.Evaluation"
# java_import "org.jruby.Ruby"

file = FileReader.new ARGV[0]
data = Instances.new file

data.setClass(data.attribute(8)) 
# 8 = index (column number) of yield_ton_hect

rFModel = RandomForest.new
rFModel.buildClassifier(data)

# eval = Evaluation.new data
# eval.evaluateModel(rFModel, data)
# puts eval.toSummaryString()

# construct = Random.java_class.constructor()
# rando = construct.new_instance()
# rando = Random.new
# crossValidateModel(Classifier classifier, Instances data, int numFolds, java.util.Random random
# eval.crossValidateModel(rFModel, data, 10.to_java(:int), Ruby.getRandom())
# puts eval.toSummaryString()
 
inst = DenseInstance.new 9
inst.setValue(data.attribute(0), 1) # Crop
inst.setValue(data.attribute(1), 'Arunachal Pradesh') # State
inst.setValue(data.attribute(2), 1) # District
inst.setValue(data.attribute(3), 1) # Season
inst.setValue(data.attribute(4), 2017) # Year
inst.setValue(data.attribute(5), 12345) #Total cost of cultivation
inst.setValue(data.attribute(6), 20) # Temperature
inst.setValue(data.attribute(7), 122.202) # Rainfall
inst.setDataset(data)

open('myfile.txt', 'w') do |f|
    f.puts rFModel.distributionForInstance(inst)[0]
end
