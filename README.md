# ZippyClippy: Azure functions
Learn to create and consume Azure functions with Clippy

## Prerequisites
You'll need
- [Postman](https://www.getpostman.com)
- [A GitHub account](https://github.com/login)
- A git client of your choice. I like [GitKraken](https://www.gitkraken.com).
- Access to Azure

### Mac
- [Xcode](https://developer.apple.com/xcode/resources/)
- [Visual Studio Code](https://code.visualstudio.com)
- [Homebrew](https://brew.sh)
- Python3 (install: `brew install python`)
- Azure funtions core tools (install: `brew tap azure/functions` then `brew install azure-functions-core-tools`)

### Windows
- [Visual Studio](https://visualstudio.microsoft.com/vs/)

## Getting Started
Currently Windows 10 and macOS 10.14 are supported. To get started, clone or download this repository. 

## Azure function
[Click here](./AzureFunction/ZippyClippy) to find the function written in Python3. 

There are two ways to complete this workshop: you can build a function from scratch or you can **deploy** the existing function if you'd like to get get going quickly. If you're attending one of my workshops, please **start from scratch**.

### Start from scratch
#### Mac
Make sure all required software is downloaded and installed. Next, open Terminal and `cd` to the correct directory. 
Then paste the following command. Make sure to replace `<FunctionAppName>` with your own function app name. We'll use `ZippyClippy` as a function app name in my workshop. 
`func init <FunctionAppName> --worker-runtime python`

Next, `cd` to the folder titled `<FunctionAppName>`. 

Run `func new` to create a new function. When asked, choose `HTTP trigger`, then use `ZippyClippy` as a name when you're asked to provide one. 

Now open `__init__.py` in Visual Studio Code to edit the function. 

#### Windows


### Debugging the function
#### Mac
run `func host start`

Use Postman to test the function. The URL will be provided in Terminal. 

#### Windows

### Deploy


## Mac Client
[Click here](./Mac-ZippyClippy) to find the macOS client. 

macOS 10.14 is currently the only tested version. Other versions might work. 

## Windows Client

## License
[MIT License](./LICENSE.md)

## Contributors
[Robert Horrion](https://twitter.com/RobertHorrion)