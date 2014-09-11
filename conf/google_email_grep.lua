local email = ngx.var.arg_email or ""
local hmtl_form = [[<form action="]] .. ngx.var.uri .. [["> <h2>Enter the first part of your email up to the @ (DO NOT INCLUDE the @)</h2> <ul> <li> <label for="email">Email:</label> <input class="text" name="email" type="text" /> </li> </ul> <input class="button" type="submit" value="Check" /> </form>]]
local hmtl_warn = [[<h1 style="color:red">Only use letters, numbers, _, -, or .</h1>]]

if email == "" then
  ngx.say([[<form action="]] .. ngx.var.uri .. html_form)
elseif email:match("^[.A-Za-z0-9_-]+$") == nil then
  ngx.say(hmtl_warn .. hmtl_form)
else
  ngx.say("Results for: " .. email)
  ngx.say([[<hr><ul>]])
  counter = 0
  for mat in io.popen("grep " .. email .. " ./google_5000000.txt"):lines() do
    counter = counter + 1
    if counter > 10 then
      ngx.say("<li> ... more than 10 results, please be more specific")
      ngx.say([[</ul>]])
      break
    end
    ngx.say("<li> " .. mat)
  end
  ngx.say([[</ul>]])
  ngx.say([[<a href="]] .. ngx.var.uri .. [[">Return to perform another search</a>]])
  ngx.say([[<hr><center>Copyright &copy; 2014 William Zajac</center>]]
end
