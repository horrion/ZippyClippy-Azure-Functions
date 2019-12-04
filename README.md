# ZippyClippy: Azure functions

Learn to create and consume Azure functions with Clippy

## Prerequisites

You'll need

- [Postman](https://www.getpostman.com)
- [Visual Studio Code](https://code.visualstudio.com)
- Access to Azure

### Mac

- [Xcode](https://developer.apple.com/xcode/resources/)
- [Homebrew](https://brew.sh)
- Python3 (install: `brew install python`)
- Azure funtions core tools (install: `brew tap azure/functions` then `brew install azure-functions-core-tools`)
- PowerShell (install: `brew cask install powershell`)
- Az PowerShell Module (install in PowerShell: `Install-Module -Name Az -AllowClobber -Scope CurrentUser`)

### Windows

- [Visual Studio](https://visualstudio.microsoft.com/vs/)
- [Node.js with NPM](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
- [Python3](https://www.python.org/downloads/windows/)
- Azure functions core tools (install: `npm install -g azure-functions-core-tools`)
- PowerShell
- Az PowerShell Module (install in PowerShell: `Install-Module -Name Az -AllowClobber -Scope CurrentUser`)

## Getting Started

Currently Windows 10 and macOS 10.14 are supported. To get started, clone or download this repository. 

## Azure function

[Click here](./AzureFunction/ZippyClippy) to find the function written in Python3. 

There are two ways to complete this workshop: you can build a function from scratch or you can **deploy** the existing function if you'd like to get get going quickly. If you're attending one of my workshops, please **start from scratch**.

### API Documentation

If you're using the Azure function provided in this repository, you'll have to supply REST API with the following data for it to work: 

Parameters

- fileName (a string such as "testfile")
- fileNameExtension (a string such as "png" or "wav")

Body

- a binary file

### Start from scratch

Make sure all required software is downloaded and installed. Next, open Terminal and `cd` to the correct directory. 
Then paste the following command. Make sure to replace `<FunctionAppName>` with your own function app name. We'll use `ZippyClippy` as a function app name in my workshop. 
`func init <FunctionAppName> --worker-runtime python`

Next, `cd` to the folder titled `<FunctionAppName>`. 

Run `func new` to create a new function. When asked, choose `HTTP trigger`, then use `ZippyClippy` as a name when you're asked to provide one. 

Now open `__init__.py` in Visual Studio Code to edit the function. 

### Debugging the function

run `func host start`

Use Postman to test the function. The URL will be provided in Terminal. 

### Deploy

Create a function app in Azure portal, then open a PowerShell session (Mac: `pwsh` in Terminal). Connect to Azure Account using Az Cmdlet: `Connect-AzAccount`

then run
`func azure functionapp publish ZippyClippy`

## Mac Client

[Click here](./Mac-ZippyClippy) to find the macOS client. 

macOS 10.14 is currently the only tested version. Other versions might work. 

## Windows Client

[Click here](./Windows-ZippyClippy) to find the Windows client. 

Windows 10 is currently the only tested version. Other versions might work. 

## License

[MIT License](./LICENSE.md)

## Contributors

[Robert Horrion](https://twitter.com/RobertHorrion)