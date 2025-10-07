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

## Screenshots

### Portrait and Landscape Orientations

<img width="402" height="874" alt="Simulator Screenshot - iPhone 17 Pro - 2025-10-06 at 20 40 07" src="https://github.com/user-attachments/assets/8deb66eb-db84-4722-bc0c-b4611a67622d" />
<img width="402" height="874" alt="Simulator Screenshot - iPhone 17 Pro - 2025-10-06 at 20 42 12" src="https://github.com/user-attachments/assets/cc21cf62-c37c-4f8e-9d26-8ac2c4fae5b8" />
<img width="874" height="402" alt="Simulator Screenshot - iPhone 17 Pro - 2025-10-06 at 20 40 50" src="https://github.com/user-attachments/assets/55cc3309-263c-42c2-a1ee-2ffdf9eb93b7" />
<img width="874" height="402" alt="Simulator Screenshot - iPhone 17 Pro - 2025-10-06 at 20 41 57" src="https://github.com/user-attachments/assets/6c50cf8e-8bfd-456c-a58c-eb8133fe09e6" />

### Error and Retry States 

<img width="402" height="874" alt="Simulator Screenshot - iPhone 17 Pro - 2025-10-06 at 20 44 14" src="https://github.com/user-attachments/assets/2a28f9bc-d17d-482b-9d98-0ea983f5cede" />
<img width="402" height="874" alt="Simulator Screenshot - iPhone 17 Pro - 2025-10-06 at 20 42 48" src="https://github.com/user-attachments/assets/40cbd2cd-f9e5-4efd-9536-9753870709ac" />
<img width="402" height="874" alt="Simulator Screenshot - iPhone 17 Pro - 2025-10-06 at 20 48 31" src="https://github.com/user-attachments/assets/d8da2d7c-ebd6-446c-9f1f-5b18e1cb64bd" />
<img width="402" height="874" alt="Simulator Screenshot - iPhone 17 Pro - 2025-10-06 at 20 39 47" src="https://github.com/user-attachments/assets/bb288479-6f39-4d0e-b8f0-dc037888627c" />
