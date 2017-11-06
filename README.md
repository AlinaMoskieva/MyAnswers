# MyAnswers

## Scripts

* `bin/setup` - setup required gems and migrate db if needed
* `bin/quality` - runs rubocop, brakeman, rails_best_practices and bundle-audit for the app
* `bin/ci` - should be used in the CI or locally
* `bin/server` - to run server locally

## Getting Started

### Prepare dependencies

Some gems have native extensions.
You should have GCC installed on your development machine.

* `qt` - to run specs with [Capybara Webkit](https://github.com/thoughtbot/capybara-webkit)
* `phantomjs` - to run Javascript unit tests
* `graphviz` - to generate Entity-Relationship Diagram

Setup required dependencies from `Brewfile`:
```bash
brew tap Homebrew/bundle
brew bundle

1. Clone application.

   ```bash
   git clone git@github.com:AlinaMoskieva/MyAnswers.git
   ```

2. Run setup script

  ```bash
  bin/setup
  ```

3. Run test and quality suits to make sure all dependencies are satisfied and applications works correctly before making changes.

  ```bash
  bin/ci
  ```

4. Run app

  ```bash
  bin/server
  ```
