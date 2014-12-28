$(document).ready(function() {
  $('.options').on('click', function(e) {
    e.preventDefault();
  });

  // AJAX request for equipping
  $('.equip-item').on('click', function() {
    // Get the unique item id 
    var itemToEquip = $(this).val();

    var data = {item_to_equip: itemToEquip};

    $.ajax({
      type: 'POST',
      url: '/equip',
      data: data,
      success: function(data) {

      },
      error: function() {},
      complete: function() {},
    });
  });
});