

/*******************
UTILITIES
*******************/


/*
 * gives the best color to make the text most readable over a given background color
 * the color parameter is an hexadecimal value
 *
 * return "white" if the color is closer to white
 * return "black" if the color is closed to black
 */
function color_black_or_white(color) {
  var rgb = color_hex_to_rgb(color);

  var luminance = 0.2126 * rgb.r + 0.7152 * rgb.g + 0.0722 * rgb.b;

  return (luminance < 128 ? '#ffffff' : '#000000');
}


/*
 * e.g.
 * color_hex_to_rgb("#ff0000") returns {r: 255, g: 0, b: 0}
 */
function color_hex_to_rgb(hex) {
  var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
  return result ? {
    r: parseInt(result[1], 16),
    g: parseInt(result[2], 16),
    b: parseInt(result[3], 16)
  } : null;
}


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


function on_form_qrcode_gen_color_change() {
  var $selector = $("#form-qrcode-gen select#f-qg-color");
  var $selected = $selector.children('option:selected');

  $selector.css('background-color', $selected.val());
  $selector.css('color', $selected.css('color'));
}

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

  var color = $(this).find("select#f-qg-color").val();

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

/*
 * this function is called on document load
 * it gives a background color to each option in the color selector
 * to enhance readability
 */
function init_form_qrcode_gen_color() {
  var $selector = $("#form-qrcode-gen select#f-qg-color");

  $selector.children('option').each(function() {
    $(this).css('background-color', $(this).val());

    var text_color = color_black_or_white($(this).val());
    $(this).css('color', text_color);
  });

  $selector.change();
}


function init() {
  /*
   * form handling
   */
  $('#form-qrcode-gen').submit(on_form_qrcode_gen_submit);
  $('#form-qrcode-gen select#f-qg-color').change(on_form_qrcode_gen_color_change);
  $('#form-qrcode-gen input').keyup(trigger_form_qrcode_gen_submit);
  $('#form-qrcode-gen select').change(trigger_form_qrcode_gen_submit);

  init_form_qrcode_gen_color();
}

$(document).ready(init);
