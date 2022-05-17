<@menuTag method="list">
    <#--
        ?sort_by('priority')：根据菜单的排序编号排序
    -->
    <aside class="col-12 col-md-12 col-lg-2">
        <div class="sidebar box sticky-column">
            <ul class="nav">
                <#list menus?sort_by('priority') as menu>
                <li class="nav__item"><a href="${menu.url}" target="${menu.target!}"><i class="${menu.icon}"></i>${menu.name}</a></li>
                </#list>
            </ul>
        </div>
    </aside>
</@menuTag>