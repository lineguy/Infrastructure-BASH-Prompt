# Infrastructure-BASH-Prompt

Infrastructure-BASH-Prompt is a basic bash script for setting up PS1 bash prompt on severs. It allows you to easily colourize and seperate out & reorder parts of the hostname / FQDN.

## Getting Started

### Prerequisites

__Disclaimer:__ _this has only been tested on Ubuntu Linux._

### Installation

You can use the below command to download the `.ps1` file and setup the source in your `.bashrc` file:
```
git clone https://github.com/lineguy/Infrastructure-BASH-Prompt.git && mv Infrastructure-BASH-Prompt/.ps1 ~ && printf "if [ -f ~/.ps1 ]; then\n     source ~/.ps1\nfi\n" >> ~/.bashrc
```

### Configuration

You can edit the script to get it to do what you would like relativly easily by editing the variables / cut commands at the top of the script:

#### EXAMPLES
```
STRING="msa-dev-server1"
```
![alt text](https://i.imgur.com/)
```
STRING="aws-qa-server2"
```
![alt text](https://i.imgur.com/)
```
STRING="gcp-prod-server3"
```
![alt text](https://i.imgur.com/)

### Why would I want to use this script?

This is pretty simple, if you are running a large infrastructure and would like to be easily tell if you are on a production/staging/qa/testing/dev system, you can just look at your prompt and the colour will be different. Quick and easy way to set this up. 
