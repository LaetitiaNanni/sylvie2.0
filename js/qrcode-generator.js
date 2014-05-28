

/*******************
UTILITIES
*******************/

/*
 * takes the id of an object (any kind of string will do)
 * and the size of the qrcode to generate (e.g. '100' -> 100x100px)
 * and the color of the qrcode to generate (a hexadecimal code)
 *
 * PREREQUISITES
 * - the decorative image we wish to put at the center of the qrcode must be stored in '#qrcode-resources img.logo-imac'
 * - there must be an empty div#qrcode-buffer which will be filled with the picture of the generated qrcode
 */
function qrcode_generate(id, size, color) {
  var options = {
    render: 'image', // render the qrcode as an image (also available: HTML5 'canvas')
    ecLevel: "H", // error correction level: highest, do not alter
    minVersion: 6, // qrcode version, do not alter

    text: id,
    fill: color, // the color of the squares composing the qrcode
    background: "#FFFFFF",
    'size': parseInt(size),
    radius: 0.5, // to have rounded corners for each square composing the qrcode
    quiet: 1, // somewhat alters the spacing around the center picture, do not alter

    mode: 4, // put an image at the center (other modes are for putting text)

    mSize: 0.3, // the logo takes 30% of the qrcode's size
    mPosX: 0.5, mPosY: 0.5, // centered

    image: $("#qrcode-resources img.logo-imac")[0] // the element where the center decorative picture is stored
  };

  $("#qrcode-buffer").empty().qrcode(options);
}


function trigger_form_qrcode_gen_submit() {
  $('#form-qrcode-gen').submit();
}


/*******************
EVENT HANDLERS
*******************/


/*
 * generates a qrcode according to the values in the form
 */
function on_form_qrcode_gen_submit() {
  var id = $(this).find("input#f-qg-id").val();
  if(id == undefined) {
    return false;
  }

  var size = $(this).find("select#f-qg-size").val();
  if(size == undefined) {
    return false;
  }

  var color = $(this).find("input#f-qg-color").val();

  qrcode_generate(id, size, color);

  $('a#qrcode-download').attr(
    'href',
    $('#qrcode-buffer img').attr('src')
  );

  return false;
}


/*******************
INITIALIZERS
*******************/


function init() {
  /*
   * form handling
   */
  $('#form-qrcode-gen').submit(on_form_qrcode_gen_submit);
  $('#form-qrcode-gen select').change(trigger_form_qrcode_gen_submit);
}

$(document).ready(init);
