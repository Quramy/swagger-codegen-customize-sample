#!/bin/sh

VERSION="2.1.4"
EXECUTABLE="swagger-codegen-cli-${VERSION}.jar"

TEMPLATE_DIR="custom-tmpl"
DIST_DIR="dist"

if [ ! -e "${EXECUTABLE}" ]; then
  wget https://repo1.maven.org/maven2/io/swagger/swagger-codegen-cli/${VERSION}/swagger-codegen-cli-${VERSION}.jar
fi

rm -rf ${DIST_DIR}

echo ""
echo "Generating HTML docs:"
java -jar ${EXECUTABLE} generate \
  -i ./simple-pet.json  \
  -o ${DIST_DIR}/html-docs \
  -l html

echo ""
echo "Generating with input JSON:"
java -jar ${EXECUTABLE} generate \
  -i ./simple-pet.json  \
  -o ${DIST_DIR}/with-input-json \
  -l typescript-angular

echo ""
echo "Generating with input JSON and custom template:"
java -jar ${EXECUTABLE} generate \
  -i ./simple-pet.json \
  -o ${DIST_DIR}/with-custom-template \
  -t ${TEMPLATE_DIR} \
  -l typescript-angular

echo ""
echo "Generating with input JSON and custom template:"
groovy custom-script.groovy generate \
  -i simple-pet.json \
  -o ${DIST_DIR}/with-custom-class \
  -t ${TEMPLATE_DIR} \
  -l MyTypescriptClientGen

