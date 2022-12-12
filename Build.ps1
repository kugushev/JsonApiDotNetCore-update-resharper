function CheckLastExitCode {
    param ([int[]]$SuccessCodes = @(0), [scriptblock]$CleanupScript=$null)

    if ($SuccessCodes -notcontains $LastExitCode) {
        throw "Executable returned exit code $LastExitCode"
    }
}

function RunInspectCode {
    $outputPath = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), 'jetbrains-inspectcode-results.xml')
    
     Write-Output "InspectCode start " $outputPath 

    dotnet exec --runtimeconfig "CommandLineTools/inspectcode.unix.runtimeconfig.json" CommandLineTools/inspectcode.exe JsonApiDotNetCore.sln --no-build --output=".\my_temp" --properties:Configuration=Release --severity=WARNING --verbosity=VERBOSE -dsl=GlobalAll -dsl=GlobalPerProduct -dsl=SolutionPersonal -dsl=ProjectPersonal
    #dotnet exec --runtimeconfig "CommandLineTools/inspectcode.unix.runtimeconfig.json" CommandLineTools/inspectcode.exe JsonApiDotNetCore.sln
    CheckLastExitCode

    Write-Output "InspectCode execution has completed."
}

dotnet tool restore
CheckLastExitCode

dotnet build -c Release
CheckLastExitCode

RunInspectCode
