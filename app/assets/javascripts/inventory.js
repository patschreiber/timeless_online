$(document).ready(function() {
  $('.options').on('click', function(e) {
    e.preventDefault();
  });

  // Initiates popover content on elements with class .options that displays html content contained within 
  // class .popover-content that's within the .option element
  $('.options').on('mouseenter', function() {
    $(this).popover({
      html: true,
      trigger: 'manual',
      placement: 'left',
      viewport: 'body',
      content: function() {
        return $(this).find('.popover-content').html();
      }
    }).popover('show');
  });

  $('.options').on('mouseleave', function() {
    $(this).popover({
      html: true,
      trigger: 'manual',
      placement: 'left',
      viewport: 'body',
      content: function() {
        return $(this).find('.popover-content').html();
      }
    }).popover('hide');
  });
});