// $ execute jquery here because of the $
// when the document is loaded then run the javascript
$(document).ready(function() {
  $(".navdrop-down").hide();
  $('.link').click(function(){
    $(".navdrop-down").slideToggle();
  })
}) 



