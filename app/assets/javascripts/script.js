


var displayProject = function(event) {
  rest = $(event.currentTarget).children()[1].lastChild.previousSibling;
  jQuery(rest).toggleClass("display");
};


$(function(){
  $('.projectEntry').on('mouseover', 'li', displayProject);
  $('.projectEntry').on('mouseout', 'li', displayProject);
});