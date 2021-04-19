<script>
function idioma_url()
{
	
	var rebanada = cortar_url();

	if( rebanada[ 3 ] === 'es' || rebanada[ 3 ] === 'en' )
		idioma = rebanada[3];
	else
	{
		var local_idioma = localStorage.getItem( 'locale' );
		if( local_idioma !== null )
			idioma = local_idioma;
		else
		{
			localStorage.setItem( 'locale', 'es' );
			idioma = 'es';
		}//end else
	}//end else
	return idioma;
}//end idioma_url
		
function cortar_url(){
	var url_web = window.location.href;
	var rebanada = url_web.split("/");

	return rebanada;
}

	var my_url = cortar_url();
	console.log(my_url);
	my_url[3] = undefined;
	if(my_url[3] !== null && my_url[3] !== undefined && my_url[3].length !== 0  )
	{
		console.log('hay algo');
	}
	else
	{
		console.log("Si esta vacio");
	}

</script>


	/*history.pushState(null, "", my_url[0]+'/'+my_url[1]+'/'+my_url[2]+'/'+my_idioma+'/'+my_url[3]);*/