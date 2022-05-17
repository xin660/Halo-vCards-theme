<#include "module/macro.ftl">
<@layout title="${sheet.title!} - ${blog_title!}">

    <div class="box box-content">
        <div class="pb-2">
            <h1 class="title title--h1 first-title title__separate">${sheet.title!}</h1>
        </div>

        <article style="padding: 1rem;">
        <@menuTag method="listByTeam" team="more">
        <div class="row">
            <#list menus as menu>
                <!-- Case Item -->
                <div class="col-12 col-lg-4">
                    <a href="${menu.url!}" target="${menu.target!}" class="more_a">
                        <div class="case-item">
                            <i class="${menu.icon} ri-2x"></i>
                            <div>
                                <h3 class="title title--h4">${menu.name!}</h3>
                            </div>	
                        </div>
                    </a>
                </div>
            </#list>
        </div>
        </@menuTag>
        </article>

    </div>
</@layout>
