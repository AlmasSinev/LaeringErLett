<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <h2>Login 5 </h2>
    ${message?ifExists}
<@l.login "/login" false/>
</@c.page>