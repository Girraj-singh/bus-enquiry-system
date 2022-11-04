$(document).ready(function () {
  var serverURL = "http://localhost:3000/bus";
  $.getJSON(`${serverURL}/fetch_all_bustype`, function (data) {
    // alert(JSON.stringify(data));
    // alert("Hello");
    data.busmodal.map((item) => {
      $("#bustype").append($("<option>").text(item.busmodal).val(item.typeid));
    });
    $("select").formSelect();
  }); 

  ////////////-----fetch rent-------////
  
    $('#bustype').change(function(){

      $('#kilometer').on("input", function(){
        var dInput = this.value;
        // alert(dInput);
       $.getJSON(`${serverURL}/fetch_rent`,{typeid:$('#bustype').val()},function(data){
        //  alert(JSON.stringify(data.rent));
         data.rent.map((item)=>{$('#rent').val(item.rent*dInput)});
      
        $("select").formSelect();
       });
     });

  });

  // ------>Source state/city------->
      $.getJSON(`${serverURL}/fetch_all_states`, function (data) {
        // alert(JSON.stringify(data))
       data.state.map((item) => {$("#sstate").append($("<option>").text(item.statename).val(item.stateid))});
         $("select").formSelect();
      });

      $('#sstate').change(function(){ //ON CHANGE SOURCE CITY
       
        $.getJSON(`${serverURL}/fetch_all_cities`,{stateid: $("#sstate").val()}, function (data) {

          
           $("#scity").empty();
           $("#scity").append($("<option>").text("choose city")); 
          //  alert(JSON.stringify(data))

         data.city.map((item) => {$("#scity").append($("<option>").text(item.cityname).val(item.cityid))});
           $("select").formSelect();
        });
      })



      // ------>Destination state/ city----->
      $.getJSON(`${serverURL}/fetch_all_states`, function (data) {
        // alert(JSON.stringify(data))
       data.state.map((item) => {$("#dstate").append($("<option>").text(item.statename).val(item.stateid))});
         $("select").formSelect();
      });

      $('#dstate').change(function(){ //ON CHANGE DESTINATION CITY
        $.getJSON(`${serverURL}/fetch_all_cities`,{stateid: $("#dstate").val()}, function (data) {
          // alert(JSON.stringify(data))
          $("#dcity").empty();
          $("#dcity").append($("<option>").text("choose city"));
         data.city.map((item) => {$("#dcity").append($("<option>").text(item.cityname).val(item.cityid))});
           $("select").formSelect();
        });
      })

      // $('#bustype').change(function(){

      //   var rents = $('#bustype').val(rent)

      //   $('#rent').val(parseInt(rents));
      // })
      
      // i=0;
      // var arr =[];
      // $('#day:checked').each(function(){
      //   arr[i++]= $(this).val();
      //   // console.log(arr);
      //   $('#day').append(val(arr));
      // })
      
      
});
