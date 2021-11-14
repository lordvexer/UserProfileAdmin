


//upload img
$(document).on("click", ".browse", function () {
  var file = $(this).parents().find(".file");
  file.trigger("click");
});
$('input[type="file"]').change(function (e) {
  var fileName = e.target.files[0].name;
  $("#file").val(fileName);

  var reader = new FileReader();
  reader.onload = function (e) {
    // get loaded data and render thumbnail.
    document.getElementById("preview").src = e.target.result;
  };
  // read the image file as a data URL.
  reader.readAsDataURL(this.files[0]);
});



//add space field

$(document).ready(function () {
  //@naresh action dynamic childs
  var next = 0;
  $("#add-more").click(function (e) {
    e.preventDefault();
    var addto = "#field" + next;
    var addRemove = "#field" + (next);
    next = next + 1;
    var newIn = ' <div id="field' + next + '" ><!-- Text input--><div class="form-group"> <label for="action_id">سوابق تحصیلی</label> <input id="action_id" name="action_id" type="text" placeholder="" class="form-control input-md"> </div></div>';
    var newInput = $(newIn);
    var removeBtn = '<button id="remove' + (next - 1) + '" class="btn btn-danger remove-me"style="margin-bottom: -7px;margin-left: 126px;margin-top: -17px;" >پاک کردن</button></div></div><div id="field">';
    var removeButton = $(removeBtn);
    $(addto).after(newInput);
    $(addRemove).after(removeButton);
    $("#field" + next).attr('data-source', $(addto).attr('data-source'));
    $("#count").val(next);

    $('.remove-me').click(function (e) {
      e.preventDefault();
      var fieldNum = this.id.charAt(this.id.length - 1);
      var fieldID = "#field" + fieldNum;
      $(this).remove();
      $(fieldID).remove();
    });
  });

});