<#include "module/macro.ftl">
<@layout title="归档 - ${blog_title!}">
<div class="box box-content">
    <div class="pb-2">
        <h1 class="title title--h1 first-title title__separate">归档</h1>
    </div>

    <article>

        <form class="search-form" id="search" method="get" action="/search" role="search">
            <input type="search" name="keyword" class="text textarea form-control" placeholder="请输入搜索关键词......" style="overflow: hidden; overflow-wrap: break-word; outline: none; height: 52px;">
            <button type="submit" class="search-btn"><i class="ri-search-2-line"></i></button>
        </form>

        <h3 class="title title--h3" style="display: flex;align-items: center;"><i class="ri-bookmark-line" style="margin-right: 0.5rem;"></i> 分类</h3>
        <div class="tags" style="margin-bottom:1rem;">
            <@categoryTag method="list">
                <#list categories as category>
                    <a href="${category.fullPath!}" class="badge badge-index" style="font-weight: 500;padding: 5px;margin: 5px;">${category.name!}( ${category.postCount!} )</a>
                </#list>
            </@categoryTag>
        </div>

        <h3 class="title title--h3" style="display: flex;align-items: center;"><i class="ri-price-tag-3-line" style="margin-right: 0.5rem;"></i> 标签</h3>
        <div class="tags" style="margin-bottom:1rem;">
            <@tagTag method="list">
                <#list tags as tag>
                    <#if tag_index lt 50>
                    <a href="${tag.fullPath!}" class="badge-tag" style="font-weight: 500;padding: 4px;">#${tag.name!}</a>
                    </#if>
                </#list>
            </@tagTag>
        </div>

        <#list archives as archive>
            <h3 class="title title--h3" style="display: flex;align-items: center;"><i class="ri-calendar-todo-line" style="margin-right: 0.5rem;"></i>${archive.year?c}</h3>
            <div class="timeline">
                <#list archive.posts as post>
                    <!-- Item -->
                    <article class="timeline__item">
                        <h5 class="title title--h5 timeline__title"><a href="${post.fullPath!}" style="color:#3B4B5E;">${post.title!}</a></h5>
                        <span class="timeline__period">${post.createTime?string('MM-dd')}</span>
                    </article>
                </#list>
            </div>	
        </#list>


        <#if posts.totalPages gt 1>
            <ul class="archives-navigator">
                <@paginationTag method="archives" page="${posts.number}" total="${posts.totalPages}" display="3">
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
        <#else>
            <span>当前只有一页</span>
        </#if>
    </article>
</div>

</@layout>
