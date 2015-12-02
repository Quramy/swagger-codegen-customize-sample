# swagger-codegen customize-sample
This is a sample repository for customizing [swagger-codegen](https://github.com/swagger-api/swagger-codegen)'s output.

## How to customize and run swagger-codegen ?

You need to make a Java class which implements `io.swagger.codegen.CodegenConfig` and need to execute swagger-codegen.jar with adding the class into classpath.

I recommend to write a groovy script.
See `custom-script.groovy` in this repo.
It has two function:

1. Customize: It extends swagger-codegen Class
1. Running: It kicks codegen CLI

It's so simple.
You don't need to install maven nor need to setting pom.xml.

Once you install [Groovy](http://www.groovy-lang.org/), execute the following cmd:

```sh
groovy custom-script.groovy generate \
  -l MyTypescriptClientGen \
  -t custom-tmpl  \
  -o dist/with-custom-class
```

The `-l` option specifies class name(FQCN) in the groovy script.
