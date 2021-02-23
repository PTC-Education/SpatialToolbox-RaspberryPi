<p align="center">
<img src="Documentation-Images/Checkpoints.gif" width="700", height="394">
</p>

# **Table of Contents**
1. Install Raspberry Pi OS onto a MicroSD Card
2. Setup the Raspberry Pi
3. Installing the Vuforia Spatial Edge Server
4. Getting Onshape API Keys
5. Running the Server
6. Connecting the Spike Prime
7. Using the Vuforia Spatial Toolbox App
8. Placing Checkpoints


<details>
<summary style="font-size: 20px;"> **Step 1: Install Raspberry Pi OS onto a MicroSD Card**</summary>
<br>

- Go to [www.raspberrypi.org/software/](https://www.raspberrypi.org/software/) and download the Raspberry Pi Imager that works with your machine.
- Install the Raspberry Pi Imager and open it.
  - If you have a Mac and security preferences stop you from opening it, navigate to the Applications folder in Finder and right-click on the Imager to open it. You should then have the option to open it and disregard the warning.
- Click on the Choose OS button and select the Raspberry Pi OS (32-bit).

<p align="center">
<img src="Documentation-Images/Choose-OS.png" width="700" height="454">
</p>

- Choose the SD card you want to flash the image to.
  - If you don&#39;t see your SD card, make sure it is plugged in properly. Check Finder or File Explorer to see if it appears on your machine.
- Click the &quot;Write&quot; button to flash the image to the SD card. This may take a few minutes.

</details>

<details>
<summary style="font-size: 20px;"> **Step 2: Setup the Raspberry Pi**</summary>
<br>

**Note:** If you have previously set up a Raspberry Pi and have a preferred method, feel free to use that one. This is just one method.

- If you have a USB keyboard, USB mouse, and either a HDMI cord for the 3 Series or a micro HDMI cord for the 4 Series to connect to a display, you should be able to access the Raspberry Pi as if it was a Linux machine. Follow these steps:
  - Insert the microSD card into the bottom of the Raspberry Pi.

  <p align="center">
  <img src="Documentation-Images/SD-Card-Placement.jpg" width="248" height="334">
  </p>

  - Provide power to the Raspberry Pi (MicroUSB for the 3 Series, USB-C for the 4 series).
  - Connect your peripherals (keyboard, mouse, and display). You should see a screen resembling the desktop of a Linux machine. This is your Raspberry Pi&#39;s desktop.
  - Connect to your Wi-Fi network in the upper right-hand corner of the screen.
- If you do not have one of those 3 peripherals, follow these steps:
  - Open the SD card in Finder or File Explorer so we can access the files.
  - Create a new file called &quot;ssh&quot; with no extention. This will enable ssh into the Raspberry Pi by default.
  - Create a file named &quot;wpa\_supplicant.conf&quot;. In this file, paste the following code:

  ```
  country=US
  ctrl_interface=DIR=/var/run/wpa_supplicant
  GROUP=netdev
  update_config=1

  network={
      ssid="your_wifi_ssid"
      scan_ssid=1
      psk="your_wifi_password"
      key_mgmt=WPA-PSK
  }
  ```

  - Change the strings &quot;your\_wifi\_ssid&quot; to your Wi-Fi network&#39;s name and &quot;your\_wifi\_password&quot; to your Wi-Fi network&#39;s password. Additionally, change the country if needed.
  - Save these two files and eject the SD card from your computer.
  - Insert the microSD card into your Raspberry Pi (see picture above for reference).
  - Provide power to the Raspberry Pi (MicroUSB for the 3 Series, USB-C for the 4 series).
  - Open Terminal on Mac or Command Prompt on Windows. Run the command &quot;ping raspberrypi.local&quot;.
  - You should see the IP address of the Raspberry Pi appear. Provided this is the only Raspberry Pi on your network, this is the one you want to connect to.

<p align="center">
<img src="Documentation-Images/Ping-RPi.png" width="700" height = "70">
</p>

  - You can now run the command &quot;ssh pi@192.168.7.131&quot; (replace with your IP address). It will ask you for the password, which by default is &quot;raspberry&quot;.

<p align="center">
<img src="Documentation-Images/SSH-Pi.png" width="700" height = "225">
</p>

  - You are now successfully ssh&#39;d into the Raspberry Pi. Run the command &quot;sudo raspi-config&quot;. This will allow you to change some settings of the Raspberry Pi. You should see the screen below.

<p align="center">
<img src="Documentation-Images/Raspi-Config.png" width="700" height = "423">
</p>

  - Navigating using the arrow keys, select &quot;Display Options&quot; by hitting Enter. Select &quot;Resolution&quot; and then select &quot;DMT Mode 82 1920x1080 60Hz 16:9&quot;. Finally, select &quot;Ok&quot; at the bottom. This sets the resolution of the Raspberry Pi to 1080p, which most ssh viewers require.
  - Return to the original configuration screen by hitting the esc key on your computer, or navigating and clicking the Back button within the configuration panel. Navigate to &quot;Interfacing Options&quot;. Select &quot;VNC&quot; and select &quot;Yes&quot; to enable VNC viewing.
  - You should see a pop up that tells you VNC was enabled. Select &quot;OK&quot;.
  - It would also be wise to change your password. At the original configuration screen, select &quot;System Options&quot;, followed by &quot;Password&quot;. This will allow you to enter a new password for your Pi.
  - You may now select &quot;Finish&quot; and close the Terminal or Command Prompt window.
  - While not strictly necessary, a viewer is very helpful for seeing what is happening within the Raspberry Pi. One view is VNC Viewer, downloadable here: [www.realvnc.com/en/connect/download/viewer/](https://www.realvnc.com/en/connect/download/viewer/).
  - Once you install VNC Viewer, open the application. You can search for an IP address to connect to. Search for your Pi&#39;s IP address and hit Enter.

<p align="center">
<img src="Documentation-Images/VNC-Viewer.jpg" width="700" height = "515">
</p>

  - You should receive a pop-up that asks you to input the device&#39;s username and password. The default username is &quot;pi&quot; and the default password is &quot;raspberry&quot;.
  - You should now see the Raspberry Pi&#39;s desktop.
- Your Raspberry Pi should now be setup and you should be able to access the Desktop.

<p align="center">
<img src="Documentation-Images/Pi-Desktop.png" width="700" height = "418">
</p>

</details>


<details>
<summary style="font-size: 20px;"> **Step 3: Installing the Vuforia Spatial Edge Server**</summary>
<br>

- On the Raspberry Pi, open the web browser and go to this link: [https://drive.google.com/file/d/1CLea\_bsk0d81IvU6zzFXJFLZLabyAf\_N/view?usp=sharing](https://drive.google.com/file/d/1CLea_bsk0d81IvU6zzFXJFLZLabyAf_N/view?usp=sharing)
- Download the script file onto your **Raspberry Pi Desktop**
- Once the download is finished, open Terminal and &quot;cd&quot; into your Desktop
- Type &quot;sudo bash RPi\_Downloads.sh&quot;
- This will run the bash file, which will download all things Spatial Toolbox related to your Raspberry Pi. It may take a few minutes to finish running the script.
- When the download finishes completely, close your Terminal window, and open a new Terminal window
- Into this new Terminal window, type &quot;sudo chown –R $USER /home/pi&quot;. This will give you permissions to move, edit, and run files on your Raspberry Pi.


</details>


<details>
<summary style="font-size: 20px;"> **Step 4: Getting Onshape API Keys**</summary>
<br>

- Go to [dev-portal.onshape.com/keys](https://dev-portal.onshape.com/keys) and select the button in the upper right corner that says &quot;Create new API key&quot;.

<p align="center">
<img src="Documentation-Images/Create-API-Key.png" width="700" height = "358">
</p>

- If you are working in cad.onshape.com, select &quot;No enterprise&quot; for Company. If you are working in a different url, select the enterprise you are working in. Allow this API to read your documents, write to your documents, and delete your documents and workspaces. Then click the button at the bottom to create your API key.

<p align="center">
<img src="Documentation-Images/Setting-for-API-Key.png" width="700" height = "355">
</p>

- A pop-up will display with the title &quot;API Key Secret&quot;. This will display your access key and secret key, which you will need for all API calls. This is the only time your secret key will be displayed, so make sure you copy it.

<p align="center">
<img src="Documentation-Images/API-Keys.png" width="700" height = "248">
</p>

- On the Raspberry Pi, open a new Terminal window. Type &quot;cd Desktop/RaspberryPi-SpatialToolbox&quot;. Then, type &quot;node make-keys.js&quot;.
- The Terminal will prompt you to enter whether you are using an enterprise, your access key, and your secret key. You can use control+shift+v to paste in the Raspberry Pi Terminal.
- Once you have set the keys without any error messages, you should be ready to run the server.
  - If you have an error message, try running &quot;sudo chown -R $USER /home/pi&quot; and trying again.

</details>


<details>
<summary style="font-size: 20px;"> **Step 5: Running the Server**</summary>
<br>

- Connect the Spike Prime to the Raspberry Pi using one of the USB ports on the Raspberry Pi. Power on the Spike Prime.
- On the Raspberry Pi, open a new Terminal window and type &quot;cd Desktop/RaspberyPi-SpatialToolbox/vuforia-spatial-edge-server&quot;.
- Run the command &quot;node server&quot; to start the server.
- Once the server begins running, you should be able to go to localhost:8080 on the Raspberry Pi&#39;s internet app to view the spatial edge server. You can also access this same page from a machine on the same Wi-Fi network by going to the IP address of your Pi:8080. For example, 192.168.7.124:8080.
- You should see a site that looks like the picture below. If you don&#39;t, make sure the server started without errors. 
- Click the Manage Hardware Interfaces button.

<p align="center">
<img src="Documentation-Images/Edge-Server.jpeg" width="700" height = "405">
</p>

- Depending on whether you plan to use a Spike Prime or not, either turn on the Spike-Drawing interface or the Drawing interface.

<p align="center">
<img src="Documentation-Images/Drawing-Setting.jpg" width="700" height = "405">
</p>

<p align="center">
<img src="Documentation-Images/Spike-Setting.jpg" width="700" height = "405">
</p>

- Once you have turned your desired interface on, you should see a settings wheel appear next to the interface. If you don&#39;t see one right away, try refreshing the page. Click on the settings wheel.
- There is a list of parameters you can edit here. They are as follows:
  - _drawName_ or _spikeDrawName_. This is the name of the object associated with the interface. **You do not need to edit this.**
  - _imageToBaseX_ (Spike only). This is the horizontal distance in **millimeters** from the center of your image target to the first joint of the Spike Prime robotic arm.
  - _imageToBaseY_ (Spike only). This is the vertical distance in **millimeters** from the center of your image target to the first joint of the Spike Prime robotic arm.
  - _link1Length_ (Spike only). This is the length in **millimeters** of the first linkage of the Spike Prime robotic arm. This is the length between the first and second joint of the robotic arm.
  - _link2Length_ (Spike only). This is the length in **millimeters** of the second linkage of the Spike Prime robotic arm. This is the length between the second joint and the end effector of the robotic arm.
  - _DocumentId._ This is the documentId of the Onshape document you wish to draw on. This is found after /document/ in the Onshape document&#39;s URL.
  - _WorkspaceId._ This is the workspaceId of the Onshape document you wish to draw on. (See step 6). This is found after /w/ in the Onshape document&#39;s URL.
  - _ElementId._ This is the elementId of the Onshape document you wish to draw on. (See step 6). This is found after /e/ in the Onshape document&#39;s URL.
  - _FeatureName_. This is the name of the feature you wish to create in Onshape.
  - _OnshapeOffsetX_. This is the horizontal distance in **Onshape&#39;s units** from the document origin you want to begin drawing. Note: the origin of your drawing on the Spatial Toolbox will be the center of the image target.
  - _OnshapeOffsetY_. This is the vertical distance in **Onshape&#39;s units** from the document origin you want to begin drawing. Note: the origin of your drawing on the Spatial Toolbox will be the center of the image target.
- Edit the parameters to suit your design, making sure to hit the save button that appears below each one to confirm your changes.
- Return to the Terminal window on your Raspberry Pi and hit control+c to restart the server. This is needed to re-initialize the server with your custom parameters.


</details>


<details>
<summary style="font-size: 20px;"> **Step 6: Connecting the Spike Prime**</summary>
<br>

**Note:** If you are not using a Spike Prime you can skip this step.

- Turn the Spike Prime on and connect it to the Raspberry Pi if it is not already.
- When plugging in motors to the Spike Prime, the inverse kinematics solver requires that the motor that controls joint 1 is connected to a port alphabetically higher than the motor that controls joint 2. (If joint 2 is in port D, then joint 1 must be in port A, B, or C). If you have a third motor connected, it must be in a port below the two motors controlling the joints.
- Re-run the command &quot;node server&quot; within the Raspberry Pi Terminal directory ~/Desktop/RaspberryPi-SpatialToolbox/vuforia-spatial-edge-server.
- After about 15-20 seconds you should see a message like the screenshot below listing the ports that the motors are connected to.

<p align="center">
<img src="Documentation-Images/Spike-Connected.png" width="700" height = "65">
</p>

- If you do not see this message, your Spike Prime is not connected. Restart the server by hitting control+c and running &quot;node server&quot; again. If you still do not see this message, double check your connections and restart the Spike Prime.
- If you see the motor ports printed to the Terminal, your Spike Prime has connected properly.


</details>


<details>
<summary style="font-size: 20px;"> **Step 7: Using the Vuforia Spatial Toolbox App**</summary>
<br>

- If you don&#39;t already have the Vuforia Spatial Toolbox App, download it from the App Store. **Note:** It is only available on iOS currently.

<p align="center">
<img src="Documentation-Images/VST-App.jpeg" width="351" height="620">
</p>

- If you want to become more familiar with the Vuforia Spatial Toolbox at any point, there is documentation here: [Spatial Toolbox Documentation](https://spatialtoolbox.vuforia.com/docs/use). The Tufts CEEO also created some tutorials on using the Spatial Toolbox here: [CEEO Innovations YouTube Playlist](https://www.youtube.com/watch?v=3wkmBDgpb34&amp;list=PLhL0fv9JyKMaWhaHmm21J6mgpp841zYYw).
- Open the app. You should see on the right side of your screen 5 buttons. The 4th one down is the Settings button. Click on the Settings button.
- You should see a variety of settings, click on the one that says Develop.

<p align="center">
<img src="Documentation-Images/Develop.jpg" width="700" height = "324">
</p>

- In Develop, there will be a setting called Discovery Server where you can input an IP Address followed by a port binding.
  - You can find the server&#39;s port by running &quot;node server&quot; in the Raspberry Pi Terminal. Search the Terminal for &quot;UDP listening on port:&quot;. The number that follows is the port number.

<p align="center">
<img src="Documentation-Images/Port.jpg" width="700" height = "474">
</p>

- Input the IP Address of your Raspberry Pi followed by the port it is running the server on. For example, mine is 192.168.7.124:52316.
- Toggle the switch next to the IP address so that it is in the on position.
- Also input this string into the setting called Interface URL and toggle the switch next to it.

<p align="center">
<img src="Documentation-Images/Discovery-Server.jpg" width="700" height = "324">
</p>

- This forces the app to connect to the server run by your Raspberry Pi. Close out of the settings by tapping the Settings button again.


</details>


<details>
<summary style="font-size: 20px;"> **Step 8: Placing Checkpoints**</summary>
<br>

- If it is not already running, run the server by going to the Raspberry Pi Terminal and running &quot;node server&quot;.
  - If you are using the Spike Prime, make sure that it connects properly, as described in step 6.
- Open the Vuforia Spatial Toolbox App on your phone and once it loads, point your phone at the image target for the interface you want to use.
  - If you are using the Spike Prime, **make sure the Spike connects before you open the app.**

<p align="center">
<img src="Documentation-Images/Draw-Image-Target.jpg" width="384" height="457"> <img src="Documentation-Images/Spike-Draw-Target.jpg" width="316" height="457">
</p>

- You should see three white cubes appear on the image target. One of the cubes is placed on the center of your image target. Another is placed at the origin for the checkpoints you will be placing. These two should be close to or exactly on top of each other.
- The third white cube is the location of the ground plane for the app. The exact position of this cube doesn&#39;t matter, but it is important that the ground plane is on the same plane as the surface of where you will be placing checkpoints.
  - You can see in the examples below that the ground plane cube looks larger than the other two because it is floating. If you tilt your camera to look at a side view, you will see the cube floating above the ground.
  - If your ground plane is floating in the air, close the app. Position your phone close to the surface you will be placing checkpoints on and reopen the app. Slowly pan over to your image target. You should see the third white cube closer to where you want it.

<p align="center">
<img src="Documentation-Images/Good-Ground-Plane.jpg" width="700" height = "324">
</p>

<p align="center">
<img src="Documentation-Images/Misaligned-Ground-Plane.jpg" width="700" height = "324">
</p>

- Once you have your ground plane cube properly positioned, you&#39;re ready to place down checkpoints.
- **Wait a few seconds for the interface to load.** You will be able to tell the interface is fully loaded once the second icon in the top left corner becomes opaque.
  - If you place a checkpoint down too early, it won&#39;t have a circle around the base. You have to restart the server on the Raspberry Pi.

<p align="center">
<img src="Documentation-Images/Interface-Loaded.png" width="700" height = "302">
</p>

- Once your interface is fully loaded, tap on the screen to place checkpoints down. If you aren&#39;t using a Spike Prime, you should see the checkpoints appear in the Onshape document as you place them.
  - You can click the trash button in the bottom left corner to clear the checkpoints at any time. This will also remove the spline from Onshape if you are not using a Spike Prime.
- If you are using a Spike Prime, you can place the checkpoints and move them as you please. When you want the Spike Prime to move to each checkpoint, go into the Pocket and add an On Button to the experience.

<p align="center">
<img src="Documentation-Images/Pocket.jpg" width="700" height = "324">
</p>

<p align="center">
<img src="Documentation-Images/On-Button.jpg" width="700" height = "324">
</p>

- You can then click on the Programming tab to see the nodes of each checkpoint and the On Button.
  - If for some reason you don&#39;t see nodes on the checkpoints, try restarting the server on your Raspberry Pi.
- Drag from the node of the On Button to the node of the first checkpoints, labelled &quot;checkpoint\_0:0&quot;.

<p align="center">
<img src="Documentation-Images/Connecting-Nodes.jpg" width="700" height = "324">
</p>

- Once the two nodes are connected, click on the Interfaces button in the top right corner to exit the programming mode.
- Click the On Button to start the Spike Prime arm. As the arm reaches each checkpoint, you should see the points added in Onshape as well.

<p align="center">
<img src="Documentation-Images/Checkpoints.gif" width="700", height="394">
</p>

</details>




