function loginViaEmail() {
  navigator.id.get(function(assertion) {
    if (assertion) {
      $('input[name=assertion]').val(assertion);
      $('#browser_id_form').submit();
    } else {
      window.location = "#{failure_path}"
    }
  });
}

$(function() {
  $('#browser_id_form button').click(function() {
    loginViaEmail();
    return false;
  });
});
