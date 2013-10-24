// tabs = document.getElementsByClassName('tab');

var showDetails = function(e) {
  test = e.currentTarget.previousSibling;
  jQuery(test).toggleClass('display');
};

// var activeTab = function(e) {
//   $('.tab').each(function(){

//       $(this).removeClass('activeTab');
//     });
//   // if(!($(this).hasClass('activeTab'))) {
//     $(this).toggleClass('activeTab');
var artSrc = ['/categoryIcon_art_85x85.png', '/categoryIcon_art_85x85_selected.png'];
var techSrc = ['/categoryIcon_technology_85x85.png', '/categoryIcon_technology_85x85_selected.png'];
var sciSrc = ['/categoryIcon_science_85x85.png', '/categoryIcon_science_85x85_selected.png'];
//   // }
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
  console.log($(e.target));
  console.log($(this).next());
};

// }
// var showWindow = function() {
//   // debugger;
//   // $('#projectDetails').modal('show');
// }
// var closeWindow = function() {
//   $('#projectDetails').modal('hide');
// }
// var displayProject = function(event) {
//   rest = $(event.currentTarget).children()[1].lastChild.previousSibling;
//   jQuery(rest).toggleClass("display");
// };


$(function(){
  // $('.projectEntry').on('mouseover', 'li', displayProject);
  // $('.projectEntry').on('mouseout', 'li', displayProject);
  $('.dropdown-toggle').dropdown();
  // $('#projectDetails').on('click', modal('toggle'));

  $('.more').on('click', showDetails);

  $('.categories').on('click', 'img', check)

  // $('.navTabs').on('click', '.tab', activeTab)
  // // $('.more').on('mouseout', showDetails);

  // // $('#b').on('click', showWindow);
  // $('#q').on('click', closeWindow);
});