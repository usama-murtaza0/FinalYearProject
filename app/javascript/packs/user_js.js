$(document).ready(function() {
    $("#user_type").change(function() {
      debugger; 
      if ($("#user_type").val() == "Vendor")
        $("#user_physical_store_address").removeClass("hidden");
      else
        $("#user_physical_store_address").addClass("hidden");
    });
});