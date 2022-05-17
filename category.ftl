<#include "module/macro.ftl">
<@layout title="分类：${category.name} - ${blog_title!}">

<div class="box box-content">
    <div class="pb-2">
        <h1 class="title title--h1 first-title title__separate">分类：${category.name}</h1>
    </div>
    <article>
        <!-- News -->
        <div class="news-grid">
            <!-- Post -->
            <#list posts.content as post>
                <article class="news-item box">
                    <div class="news-item__image-wrap overlay overlay--45">
                        <div class="news-item__date">${post.createTime?string('dd')}<span>${post.createTime?string('MMM')}</span></div>
                        <a class="news-item__link" href="${post.fullPath!}"></a>
                        <#if post.thumbnail?? && post.thumbnail!=''>
                            <img class="cover lazyload" src="${post.thumbnail!''}" alt="${post.title}" />
                        <#else>
                            <img class="cover lazyload" src="${theme_base!}/source/images/sj/${randomMethod(1,10)}.webp" alt="${post.title}" />
                        </#if>
                        
                    </div>
                    <div class="news-item__caption">
                        <h2 class="title title--h4 ell"><#if post.topPriority gt 0><span style="margin-right: 10px;color: red;">[置顶]</span></#if>${post.title}</h2>
                        <p class="ell">${post.summary}</p>
                    </div>
                </article>
            </#list>
        </div>
        <#if posts.totalPages gt 1>
            <@paginationTag method="categoryPosts" slug="${category.slug!}" page="${posts.number}" total="${posts.totalPages}" display="3">
                <div class="pagination">
                    <ul class="clearfix">
                        <#if pagination.hasPrev>
                            <li class="pre pagbuttons">
                                <a class="btn" role="navigation" href="${pagination.prevPageFullPath!}">上一页</a>
                            </li>
                        </#if>
                        <#if pagination.hasNext>
                            <li class="next pagbuttons">
                                <a class="btn" role="navigation" href="${pagination.nextPageFullPath!}">下一页</a>
                            </li>
                        </#if>
                    </ul>
                </div>
            </@paginationTag>
        </#if>
    </article>
</div>

</@layout>
