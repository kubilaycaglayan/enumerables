[![hire-badge](https://img.shields.io/badge/Consult%20/%20Hire%20Kubilay-Click%20to%20Contact-brightgreen)](mailto:kblycaglayan@gmail.com) [![Twitter Follow](https://img.shields.io/twitter/follow/kbcaglayan?label=Follow%20Kubilay%20on%20Twitter&style=social)](https://twitter.com/kbcaglayan)

# Enumerable-Methods

I am rebuilding Enumerable methods on the Ruby in this project.

> To show that it is not too hard to create enumerable methods I worked hard to create them on my own. With the help of ruby documentation.

Including Functions:
**my_each**
**my_each_with_index**
**my_select**
**my_all?**
**my_any?**
**my_none?**
**my_count**
**my_map**
**my_inject**

## Built With

- Ruby

## Getting Started

To get a local copy up and running follow these steps:

### Prerequisites

- Ruby installed on local machine
- A browser (for usage or repl.it)

### Usage

#### Preview with repl.it in [Live Demo Link](https://repl.it/@kblycaglayan/enumerables)  (with tests)

OR:

- Fork/Clone this project to your local machine
- Open enumerables.rb in your local enviroment and run this code:

```
## Testing 
You can copy and paste this method to test
def my_test
  puts '------> my_any?'.upcase
  puts(%w[ant bear cat].my_any? { |word| word.length >= 3 }) #=> true
  puts(%w[ant bear cat].my_any? { |word| word.length >= 4 }) #=> true
  puts %w[ant bear cat].my_any?(/d/) #=> false
  puts [nil, true, 99].my_any?(Integer) #=> true
  puts [nil, true, 99].my_any? #=> true
  puts [].my_any? #=> false
  puts '------> my_none?'.upcase
  puts(%w[ant bear cat].my_none? { |word| word.length == 5 }) #=> true
  puts(%w[ant bear cat].my_none? { |word| word.length >= 4 }) #=> false
  puts %w[ant bear cat].my_none?(/d/) #=> true
  puts [1, 3.14, 42].my_none?(Float) #=> false
  puts [].my_none? #=> true
  puts [nil].my_none? #=> true
  puts [nil, false].my_none? #=> true
  puts [nil, false, true].my_none? #=> false
  puts '-------> my_count'.upcase
  ary = [1, 2, 4, 2]
  puts ary.my_count               #=> 4
  puts ary.my_count(2)            #=> 2
  puts ary.my_count{ |x| x%2==0 } #=> 3
  puts '-------> my_map?'.upcase
  print (1..4).my_map { |i| i * i } #=> [1, 4, 9, 16]
  puts
  print (1..4).my_map { 'cat' } #=> ["cat", "cat", "cat", "cat"]
  puts
  triple = proc do |item|
    item * 3
  end
  puts ' --  __BOTH__  --  '
  result = (1..3).my_map(triple) do |x|
    print -x
  end
  print result
  puts
  puts ' --  __ONLY__BLOCK__  --  '
  result = (1..3).my_map(&:-@)
  print result
  puts
  puts ' --  __ONLY__PROC__  --  '
  print (1..3).my_map(triple)
  puts

  puts '-------> my_inject?'.upcase
  result = %w[a b cc].my_inject('x') do |memo, n|
    memo + n
  end
  puts result
  # Sum some numbers
  puts (5..10).my_inject(:+) #=> 45
  # Same using a block and inject
  puts (5..10).my_inject { |sum, n| sum + n } #=> 45
  # Multiply some numbers
  puts (5..10).my_inject(1, :*) #=> 151200
  # Same using a block
  puts (5..10).my_inject(1) { |product, n| product * n } #=> 151200
  # find the longest word
  longest = %w[cat sheep bear].my_inject do |memo, word|
    memo.length > word.length ? memo : word
  end
  puts longest #=> "sheep"
  puts (1..5).my_inject(:*)
  puts multiply_els([2, 4, 5])
end

```

## Author

👤 **Kubilay Caglayan**

- Github: [@kblycaglayan](https://github.com/kblycaglayan)
- Twitter: [@kbcaglayan](https://twitter.com/kbcaglayan)
- LinkedIn: [Kubilay](https://www.linkedin.com/in/kubilaycaglayan/)
- Email: [kblycaglayan@gmail.com](mailto:kblycaglayan@gmail.com)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/kblycaglayan/Enumerable-Methods/issues)

Start by:

- Forking the project
- Cloning the project to your local machine
- `cd` into the project directory
- Run `git checkout -b your-branch-name`
- Make your contributions
- Push your branch up to your forked repository
- Open a Pull Request with a detailed description to the development(or master if not available) branch of the original project for a review

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- The Odin project for the project plan
- https://ruby-doc.org/core-2.6.5/Enumerator.html
- https://ruby-doc.org/core-2.6.5/Enumerable.html

## 📝 License

This project is [MIT](LICENSE.md) licensed
