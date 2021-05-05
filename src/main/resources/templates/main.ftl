<#import "parts/common.ftl" as c>

<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form class="form-inline" method="get" action="/main">
                <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search by tag">
                <button class="btn btn-primary ml-2" type="submit">Search</button>
            </form>
        </div>
    </div>
    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new Message
    </a>
    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                <input type="text" class="form-control" name="text" placeholder="Введите сообщение">
                </div>
                <div class="form-group">
                <input type="text" class="form-control" name="tag" placeholder="Введите тэг">
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file" class="custom-file-input" id="customFile">
                        <label class="custom-file-label" for="customFile">Choose file</label>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary ">Добавить</button>
                </div>
            </form>
        </div>
    </div>
    <div class="card-columns">
        <#list messages as message>
        <div class="card my-3">
            <#if message.filename??>
                <img class="card-img-top" src="/img/${message.filename}"
            </#if>
            <span style="margin-left: 5px">${message.text}</span>
            <i style="color: rgba(23,23,23,0.66); text-align: right; margin-left: 5px;">${message.tag}</i>
            <div class="card-footer text-muted" style="text-align: right; ">
                ${message.authorName}
            </div>
        </div>

    <#else>
        No messages
    </#list>
    </div>
</@c.page>