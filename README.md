# README

# Setup and basic layout

I used ruby ruby-3.1.3 and rails 7.0.4.2 to create the example application. Installing the correct ruby version and running `bundle` should be enough to set it up. Tests can be run with `bundle exec rspec` or using your IDE.

## Note about time spent and assignment specifications

I actually spent 3 hours on this, because I did not code it all in one sitting, instead doing it bit by bit over the day. I also took the chance to refresh my ruby knowledge and remember lots of caveats, setup Rubymine, and other general tasks. Also, translating the assignment into a real ruby application was the most time consuming part. In the future I'd suggest providing a simple repository like the initial commit on this for future interviews.

## Database setup

`sqlite3` is used for the database, and the `seeds.rb` file must be run to make the app work. The tests do not rely on `seeds.rb`, so no setup is needed for that. In order to setup the database for development, and to be able to use the app, please run `bundle exec db:migrate db:seed`

### Commit history and context
The resulting application includes codes for all problems. 
1. The initial commit contains the best approximation I could do to the assignment's code, without any improvement/fixes/work done.
2. Next commit includes basic tests that would have been there if I had written the app from scratch, using TDD. As well as 404 handling.

The next commits include solutions to all problems.

# Problem 1

I implemented the requested function as part of a Utils class which I placed inside app/lib (to make it autoload without editing autoload_paths), the tests for this function are inside `spec/filter_and_group_spec.rb`. I used TDD to develop this, and assumed that an empty hash would be returned for integers under 2. I preffered this over raising an exception, which is also a possibility, mostly because it feels like a more comfortable interface for a utility function.

# Problem 2

The code for problem 2 was not working as provided, since ruby code was placed inside the view, without the `<% %>` syntax. I moved part of the code to a controller, which I think is the more sensible approach, rather than fetching users inside the view. I also used `seed.rb` to setup some users, and `params.require(:id)` instead of a hard-coded id. All of this work was done to translate the assignment to a live rails app.

After that I started the actual refactoring, first option is what I'd consider the "ruby way", placing full_name inside the model. But I believe this has it's own share of problems. For example mobile and desktop views might want different ways of rendering the full name of a user.

## Problem 2 alternative (located in branch problem2_alternative)

The alternative solution to problem 2, which I prefers, involves using a view helper, which is then reused through all views. This decouples the model from it's representation, which allows more flexibility and respects the single responsibility principle.

## Problem 2 improvement (located in branch problem2_improvement)

I realize multiple views for users were probably added as a way to test my usage of helpers or model abstractions, but in a real application, I'd probably try to not repeat myself so much, and rely in a single view, changing the rendered user inside the controller. 

# Problem 3

I saw 2 issues in problem 3's code

## Using html_safe instead of sanitize

This will cause all text inside content to be put directly into the HTML, resulting in possible injection security issues. I quickly tested this by changing the layout to include a `<ul>` andn adding a review in `seeds.rb` which had the characters `</ul>`. My assumption proved correct, and I moved on to fix it by using `sanitize`. I also added a quick controller test to make sure no regressions happened in the future. And another test to make sure that well intended html content was still working.

## N+1 performance issue

I suspected there was an n+1 issue since for each review we tried to fetch a user, which was not included in the original query. I confirmed this with the gem `bullet`, in this simple scenario just looking at the generated SQL in the rails console would have been enough, but in more complex applications bullet has been a life saver.

I also tried a new gem (`n_plus_one_control`) that I did not know about, that helped me write a very simple and effective test, to make sure that no n+1 problems would happen for different numbers of reviews. You can check the documentation [here](https://github.com/palkan/n_plus_one_control).
