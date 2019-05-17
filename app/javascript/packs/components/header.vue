<template>
    <header>
        <p>TO DO application</p>
        <div class="menu">
            <input id="nav-input" type="checkbox" class="unshown">
            <label class="menu-trigger" for="nav-input">
                <span></span>
                <span></span>
                <span></span>
            </label>
            <ul class="menu-content">
                <li><router-link to ="/" exact-active-class="active">Top</router-link></li>
                <li><router-link to = "/about" exact-active-class="active">About</router-link></li>
                <li><router-link to  = "/contact" exact-active-class="active">Contact</router-link></li>
            </ul>
        </div>
    </header>
</template>


<style scoped>

    *{
        margin:0;
        padding:0;
    }

    header{
        position:relative;
        margin:0;
        padding:0;
        height:50px;
        background-color:#ff9999;
        width:100%;
    }

    header p{
        line-height:50px;
        font-size:20px;
        color:#fff;
    }

    .menu{
        position:absolute;
        top:8px;
        right:8px;
        height:50px;
        width:70px;
    }

    .unshown {
        display: none;
    }

    .menu-trigger,
    .menu-trigger span{
        display:inline-block;
    }

    .menu-trigger{
        position:relative;
        width:32px;
        top:0;
        right:0;
        height:34px;
    }

    .menu-trigger span{
        position:absolute;
        left:0;
        width:100%;
        height:4px;
        border-radius:4px;
        background-color: #000;
    }

    .menu-trigger span:nth-of-type(1){
        top:0;
    }

    .menu-trigger span:nth-of-type(2){
        top:14px;
    }

    .menu-trigger span:nth-of-type(3){
        bottom:0;
    }

    .menu-trigger.active span:nth-of-type(1) {
        -webkit-transform: translateY(20px) rotate(-45deg);
        transform: translateY(20px) rotate(-45deg);
    }
    .menu-trigger.active span:nth-of-type(2) {
        opacity: 0;
    }
    .menu-trigger.active span:nth-of-type(3) {
        -webkit-transform: translateY(-20px) rotate(45deg);
        transform: translateY(-20px) rotate(45deg);
    }

    #nav-input:checked ~ .menu-content{
        display:block;
        overflow: hidden;
    }

    .menu-content{
        display:none;
        width: 5rem;
        background: rgba(255,255,255,0.9);

    }
    .menu-content li {
        height:30px;
        list-style-type: none;
        border: solid 2px #000;
        text-align:center;
        font-size:1.1rem;
        color:#fff;
        font-family: "Yu Gothic UI";
    }

    /*router-link でcss使うには、activeを用いる。*/
    .active.router-link-active{
        text-decoration:none;
        color:#000;

    }


    </style>