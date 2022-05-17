<#include "module/macro.ftl">
<@layout title="${sheet.title!} - ${blog_title!}">

    <div class="box box-content">
        <div class="pb-2">
            <h1 class="title title--h1 first-title title__separate">${sheet.title!}</h1>
        </div>

        <article class="post-formatContent">
            ${sheet.formatContent!}
        </article>


        <#if !post.disallowComment!false>
        <h2 class="title title--h3">Comments</h2>
        <#include "module/comment.ftl">
        <@comment post=sheet type="sheet" />
        
    </#if>
    </div>
</@layout>
