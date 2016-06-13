<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<footer class="container-fluid">
	<p>Copyright &copy; Samantha Molina, Andr&eacute;s Samaniego,
		Stalin Guam&aacute;n</p>
</footer>

<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.0-rc2/js/bootstrap.min.js"></script>
<script>
	$("#myCarousel").on('slide.bs.carousel', function(evt) {
	  var id = $(evt.relatedTarget).index();
	  console.debug("slide transition started")
	  console.debug('current slide = ', $(this).find('.active').index())
	  console.debug('next slide = ', $(evt.relatedTarget).index())
	  
	  document.getElementById("peliculaInfo").value = id;
	})
</script>

</body>
</html>
