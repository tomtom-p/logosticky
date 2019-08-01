{if isset($hi_fb_on) && $hi_fb_on}
	<script>
		{literal}
			var redirect = '{/literal}{$hi_fb_login_page}{literal}';
			window.fbAsyncInit = function() {
				FB.init({
					appId: '{/literal}{$hi_fb_app_id}{literal}',
					scope: 'email, user_birthday',
					cookie: true,
					status: true,
					xfbml: true, 
					version: 'v2.1'
				});
			};
			(function(d, s, id) {
				var js, fjs = d.getElementsByTagName(s)[0];
				if (d.getElementById(id)) return;
				js = d.createElement(s); js.id = id;
				js.src = "//connect.facebook.net/en_US/sdk.js";
				fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));
			
			function pfFbLogin() {
				FB.api('/me?fields=email,birthday,first_name,last_name,gender', function(response) {
					$.ajax({
						type: "POST",
						url: baseDir + "modules/nrtfacebookconnect/ajax/facebookConnect.php",
						data: {
							firstname: response.first_name, 
							lastname: response.last_name, 
							email: response.email, 
							id: response.id, 
							gender: response.gender,
							birthday: response.birthday
						},
						success:  function(data){ 
						    if(data == 'no_email'){
						        alert(no_email);  
						    }else{
						        
							if(redirect == "no_redirect")
								window.location.reload();
							if(redirect == "authentication_page")
								window.location.href = "{/literal}{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}{literal}";	
						    }
						}
					});
				});
			}
			
			function fb_login(){
				FB.login(function(response) {
					if (response.authResponse) {
						access_token = response.authResponse.accessToken;
						user_id = response.authResponse.userID;
						pfFbLogin();
					}	
				},
				{
					scope: 'public_profile,email'
				});
			}
		{/literal}
	</script>
{/if}