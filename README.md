# Coding Assessment

## Overview

* Complete the challenge as a native app solution (Swift)
* Send a GitHub link and screenshots of the app

## Technologies

Try to use the following:

* Design pattern: MVVM
* Unit Testing
* Combine
* SwiftUI

## Programming Exercise

### Fetch Country Data

Fetch a list of countries in **JSON** format from this URL:


`https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json`


### Display Country Information

* Display all countries in the JSON
* Order countries by position in the JSON
* Information to display in each table cell:
	* Name
    * Region
    * Code
    * Capital

### Information Format and Layout

```
-----------------------------------------
|                                       |
| "name" "region"                "code" |
|                                       |
| "capital"                             |
|                                       |
-----------------------------------------
```

#### Examples

```
-----------------------------------------
|                                       |
| United States of America, NA       US |
|                                       |
| Washington, D.C.                      |
|                                       |
-----------------------------------------

-----------------------------------------
|                                       |
| Uruguay, SA                        UY |
|                                       |
| Montevideo                            |
|                                       |
-----------------------------------------
```

## Requirements

* The user should be able to scroll through the entire list of countries
* The implementation should be robust, i.e.,
	* handling errors
	* handling edge cases
* The app should support device rotation