set -eu

echo "java -jar Run/CCLearner_Feature.jar"
java -jar Run/CCLearner_Feature.jar

echo "java -jar Run/CCLearner_Train.jar"
java -jar Run/CCLearner_Train.jar

echo "java -jar Run/CCLearner_Test.jar"
java -jar Run/CCLearner_Test.jar