
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![GPL License][license-shield]][license-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/F0xedb/shUnit">
    <img src="https://tos.pbfp.xyz/images/logo.svg" alt="Logo" width="150" height="200">
  </a>

  <h3 align="center">Shell Unit Test Framework</h3>

  <p align="center">
    A simple bash test runner
    <br />
    <a href="https://github.com/F0xedb/shUnit"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/F0xedb/shUnit">View Demo</a>
    ·
    <a href="https://github.com/F0xedb/shUnit/issues">Report Bug</a>
    ·
    <a href="https://github.com/F0xedb/shUnit/issues">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Usage](#usage)
* [Roadmap](#roadmap)
* [Contributing](#contributing)
* [License](#license)
* [Contact](#contact)
* [Acknowledgements](#acknowledgements)



<!-- ABOUT THE PROJECT -->
## About The Project


<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

All you need is a compatible shell eg bash

### Installation
 
1. Clone the shUnit
```sh
git clone https:://github.com/F0xedb/shUnit.git
```

copy shUnit and assert.sh to your path.
eg

```bash
cp shUnit /usr/bin/shUnit
cp assert.sh /usr/bin/assert.sh
```


<!-- USAGE EXAMPLES -->
## Usage

Running `shUnit` is relatively simple `cd` into the root directory of the project and run `shUnit`
shUnit will run all files ending with `.shunit`

Here is a basic unit test file
```bash
# unit test showcase
function AequalsA {
    AssertEqual "a" "a" # no problem
    AssertContains "abcdefg" "def"  # no problem
}

function FailTest {
    AssertEquals "a" "b" # error a != b
}
```

The runner outputs the following

```bash
$ shUnit
> Running unit test : unit test showcase
> Pass: AequalsA
> Error: FailTest failed - expected a got b
> unit test failed: Pass: 1 Error: 1
```

Here is a short list of assertions:
* `AssertEquals` input a, b -> must equal or an error occurs
* `AssertFileEquals` input a, b(files) -> must equal or an error occurs
* `AssertContains` input a,b -> b must be a substring of a
* `AssertFileContains` input a,b (files- -> b must be inside of a
* `AssertExists` input a -> Check if a file or variable exists
* `AssertTrue` input a -> give a shell statement to check if something exists eg `[ -f "$A" ]`
* `Assert` input a -> Fails automatically when called. The input is a short message of what went wrong

Here are some simple examples

```bash
# Assertion examples

function exists {
    file="$HOME/h"
    AssertExists "$file" # file doesn't exist so this test fails
}
function content {
    touch a
    cat <<EOF > b
    b
EOF
    AssertFileEquals "a" "b" # the content is not the same so the test failes
}
function equals {
    AssertEquals "a" "a" # the strings are the same so the test passes
}
function filecontains {
  touch a
  cat <<EOF > b
  b
EOF
    AssertFileContains "b" "a" # file b contains data in file a so a pass
    AssertFileContains "a" "b" # file a contains nothing so it doesn't contain the data in b => test failed
}

function assert {
    if [[ "a" != "b" ]]; then
        assert "A does not equal b" # just errors when this is called
    fi
}

function assert_true {
    assertTrue [[ "a" != "b" ]] # this is the same as the assert function
}
```

Optionally we have "special" functions for helping your unit tests

* `setup` # called once per file at the start
* `destory` # called once per file at the end (even when a test fails)
* `setupTest` # called before each function
* `destroyTest` # called after each function

> These function don't need to be used, but are usefull to clean up the test suite
_For more examples, please refer to the [Documentation](https://www.github.com/F0xedb/shUnit/wkik)_



<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/F0xedb/shUnit/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the GPL License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

F0xedb - tom@pbfp.team

Project Link: [https://github.com/F0xedb/shUnit](https://github.com/F0xedb/shUnit)



<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* [F0xedb](https://github.com/F0xedb/shUnit)





<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/F0xedb/shUnit.svg?style=flat-square
[contributors-url]: https://github.com/F0xedb/shUnit/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/F0xedb/shUnit.svg?style=flat-square
[forks-url]: https://github.com/F0xedb/shUnit/network/members
[stars-shield]: https://img.shields.io/github/stars/F0xedb/shUnit.svg?style=flat-square
[stars-url]: https://github.com/F0xedb/shUnit/stargazers
[issues-shield]: https://img.shields.io/github/issues/F0xedb/shUnit.svg?style=flat-square
[issues-url]: https://github.com/F0xedb/shUnit/issues
[license-shield]: https://img.shields.io/github/license/F0xedb/shUnit.svg?style=flat-square
[license-url]: https://github.com/F0xedb/shUnit/blob/master/LICENSE.txt
[product-screenshot]: https://tos.pbfp.xyz/images/logo.svg
