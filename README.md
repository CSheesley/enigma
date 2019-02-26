# Enigma
1901 BE - Mod 1 final independent project: In this project you’ll use Ruby to build a tool for cracking an encryption algorithm


## **Self Assessment**

#### **Functionality: 3**
  Enigma Class with encrypt and decrypt methods successfully implemented. Encrypt/decrypt command line interfaces successfully implemented

#### **Object Oriented Programming: 3**
  Project is broken into logical components consisting of at least 4 classes that have single responsibilities. (5 classes/modules with focused responsibilities).

   No more than 2 methods are longer than 7 lines. (2 methods are longer than 7 lines - encode and decode, each in the Cipher class.)

  No class is longer than 100 lines. (All 5 classes/modules under 100 lines - longest class is 51 lines. No line is more than 80 characters long.)

  While there may be 1 or 2 lapses, variable and method names clearly communicate purpose. (Subjective, but I believe that the variable and method names in this code accurately describe their function.)

#### **Test Driven Development: 3**  

  I believe that every method is tested at both the unit and integration level.  Tests were written prior to the code (aside from pseudo coding), and guided code development. An occasional helper method test was added after the helper method was refactored into its own method. Git history should show evidence of being created first.

  Test coverage metrics show coverage at 99% or greater.

  Simplecov is at 98.91%. The only lines which are not shown as covered are in the key class under the `format_to_char_length` method. This method is being tested at the unit level, however the body of its code block shows up as un-tested. ( I am unsure of how to have this show as tested)

    def format_to_char_length(characters, length)
      <!-- until characters.length == length
        characters.prepend("0")
        end
      characters -->
    end

#### **Version Control: 3**
  (For a 4) - At least 40 commits (More than 90). At least 15 pull requests (18) that are named and documented to clearly communicate the purpose of the pull request. No commits include multiple pieces of functionality. No commit message is ambiguous.

  I am optimistically shooting for a 4!
