<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
<h2>Registration 33</h2>
 ${message?ifExists}
<@l.login "/registration" true/>
</@c.page>