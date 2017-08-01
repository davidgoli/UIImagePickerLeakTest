Reproduces a crash in iOS 10.3.3 using UIImagePickerController.

To reproduce:

- Build & open the app in Xcode 8.3 or later
- Take a large number of pictures (usually around 100 will do it)

In the Profiler tool, you can observe the app's memory remaining constant and
small, while "Other apps & programs" grows continuously until the system runs
out of memory.
