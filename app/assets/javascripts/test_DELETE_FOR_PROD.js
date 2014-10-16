$(document).on('click', '#dev-button', function() {
  data = {enemy_id: 1000}

  $.ajax({
    type: 'POST',
    url: '/update-stats',
    data: data,
    beforeSend: function() {
    },
    success: function(data) {
      console.log(data);
    },
    error: function(xhr, status, error) {
    },
    complete: function() {}
  });
  return false;
});