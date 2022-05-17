<#macro comment post,type>
    <#if !post.disallowComment!false>
        <script src="/themes/0vcards/source/js/vue.min.js"></script>
        <script src="${options.comment_internal_plugin_js!'/themes/0vcards/source/js/halo-comment.min.js'}"></script>
        <halo-comment id="${post.id?c}" type="${type}"/>
    </#if>
</#macro>