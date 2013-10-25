
var artSrc = ['/categoryIcon_art_85x85.png', '/categoryIcon_art_85x85_selected.png'];
var techSrc = ['/categoryIcon_technology_85x85.png', '/categoryIcon_technology_85x85_selected.png'];
var sciSrc = ['/categoryIcon_science_85x85.png', '/categoryIcon_science_85x85_selected.png'];

var showDetails = function(e) {
  test = e.currentTarget.previousSibling;
  jQuery(test).toggleClass('display');
};

var check = function(e) {
  $('.checks').each(function() {
    $(this).attr('checked', false);
  });

  var check = $(this).next();
  jQuery(check).attr('checked', 'checked');
   $('.tech').attr('src', techSrc[0]);
   $('.art').attr('src', artSrc[0]);
   $('.sci').attr('src', sciSrc[0]);

  if ($(this).hasClass('art')) {
    $(this).attr('src', artSrc[1]);
  } else if ($(this).hasClass('tech')) {
    $(this).attr('src', techSrc[1]);
  } else if ($(this).hasClass('sci')) {
    $(this).attr('src', sciSrc[1]);
  }
};

// On Start
$(function(){

  $('.dropdown-toggle').dropdown();

  $('.more').on('click', showDetails);

  $('.categories').on('click', 'img', check);

  $('.searchNav').change(function() {
    $('.search').addClass('display');
    $('.'+$(this).val()).removeClass('display');
  });
});