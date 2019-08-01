$(function() {
	$('input.star').rating();
	$('.auto-submit-star').rating();
	$('.open-comment-form').click(function(e) {
		$("#moda_productcomment").modal({show: true});
    });
	$('button.usefulness_btn').click(function() {
		var id_product_comment = $(this).data('id-product-comment');
		var is_usefull = $(this).data('is-usefull');
		var parent = $(this).parent();

		$.ajax({
			url: productcomments_controller_url + '?rand=' + new Date().getTime(),
			data: {
				id_product_comment: id_product_comment,
				action: 'comment_is_usefull',
				value: is_usefull
			},
			type: 'POST',
			headers: { "cache-control": "no-cache" },
			success: function(result){
				parent.fadeOut('slow', function() {
					parent.remove();
				});
			}
		});
	});

	$('span.report_btn').click(function() {
		if (confirm(confirm_report_message))
		{
			var idProductComment = $(this).data('id-product-comment');
			var parent = $(this).parent();

			$.ajax({
				url: productcomments_controller_url + '?rand=' + new Date().getTime(),
				data: {
					id_product_comment: idProductComment,
					action: 'report_abuse'
				},
				type: 'POST',
				headers: { "cache-control": "no-cache" },
				success: function(result){
					parent.fadeOut('slow', function() {
						parent.remove();
					});
				}
			});
		}
	});

	$('#submitNewMessage').click(function(e) {
		// Kill default behaviour
		e.preventDefault();

		// Form element

        url_options = '?';
        if (!productcomments_url_rewrite)
            url_options = '&';

		$.ajax({
			url: productcomments_controller_url + url_options + 'action=add_comment&secure_key=' + secure_key + '&rand=' + new Date().getTime(),
			data: $('#id_new_comment_form').serialize(),
			type: 'POST',
			headers: { "cache-control": "no-cache" },
			dataType: "json",
			success: function(data){
				if (data.result)
				{
					$("#moda_productcomment").modal('hide');
                    var buttons = {};
                    buttons[productcomment_ok] = "productcommentRefreshPage";
                    modalChooseBox(moderation_active ? productcomment_added_moderation : productcomment_added, productcomment_title, buttons);
				}
				else
				{
					$('#new_comment_form_error ul').html('');
					$.each(data.errors, function(index, value) {
						$('#new_comment_form_error ul').append('<li>'+value+'</li>');
					});
					$('#new_comment_form_error').slideDown('slow');
				}
			}
		});
		return false;
	});
});

function productcommentRefreshPage() {
    window.location.reload();
}


function modalChooseBox(question, title, buttons, otherParams)
{
    var msg, funcName, action;
	msg = '';
    if (title)
		msg = "<h2>" + title + "</h2><p>" + question + "</p>";
    msg += "<p class=\"submit\">";
    var i = 0;
    for (var caption in buttons) {
        if (!buttons.hasOwnProperty(caption)) continue;
        funcName = buttons[caption];
        if (typeof otherParams == 'undefined') otherParams = 0;
        otherParams = escape(JSON.stringify(otherParams));
		if(funcName){
        	action ="window['" + funcName + "'](JSON.parse(unescape('" + otherParams + "')), " + i + ")";
	  		msg += '<button type="submit" class="btn" value="true" onclick="' + action + '" data-dismiss="modal" aria-label="Close">';
		}else{
	  		msg += '<button type="submit" class="btn" value="true" data-dismiss="modal" aria-label="Close" >';
		}
	  msg += '<span>' + caption + '</span></button>'
        i++;
    }
    msg += "</p>";
	$('#data_content_choosebox').html(msg);
	$("#moda_choosebox").modal({show: true});
	
}