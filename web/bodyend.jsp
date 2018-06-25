
<script src="style/js/vendor/jquery.js" type="text/javascript"></script>
<script src="style/js/vendor/fastclick.js" type="text/javascript"></script>
<script src="style/js/foundation.min.js" type="text/javascript"></script>

<script>
    //var easter_egg = new Konami('javascript:var%20KICKASSVERSION="2.0";var%20s%20=%20document.createElement("script");s.type="text/javascript";document.body.appendChild(s);s.src="//hi.kickassapp.com/kickass.js";void(0);');
    jQuery.fn.load = function(callback){ $(window).on("load", callback) };
    $(document).foundation();
</script>