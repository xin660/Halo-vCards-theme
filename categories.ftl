<#include "module/macro.ftl">
<@layout title="分类列表 - ${blog_title!}">
<div class="box box-content">
    <div class="pb-2">
        <h1 class="title title--h1 first-title title__separate">分类列表</h1>
    </div>
    <article>
        <div class="tags" style="margin-bottom:1rem;">
            <@categoryTag method="list">
                <#if categories?? && categories?size gt 0>
                    <#list categories as category>
                        <a href="${category.fullPath!}" class="badge badge-index" style="font-weight: 500;padding: 5px;margin: 5px;">${category.name!}( ${category.postCount!} )</a>
                    </#list>
                </#if>
            </@categoryTag>
        </div>
    </article>

</div>
</@layout>
