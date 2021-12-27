<!DOCTYPE html>
<html lang="zh-CN">
<#assign title=settings.journals_title!'休闲'>
<#import "template/common/header.ftl" as headInfo>
<@headInfo.head title="${title}" type="sheet"/>
<#import "template/macro/tail.ftl" as tailInfo>
<#include "template/macro/loading.ftl">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
<body>
<style>
    /* 美化 hr 样式 */
    hr {
        position: relative;
        margin: 2rem auto;
        width: calc(100% - 4px);
        border: 2px dashed #a4d8fa;
        background: #fff;
    }

    hr {
        box-sizing: content-box;
        height: 0;
        overflow: visible;
    }

    hr:before {
        position: absolute;
        top: -10px;
        left: 5%;
        z-index: 1;
        color: #49b1f5;
        content: '\f0c4';
        font: normal normal normal 14px/1 FontAwesome;
        font-size: 20px;
        -webkit-transition: all 1s ease-in-out;
        -moz-transition: all 1s ease-in-out;
        -o-transition: all 1s ease-in-out;
        -ms-transition: all 1s ease-in-out;
        transition: all 1s ease-in-out;
    }

    hr:hover::before{
        left: 95%;
    }
    .note {
        position: relative;
        padding: 15px;
        margin-top: 10px;
        margin-bottom: 10px;
        border: initial;
        border-left: 3px solid #eee;
        background-color: #f9f9f9;
        border-radius: 3px;
        font-size: 1.5rem!important;
    }

    .note:not(.no-icon):before {
        position: absolute;
        font-family: FontAwesome;
        font-size: larger;
        top: 11px;
        left: 15px;
    }

    .note:not(.no-icon) {
        padding-left: 20px;
    }

    .note.info {
        background-color: #eef7fa;
        border-left-color: #428bca;
    }

