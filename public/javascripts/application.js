// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// google analytics must go last

var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-9846072-7']);
_gaq.push(['_trackPageview']);

(function() {
  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();