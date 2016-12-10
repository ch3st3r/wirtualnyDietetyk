<%@ page import="com.myApp.User" %>


${userInstance?.username}

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'age', 'error')} ">
    <label for="age">
        <g:message code="user.enabled.label" default="Age" />
    </label>
    <g:field type="number" name="age" value="${userInstance?.age}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'weight', 'error')} required">
    <label for="weight">
        <g:message code="user.weight.label" default="Weight" />
    </label>
    <g:field name="weight" value="${fieldValue(bean: userInstance, field: 'weight')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'sex', 'error')} ">
    <label for="sex">
        <g:message code="user.enabled.label" default="Sex" />
    </label>
    <g:if test="${userInstance?.sex == "women"}">
        <g:radio name="sex" value="women" checked="true"/>Kobieta
        <g:radio name="sex" value="men" checked=""/>Mężczyzna
    </g:if>
    <g:else>
        <g:radio name="sex" value="women" checked=""/>Kobieta
        <g:radio name="sex" value="men" checked="true"/>Mężczyzna
    </g:else>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lifeStyleMode', 'error')} ">
    <label for="lifeStyleType">
        <g:message code="user.enabled.label" default="Lifestyle Type" />
    </label>

    <g:if test="${userInstance?.lifeStyleMode == 1.4}">
        <g:radio name="lifeStyleMode" value="1,4" checked="true"/>Siędzący
        <g:radio name="lifeStyleMode" value="1,7" checked=""/>Umiarkowanie aktywny
        <g:radio name="lifeStyleMode" value="2,0" checked=""/>Aktywny
    </g:if>
    <g:elseif test="${userInstance?.lifeStyleMode == 1.7}">
        <g:radio name="lifeStyleMode" value="1,4" checked=""/>Siędzący
        <g:radio name="lifeStyleMode" value="1,7" checked="true"/>Umiarkowanie aktywny
        <g:radio name="lifeStyleMode" value="2,0" checked=""/>Aktywny
    </g:elseif>
    <g:elseif test="${userInstance?.lifeStyleMode == 2.0}">
        <g:radio name="lifeStyleMode" value="1,4" checked=""/>Siędzący
        <g:radio name="lifeStyleMode" value="1,7" checked=""/>Umiarkowanie aktywny
        <g:radio name="lifeStyleMode" value="2,0" checked="true"/>Aktywny
    </g:elseif>
    <g:else>
        <g:radio name="lifeStyleMode" value="1,4" checked=""/>Siędzący
        <g:radio name="lifeStyleMode" value="1,7" checked=""/>Umiarkowanie aktywny
        <g:radio name="lifeStyleMode" value="2,0" checked=""/>Aktywny
    </g:else>

</div>

<div class="bmr">BMR
    <div class="bmrValue">
        <g:if test="${userInstance?.userKcalInfo?.bmr}"><g:formatNumber number="${userInstance?.userKcalInfo?.bmr}" maxFractionDigits="0" /></g:if>
        <g:else>0</g:else>
    </div>
</div>

<div class="dwe">DWE
    <div class="dweValue">
        <g:if test="${userInstance?.userKcalInfo?.dwe}"><g:formatNumber number="${userInstance?.userKcalInfo?.dwe}" maxFractionDigits="0" /></g:if>
        <g:else>0</g:else>
    </div>
</div>

<div class="exercisesKcal">SPORT
    <div class="exercisesKcalValue">
        <g:if test="${userInstance?.userKcalInfo?.exercisesKcal}"><g:formatNumber number="${userInstance?.userKcalInfo?.exercisesKcal}" maxFractionDigits="0" /></g:if>
        <g:else>0</g:else>
    </div>
</div>

<div class="fieldcontain">
    %{--<g:each in="${sportList}">
        <div style="display:flex;">
            <div><g:checkBox style="width: 100px; margin-left: 80px" class="sportCheckbox" name="${it.name}" value="${it.name}" checked="false"/>${it.name}</div>
            <div class="sportTime"><g:field style="margin-left: 25px" name="weight" value="${fieldValue(bean: userInstance, field: 'weight')}"/></div>
        </div>
    </g:each>--}%

    <g:each in="${sportList}" var="sport">
        <g:if test="${sport in userInstance.exercises.sport}">
            <div style="display:flex;">
                <div><g:checkBox style="width: 100px; margin-left: 80px" class="sportCheckbox" name="${sport.name}" value="${sport.name}" checked="true"/>${sport.name}</div>
                <g:each in="${userInstance.exercises}" var="exercise">
                    <g:if test="${exercise.sport == sport}">
                        <div class="sportTime"><g:field style="margin-left: 25px" name="sport" value="${exercise.minutes}"/></div>
                    </g:if>
                </g:each>
            </div>
        </g:if>
        <g:else>
            <div style="display:flex;">
                <div><g:checkBox style="width: 100px; margin-left: 80px" class="sportCheckbox" name="${sport.name}" value="${sport.name}" checked="false"/>${sport.name}</div>
                <div class="sportTime"><g:field style="margin-left: 25px" disabled="true" name="sport" value="0"/></div>
            </div>
        </g:else>
    </g:each>


</div>

<div class="dailyKcal">DAILY KCAL
    <div class="dailyKcalValue">
        <g:if test="${userInstance?.userKcalInfo?.dailyKcal}"><g:formatNumber number="${userInstance?.userKcalInfo?.dailyKcal}" maxFractionDigits="0" /></g:if>
        <g:else>0</g:else></div>
</div><br>


<div class="fieldcontain">
    <label for="goal">
        <g:message code="user.enabled.label" default="Goal" />
    </label>

    <g:if test="${userInstance?.goal == 0.85}">
        <g:radio name="goal" value="0,85" checked="true"/>Utrata masy ciała
        <g:radio name="goal" value="1" checked=""/>Utrzymanie wagi
        <g:radio name="goal" value="1,2" checked=""/>Przyrost masy ciała
    </g:if>
    <g:elseif test="${userInstance?.goal == 1}">
        <g:radio name="goal" value="0,85" checked=""/>Utrata masy ciała
        <g:radio name="goal" value="1" checked="true"/>Utrzymanie wagi
        <g:radio name="goal" value="1,2" checked=""/>Przyrost masy ciała
    </g:elseif>
    <g:elseif test="${userInstance?.goal == 1.2}">
        <g:radio name="goal" value="0,85" checked=""/>Utrata masy ciała
        <g:radio name="goal" value="1" checked=""/>Utrzymanie wagi
        <g:radio name="goal" value="1,2" checked="true"/>Przyrost masy ciała
    </g:elseif>
    <g:else>
        <g:radio name="goal" value="0,85" checked=""/>Utrata masy ciała
        <g:radio name="goal" value="1" checked=""/>Utrzymanie wagi
        <g:radio name="goal" value="1,2" checked=""/>Przyrost masy ciała
    </g:else>

</div>

<div class="allKcal">ALL KCALORIES
    <div class="allKcalValue">
        <g:if test="${userInstance?.userKcalInfo?.allKcal}"><g:formatNumber number="${userInstance?.userKcalInfo?.allKcal}" maxFractionDigits="0" /></g:if>
        <g:else>0</g:else></div>
    </div>
</div><br>