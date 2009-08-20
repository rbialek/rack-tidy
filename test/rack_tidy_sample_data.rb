module RackTidySampleData
  
DIRTY_HTML = <<-dirty
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>True Blood - Wikipedia, the free encyclopedia</title>
<link href="/stylesheets/style.css" media="screen" rel="stylesheet" type="text/css" />
</head>
<body>
<p><i><b>True Blood</b></i> is an <a href="/wiki/Television_in_the_United_States" title="Television in the United States">American</a> <a href="/wiki/Television_drama_series" title="Television drama series" class="mw-redirect">television drama series</a> created and produced by <a href="/wiki/Alan_Ball_(screenwriter)" title="Alan Ball (screenwriter)">Alan Ball</a>. It is based on the <i><a href="/wiki/The_Southern_Vampire_Mysteries" title="The Southern Vampire Mysteries">The Southern Vampire Mysteries</a></i> series of novels by <a href="/wiki/Charlaine_Harris" title="Charlaine Harris">Charlaine Harris</a>. The show is broadcast on the premium cable network <a href="/wiki/HBO" title="HBO">HBO</a> in the United States. It is produced by HBO in association with Ball's production company, Your Face Goes Here Entertainment. It premiered on September 7, 2008.</p>
<h1>Episode Guide</h1>
<ul>
<li><a href="/wiki/True_Blood_(season_1)">Season One</a></li>
<li><a href="/wiki/True_Blood_(season_2)">Season Two</a></li>
</ul>
</body>
</html>
dirty

CLEAN_HTML = <<-clean
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>
      True Blood - Wikipedia, the free encyclopedia
    </title>
    <link href="/stylesheets/style.css" media="screen" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <p>
      <i><b>True Blood</b></i> is an <a href="/wiki/Television_in_the_United_States" title="Television in the United States">American</a> <a href="/wiki/Television_drama_series" title="Television drama series" class="mw-redirect">television drama series</a> created and produced by <a href="/wiki/Alan_Ball_(screenwriter)" title="Alan Ball (screenwriter)">Alan Ball</a>. It is based on the <i><a href="/wiki/The_Southern_Vampire_Mysteries" title="The Southern Vampire Mysteries">The Southern Vampire Mysteries</a></i> series of novels by <a href="/wiki/Charlaine_Harris" title="Charlaine Harris">Charlaine Harris</a>. The show is broadcast on the premium cable network <a href="/wiki/HBO" title="HBO">HBO</a> in the United States. It is produced by HBO in association with Ball's production company, Your Face Goes Here Entertainment. It premiered on September 7, 2008.
    </p>
    <h1>
      Episode Guide
    </h1>
    <ul>
      <li>
        <a href="/wiki/True_Blood_(season_1)">Season One</a>
      </li>
      <li>
        <a href="/wiki/True_Blood_(season_2)">Season Two</a>
      </li>
    </ul>
  </body>
</html>
clean

CLEAN_HTML_WITH_4_SPACE_INDENTS = <<-clean_with_4
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>
            True Blood - Wikipedia, the free encyclopedia
        </title>
        <link href="/stylesheets/style.css" media="screen" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <p>
            <i><b>True Blood</b></i> is an <a href="/wiki/Television_in_the_United_States" title="Television in the United States">American</a> <a href="/wiki/Television_drama_series" title="Television drama series" class="mw-redirect">television drama series</a> created and produced by <a href="/wiki/Alan_Ball_(screenwriter)" title="Alan Ball (screenwriter)">Alan Ball</a>. It is based on the <i><a href="/wiki/The_Southern_Vampire_Mysteries" title="The Southern Vampire Mysteries">The Southern Vampire Mysteries</a></i> series of novels by <a href="/wiki/Charlaine_Harris" title="Charlaine Harris">Charlaine Harris</a>. The show is broadcast on the premium cable network <a href="/wiki/HBO" title="HBO">HBO</a> in the United States. It is produced by HBO in association with Ball's production company, Your Face Goes Here Entertainment. It premiered on September 7, 2008.
        </p>
        <h1>
            Episode Guide
        </h1>
        <ul>
            <li>
                <a href="/wiki/True_Blood_(season_1)">Season One</a>
            </li>
            <li>
                <a href="/wiki/True_Blood_(season_2)">Season Two</a>
            </li>
        </ul>
    </body>
</html>
clean_with_4

CSS = <<-css
body {
font-family: "Lucida Grande", "Lucida Sans Unicode", Verdana, sans-serif;
font-size: 1em;
margin: 0 auto;
}
css

JS = <<-js
function(foo) {
alert('bar')
}
js

end