$(document).ready(function() {
        $('#voto1').click(function(event) {
            $.get('Votacion', {
                    votacion : "1", 
                    peliculaInfo: $('#peliculaInfo').val()
            }, function(responseText) {
                    $('#ajaxGetUserServletResponse').text(responseText);
            });
        });
        
        $('#voto2').click(function(event) {
            $.get('Votacion', {
                    votacion : "2", 
                    peliculaInfo: $('#peliculaInfo').val()
            }, function(responseText) {
                    $('#ajaxGetUserServletResponse').text(responseText);
            });
        });
        
        $('#voto3').click(function(event) {
            $.get('Votacion', {
                    votacion : "3", 
                    peliculaInfo: $('#peliculaInfo').val()
            }, function(responseText) {
                    $('#ajaxGetUserServletResponse').text(responseText);
            });
        });
        
        $('#voto4').click(function(event) {
            $.get('Votacion', {
                    votacion : "4", 
                    peliculaInfo: $('#peliculaInfo').val()
            }, function(responseText) {
                    $('#ajaxGetUserServletResponse').text(responseText);
            });
        });
        
        $('#voto5').click(function(event) {
            $.get('Votacion', {
                    votacion : "5", 
                    peliculaInfo: $('#peliculaInfo').val()
            }, function(responseText) {
                    $('#ajaxGetUserServletResponse').text(responseText);
            });
        });
});