<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">User Name: </label>
            <div class="col-sm-5">
                <input type="text" name="username" class="form-control" placeholder="User name"/>
            </div>
        </div>
        <#if isRegisterForm>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Email: </label>
            <div class="col-sm-5">
                <input type="email" name="email" class="form-control" placeholder="ivanov@ivan.com"/>
            </div>
        </div>
        </#if>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Password: </label>
            <div class="col-sm-5">
                <input type="password" name="password" class="form-control" placeholder="Password"/>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit" >Sign In</button>
        <#if !isRegisterForm><label class="col-sm-4 col-form-label"></label><a href="/registration" class="col-sm-5">Registration page</a></#if>

    </form>

</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit">Sign out</button>
    </form>
</#macro>