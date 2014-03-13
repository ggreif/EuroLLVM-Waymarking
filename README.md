EuroLLVM-Waymarking
===================

# 2014 EuroLLVM Edinburgh

3-bit Waymarking

(a.k.a. Son of `Use`-Diet)

Gabor Greif
Weekend LLVM-hobbyist

# Situation before 2005

<picture : array of Uses embedded/pointered in User>
Use has 4 pointers

# `Use`-Diet

- drop pointer to User
- make `prev` pointer tagged (2-bits, since 4-byte aligned)
- seen 12% space savings on big C++ programs
- landed <date> in the LLVM codebase

# How it Works

Employ a _framed serial code_ in consecutive `Use`s
- `S` --> full stop
- `s` --> stop
- `0`, `1` --> binary digits

Read off binary digits to obtain distance to `User`

# Interlude

:-)

# The Sacrifice

2.5% runtime increase

(but it was worth it!)

# Solution

When two feet permit just so much speed, then you have to upgrade to three feet!
<INCREMENTAL>
<Photo of giant ant sawed into half>

I really did not mean to do something cruel as this!

But no earthly life-form provides this feature, so...
<INCREMENTAL>

Clearly I was in need of some alien technology!
<INCREMENTAL>

...then I took a page from the book of space exploration and found this gem:
<INCREMENTAL>

<photoshopped Mars image with foot traces (three of them)>

Alien tricks from Mars! :-)

# Son of `Use`-Diet: 3-bits encoding

We have 8 tags for disposal

- double digits: `00`, `01`, `10`, `11`
- 3 stop tags: `q`, `r`, `s` (always in this order)
- full stop: `S`

Originally modelled in Haskell (+QuickCheck)
Now in LLVM repo (on a branch), with automatic algorithm selection

# Benefits

- stop tags allow longer hops while hunting down the framed digits
- 2-bits at a time

Comparison

"1s100000s11010s10100s1111s1010s110s11s1S"
(10)987659876587654654343221

"qrs101qrs30qrs13qrs3rsS"
 55555544455444443332221

210211011000


<diffs>

# Further opportunities

- unroll tag initialisation loops
- distance relative to stopped frame (microoptimization)
- `rol` (rotate) instructions with condition flags
- examining resultant assemby (on all archs!)
 