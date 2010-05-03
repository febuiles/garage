$("document").ready(function() {
    $("#buy").click(function() {
        var name = $("input[name='name']").val();
        var email = $("input[name='email']").val();

        if (name == "" || email == "") {
            $("#warning").toggle();
        } else {
            $("form").submit();
        }
    });

});