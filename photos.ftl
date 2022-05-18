<#include "module/macro.ftl">
<@layout title="相册 | ${options.blog_title!}">

<div class="box box-content">
  <div class="pb-2">
            <h1 class="title title--h1 first-title title__separate">${settings.photos_title!'相册'}</h1>
  </div>

  <article>
    <!-- Filter -->
    <div class="select">
      <span class="placeholder">选择分类</span>
      <ul class="filter">
        <li class="filter__item">Category</li>
        <li class="filter__item active" data-filter="*"><a class="filter__link active" href="#filter">全部</a></li>
        <@photoTag method="listTeams">
            <#list teams as item>
              <li class="filter__item" data-filter=".category-${((item.team)?length>0)?string((item.team),'默认')}"><a class="filter__link" href="#filter">${((item.team)?length>0)?string((item.team),'默认')}</a></li>
            </#list>
        </@photoTag>
      </ul>
      <input type="hidden" name="changemetoo"/>
    </div>

    <!-- Gallery -->
    <div class="gallery-grid <#if settings.photos!true>gallery-grid-row<#else>gallery-grid-two</#if> js-grid js-filter-container">
      <div class="gutter-sizer"></div>

      <@photoTag method="list">
        <#list photos?sort_by('name')?reverse as photo>
          <!-- Item 1 -->
          <figure class="gallery-grid__item category-${((photo.team)?length>0)?string((photo.team),'默认')}">
            <div class="gallery-grid__image-wrap">
              <img class="gallery-grid__image cover lazyload" data-src="${photo.url!}" src="${photo.url!}" data-zoom alt="${photo.name}" />
            </div>
            <figcaption class="gallery-grid__caption">
              <h4 class="title title--h6 gallery-grid__title">${photo.name}</h4>
              <span class="gallery-grid__category">${((photo.team)?length>0)?string((photo.team),'默认')}</span>
            </figcaption>
          </figure>
        </#list>
      </@photoTag>
      
    </div><!-- Gallery End -->
  </article>
</div>
</@layout>
