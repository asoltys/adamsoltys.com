var NUM_ITEMS_TO_DISPLAY = 3;

Event.observe(window, 'load', function() {
	$$('div#content ul').each(function(e) {
		showLess(e);
	});
	
	$$('a.more').each(function(e) {
		e.observe('click', clickHandler);
	});
});

function clickHandler(e)
{
	e = e.element();
	if (e.innerHTML == 'More...')
	{
		showMore(e.previous());
		e.update('Less...');
	}
	else
	{
		showLess(e.previous());
		e.update('More...');
	}
}

function showLess(e)
{
	var i = 0;
	e.childElements().each(function(c) {
		i++;
		if (i > NUM_ITEMS_TO_DISPLAY) c.hide();
	});
}

function showMore(e)
{
	e.childElements().invoke('show');
}