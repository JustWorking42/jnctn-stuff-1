$(document).ready(function() {
  let back = "white";
  let text = new Array(); 
  let status = 0;
  const basic_path = "https://fc72e9ac.ngrok.io/api/v1"
//Get data
$.ajax({
  url: basic_path + "/reports",
  context: document.body
}).done(function(stuff) {
  for (var key in stuff) {
    status = stuff[key].status;
    create(status,stuff[key].userName, stuff[key].descr, Time(stuff[key].date), stuff[key].photo, key);
  }
});
  //Unix to time
  function Time(Unix){
    let a = new Date(Unix * 1000);
    let months =['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    let month = months[a.getMonth()];
    let year = a.getFullYear();
    let date = a.getDate()
    let time = date+ ' '+ month +' '+ year;
    return time;
    }

  
 
  //Add card
  function create(status, name, text, date, pics, cid){
  $("#sortable"+status).html(function(){
    $(this).append(card(back, name, text, date, pics, cid))
  });
  }

  //Define card
  function card(color, name, text, date, pics, cardid) {
    return (
      `<div class="kanban-card d-flex flex-column" data-cid="`+cardid+`" style="background-color:white">
          <div class="card-header">
            <div>
              <div class="name">` +name +`</div>
            </div>
            <div>
              <div class="date">` +date + `</div>
              <div><button class="action"> <span class="oi oi-x"></span> Delete</button></div>
            </div>
          </div>
         <div class="problem">`+ text+ `</div>
<div class="pics">
  <img src="` +pics+`">
  </div>
            
        </div>`        
    );
  }
    
  
 

  //Delete card
  $(document).on("click", "button", function() {
    $(this)
      .parent().parent().parent().parent()
      .fadeOut(250, function() {
        $(this).remove();
      });
    var cid = $(this).parent().parent().parent().parent().data("cid");
    $.ajax({
      url:basic_path +'/reports/'+cid+'/destroy'
    });
    
  });
//Move card
  $(function() {
    $("#sortable0, #sortable1, #sortable2, #sortable3")
      .sortable({
        connectWith: ".list-body",
       stop: function(evt, ui) {
          var cid = $(evt.originalEvent.target).data("cid");
          if (typeof(a) === 'undefined') {
            cid = $(evt.originalEvent.target).parents(".kanban-card").data("cid");
          }

          var status_id = $(evt.originalEvent.target).parents(".list-body").attr('id').substr(-1);
          $.ajax({
            url:basic_path +'/reports/'+cid+'/change_status?to='+status_id
          })
        }
      })
      .disableSelection();
  });

});
