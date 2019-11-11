import logging
import azure.functions as func
import sys
import tempfile
import zipfile
import shutil
import os.path


def main(req: func.HttpRequest) -> func.HttpResponse:

    # Next 4 lines are for debugging
    # logging.info(f"Headers: {req.headers}")
    # logging.info(f"Params: {req.params}")
    # logging.info(f"Route Params: {req.route_params}")
    # logging.info(f"Body: {req.get_body()}")

    #
    # Step 1: Define all variables
    #

    # Define inputFile as file that was received through HttpRequest
    inputFile = req.get_body()

    # Define fileName
    fileName = req.params.get('fileName')
    if not fileName:
        try:
            req_body = req.get_json()
        except ValueError:
            pass
        else:
            fileName = req_body.get('fileName')

    # Define fileNameExtension
    fileNameExtension = req.params.get('fileNameExtension')
    if not fileNameExtension:
        try:
            req_body = req.get_json()
        except ValueError:
            pass
        else:
            fileNameExtension = req_body.get('fileNameExtension')

    # The following variables are now defined: 
    # 
    # fileName (provides the original file name)
    # fileNameExtension (provides file type info)
    # inputFile (the actual file transmitted)
    #

    #
    # Step 2: Zip the file
    #

    # Create Temp directory
    tempDir = tempfile.mkdtemp()

    # Join directory and file paths
    fileNameWithDirectory = os.path.join(tempDir, fileName+"."+fileNameExtension)

    # Create a new file in binary mode, write received data to it
    inputFileForTemp = open(fileNameWithDirectory, mode='wb')
    inputFileForTemp.write(inputFile)
    tempfileNameInput = inputFileForTemp.name

    # zip the file
    zippedFile = open(shutil.make_archive(fileName, 'zip', tempDir), 'rb').read()

    # Next line is for debugging
    # logging.info(f"tempfile: {tempfileNameInput}")

    #
    # Step 3: Return the zipped file
    #

    # Respond to presence/non-presence of fileName
    if fileName:
        # Respond to presence/non-presence of fileNameExtension
        if fileNameExtension:
            # Respond to presence/non-presence of inputFile
            if inputFile:
                # return func.HttpResponse(f"fileName is {fileName}, \nfileNameExtension is {fileNameExtension}, \nfile size is {fileSize} bytes")
                return func.HttpResponse(zippedFile)
            else:
                return func.HttpResponse(
                    "no file found in body",
                    status_code=400
                )
        else:
            return func.HttpResponse(
                "Please pass a fileNameExtension on the query string",
                status_code=400
            )
    else:
        return func.HttpResponse(
             "Please pass a fileName on the query string",
             status_code=400
        )