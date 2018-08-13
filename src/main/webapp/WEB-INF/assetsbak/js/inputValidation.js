
    function valid(element, pattern, message) {
        var obj = document.querySelector(element);
        var result = obj.value.match(pattern) != null;
        if (!result) {
            window.alert(message);
            obj.focus();
        }
        return result;
    }
function checkBlank()
{  return valid ("input[type=number]", "^\\w+$", "Chỉ nhập từ 1 - 999");
}
function checkRange() {
    return valid("input[type=number]", "^\\d{1,3}$", "Chỉ nhập từ 1 - 999");
}
function isPositive(element, message){
    var obj = document.querySelector(element);
    var result = obj.value;
    if(result < 1){
        window.alert(message);
        obj.focus();
    }
    return result;
}
function checkPositive(){
    return isPositive('input[type=number]', 'Chỉ nhập từ 1 - 999');
}
function checkAll() {
    return checkBlank() && checkRange() && checkPositive();

}
