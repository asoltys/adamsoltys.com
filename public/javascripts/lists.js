var SIZE = 3;

$(function() {
  var more_link = "<a class=\"more\">More...</a>";
  $('div#content ul').filter(needShrinking).after(more_link).each(collapse);
  $('a.more').click(expandList);
});

function needShrinking()
{
  return $(this).children().length > 3;
}

function expandList()
{
  var list = $(this).previous();
  list.expand();
}

function expand()
{
  $(this).find("li:gt(3)").show();
}

function collapse()
{
  $(this).find("li:gt(3)").hide();
}
