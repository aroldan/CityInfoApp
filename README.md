# City Info Demo App

This demonstrates how you can set up modular iOS apps.

## Setup

 1. Install CocoaPods

  If you don't already have it installed, install the latest version of [CocoaPods](http://cocoapods.org/). If you have Ruby installed, you can do so by typing `gem install cocoapods`.

 1. Set up the private repository

  In order to publish podspecs outside of the master repository, we set up a mini-repository. Normally this would be hosted in a private GitHub account for your project or company.

  To set it up, go to your cocoapods folder and check out the private repo:

  ```
  cd ~/.cocoapods/repos
  git clone https://github.com/aroldan/HSPodsExample.git
  ``` 

 1. Clone repo

  ```
  cd ~/dev //or whatever your dev folder is
  git clone https://github.com/aroldan/CityInfoApp.git 
  ```

 1. Install pods

  Run `pod install` in the project folder.

 1. Run!