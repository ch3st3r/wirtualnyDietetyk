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

<style>
    .col1{
        width: 350px;
        text-align: right;
        margin-right: 20px;
    }

</style>


<a href="#edit-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="myProfile">
    ${userInstance?.username}<br><br>

    <div class="row" style="display:flex">
        <div class="col1">Wiek </div> <div class="col2">${userInstance?.age}</div>
    </div>

    <div class="row" style="display:flex">
        <div class="col1">Waga </div> <div class="col2">${userInstance?.weight}</div>
    </div>

    <div class="row" style="display:flex">
        <div class="col1">Tryb życia </div>
        <div class="col2">
            <g:if test="${userInstance?.lifeStyleMode == 1.4}">Siedzący</g:if>
            <g:elseif test="${userInstance?.lifeStyleMode == 1.7}">Umiarkowanie aktywny</g:elseif>
            <g:elseif test="${userInstance?.lifeStyleMode == 2.0}">Aktywny</g:elseif>
        </div>
    </div>
    <b>
    <div class="row" style="display:flex">
        <div class="col1">Tempo metabolizmu spoczynkowego </div>
        <div class="col2"><g:formatNumber number="${userInstance?.userKcalInfo?.bmr}" type="number" maxFractionDigits="0" /> kcal</div>
    </div>
    </b>
    <br>

    <div class="row" style="display:flex">
        <div class="col1">Uprawiane sporty</div>
        <div class="col2">
            <g:each in="${userInstance.exercises}" var="exercise">
                ${exercise.sport.name} (${exercise.minutes} minut)<br>
            </g:each>
        </div>
    </div>

    <div class="row" style="display:flex">
        <div class="col1">Kalorie spalone podczas uprawiania sportu</div>
        <div class="col2"><g:formatNumber number="${userInstance?.userKcalInfo?.exercisesKcal}" type="number" maxFractionDigits="0" /> kcal</div>
    </div>

    <div class="row" style="display:flex">
        <div class="col1">z czego średnio w czasie jednego dnia ćwiczeń</div>
        <div class="col2"><calculator:calculateExerciseKcalPerDay kcal="${userInstance?.userKcalInfo?.exercisesKcal}"></calculator:calculateExerciseKcalPerDay> kcal</div>
    </div>

    <b><div class="row" style="display:flex">
        <div class="col1">Dzienny wydatek energetyczny</div>
        <div class="col2"><g:formatNumber number="${userInstance?.userKcalInfo?.dailyKcal}" type="number" maxFractionDigits="0" /> kcal</div>
    </div>
    </b>
    <br>

    <div class="row" style="display:flex">
        <div class="col1">Cel </div>
        <div class="col2">
            <g:if test="${userInstance?.goal == 0.85}">Utrata masy ciała</g:if>
            <g:elseif test="${userInstance?.goal == 1}">Utrzymanie wagi</g:elseif>
            <g:elseif test="${userInstance?.goal == 1.2}">Przyrost masy ciała</g:elseif>
        </div>
    </div>

    <b><div class="row" style="display:flex">
        <div class="col1">Całkowite dzienne zapotrzebowanie kaloryczne</div>
        <div class="col2"><g:formatNumber number="${userInstance?.userKcalInfo?.allKcal}" type="number" maxFractionDigits="0" /> kcal</div>
    </div>
    </b>
    <br>

    <g:link controller="virtualNutritionist" action="generateDiet">button</g:link>
    <g:link controller="virtualNutritionist" action="deleteUserMeal">usun userMeal</g:link>
</div>




</body>
</html>
