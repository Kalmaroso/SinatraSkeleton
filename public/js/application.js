$(document).ready(function() {
  signup();
  login();
});


var signup = function(){
  $(".signup").on("click", ".button", function(e){
    e.preventDefault();
    var url = $(".signup").attr("action") + "?" + $(".signup").serialize();

    $.ajax({
      url: url,
      method: "POST"
    }).done(function(response){
      if (response==="login"){
        window.location.href = "/";
      }else{
        $("#error-list").remove();
        $(".errors").append(response);
      };
    });
  });
};


var login = function(){
  $(".login").on("click", ".button", function(e){
    e.preventDefault();
    var url = $(".login").attr("action") + "?" + $(".login").serialize();
    $.ajax({
      url: url,
      method: "POST"
    }).done(function(response){
      if (response==="login"){
        window.location.href = "/";
      }else{
        $(".error").remove();
        $(".error-list").append(response);
      };
    });
  });
};