</style>
<div id="Joe">
    <#include "template/common/navbar.ftl">
    <div class="joe_container joe_main_container page-sheet${(settings.aside_position=='left')?then(' revert','')}">
        <div class="joe_main">
            <div class="joe_detail">
                <#include "template/macro/post_status.ftl">
                <@post_status status=sheet.status />
                <h1 class="joe_detail__title txt-shadow" data-sheetid="${sheet.id}">${sheet.title}</h1>
                <div class="sheet-content">
                    <div class="note info">
                        <a style="display:flex;justify-content: left;align-content: center;"><span style="line-height:30px;"></span>
                            <i class="fa fa-gamepad fa-2x fa-fw" aria-hidden="false" align="absmiddle" width="59px" height="30px"></i>
                            <span style="line-height:35px;">&nbsp;&nbsp;&nbsp;休闲之际，来放松下吧OωO</span>
                        </a>
                    </div>
                    <ul class="nav nav-pills nav-stacked">
                        <li role="presentation" class="dropdown">
                            <a href="https://yun.chenmx.net/mikutap/index.html" target="_blank">&nbsp;mikutap</a>
                        </li>
                        <li role="presentation" class="dropdown">
                            <a href="https://yun.chenmx.net/battlecity/index.html" target="_blank">&nbsp;坦克大战</a>
                        </li>
                        <li  role="presentation" class="disabled"><a href="#">&nbsp;虚位以待</a></li>
                    </ul>
                    <hr />
                </div>
            </div>
            <#assign enable_comment = (metas?? && metas.enable_comment?? && metas.enable_comment?trim!='')?then(metas.enable_comment?trim,'true')>
            <#if settings.enable_clean_mode!=true && settings.enable_comment==true && sheet.status!='DRAFT'>
                <div class="joe_comment">
                    <#if sheet.disallowComment == true || enable_comment == 'false'>
                        <div class="joe_comment__close">
                            <svg class="joe_comment__close-icon" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg" width="18" height="18">
                                <path d="M512.307.973c282.317 0 511.181 201.267 511.181 449.587a402.842 402.842 0 0 1-39.27 173.26 232.448 232.448 0 0 0-52.634-45.977c16.384-39.782 25.293-82.688 25.293-127.283 0-211.098-199.117-382.157-444.621-382.157-245.555 0-444.57 171.06-444.57 382.157 0 133.427 79.514 250.88 200.039 319.18v107.982l102.041-65.127a510.157 510.157 0 0 0 142.49 20.122l19.405-.359c19.405-.716 38.758-2.508 57.958-5.427l3.584 13.415a230.607 230.607 0 0 0 22.323 50.688l-20.633 3.328a581.478 581.478 0 0 1-227.123-12.288L236.646 982.426c-19.66 15.001-35.635 7.168-35.635-17.664v-157.39C79.411 725.198 1.024 595.969 1.024 450.56 1.024 202.24 229.939.973 512.307.973zm318.464 617.011c97.485 0 176.794 80.435 176.794 179.2S928.256 976.23 830.77 976.23c-97.433 0-176.742-80.281-176.742-179.046 0-98.816 79.309-179.149 176.742-179.149zM727.757 719.002a131.174 131.174 0 0 0-25.754 78.182c0 71.885 57.805 130.406 128.768 130.406 28.877 0 55.552-9.625 77.056-26.01zm103.014-52.327c-19.712 0-39.117 4.557-56.678 13.312L946.33 854.58c8.499-17.305 13.158-36.864 13.158-57.395 0-71.987-57.805-130.509-128.717-130.509zM512.307 383.13l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072 67.072 67.072 0 0 1 66.662-67.43zm266.752 0l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072h-.051l.307-6.86a67.072 67.072 0 0 1 66.406-60.57zm-533.504 0l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072 67.072 67.072 0 0 1 66.662-67.43z" />
                            </svg>
                            <span>博主关闭了当前页面的评论</span>
                        </div>
                    <#else>
                        <#include "template/macro/comment.ftl">
                        <@comment target=sheet type="sheet"/>
                    </#if>
                </div>
            <#else>
                <div class="joe_comment">
                    <div class="joe_comment__close">
                        <svg class="joe_comment__close-icon" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg" width="18" height="18">
                            <path d="M512.307.973c282.317 0 511.181 201.267 511.181 449.587a402.842 402.842 0 0 1-39.27 173.26 232.448 232.448 0 0 0-52.634-45.977c16.384-39.782 25.293-82.688 25.293-127.283 0-211.098-199.117-382.157-444.621-382.157-245.555 0-444.57 171.06-444.57 382.157 0 133.427 79.514 250.88 200.039 319.18v107.982l102.041-65.127a510.157 510.157 0 0 0 142.49 20.122l19.405-.359c19.405-.716 38.758-2.508 57.958-5.427l3.584 13.415a230.607 230.607 0 0 0 22.323 50.688l-20.633 3.328a581.478 581.478 0 0 1-227.123-12.288L236.646 982.426c-19.66 15.001-35.635 7.168-35.635-17.664v-157.39C79.411 725.198 1.024 595.969 1.024 450.56 1.024 202.24 229.939.973 512.307.973zm318.464 617.011c97.485 0 176.794 80.435 176.794 179.2S928.256 976.23 830.77 976.23c-97.433 0-176.742-80.281-176.742-179.046 0-98.816 79.309-179.149 176.742-179.149zM727.757 719.002a131.174 131.174 0 0 0-25.754 78.182c0 71.885 57.805 130.406 128.768 130.406 28.877 0 55.552-9.625 77.056-26.01zm103.014-52.327c-19.712 0-39.117 4.557-56.678 13.312L946.33 854.58c8.499-17.305 13.158-36.864 13.158-57.395 0-71.987-57.805-130.509-128.717-130.509zM512.307 383.13l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072 67.072 67.072 0 0 1 66.662-67.43zm266.752 0l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072h-.051l.307-6.86a67.072 67.072 0 0 1 66.406-60.57zm-533.504 0l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072 67.072 67.072 0 0 1 66.662-67.43z" />
                        </svg>
                        <span>${(sheet.status=='DRAFT')?then('预览状态下不可评论','博主关闭了所有页面的评论')}</span>
                    </div>
                </div>
            </#if>
        </div>
        <#assign enable_aside = (metas?? && metas.enable_aside?? && metas.enable_aside?trim!='')?then(metas.enable_aside?trim,'true')>
        <#if settings.enable_sheet_aside == true && enable_aside == 'true'>
            <#include "template/common/aside.ftl">
        </#if>
    </div>
    <#include "template/common/actions.ftl">
    <#include "template/common/footer.ftl">
</div>
<@tailInfo.tail type="sheet"/>
</body>
</html>