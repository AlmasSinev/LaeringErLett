<#import "parts/common.ftl" as c>

<@c.page>
    <h4>Hello, user!</h4>
    <div style="padding: 30px 50px;">
        <h1>Курсы</h1>
        <#list courses as course>
            <div class="course_container">
                <h3>${course.name}</h3>
                <p>Преподаватель: ${course.teacher_id}</p>
                <i>${course.specialization_id} - ( ${course.level} )</i>
            </div>
        <#else>
            No courses
        </#list>
    </div>

</@c.page>