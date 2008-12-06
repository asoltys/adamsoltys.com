$(function() {
  Date.format = 'mm/dd/yyyy';
  $('input#post_created_at').datePicker({
    clickInput:true, 
    startDate:'01/01/2008', 
    createButton:false
  });
});
