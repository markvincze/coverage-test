If (Test-Path ./coverage) {
  Remove-Item ./coverage -Recurse
}
New-Item ./coverage -Type Directory

If (Test-Path src/CoverageTest/bin) {
  Remove-Item src/CoverageTest/bin -Recurse
}
If (Test-Path src/CoverageTest/obj) {
  Remove-Item src/CoverageTest/obj -Recurse
}

If (Test-Path test/CoverageTest.UnitTests/bin) {
  Remove-Item test/CoverageTest.UnitTests/bin -Recurse
}
If (Test-Path test/CoverageTest.UnitTests/obj) {
  Remove-Item test/CoverageTest.UnitTests/obj -Recurse
}

dotnet restore

dotnet build **/project.json -c Release -f net462

packages/OpenCover.4.6.519/tools/OpenCover.Console.exe -target:"c:\Program Files\dotnet\dotnet.exe" -targetargs:"test -c Release -f net462 test/CoverageTest.UnitTests" -mergeoutput -hideskipped:File -output:coverage/coverage.xml -oldStyle -searchdirs:"test/CoverageTest.UnitTests/bin/Release/net462/win7-x64" -register:user -filter:"+[Coverage*]*"

packages/ReportGenerator.2.4.5.0/tools/ReportGenerator.exe -reports:coverage/coverage.xml -targetdir:coverage -verbosity:Error
