
# Novium Installer

> [!WARNING]
> This is **NOT** the binary releases for Novium. This is simply to make the installer.
> If you are looking for the main repository, please go to [https://github.com/HauberDevs/Novium](https://github.com/HauberDevs/Novium)

This contains the needed files for making a setup executable for Novium.

1. First off, download [Inno Setup Version 5.6.1 (a)](https://files.jrsoftware.org/is/5/innosetup-5.6.1.exe) and install it. **Make sure it is the 32bit version otherwise you may run into issues installing the software on XP!**

2. Drag the Setup files into a VM window and/or unpack the archive then open the **novium-make.iss** file inside that to open the file.
![pic](https://snipboard.io/tWabCj.jpg)

> [!CAUTION]
> Before doing anything, please first mark the **AppId** variable and go to **Tools -> Generate GUID** and generate a new GUID.
> This is to make sure that your app does not conflict with the official Novium Installer!
> ![How to change App GUID](https://snipboard.io/0zc7Aj.jpg)

3. Make sure the paths match the location where the distribution releases of Novium aswell as other needed files are located. If this the script cannot find those files, the script fails to compile.

4. Do any changes in the script as you desire.

5. Either run the setup to test it by clicking on the green play button in the toolbar or go to **Build -> Compile** or press **CTRL+F9** to compile the setup. If all goes well, you will find the appriopriate version in the "installerbin" folder located in the same directory as the novium-make.iss file.

That's it! You can now distribute the setup if you like. Please just don't claim that you made the application :)
