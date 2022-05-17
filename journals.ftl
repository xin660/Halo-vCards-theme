<#include "module/macro.ftl">
<@layout title="${settings.jounarls_title!'日志'} | ${options.blog_title!}">

<div class="box box-content">
    <div class="pb-2">
        <h1 class="title title--h1 first-title title__separate">${settings.jounarls_title!'日志'}</h1>
    </div>

    <article>
        <#list journals.content as journal>
            <div class="comment-box">
                <div class="comment-box__inner">
                    <svg class="avatar avatar--60" viewBox="0 0 84 84">
                        <g class="avatar__hexagon">
                            <image xlink:href="${user.avatar!}" height="100%" width="100%"></image>
                        </g>
                    </svg>
                    <div class="comment-box__body">
                        <h5 class="comment-box__details">
                            <span>${user.nickname!}</span>
                            <span class="comment-box__details-date">${journal.createTime?string('yyyy-MM-dd HH:mm')}</span>
                        </h5>
                        <p>${journal.content!}</p>
                    </div>
                </div>
            </div>
        </#list>

        <ul class="archives-navigator">
            <@paginationTag method="journals" page="${journals.number}" total="${journals.totalPages}" display="3">
                <#if pagination.hasPrev>
                    <li class="prev">
                        <a href="${pagination.prevPageFullPath!}">
                            <i class="ri-arrow-left-s-line"></i>
                        </a>
                    </li>
                </#if>
                <#list pagination.rainbowPages as number>
                    <#if number.isCurrent>
                        <li class="current">
                        <a>${number.page!}</a>
                        </li>
                    <#else>
                        <li>
                        <a href="${number.fullPath!}">${number.page!}</a>
                        </li>
                    </#if>
                </#list>
                <#if pagination.hasNext>
                    <li class="next">
                        <a href="${pagination.nextPageFullPath!}">
                            <i class="ri-arrow-right-s-line"></i>
                        </a>
                    </li>
                </#if>
            </@paginationTag>
        </ul>


    </article>
</div>

</@layout>
