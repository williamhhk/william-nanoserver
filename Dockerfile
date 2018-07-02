
FROM microsoft/nanoserver:latest

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# msi does not work in nano
ENV JAVA_PKG=Java.zip 
ENV JAVA_HOME C:\\Java\\jre1.8.0_171\\bin
ADD $JAVA_PKG /

RUN Expand-Archive -Path C:\Java.zip -DestinationPath C:\ ;  \
	Remove-Item C:\Java.zip ;  
#	$env:Path+=";C:\Java\jre1.8.0_171\bin" ;
RUN $newPath = ('{0};{1}' -f  $env:JAVA_HOME, $env:PATH); \
	setx /M PATH $newPath;
	
CMD [ "java.exe" ]
