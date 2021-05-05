<#include "security.ftl">
<#import "login.ftl" as l>
<div class="header">
    <a href="/" class="logo">Læring er lett</a>
    <div class="header-right">
        <a href="about.html">О нас</a>
        <a href="/login"><b>${name}</b></a>
        <#if name != "Guest">
            <@l.logout/>
        </#if>
        <a class="active" href="/login">Войти</a>
    </div>
</div>