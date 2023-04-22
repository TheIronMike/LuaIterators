# LuaIterators
Contains various iterators for the LuaU 5.3 variant in order to make development easier

Many of the functions are not the most "efficient" method of using a for loop.
I am aware the pairs, ipairs, and particuarly next all work faster, as they are apart of Lua's C libraries.
I am also aware, that generic for loops create new closures for every iteration, which necessarily creates a little more overhead.
However, the for loop generally for LuaU will not be looping over enough data for such implications to be drastic.
In the event that you are, however, looping over that much data it is expected to know the appropriate method of going through the loop.

Fold#7337
