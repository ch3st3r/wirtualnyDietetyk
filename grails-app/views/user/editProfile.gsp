<%@ page import="com.myApp.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>




<a href="#edit-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="edit-user" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${userInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${userInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form id="profilForm" url="[resource:userInstance, action:'update']" method="PUT" >
        <g:hiddenField name="version" value="${userInstance?.version}" />
        <fieldset class="form">
            <g:render template="editProfileForm"/>
        </fieldset>
        <fieldset class="buttons">
            <g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
        </fieldset>
    </g:form>
</div>

<script>
    $('.save').click(function(e){
        e.preventDefault();
        if(validateForm()){
            var data = collectData();
            var jsonData = JSON.stringify(data);
            var url = '/WirtualnyDietetyk/user/updateProfile';
            var funct = function(e){
            };
            myAjax(url, jsonData, funct);
        } else {
            alert('bledne dane');
        }
    });

    function validateForm() {
        var validator = true;

        if($('#age').val() < 18){
            validator = false;
        }

        if($('#weight').val() < 0 || isNaN($('#weight').val())){
            validator = false;
        }



        return validator;
    }


    $("input[name='weight']").change(function() {
        countRMRFunct();
        countDWEFunct();
    });

    $("input[name='age']").change(function() {
        countRMRFunct();
    });

    $("input[name='sex']").change(function() {
        countRMRFunct();
    });

    $("input[name='lifeStyleMode']").change(function() {
        countDWEFunct();
    });

    $("input[name='sport']").change(function() {
        countExercisesKcalFunct();
    });

    $('.dweValue').bind("DOMSubtreeModified",function(){
        countDailyKcalFunct();
    });

    $('.exercisesKcalValue').bind("DOMSubtreeModified",function(){
        console.log('tu');
        countDailyKcalFunct();
    });

    $('.dailyKcalValue').bind("DOMSubtreeModified",function(){
        countAllKcalFunct();
    });

    $("input[name='goal']").change(function() {
        countAllKcalFunct();
    });


    $('.calculateRMR').click(function(){
        countRMRFunct();
    });

    $('.fieldcontain').contents().find(":checkbox").bind('change', function(){
        var minutes =  $(this).parent().next().children();

        if($(this).is(':checked')){
            minutes.prop('disabled', false);
        } else {
            minutes.prop('disabled', true);
            minutes.val(0);
            countExercisesKcalFunct();
        }
    });

    function countRMRFunct(){
        var data = collectData();
        countRMR(data);
    }

    function countDWEFunct(){
        var data = collectData();
        countDWE(data);
    }

    function countExercisesKcalFunct(){
        var data = collectData();
        countExercisesKcal(data);
    }

    function countDailyKcalFunct(){
        var data = collectData();
        countDailyKcal(data);
    }

    function countAllKcalFunct(){
        var data = collectData();
        countAllKcal(data);
    }

    function collectData(){
        var array = [];
        var map = new Object();
        map['age'] =  $("#age").val();
        map['weight'] = $("#weight").val();
        map['sex'] = $('input[name=sex]:radio:checked').val();
        map['lifeStyleMode'] = $('input[name=lifeStyleMode]:radio:checked').val();
        map['bmr'] = $('.bmrValue').text();
        map['dwe'] = $('.dweValue').text();
        map['exercisesKcal'] = $('.exercisesKcalValue').text();
        map['dailyKcal'] = $('.dailyKcalValue').text();
        map['goal'] = $('input[name=goal]:radio:checked').val();
        map['allKcal'] = $('.allKcalValue').text();

       /* console.log($("#age").val());
        console.log($("#weight").val());
        console.log($('input[name=sex]:radio:checked').val());
        console.log($('input[name=lifeStyleMode]:radio:checked').val());*/

        $('.sportCheckbox').each(function(){
            if($(this).is(':checked')) {
                var sport = new Object();
                sport['name'] = $(this).val();
                sport['minutes'] = $(this).parent().next().children().val();
               /* console.log($(this).val());
                console.log($(this).parent().next().children().val());*/
                array.push(sport);
            }
        });
        map['sports'] = array;

        return map;
    }

    function countRMR(data){
        var jsonData = JSON.stringify(data);
        var url = '/WirtualnyDietetyk/user/countRMR'
        var funct = function(response){
            $('.bmrValue').text(response.rmr);
        }

        myAjax(url, jsonData, funct);
    }

    function countDWE(data){
        var jsonData = JSON.stringify(data);
        var url = '/WirtualnyDietetyk/user/countDWE'
        var funct = function(response){
            $('.dweValue').text(response.dwe);
        }

        myAjax(url, jsonData, funct);
    }

    function countExercisesKcal(data){
        var jsonData = JSON.stringify(data);
        var url = '/WirtualnyDietetyk/user/countExercisesKcal'
        var funct = function(response){
            $('.exercisesKcalValue').text(response.kcal);
        }

        myAjax(url, jsonData, funct);
    }

    function countDailyKcal(data){
        var jsonData = JSON.stringify(data);
        var url = '/WirtualnyDietetyk/user/countDailyKcal'
        var funct = function(response){
            console.log(response.kcal);
            $('.dailyKcalValue').text(response.kcal);
        }
        myAjax(url, jsonData, funct);
    }

    function countAllKcal(data){
        var jsonData = JSON.stringify(data);
        /*console.log(jsonData);*/
        var url = '/WirtualnyDietetyk/user/countAllKcal'
        var funct = function(response){
           /* console.log(response.kcal + ' all Kcal');
            console.log($('.allKcalValue').text());*/
            $('.allKcalValue').text(response.kcal);
        }
        myAjax(url, jsonData, funct);
    }

    function myAjax(url, jsonData, funct){
        $.ajax({
            url: url,
            data: {'bmrData': jsonData},
            type: 'post',
            traditional: true,
            success : funct,
        });
    }




</script>


</body>
</html>
