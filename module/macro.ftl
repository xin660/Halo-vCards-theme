<#macro layout title>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="${meta_keywords!}"/>
    <meta name="description" content="${meta_description!}" />

	<!-- Meta Data -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="format-detection" content="telephone=no" />
	<meta name="format-detection" content="address=no" />
	<meta name="author" content="irils" />
    <#--
        公共 head 代码，详情请参考：https://docs.halo.run/zh/developer-guide/theme/public-template-tag
        包含：Favicon，自定义 head 等
    -->

	<!-- Styles -->
	<link rel="stylesheet" type="text/css" href="${theme_base!}/source/css/style.css" />
    <@global.head />

    <title>${title}</title>

	<style>
		:root {
		--index: ${settings.indexcolor!'#3086FF'};
		--aide: ${settings.aidecolor!'#FF965D'};
		--text: ${settings.textcolor!'#3B4B5E'};
		}

		${settings.custom!}
	</style>
</head>
<body>
	<!-- Preloader -->
	<#if settings.preloader!true>
	 <div class="preloader">
	    <div class="preloader__wrap">
		    <div class="circle-pulse">
                <div class="circle-pulse__1"></div>
                <div class="circle-pulse__2"></div>
            </div>
		    <div class="preloader__progress"><span></span></div>
		</div>
	</div>
	</#if>

	<!-- Scroll Indicator -->
	<#if settings.ScrollIndicator!true>
    <div class="scroll-line"></div>
	</#if>

	<main class="main">
		<!-- Header Image -->
		<div class="header-image">
			<div class="js-parallax" style="background-image: url(${settings.bannerUrl!});"></div>
		</div>

		<div class="container gutter-top">
			<!-- Header -->
			<header class="header box">
				<div class="header__left">
					<div class="header__photo">
						<img class="header__photo-img" src="${user.avatar!}" alt="${user.nickname!}">
					</div>
					<div class="header__base-info">
						<h4 class="title titl--h4">${user.nickname!}</h4>
						<div class="status">${settings.author_describe!}</div>
						<ul class="header__social">
						    <#if settings.rss!true>
							<li><a href="${atom_url!}"><i class="ri-rss-fill"></i></a></li>
							</#if>
							<#if settings.qq??>
							<li><a href="tencent://message/?uin=${settings.qq}&Site=&Menu=yes"><i class="ri-qq-line"></i></a></li>
							</#if>
							<#if settings.weibo??>
							<li><a href="https://weibo.com/${settings.weibo}"><i class="ri-weibo-fill"></i></a></li>
							</#if>
							<#if settings.email??>
							<li><a href="mailto:${settings.email}"><i class="ri-mail-line"></i></a></li>
							</#if>
							<#if settings.github??>
							<li><a href="https://github.com/${settings.github}"><i class="ri-github-fill"></i></a></li>
							</#if>
							<#if settings.telegram??>
							<li><a href="https://t.me/${settings.telegram}"><i class="ri-telegram-line"></i></a></li>
							</#if>
							<#if settings.bilibli??>
							<li><a href="${settings.bilibli}"><i class="ri-bilibili-line"></i></a></li>
							</#if>
						</ul>
					</div>
				</div>
				<div class="header__right">
					<ul class="header__contact">
						<@categoryTag method="count">
						<li><span class="overhead">分类数量</span>${count!0}</li>
						</@categoryTag>
						<@tagTag method="count">
						<li><span class="overhead">标签数量</span>${count!0}</li>
						</@tagTag>
					</ul>
					<ul class="header__contact">
						<@postTag method="count">
						<li><span class="overhead">文章数量</span>${count!0}</li>
						</@postTag>
						<@commentTag method="count">
						<li><span class="overhead">评论数量</span>${count!0}</li>
						</@commentTag>
						
					</ul>
				</div>
			</header>

			<div class="row sticky-parent">
				<!-- Sidebar nav -->
				<#include "menu.ftl">

				<!-- Content -->
				<div class="col-12 col-md-12 col-lg-10">
					
					<#nested >

					<!-- Footer -->
					<footer class="footer">
					Powered by <a href="https://halo.run/" target="_blank" rel="noopener noreferrer">Halo</a> | Theme by <a href="https://halo.run/" target="_blank" rel="noopener noreferrer">vCards</a> © 2022 Copyright</footer>
				</div>
			</div>
		</div>
	</main>

	<div id="GoTop"><a href="javascript:;" aria-label="GoTop"><i class="ri-rocket-line ri-xl"></i></a></div>



<!-- JavaScripts -->
	<script src="${theme_base!}/source/js/jquery-3.4.1.min.js"></script>
	<script src="${theme_base!}/source/js/plugins.min.js"></script>
	<script src="${theme_base!}/source/js/common.js"></script>


	<script type="text/javascript">
    var url = location.href;
    var urlstatus = false;
    $(".nav li a").each(function () {
        if ((url + '/').indexOf($(this).attr('href')) > -1 && $(this).attr('href') != '/') {
            $(this).addClass('active');
            urlstatus = true;
        } else {
            $(this).removeClass('active');
        }
    });
    if (!urlstatus) {
        $(".nav li a").eq(0).addClass('active');
    }

	

	</script>
<#--
    公共底部代码，详情请参考：https://docs.halo.run/zh/developer-guide/theme/public-template-tag
    包含：统计代码，底部信息
-->
<@global.footer />
</body>
</html>
</#macro>
