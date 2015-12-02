@Grab('io.swagger:swagger-codegen-cli:2.1.4')
import io.swagger.codegen.*;
import io.swagger.codegen.languages.*;

class MyTypescriptClientGen extends AbstractTypeScriptClientCodegen {
  
  String name = "my-typescript"
  String help = "Custom Typescript code generator"

  MyTypescriptClientGen() {
    super()
    this.modelTemplateFiles["model.mustache"] = ".ts"
    this.apiTemplateFiles["api.mustache"] = ".ts"
    this.apiPackage = "API.Client"
    this.modelPackage = "API.Client"
    this.supportingFiles.add(new SupportingFile("api.d.mustache", apiPackage().replaceAll(/\./, "${File.separatorChar}"), "api.d.ts"))
    this.typeMapping.DateTime = "string";
  }

  public static main(String[] args) {
    SwaggerCodegen.main(args)
  }

}
