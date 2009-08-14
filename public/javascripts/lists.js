$(function() {
  var more_link = "<a class=\"more\">More...</a>";
  $('div#content ul').filter(needShrinking).after(more_link).find("li:gt(3)").hide();
  $('a.more').click(toggleList);
});

function needShrinking()
{
  return $(this).children().length > 4;
}

function toggleList()
{
  $(this).prev().find("li:gt(3)").toggle();
  $(this).text() == 'More...' ? $(this).text('Less...') : $(this).text('More...');
}
