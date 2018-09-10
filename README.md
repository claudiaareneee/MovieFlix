# Project 1 - MovieFlix

**MovieFlix** is a movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **10** hours spent in total

## User Stories

The following **required** user stories are complete:

- [x] User sees app icon in home screen and styled launch screen (+1pt)
- [x] User can scroll through a list of movies currently playing in theaters from The Movie DB API (+5pt)
- [x] User can "Pull to refresh" the movie list (+2pt)
- [x] User sees a loading state while waiting for the movies to load (+2pt)

The following **stretch** user stories are implemented:

- [ ] User sees an alert when there's a networking error (+1pt)
- [ ] User can search for a movie (+3pt)
- [ ] While poster is being fetched, user see's a placeholder image (+1pt)
- [ ] User sees image transition for images coming from network, not when it is loaded from cache (+1pt)
- [ ] Customize the selection effect of the cell (+1pt)
- [ ] For the large poster, load the low resolution image first and then switch to the high resolution image when complete (+2pt)

The following **additional** user stories are implemented:

- [ ] I added constraints to the layout so that this app would look good on different models
- [ ] List anything else that you can get done to improve the app functionality! (+1-3pts)

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. I want to see how other people implemented the loading state screen
2. I also would like to talk more about functional programming and how we are using it Swift.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://i.imgur.com/gKpjCZE.gif' title='MovieFlix Walkthrough' width='' alt='MovieFlix Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

- My biggest issue was working with outlets and making sure that they were properly implemented
- I also had an issue with the layout because the table view would shrink the size of my rows
- Because of my network connection, I had trouble seeing if my activity indicator was running at the proper time

## License

    Copyright [2018] [Claudia Nelson]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
