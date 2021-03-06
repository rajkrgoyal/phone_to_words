# Convert phone number to words / words combinations in Ruby:

Given a 10 digit phone number, you must return all possible words or combination of words from the provided dictionary, that can be mapped back as a whole to the number.

With this we can generate numbers like 1-800-motortruck which is easier to remember then 1-800-6686787825
The phone number mapping to letters is as follows:

2 = a b c

3 = d e f

4 = g h i

5 = j k l

6 = m n o

7 = p q r s

8 = t u v

9 = w x y z
 
The phone numbers will never contain a 0 or 1. 
Words have to be at least 3 characters.

To get give you an initial verification, the following must be true:

6686787825 should return the following list [["motor", "usual"], ["noun", "struck"], ["nouns", "truck"], ["nouns", "usual"], ["onto", "struck"], "motortruck"]

2282668687 should return the following list [["act", "amounts"], ["act", "contour"], ["acta", "mounts"], ["bat", "amounts"], ["bat", "contour"], ["cat", "contour"], "catamounts"]

The conversion of a 10 digit phone number should be performed within 1000ms.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes


### Installing

A step by step series of examples that tell you have to get a development env running

1. Clone / Download the code.
2. You may create gemset in .ruby-gemset if you want.
3. Code is tested in ruby version 2.5.3. It may work in other versions as well. You can change, ruby version in .ruby-version file.
4. Open terminal and cd in root directory.
5. It will create gemset and will ask to install rvm version, if already not installed.
6. Install bundler and gems:

```
gem install bundler
bundle install
```

### Execution

- `rspec spec/conversion_test.rb --format documentation`
- `time ruby lib/benchmark.rb`


### Program output.

   ![](assets/images/result-with-benchmark.png?raw=true)
  
### Test case output.

   ![](assets/images/rspec.png)

