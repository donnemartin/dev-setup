# Configure the necessary Spark environment
import os
import sys


# Note: Some Spark installations do not need the extra libexec path
spark_home = os.environ.get('SPARK_HOME', None)
sys.path.insert(0, spark_home + "/libexec/python")

# Add the py4j to the path.
# You may need to change the version number to match your install
sys.path.insert(0, os.path.join(spark_home, 'libexec/python/lib/py4j-0.8.2.1-src.zip'))

# Initialize PySpark to predefine the SparkContext variable 'sc'
execfile(os.path.join(spark_home, 'libexec/python/pyspark/shell.py'))