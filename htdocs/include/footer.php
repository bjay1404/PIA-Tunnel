<?php

$disp_footer = '';






$disp_footer .= "<div class=\"clear\"></div><p>&nbsp;</p>\n";

$disp_footer .= '<p style="text-align: center">Bitcoin donations accepted at 157Gh2dTCkrip8hqj3TKqzWiezHXTPqNrV</p>';
$disp_footer .= '<script type="text/javascript">
/* sets or removes an attribute based on an elements source value
 - think toggeling an input box with "on" or "off" select dropdown
 - "SomeInputID" may be a comma separated list of ids
 - callback_function - OPTIONAL function to be executed after a switch
 example: toggle(this, "SomeInputId", "off", "disabled", "", "");
*/
function toggle( ele_src, target_id, on_ele_src_value, attribute, value, callback_function){

  var targets; //keeps the target_ids in an array

  if( target_id.indexOf(",") > 1 ){
    targets = target_id.split(",");
  }else{
    targets = [ target_id ];
  }

  var length = targets.length;
  for (var i = 0; i < length; i++) {
    var target = document.getElementById(targets[i]);
    if( ele_src.value == on_ele_src_value ){

      if( !value ) value = "";

      if( target ){
        target.setAttribute(attribute, value);
      }

    }else{
      if( target ){
        target.removeAttribute(attribute);
      }
    }
  }

  if( callback_function && (typeof callback_function == "function")) {
    callback_function();
  }
}
</script>';
$disp_footer .= "\n</body></html>";
?>