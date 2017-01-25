<footer class="ui-footer">
	<div class="container">
		<p>{date("Y")}SS-Panel-SSR &nbsp; {$config["version"]}</p>
	</div>
	<div style="display:none;">
	    {md5($config["version"])}
	</div	
</footer>
<!-- analytics -->
<div style="display:none;">
    {$analyticsCode}
</div>
</body>
</html>
