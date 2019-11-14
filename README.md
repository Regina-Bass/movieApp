# Flix

Flix is an app that allows users to browse movies from the [The Movie Database API](https://developers.themoviedb.org/3/getting-started/introduction).



## Flix Part 2

### User Stories

#### REQUIRED (10pts)
- [x] (5pts) User can tap a cell to see more details about a particular movie.
- [x] (5pts) User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

#### BONUS
- [x] (2pts) User can tap a poster in the collection view to see a detail screen of that movie.
- [x] (2pts) In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer.

### App Walkthough GIF

<img src="http://g.recordit.co/II9PLwpfm7.gif" width=250><br>

### Notes
In Flix Part 2 I learned about: 
- Collection Views
- Aspect Fill
- Show Navigation 
- `deselectRow`

I also learned that there are functions within API such as the 'Get Similar Movies' that we used for the superhero tab that takes in a variable and assembles information for you (*Not the same as Reccommendations*).

---

## Flix Part 1

### User Stories

#### REQUIRED (10pts)
- [x] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [x] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [x] (3pts) User can view the movie poster image for each movie.

#### BONUS
- [x] (2pt) User can view the app on various device sizes and orientations.
- [x] (1pt) Run your app on a real device.

### Updates Part 1 - Better Autolayouts

<img src="http://g.recordit.co/RkwMWOaD93.gif" width=250><br>
<img src="http://g.recordit.co/fNbVeXAWCf.gif" width=200><br>

### App Walkthough GIF
<img src="http://g.recordit.co/1AiHArdrF5.gif" width=250><br>


### Notes
In this lab assignment I learned about image assets and launchscreens, as well as auto layouts.
In addition, I have a better understanding of network connections, understanding different APIs, and what pods are.

I ran into two challenges in this lab:
- One was that I kept getting a nil error when I switched the cell variable from 
`UItableViewCell()` to `tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell`.
However for some reason when I opened it up the next day it was working fine so it may have just been some cleaning problem.

- The other problem was that the my images weren't displaying although my URLs were printing correctly.
I got the following error: *The resource could not be loaded because the App Transport Security policy requires the use of a secure connection*
I fixed this by searching the web until I found a solution to add this in my info.plist:
`<key>NSAppTransportSecurity</key>
    <dict>
        <key>NSAllowsArbitraryLoads</key>
        <true/>
        <key>NSExceptionDomains</key>
        <dict>
            <key>yourdomain.com</key>
            <dict>
                <key>NSIncludesSubdomains</key>
                <true/>
                <key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
                <false/>
            </dict>
       </dict>
  </dict>`



