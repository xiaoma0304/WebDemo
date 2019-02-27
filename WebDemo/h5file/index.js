/**
 * Created by mgn on 2019/2/18.
 */
$(function () {
    $('#demo_test').click(function () {
        var sum = JsBindingDemo.nativeAdd(2, 3);
        // var aa = multiplyDemo(2, 3);
        $('#demo_result').html(JsBindingDemo.nativeName);
        // $('#demo_result').html(sum);z

    });
});

function native_execute() {
    $('#demo_result').html('我是被 native 执行的哦');
}

var js_name = 'abc';
