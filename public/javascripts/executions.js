$(function() {
  Date.format = 'mm/dd/yyyy';
  $('input#execution_date').datePicker({
    clickInput:true, 
    startDate:'01/01/2008', 
    createButton:false
  });
});
