# Wordle Elimination
This simple ruby script helps me to play Wordle faster, by using a process of elimination.

To play:
```ruby wordle.rb```

You'll be asked to enter your results.

### position 
if you found a match, enter it here\
position is 0-indexed:

>position 0 (first letter)\
>position 1 (second letter)\
>position 2 (third letter)\
>position 3 (fourth letter)\
>position 4 (fifth letter)

### not in position 

if you found a matched letter but in another spot, you can make which position it is NOT in

### letters NOT in word

Here's where you can list the letters that are no in the word.  Don't use commas or spaces, just type them, for example: HGUR

This will exlcude the letters H, G, U, and R.
