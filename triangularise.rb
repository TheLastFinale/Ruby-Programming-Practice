def triangularize(n)
  the_tri = []
  if n.class != Integer
    return nil
  end
  if n > 222 || n < 1
    return nil
  end

  #line 1
  n.times do
    the_tri = the_tri.push("_")
  end
  the_tri = the_tri.push(" " + "\n")

  #line 2
  the_tri = the_tri.push("\\")
  (n-1).times do
    the_tri = the_tri.push(" ")
  end

  #lines 3 through n
  if n > 2
    x = 1
    until x == n - 1

      the_tri = the_tri.push("|\n")
      x.times do
        the_tri = the_tri.push(" ")
      end
      the_tri = the_tri.push("\\")
      (n-1-x).times do
        the_tri = the_tri.push(" ")
      end
      x += 1

    end
  end

  #line n+1
  the_tri = the_tri.push("|\n")
  (n-1).times do
    the_tri = the_tri.push(" ")
  end
  the_tri = the_tri.push("\\|")


the_tri.each do |st|
  print st


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
