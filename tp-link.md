To use the TP-Link TL-WN722N wireless USB adapter on a Linux system, you might need to install the appropriate drivers. As of my last update in September 2021, the TL-WN722N is supported by the open-source ath9k_htc driver, which is usually included in most Linux distributions.

Here are the steps you can follow to install the driver on a Linux system:

1. **Connect your TL-WN722N adapter to your Linux system.**

2. **Update your package list:**
   ```
   sudo apt-get update
   ```

3. **Install necessary packages:**
   ```
   sudo apt-get install linux-headers-$(uname -r) build-essential
   ```

4. **Download the firmware:**
   ```
   wget http://wireless.kernel.org/download/htc_fw/1.3/htc_9271.fw
   ```

5. **Copy the firmware to the appropriate directory:**
   ```
   sudo cp htc_9271.fw /lib/firmware
   ```

6. **Unload conflicting modules:**
   ```
   sudo modprobe -r ath9k_htc
   ```

7. **Load the driver:**
   ```
   sudo modprobe ath9k_htc
   ```

After these steps, your TP-Link TL-WN722N adapter should be recognized and operational on your Linux system.

Please note that Linux kernel and driver support can change over time, so it's advisable to check the official Linux kernel documentation or community forums for the most up-to-date information regarding TL-WN722N support on Linux.