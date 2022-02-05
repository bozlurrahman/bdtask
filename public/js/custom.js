$(document).ready(function () {

	// validate signup form on keyup and submit
	var validator = $("#edit_post,#new_post").validate({
		rules: {
			post_title: {
				required: true,
				minlength: 5,
			},
			post: {
				required: true,
				minlength: 15,
			},
		},
		messages: {
			post_title: {
				required: "Enter a Post title",
				minlength: jQuery.validator.format("Enter at least {0} characters"),
			},
			post: {
				required: "Enter a Post details",
				minlength: jQuery.validator.format("Enter at least {0} characters"),
			},
		},
		// specifying a submitHandler prevents the default submit, good for the demo
		submitHandler: function () {

			var formData = new FormData($("#edit_post,#new_post")[0]);

			$.ajax({
				url: ajax_url,
				type: "post",
				timeout: 10000,
				async: false,
				data: formData,
				cache:false,
				contentType: false,
				processData: false,
				// data: $("#edit_post,#new_post").serialize(),
			}).fail(function() {

			}).success(function(response){
				console.log(response);
				var response_data = JSON.parse(response);
				var msg = 'Updated Successfully';

				if($("#new_post").length > 0) {
					$("#new_post")[0].reset();
					msg = 'Inserted Successfully';
				}

				if( response_data.success >= 1)
					$('.success-message').slideDown().text(msg);
				setTimeout(function() {
					$('.success-message').slideUp();
				}, 5000)
			});
		},
		// highlight: function (element, errorClass) {
		// 	$(element).parent().next().find("." + errorClass).removeClass("checked");
		// }
	});

});