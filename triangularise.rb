def triangularize(n)
  the_tri = []
  if n.class != Integer
    return nil
  end
  if n > 222 || n < 1 #222 is the width of my command prompt screen
                      #we also just don't want non-real numbers in our
    return nil        #program
  end

#line 1
  #adds our "_" symbols to the array n times
  n.times do
     the_tri.push("_")
  end
  the_tri.push(" " + "\n")

#line 2
  #adds our "\" symbol to the array
  #then adds " " to the array n-1 times
  #the newline isn't seen here as we use it in each iteration of the next block
  the_tri.push("\\")
  (n-1).times do
    the_tri.push(" ")
  end

#lines 3 through n
  #the first 2 lines are relatively static in calculation, whereas this one needs
  #a little more calculation to it.
  #each line from here out begins with a space, so we base the number of spaces
  #we have to print before and after the \ symbol off of the current line
  #we're on. This just works because of some math I gone and did.
  #basically, if each line from here on out is treated as line 1+,
  #then there's one extra space per line before the \ symbol
  #therefore, the only remaining symbols afterwards are (n-1-x) symbols
  #and a |\n to prepare for the next line
  #I figured this all out on graph paper by drawing out triangles.
  if n > 2
    x = 1
    until x == n - 1

      the_tri.push("|\n")
      x.times do
        the_tri.push(" ")
      end
      the_tri.push("\\")
      (n-1-x).times do
        the_tri.push(" ")
      end
      x += 1

    end
  end

#line n+1
  #this is the end of our triangle
  #it's also relatively statically produced, where you simply need one more |
  #symbol and then n-1 " "s and top it down with a \|. This is very similar to
  #the way the first 2 lines of any triangle are produced as well.
  #
  #incidentally, a size(1) triangle will not look like a triangle.
  the_tri.push("|\n")
  (n-1).times do
    the_tri.push(" ")
  end
  the_tri.push("\\|")


the_tri.each do |st|
  print st
end
end


triangularize(7)

=begin
output for 7:
_______
\      |
 \     |
  \    |
   \   |
    \  |
     \ |
      \|
=end
