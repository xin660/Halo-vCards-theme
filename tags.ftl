<#include "module/macro.ftl">
<@layout title="标签列表 - ${blog_title!}">
<div class="box box-content">
    <div class="pb-2">
        <h1 class="title title--h1 first-title title__separate">标签列表</h1>
    </div>
    <article>
        <div class="tags" style="margin-bottom:1rem;">
            <@tagTag method="list">
                <#if tags?? && tags?size gt 0>
                    <#list tags as tag>
                        <a href="${tag.fullPath!}" class="badge-tag" style="font-weight: 500;padding: 4px;">#${tag.name!}</a>
                    </#list>
                </#if>
            </@tagTag>
        </div>
    </article>

</div>

</@layout>
