#PROTO SPACE

>You can posts and share your prototypes.

##Tables

```
- users

- prototypes

- prototype_images

- comments

- likes

```

##Columns

###users
|id     |email  |password|nickname|avatar|member|profile|works |
|-------|-------|--------|--------|------|------|-------|------|
|integer|string |string  |string  |string|string|text   |string|


###prototypes
|id     |title |catch\_copy|concept|user\_id|
|-------|------|-----------|-------|--------|
|integer|string|string     |text   |integer |


###prototype_images
|id     |image |prototype_id|type   |
|-------|------|------------|-------|
|integer|string|integer     |integer|


###comments
|id     |user\_id|prototype\_id|text  |
|-------|--------|-------------|------|
|integer|integer |integer      |text  |


###likes
|id    |user\_id|prototype_id|
|------|--------|------------|
integer|integer |integer     |



##Asociations

    User

       has_many    :prototypes
       has_many    :comments
       has_many    :likes



    Prototype

       belongs_to  :user
       has_many    :images
       has_many    :comments
       has_many    :likes



    Prototype_image

       belongs_to  :prototype
       enum type:  %i(main sub)



    Comment

       belongs_to  :user
       belongs_to  :prototype



    Like

       belongs_to  :user
       belongs_to  :prototype




