# System.Runtime.Serialization.Formatters.Soap.Commands
 
 Dieses PowerShell Module enthält Funktionen mit deren Hilfe Objekte im Soap-Format serialisiert und deserialisiert werden können.

## Voraussetzungen

Um dieses Module nutzen zu können, ist .Net Standard notwendig. Dies sollte bei Windows Systemen standardmäßig zur Verfügung stehen.

## Installation

Kopieren Sie das Module in eins der PowerShell Module Pfade.

## Verwendung

In diesem Beispiel wird gezeigt und erläutert, wie das Module verwendet werden kann.

```powershell
# Importieren des Moduls
Import-Module System.Runtime.Serialization.Formatters.Soap.Commands

# Pfad angegeben
$TargetPath = "C:\test.soap"

# Serialisiert das Objekt
ConvertTo-SoapFile -File $TargetPath -InputObject $host

# Deserialisiert die angegebene Datei.
ConvertFrom-SoapFile -File $TargetPath

```

## Hinweis

Das Module verwendet Klassen des Namepaces [System.Runtime.Serialization.Formatters.Soap], mit denen die Umsetzung vereinfacht wird.