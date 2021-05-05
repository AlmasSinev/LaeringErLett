<#import "parts/common.ftl" as c>

<@c.page>
    <div style="padding: 30px 50px;">
        <h1>Курсы</h1>
        <#list courses as course>
            <div class="course_container">
                <h3>${course.name}</h3>
                <p>Преподаватель: ${course.getTeacherName()}</p>
                <i>${course.getSpecializaionName()}   (Уровень - ${course.level})</i>
            </div>
        <#else>
            No courses
        </#list>
    </div>

</@c.page>