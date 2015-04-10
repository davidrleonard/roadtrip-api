// =====
// JavaScripts. Yum.
// =====

$(document).ready(function(){
  $('.js-category-pick').click(function(e){
    e.preventDefault();

    // What'd you want?
    var requested = $(this).attr('href'); // => 'history'

    // Build it up
    var template_needed = '#js-category-' + requested;
console.log(template_needed);
    // Get the template
    var builtHTML = $(template_needed).html();
console.log(builtHTML);
    // Put it in the DOM
    $('#active').html(builtHTML);
  });
});