def triangularize(n)
  the_tri = []
  if n.class != Integer
    return nil
  end
  if n > 222 || n < 1 #222 is the width of my command prompt screen
                      #we also just don't want non-real numbers in our
    return nil        #program
  end
#see below for the lines guide
  
#line 1
  #add to the array n*B

  n.times do
     the_tri.push("_")
  end
  the_tri.push(" " + "\n")

#line 2
  #S + \f + D + (n-1)S
  the_tri.push("\\")
  (n-1).times do
    the_tri.push(" ")
  end

#lines 3 through n
  #P + \f + xS + D + (n-1-x)S; x += 1 until x == n - 1
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
  #P + \f + (n-1)S + D + P
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
Size 7 triangle:
_______         Line 1
\      |        Line 2
 \     |        Line 3
  \    |        Line 3
   \   |        Line 5
    \  |        Line 6
     \ |        Line 7
      \|        Line 8



basically:
for triangle of size n
S = Spacebar or " "
B = Underscore or "_"
D = Backslash or "\"
P = Pipe or "|"
\f = newline command
x = the current line - 2

if you divide the triangle up into n+1 lines, each of which have n + 1\n characters each, it's easier to visualize mentally
for this example I'll be doing a size 3 triangle.
=>___     Line 1: add to the array n*B
=>\  |    Line 2: S + \f + D + (n-1)S 
=> \ | Lines 3-n: P + \f + xS + D + (n-1-x)S; x += 1 until x == n - 1
=>  \|  Line n+1: P + \f + (n-1)S + D + P
  
any given array in this function is size (n+1)^2, 


=end
