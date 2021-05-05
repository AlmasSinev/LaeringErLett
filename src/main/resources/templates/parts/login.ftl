<#macro login path>
    <div class="container" id="container">
        <div class="form-container sign-up-container">
            <form action="#">
                <h1>Регистрация</h1>
                <span>Введи свои данные.</span>
                <input type="text" name="surname" placeholder="Фамилия" />
                <input type="text" name="firstname" placeholder="Имя" />
                <input type="date" name="birthday" id="date" value="2000-01-01"/>
                <input type="email" name="email" placeholder="Email" />
                <input type="password" name="passwd" placeholder="Password" />
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button class="signUpBtn" href="/login_register" onclick="sayMessage()">Зарегистрироваться</button>
            </form>
        </div>
        <div class="form-container sign-in-container">
            <form action="${path}" method="post">
                <h1>Авторизация</h1>
                <span>Введи свои данные</span>
                <input type="email" name="email" placeholder="Email" />
                <input type="password" name="passwd" placeholder="Пароль" />
                <a href="#">Забыли пароль?</a>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button class="signInBtn" type="submit">Войти</button>
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>С возвращением!</h1>
                    <p>Для продолжения введи, пожалуйста, свои данные.</p>
                    <button class="ghost" onclick="changeIn()" id="signIn">Авторизация</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h1>Привет, Друг!</h1>
                    <p>Введи свои персональные данные и начинай учиться вместе с нами.</p>
                    <button class="ghost" onclick="changeUp()" id="signUp">Регистрирация</button>
                </div>
            </div>
        </div>
    </div>

</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit">Выйти</button>
    </form>
</#macro>