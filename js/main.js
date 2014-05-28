$("#main-menu .menu-sub").hide();


$("#main-menu a").click( function (e) {
    e.preventDefault();
    
    // Si le sous-menu était déjà ouvert, on le referme :
    if ($(this).next(".menu-sub:visible").length != 0) {
        $(this).next().hide();
    }
    // Si le sous-menu est caché, on ferme les autres et on l'affiche :
    else {
        $("#main-menu .menu-sub").hide();
        $(this).next().show();
    }
});

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