#-------------------------------------
#
# Module: System.Runtime.Serialization.Formatters.Soap.Commands
#
# Description: 
# Dieses PowerShell Module stellt Funktionen zur Verfügung mit der Hilfe 
# Objekte im Soap-Format serialisiert und deserialisiert werden können.
#
# Namespace: System.Runtime.Serialization.Formatters.Soap
# Assemblies: System.Runtime.Serialization.Formatters.Soap.dll
#
#-------------------------------------

Add-Type -AssemblyName System.Runtime.Serialization.Formatters.Soap

# Deserialisiert den angegebenen Stream in ein Objektdiagramm.
function ConvertFrom-SoapFile
{
    [CmdletBinding()]
    [Alias()]
    Param
    (
        # Hilfebeschreibung zu Param1
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        [String] $File
    )

    Begin
    {
        if (-not(Test-Path -Path $File)) { throw "File not found."}
    }
    Process
    {
        [System.IO.FileStream] $FileStream = [System.IO.FileStream]::new($File, [System.IO.FileMode]::Open)
        [System.Runtime.Serialization.Formatters.Soap.SoapFormatter] $SoapFormatter = [System.Runtime.Serialization.Formatters.Soap.SoapFormatter]::new()
        $OutputObject = $SoapFormatter.Deserialize($FileStream)
        return $OutputObject
    }
    End
    {
        $FileStream.Close()
    }
}

# Serialisiert das Objekt oder das Objektdiagramm mit dem angegebenen obersten Element (Stamm) in den angegebenen Stream.
function ConvertTo-SoapFile
{
    [CmdletBinding()]
    [Alias()]
    Param
    (
        # Hilfebeschreibung zu Param1
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        [String] $File,

        # Hilfebeschreibung zu Param2
        [System.Object]
        $InputObject
    )

    Begin
    {
    }
    Process
    {
        [System.IO.FileStream] $FileStream = [System.IO.FileStream]::new($File, [System.IO.FileMode]::Create)
        [System.Runtime.Serialization.Formatters.Soap.SoapFormatter] $SoapFormatter = [System.Runtime.Serialization.Formatters.Soap.SoapFormatter]::new()
        $SoapFormatter.Serialize($FileStream, $InputObject)
    }
    End
    {
        $FileStream.Close()
    }
}
