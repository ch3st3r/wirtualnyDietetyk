<div id="searchResults" class="searchResults">
<g:if test="${productResults?.results}">
    <div id="albumResults" class="resultsPane">
        <g:each in="${productResults?.results}" var="product">
            ${product?.name}
        </g:each>
    </div>
</g:if>
</div>