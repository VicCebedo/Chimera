// Store the currently selected tab in the hash value.
$("ul.nav-tabs > li > a").on("shown.bs.tab", function (e) {
	var id = $(e.target).attr("href").substr(1);
	
	// Code to call as a workaround over gantt bug where chart doesn't
	// render if placed in a tab.
	if(id == "tab_timeline"){
		gantt.render();
	}
    window.name = id;
    
    // TODO Some href links, if equal to #, scrolls to top.
    return false;
});

// Toggle display of two divs.
function switchDisplay(div1, div2) {
	toggleVisibility(div1);
	toggleVisibility(div2);
}

// Toggle hide/show of object.
function toggleVisibility(obj) {
	obj = $(obj); 
	if(obj.is(":visible")){
		obj.hide();
	} else {
		obj.show();
	}
}

// Sleep for a few seconds.
function sleep(milliseconds) {
  var start = new Date().getTime();
  for (var i = 0; i < 1e7; i++) {
    if ((new Date().getTime() - start) > milliseconds){
      break;
    }
  }
}

// Submit a form.
function submitForm(id) {
	$('#'+id).submit();
}