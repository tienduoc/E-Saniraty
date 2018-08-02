$(function () {
    var emailRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/


    $.validator.setDefaults({
        errorClass: "form__label",
        highlight: function (element) {
            $(element)
                .closest(".form__input")
                .addClass("invalid");
        },
        unhighlight: function (element) {
            $(element)
                .closest(".form__input")
                .removeClass("invalid");
        }
    });

    $.validator.addMethod("strongPassword", function (value, element) {
            return this.optional(element) || (/\d/.test(value) && /[a-z]/i.test(value));
        },
        "Mật khẩu phải chứa ít nhất 1 chữ cái và 1 chữ số!"
    );

    $.validator.addMethod("nowhitespace", function (value, element) {
        return this.optional(element) || /^\S+$/i.test(value);
    });

    $.validator.addMethod("emailRegex", function (value, element) {
        return this.optional(element) || emailRegex.test(value);
    });

    $.validator.addMethod("alphanumeric", function (value, element) {
        return this.optional(element) || /^\w+$/i.test(value);
    }, "Chỉ nhập chữ, số, và dấu gạch dưới!");

    $.validator.addMethod("lettersonly", function (value, element) {
        return this.optional(element) || /^[a-z]+$/i.test(value);
    }, "Chỉ nhập chữ!");
    $.validator.addMethod("lettersanddigit", function (value, element) {
        return this.optional(element) || /^[a-z-0-9]+$/i.test(value);
    }, "Không nhập chữ có dấu");
    $.validator.addMethod("lettersanddigitUNICODE", function (value, element) {
        return this.optional(element) || /[^\u0000-\u007F]+/i.test(value);
    }, "Chỉ nhập chữ, chữ hoa và số");

    $.validator.addMethod("numberanddot", function (value, element) {
        return this.optional(element) || /^[0-9\.()'"\s]+$/i.test(value);
    }, "Chỉ nhập số và dấu chấm");
    $.validator.addMethod("fullnameinput", function (value, element) {
            return this.optional(element) || /[^\u0000-\u007F]+/i.test(value);
    },"Hãy nhập tên đầy đủ!");


        $("#register-form").validate({
            rules: {
                fullname: {
                    required: true,
                    minlength: 3,
                    maxlength: 40,
                    fullnameinput: true
                },
                username: {
                    required: true,
                    minlength: 3,
                    maxlength: 50,
                    nowhitespace: true,
                    alphanumeric: true
                },
                email: {
                    required: true,
                    emailRegex: true

                },
                password: {
                    required: true,
                    strongPassword: true,
                    minlength: 6,
                    maxlength: 30
                },
                passwordConfirm: {
                    required: true,
                    equalTo: "#password"
                },
                phone: {
                    required: false,
                    digits: true,
                    nowhitespace: true,
                    minlength: 10,
                    maxlength: 11
                }
            }
        });
        $("#login-form").validate({
        rules: {
            username: {
                required: true,
                maxlength: 50,
                nowhitespace: true,
                alphanumeric: true
            },
            password: {
                required: true,
                maxlength: 30
            }
        }
    });


});
