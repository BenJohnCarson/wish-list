# Wish List
#### Technologies: Ruby, RSpec

## Index
* [Task](#Task)
* [Installation](#Install)
* [Usage](#Usage)
* [Approach](#Approach)
* [User Stories](#Stories)
* [Extensions](#Extensions)

## <a name="Task">Task</a>
Using any language of your choice, implement some interesting fragment of one of the following concepts:

• a current account
• a shopping basket
• a social network

## <a name="Install">Installation</a>
* Clone from github
```
$ git clone https://github.com/BenJohnCarson/wish_list
```

* Switch to ruby 2.3.3
```
$ rvm use 2.3.3
```

* Install gems
```
$ gem install bundler
$ bundle
```

* Running tests
```
$ rspec
```

## <a name="Usage">Usage</a>
* Open irb in the project root folder
```
$ irb
```
* Require the wish_list file
```
> require './lib/wish_list'
```
* Create a new list
```
> list = Wish_list.new
```
* Add a wish
```
> list.add_wish("Guitar", 400)
```
* Retrieve a wish
```
> list.get_wish("Guitar")
```
* Edit a wish
```
> list.edit_wish({wish_name: "Guitar", property: "name", value: "Bass"})
```
* Remove a wish
```
> list.remove_wish("Guitar")
```

## <a name="Approach">Approach</a>
### Planning
My first step when starting this challenge was to get a blank piece of paper and jot down any and all ideas that came to me for any of the three concepts.
Next I scanned through the ideas and tried to pick one I thought I could turn into an interesting feature in a small amount of time.
The idea I settled on was a wish list for a current account. From here I began fleshing out my idea by creating several user stories which can be found below.
After creating two user stories, I extracted the most basic MVP I could and drew up a sequence diagram which helped me visualise the potential objects I'd need and the messages that they could send.
This concluded my planning and I began writing code.

### Initial Sequence Diagram
![Alt text](/assets/wish_list_sequence_diagram.png)

### Creating
I took a TDD approach to writing my code, beginning with feature tests that prompted unit tests that drove me to write code.
I got upto implementing adding a wish when I realised I needed to decide on how I'd handle passing back confirmation messages to the customer. 
This prompted me to draw up a domain model. I envisioned having an interface ontop of the wish_list, that could call the lists public methods. 
The interface would also have a printer class that would return the correct confirmation message from a messages hash. 
This would allow proper separation of model, view and controller and by keeping any presentation information out of wish_list it allows it to be inserted into any interface.
However, having done this I realised that the presentation was not the most interesting feature and so in the interest of time I'd assume that my wish_list would be hooked up to an interface at a later date and that I'd continue working on more novel features.

From here I carried on implementing the basic features remove and get wish. 
The edit_wish method proved to require a little extra thought. I wanted to implement it so that if the wish were to have additional properties added to it in the future (e.g. order value), I wouldn't have to come back and change the edit method.



### Domain Model Diagram with Interface
![Alt text](/assets/wish_list_domain.png)

## <a name="Stories">User Stories</a>
```
As a current account customer,
So I can motivate myself to start saving,
I'd like to have a list of things I wish to purchase, that I can edit.

As a current account customer,
So I know when I can afford to treat myself,
I'd like to see which items on my wish list I can currently afford.
```

## <a name="Extensions">Extensions</a>
Following completetion of the basic MVP, there a few things I'd like to do to extend the feature:

* Allow ordering of the list, so the customer can choose which item they'd like to save for first
* Implement a sorting function that can return the list sorted by user defined property (e.g. price descending)
* Assuming the list can be hooked up to a savings account, allow realtime notifications (by text/email) of when you've saved enough to afford an item on your list