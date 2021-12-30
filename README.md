# SpaceX
<div style="text-align: center">
    <table>
        <tr>
            <td style="text-align: center">
                    <img src="https://github.com/Hugo-Coutinho/SpaceX/blob/master/SpaceX/Core/Helper/readme%20gifs/filtering.gif?raw=true" width="200" height="350"/>
                </a>
            </td>            
            <td style="text-align: center">
                    <img src="https://github.com/Hugo-Coutinho/SpaceX/blob/master/SpaceX/Core/Helper/readme%20gifs/opening.gif?raw=true" width="200" height="350"/>
                </a>
            </td>            
            <td style="text-align: center">
                    <img src="https://github.com/Hugo-Coutinho/SpaceX/blob/master/SpaceX/Core/Helper/readme%20gifs/scrolling.gif?raw=true" width="200" height="350"/>
                </a>
            </td>            
        </tr>
        <tr>         
            <td style="text-align: center">
                    <img src="https://github.com/Hugo-Coutinho/SpaceX/blob/master/SpaceX/Core/Helper/readme%20gifs/sorting.gif?raw=true" width="200" height="350"/>
                </a>
            </td>              
        </tr>
    </table>
</div>

## About this Project

The idea of the App is:

" *Listing the SpaceX information and rocket launches. It's possible to sort the launches by ascendent or descendent and filtering by launch year as well* ".

## Why?

This project is part of my personal portfolio, so, I'll be happy if you could provide me any feedback about the project, code, structure or anything that you can report that could make me a better developer!

Email-me: hugocoutinho2011@gmail.com

Connect with me at [LinkedIn](https://www.linkedin.com/in/hugo-coutinho-aaa3b0114/?locale=en_US).

Also, you can use this Project as you wish, be for study, be for make improvements or earn money with it!
It's free!

## Explaining with diagrams how I'm using VIPE and clean architecture for this project

### Decoupled ViewController with tableViewController and their sections
Here in this case on the main screen, I'm printing the SpaceX information and a rocket launch list. In my navigationBar I put a search to be able to filter the launches by the year. 

My inheritance with UIKit it's up to the TableviewController to do it. My ViewController extends TableViewController and their only responsibility is starting the sections using their builder and implements their output.
With this design basically my ViewController became a section manager. Completely decoupled it doesn't know nothing about the sections and their logics. Using the section builder and communicating with sectionInput protocol ViewController it's isolated not having any reference directly to sections being able to delete/refactor/new features without breaking nothing into it.

Unfortunately, I break some solid principles in this case creating a direct reference of my ViewController into LaunchSection, I did this faster solution that the LaunchSection be able to implement the search Bar delegates and then filtering the launches by year.A side solution that for me suit better not breaking any solid principles it is given the launch request logic and filtering all the stuff responsibility to ViewController itself, and only passing the launch list to the launchBuilder. That way I'll continue following the good principles

<div align="center">
<img src="https://github.com/Hugo-Coutinho/SpaceX/blob/master/SpaceX/Core/Helper/readme%20gifs/view_controller_architecture.png?raw=true"/>
</div>

### Breaking VIPE into mini VIPE for each section
Looking at the section landscape, his responsibility is to do everything related to launch and just that. This section doesn't know nothing about the tableview logic and the viewController management, it's isolated.

Thus, launch section has to do the launch networking, business logic, formatting and presentation and rendering user events and updating launch data. And it does, using clean architecture and VIPE UI design pattern.

As you can see below in the diagram, I like to work with a single cell for each state, so I have an error, a loading and a success, and the section does the state management.

To respect the uncle Bob clean architecture design, I like to use the encapsulation pilar from OOP to isolate my application from external frameworks. Here I'm using Nuke pod to help me with load images and caches, but I don't want to my UI import external frameworks, because doing this I'm becoming a hostage to it. So I had created an Adapter isolating my UI to know Nuke and I'm using the adapter where I need. So in this way, I'm continuing using the benefits of Nuke and the same time not depending onto external applications.

<div align="center">
<img src="https://github.com/Hugo-Coutinho/SpaceX/blob/master/SpaceX/Core/Helper/readme%20gifs/encapsulation_with_section_tableviewcell.png?raw=true"/>
</div>


### Installing

**Cloning the Repository**

```swift
$ git clone https://github.com/Hugo-Coutinho/SpaceX.git

$ cd SpaceX
```

**Installing dependencies**

```swift
$ pod install
```

## Built With

- [Nuke](https://github.com/kean/Nuke) - Image Loading System


## Contributing

You can send how many PR's do you want, I'll be glad to analyse and accept them! And if you have any question about the project...

Email-me: hugocoutinho2011@gmail.com

Connect with me at [LinkedIn](https://www.linkedin.com/in/hugo-coutinho-aaa3b0114/?locale=en_US)

Check my development techniques: [My personal study annotations](http://bloghugocoutinho.wordpress.com)

Thank you!

