<#include "module/macro.ftl">
<@layout title="友情链接 - ${blog_title!}">

<div class="box box-content">
    <div class="pb-2">
        <h1 class="title title--h1 first-title title__separate">友情链接</h1>
    </div>
    <article>
        <div class="row Links-wrapper" id="link_s">
			<@linkTag method="list">
                <#if links?? && links?size gt 0>
                    <#list links as link>
                        <a href="${link.url!}" class="col-6 col-lg-4 pb-3 Links-a" name="link_a">
                            <div class="links-item">
                                <img class="links-item__icon" src="${link.logo!}" alt="" width="55" height="55">
                                <div>
                                    <h3 class="links-title title--h4 pt-3 ell">${link.name}</h3>
                                    <p class="links-item__caption ell"><#if link.description!=''>${link.description}</#if></p>
                                </div>	
                            </div>
                        </a>
                    </#list>
                </#if>
            </@linkTag>
		</div>
    </article>
</div>
<#if settings.links_random!true>
<script>
  /* 刷新随机排序links */
    window.onload=function(){
        randomFun()
        }
        function randomFun(){
        var span=document.getElementById('link_s');
        var spanItem=document.getElementsByName('link_a');
        var random=function(){return Math.random()>0.5 ? -1 : 1};//为sort()传入的随机排列参数
        var spanArr=new Array();//用来存放元素的数组
        var k,m;
        for(var i=0; i<spanItem.length; i++){
            spanArr.push(spanItem[i]);//将元素存入元素数组
        }
        spanArr.sort(random);//打乱元素数组排列顺序
        for(k=0; k<spanArr.length; k++){
            span.appendChild(spanArr[k]);//将打乱后的元素重新插入到页面中
        }
    }
</script>
</#if>

</@layout>
