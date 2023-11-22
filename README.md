<div align="center">
  
# [MatLab.](https://github.com/BrenoFariasdaSilva/MatLab) <img src="[Icon-Image-URL](https://github.com/BrenoFariasdaSilva/MatLab/blob/main/.assets/matlab.svg)"  width="3%" height="3%">

</div>

<div align="center">
  
---

My MatLab Drive Files.
  
---

</div>

<div align="center">

![wakatime](https://wakatime.com/badge/github/BrenoFariasdaSilva/MatLab.svg)

</div>


## Table of Contents
- [MatLab. ](#matlab-)
	- [Table of Contents](#table-of-contents)
	- [Introduction](#introduction)
	- [Requirements](#requirements)
		- [Install MatLab](#install-matlab)
	- [Setup](#setup)
		- [Clone the repository](#clone-the-repository)
	- [Contributing](#contributing)
	- [License](#license)
		- [Creative Commons Zero v1.0 Universal](#creative-commons-zero-v10-universal)


## Introduction

Detailed project description.

## Requirements
### Install MatLab
1. Download Matlab from [Here](https://matlab.mathworks.com/) and download it.
2. Then, run the following commands:

```bash
unzip -qq matlab*.zip -d matlab
cd matlab
sudo ./install
```

3. During the installation process, in the "Options" tab, select "Create Symbolic Links to MATLAB Scripts in" and select the folder `/usr/local/bin`.
4. To run the MATLAB directly using the Command line terminal, we have to create a Symbolic for its script, run the following command:

```bash
sudo ln -s /<path-to-your-matlab>/matlab /usr/local/bin/matlab
```

5. Lastly, install the MatLab Support Package, which also creates the Application Icon, run the following command:

```bash
sudo apt install matlab-support -y
```


## Setup

### Clone the repository
1. Clone the repository with the following command:

```bash
git clone https://github.com/BrenoFariasdaSilva/MatLab.git
cd MatLab
```

## Contributing
Code improvement recommendations are very welcome. In order to contribute, follow the steps below:

## License

### Creative Commons Zero v1.0 Universal
This project is licensed under the [Creative Commons Zero v1.0 Universal](LICENSE), which means you are free to use, modify, and distribute the code. See the [LICENSE](LICENSE) file for more details.
