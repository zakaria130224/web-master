/* Select2 Init*/
"use strict";
$(".select2").select2({
    placeholder: "--Please Select--"
});
$("#input_tags").select2({
    tags: true,
    tokenSeparators: [',', ' ']
});