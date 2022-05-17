<#include "module/macro.ftl">
<@layout title="${post.title!} - ${blog_title!}">
<header class="header-post">
    <div class="header-post__image-wrap">
        <div class="news-item__date"><span>${post.createTime?string('yyyy-MM-dd')}</span></div>
        <div class="header-post-news-item__con">
            <p itemprop="name headline" style="text-shadow: 0 0 5px #000; font-size: 1.5rem;margin-bottom: 2.5rem;">
                ${post.title!} 
            </p>
                <p class="news-category" style="font-size: 1rem;font-weight: 500;text-shadow: 0 0 5px #000;">
                    <#list categories as category>
                        <a href="${category.fullPath!}">#${category.name!}</a>
                    </#list>
                </p>
        </div>
        <#if post.thumbnail?? && post.thumbnail!=''>
            <img class="header-post-news-item-image lazyload" data-src="${post.thumbnail!''}" src="${post.thumbnail!''}" alt="${post.title}" />
        <#else>
            <img class="header-post-news-item-image lazyload" data-src="${post.thumbnail!''}" src="${theme_base!}/source/images/sj/${randomMethod(1,10)}.jpg" alt="${post.title}" />
        </#if>
    </div>
</header>
<div class="box box-content">

    <article class="post-formatContent">
        ${post.formatContent!}

        <div class="post-tag" style="display: flex;">
            <i class="ri-price-tag-3-line"></i>
            <#list tags as tag>
                <a href="${tag.fullPath!}">${tag.name!}</a>
            </#list>
        </div>
    </article>

    <footer class="footer-post">
        <a class="footer-post__share" href="https://connect.qq.com/widget/shareqq/index.html?url=${blog_url!}${post.fullPath!}&sharesource=qq&title=${post.title!}"><i
                class="font-icon ri-qq-fill ri-xl"></i><span>QQ</span></a>
        <a class="footer-post__share" href="http://service.weibo.com/share/share.php?url=${blog_url!}${post.fullPath!}/&title=${post.title!}" onclick="window.open(this.href, 'weibo-share', 'width=730,height=500');return false;"><i
                class="font-icon ri-weibo-fill ri-xl"></i><span>Weibo</span></a>
        <a class="footer-post__share" href="https://api.qrserver.com/v1/create-qr-code/?size=200x200&margin=10&data=${blog_url!}${post.fullPath!}" onclick="window.open(this.href, 'wechat-share', 'width=730,height=500');return false;"><i
                class="font-icon ri-wechat-fill ri-xl"></i><span>wechat</span></a>
    </footer>
    
    <h2 class="title title--h3">Comments</h2>
    <#include "module/comment.ftl">
    <@comment post=post type="post" />
</div>

</@layout>
