$(document).ready(function () {
    $('#b_rootwizard').bootstrapWizard({
        onTabShow: function (tab, navigation, index) {
            var $total = navigation.find('li').length;
            var $current = index + 1;
            var $percent = ($current / $total) * 100;
            $('#b_rootwizard').find('.bar').css({ width: $percent + '%' });
        }
    });
});

$(window).load(function () {
    $('#rootwizard').bootstrapWizard({
        onTabShow: function (tab, navigation, index) {
            var $total = navigation.find('li').length;
            var $current = index + 1;

            // If it's the last tab then hide the last button and show the finish instead
            if ($current >= $total) {
                $('#rootwizard').find('.pager .next').hide();
                $('#rootwizard').find('.pager .finish').show();
                $('#rootwizard').find('.pager .finish').removeClass('disabled');
            } else {
                $('#rootwizard').find('.pager .next').show();
                $('#rootwizard').find('.pager .finish').hide();
            }
        },
        onNext: function (tab, navigation, index) {
            var form = $('form[name="step' + index + '"]');
            form.parsley().validate();
            if (!form.parsley().isValid()) {
                return false;
            }

        },

        onTabClick: function (tab, navigation, index) {
            var form = $('form[name="step' + (index + 1) + '"]');
            form.parsley().validate();
            if (!form.parsley().isValid()) {
                return false;
            }
        }
    });
});