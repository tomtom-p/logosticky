$(document).ready(function () {
	
		$('body').append('<div id="moda_compare" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true"><div class="modal-dialog" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div><div class="modal-body"><div id="data_content_compare">......</div></div></div></div></div>');
		
		$(".add_to_compare").click(function(){
			$("body").append("<div class='loading'></div>");
			var id_product = $(this).attr('data-id-product');
			AddCompare($(this),id_product);
		});
		$(".remove_to_compare").click(function(){
			$("body").append("<div class='loading'></div>");
			var id_product = $(this).attr('data-id-product');
			RemoveCompare($(this),id_product);
		});
});


function AddCompare(selector,id_product)
{
	$.ajax({
		type: 'POST',
		url: baseDir + 'modules/nrtcompare/ajax.php',
		headers: { "cache-control": "no-cache" },
		async: true,
		data: 'id_product_add=' + id_product + '&token=' + static_token,
		cache: false,
		success: function(data)
		{
				if(data == 'checked'){
					selector.addClass('checked');	
					selector.attr('title',remove_to_compare);
					$('#data_content_compare').html(add_compare+'<br/><a class="goto_page" href='+mycompare+'>'+view_compare+'</a>');
					$("body div.loading").remove();
					$("#moda_compare").modal({show: true});
				}else if(data == 'limit'){
					$('#data_content_compare').html(first_alert_compare+limit_compare+last_alert_compare+'<br/><a class="goto_page" href='+mycompare+'>'+view_compare+'</a>');
					$("body div.loading").remove();
					$("#moda_compare").modal({show: true});
				}
				else{
					selector.removeClass('checked');	
					selector.attr('title',add_to_compare);
					$('#data_content_compare').html(remove_compare+'<br/><a class="goto_page" href='+mycompare+'>'+view_compare+'</a>');
					$("body div.loading").remove();
					$("#moda_compare").modal({show: true});		
				}
		}
	});
}

function RemoveCompare(selector,id_product)
{
	$.ajax({
		type: 'POST',
		url: baseDir + 'modules/nrtcompare/ajax.php',
		headers: { "cache-control": "no-cache" },
		async: true,
		data: 'id_product_remove=' + id_product + '&token=' + static_token,
		cache: false,
		success: function(data)
		{
				if(data == 'ok'){
					window.location.reload();
				}
		}
	});
}