$("#main-ul").hide();

function slideT(clicked){
	document.getElementById(clicked).children().slideToggle();
}


// On page load
$(window).load(columnHeight);

// On window resize
$(window).resize( function () {
    // Clear all forced column heights before recalculating them after window resize
    $(".column").css("height", "");  
    columnHeight();
});

// Make columns 100% in height
function columnHeight() {
    // Column heights should equal the document height minus the header height and footer height
    var newHeight = $(document).height() - $("footer").height() - 5+ "px";
    $(".column").css("height", newHeight);

}