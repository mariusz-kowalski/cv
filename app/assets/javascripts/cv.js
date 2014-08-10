function flip(){
  var elem = $('#feeder').children().first().detach();
  elem.appendTo('#paged_doc');
}

var last_page_content;
var page_no = 0;

function two_digit(val){
  if(val<10){
    return "0"+val;
  }else{
    return val.toString();
  }
}

function add_page(){
  var footer = $( "<div>", {class: "footer"} );
  page_no++;
  var date = new Date();
  var str_date = two_digit(date.getUTCDate()) + "/" + two_digit(date.getUTCMonth()+1) + "/" + date.getUTCFullYear();
  // var str_date = date.toISOString()
  var footer_content = "<div class='left'>CV - Mariusz Kowalski - generated at: ";
  footer_content += str_date;
  footer_content += "</div><div class='right'>page ";
  footer_content += page_no.toString();
  footer_content += " of <span class='page_count'></span></div>";
  footer.append(footer_content);

  var page = $( "<div>", {class: "page"} );
  last_page_content = $( "<div>", {class: "content"} );
  page.append(last_page_content);
  $('#paged_doc').append(page);
  $('#paged_doc').append(footer);
}

$(function(){
  
  add_page();
  // var page_height = 1900;
  var page_height = 10000; // <-- in wkhtmltopdf in JS context the page height is 11600 :|
  
  $('#feeder').children().each( function() {
    if( (last_page_content.height() + $(this).height()) >= page_height){
      add_page();
    }
    $(this).detach();
    last_page_content.append($(this));
  });

  $('.page_count').append(page_no);
});
