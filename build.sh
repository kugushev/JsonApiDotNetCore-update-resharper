dotnet build -c Release


bash CommandLineTools/inspectcode.sh JsonApiDotNetCore.sln --no-build --output=".\my_temp" --properties:Configuration=Release --severity=WARNING --verbosity=VERBOSE -dsl=GlobalAll -dsl=GlobalPerProduct -dsl=SolutionPersonal -dsl=ProjectPersonal
