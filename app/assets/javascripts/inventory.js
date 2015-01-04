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
        console.log(data);

        // Equip item
        var equipped_item_inventory_row = $('#item-' + data.equipped_item.unique_item_id);

        // Only add the one checkmark signifying the item is equipped
        if ( !equipped_item_inventory_row.find('.equipped').hasClass("ss-check") ) {
          equipped_item_inventory_row.find('.equipped').addClass('ss-icon ss-check text-center text-success');
        }
        equipped_item_inventory_row.find('.equip-item').text('Unequip');

        // Unequip item
      },
      error: function() {},
      complete: function() {},
    });
  });
});