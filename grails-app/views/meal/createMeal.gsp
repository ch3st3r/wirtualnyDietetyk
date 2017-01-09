<%--
  Created by IntelliJ IDEA.
  User: Damian
  Date: 2016-10-29
  Time: 15:15
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'meal.label', default: 'Meal')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <g:javascript src="select2.full.js" />
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'select2.css')}" type="text/css">
</head>

<body>
%{-- <g:each in="${products}" var="product">
     ${product.name}<br>
 </g:each>
--}%
<a href="#create-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul>
</div>

<div class="meal" role="main">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>

    <div class="mealTitle">
        <div class="nameOfField">Nazwa posiłku:</div><g:field name="mealName" id="mealName" type="text"></g:field>
    </div>

        <div class="ingredientFieldName">Nazwa składnika oraz gramatura:</div>
    <div class="ingredientRow" style="display:flex">
        <div class="selector">
            <select class="js-data-example-ajax">
                <option value="3620194" selected="selected">Choose product...</option>
            </select>
        </div>
        <div>
            <g:field type="number" class="weight" step="0.1" name="weight" required="" value="0"/>
        </div>
        <div>
            <button class="buttonAdd">add</button>
        </div>
        <div>
            <button class="buttonRemove">remove</button>
        </div>
    </div>

</div>

<div class="mealReceipt">
    <div class="nameOfReceipt">Przepis:</div>
    <g:textArea id="receipt" name="receipt" value="" rows="5" cols="80"/>
</div>

<button class="collectData sendDataButton">Dodaj posiłek</button>


<script>

    function dupa() {
        $(".js-data-example-ajax").each(function() {
            initializeSelect2($(this));
        });
    }

    /*$('.collectData').click(function(){
     var array = [];
     $('.ingredientRow').each(function(){
     //  console.log(this.childNodes[1].childNodes[2].childNodes[0].textContent);  // zbiera
     //  console.log(this.childNodes[3].childNodes[1].value);
     })

     $('.ingredientRow').each(function(){
     var ingredient = new Object();
     var product = this.childNodes[1].childNodes[2].childNodes[0].textContent
     var weight = this.childNodes[3].childNodes[1].value;
     ingredient.product = product;
     ingredient.weight = weight;
     array.push(ingredient);
     })

     console.log(array);
     });*/

    function collectData(){
        /* var array = [];

         $('.ingredientRow').each(function(){
         var ingredient = new Object();
         var product = this.childNodes[1].childNodes[2].childNodes[0].textContent
         var weight = this.childNodes[3].childNodes[1].value;
         //   ingredient.product = product;
         //   ingredient.weight = weight;
         //   array.push(ingredient);
         array.push({'product': product, 'weight': weight})
         })
         return array;*/

        var array = [];

        $('.ingredientRow').each(function(){
            var object = {};
            var product = this.childNodes[1].childNodes[2].childNodes[0].textContent
            var weight = this.childNodes[3].childNodes[1].value;
            object['product'] = product;
            object['weight'] = weight;
            array.push(object);
        })
        return array;


    }

    $('.collectData').click(function(){
        sendData();
    })

    function sendData(){
        var mealName = $('#mealName').val();
        var receipt = $('#receipt').val();
        var data = collectData();
        var myJsonString = JSON.stringify(data);
        console.log(data);
        console.log(myJsonString);
        $.ajax({
            type: "POST",
            url: "/WirtualnyDietetyk/meal/addMeal",
            success : function(){
                /*alert('dupa');*/
            },
            data: {'dupa': myJsonString, 'mealName': mealName, 'receipt': receipt},
            /*dataType: "json",*/
            traditional: true,
        });
    }


    function createSelect2(element){
        element.select2({
            width: 'auto',
            placeholder: "Select an option",
            ajax: {
                url: "/WirtualnyDietetyk/meal/dupa",
                dataType: 'json',
                delay: 250,
                data: function (params) {
                    return {
                        q: params.term, // search term
                        page: params.page
                    };
                },

                processResults: function (data) {
                    console.log(data);
                    return {
                        results: $.map(data, function(obj) {
                            return { id: obj.id, text: obj.text };
                        })
                    };
                },
                cache: true
            },
            escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
            minimumInputLength: 1,
            /*templateResult: formatResult,*/ // omitted for brevity, see the source of this page
            /*templateSelection: formatSelection // omitted for brevity, see the source of this page*/
        });

    }


    function initializeSelect2(selectElementObj) {
        selectElementObj.next().remove()  // do usunięcia nieaktywnego spana, który się tworzył przy duplikacie
                                          // inna opcja jest taka, żeby zamiast clone() appendować <div><select>...</select></div>
        createSelect2(selectElementObj);
    }



    $('.meal').on('click', '.buttonAdd', function(){
        var newSelectRow = $('.ingredientRow:last').clone()
        $(newSelectRow).appendTo('.meal');
        dupa();
    });

    $('.meal').on('click', '.buttonRemove', function(){
        var ingredientRows = 0;
        $('.ingredientRow').each(function(){
            ingredientRows += 1;
        });
        if(ingredientRows > 1){
            $(this).parent().parent().remove();
        }
    });



    createSelect2($('.js-data-example-ajax'));




</script>

</body>
</html>