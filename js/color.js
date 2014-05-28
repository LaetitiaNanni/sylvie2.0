
/* Valeur de la couleur à retourner */
var currentHex = 'ff8800';

function init() { 

  $('.color-box').colpick({
  layout:'hex',
  submit:0,
  colorScheme:'dark',
  color:'ff8800',
  onSubmit:function(hsb,hex,rgb,el) {
    $(el).css('background-color', '#'+hex);
    $(el).colpickHide();
  },
  onChange:function(hsb,hex,rgb,el){
    currentHex = hex;
    $('#addColor').html(currentHex);
    $(el).css('background-color', '#'+hex);
  }

})
.css('background-color', '#ff8800');


}

$(document).ready(init);
