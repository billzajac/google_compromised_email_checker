local email = ngx.var.arg_email or ""
html_form = [[<form action="]] .. ngx.var.uri .. [["> <h2>Enter the first part of your email up to the @</h2><h3>DO NOT INCLUDE the @</h3> <ul> <li> <label for="email">Email:</label> <input class="text" name="email" type="text" /> </li> </ul> <input class="button" type="submit" value="Check" /> </form>]]
html_warn = [[<h1 style="color:red">Only use letters, numbers, _, -, or .</h1>]]

if email == "" then
  ngx.say(html_form)
elseif email:match("^[.A-Za-z0-9_-]+$") == nil then
  ngx.say(html_warn .. html_form)
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
end
ngx.say([[<hr>]])
ngx.say([[Code source: <a href="https://github.com/billzajac/google_compromised_email_checker">https://github.com/billzajac/google_compromised_email_checker</a><br>]])
ngx.say([[Data source: <a href="http://rghost.net/download/57937836/35f838fa3fb1639873e65fbe6b7487164772e031/google_5000000.txt.zip">http://rghost.net/download/57937836/35f838fa3fb1639873e65fbe6b7487164772e031/google_5000000.txt.zip</a>]])
ngx.say([[<hr><center>Copyright &copy; 2014 William Zajac</center><br>]])
