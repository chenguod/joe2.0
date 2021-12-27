<!DOCTYPE html>
<html lang="zh-CN">
<#import "template/common/header.ftl" as headInfo>
<@headInfo.head title="${sheet.title}" type="sheet" id=sheet.id />
<#import "template/macro/tail.ftl" as tailInfo>
<script src="https://cdn.staticfile.org/echarts/5.1.2/echarts.min.js"></script>
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
</style>
<div id="Joe">
    <#include "template/common/navbar.ftl">
    <div class="joe_container joe_main_container page-sheet${(settings.aside_position=='left')?then(' revert','')}">
        <div class="joe_main">
            <div class="joe_detail">
                <#include "template/macro/post_status.ftl">
                <@post_status status=sheet.status />
                <div class="sheet-content">
                    <div id="siteTrend" style="width: auto;height: 400px">
                    </div>
                    <hr />
                    <div id="siteArea" style="width: auto;height: 400px">
                    </div>
                    <hr />
                    <div id="siteSource" style="width: auto;height: 700px">
                    </div>
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
<script>
    var siteTrend;
    var siteArea;
    var siteSource;
    $.ajax({
        url: "https://www.chenmx.net/baidu/siteTrend",
        type: "GET",
        contentType: "application/json",
        dataType: "json",
        async: false,
        success: function (response) {
            siteTrend = response.data;
        }
    });
    $.ajax({
        url: "https://www.chenmx.net/baidu/siteArea",
        type: "GET",
        contentType: "application/json",
        dataType: "json",
        async: false,
        success: function (response) {
            siteArea = response.data;
        }
    })

    $.ajax({
        url: "https://www.chenmx.net/baidu/siteSource",
        type: "GET",
        contentType: "application/json",
        dataType: "json",
        async: false,
        success: function (response) {
            siteSource = response.data;
            siteSource.series[0].data[1].selected=true
            siteSource.series[0].label = {
                position: 'inner',
                fontSize: 14
            }
            siteSource.series[0]. radius=[0, '30%'];
            siteSource.series[1]. radius=['45%', '60%'];
            siteSource.series[1].label ={
                formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
                backgroundColor: '#F6F8FC',
                borderColor: '#8C8D8E',
                borderWidth: 1,
                borderRadius: 4,

                rich: {
                    a: {
                        color: '#6E7079',
                        lineHeight: 22,
                        align: 'center'
                    },
                    hr: {
                        borderColor: '#8C8D8E',
                        width: '100%',
                        borderWidth: 1,
                        height: 0
                    },
                    b: {
                        color: '#4C5058',
                        fontSize: 14,
                        fontWeight: 'bold',
                        lineHeight: 33
                    },
                    per: {
                        color: '#fff',
                        backgroundColor: '#4C5058',
                        padding: [3, 4],
                        borderRadius: 4
                    }
                }
            }
        }
    })

    //访客数
    var chartDomTrend = document.getElementById('siteTrend');
    var myChartTrend = echarts.init(chartDomTrend);
    siteTrend && myChartTrend.setOption(siteTrend);

    //地域分布
    var chartDomArea = document.getElementById('siteArea');
    var myChartArea = echarts.init(chartDomArea);
    siteArea && myChartArea.setOption(siteArea);

    //访问来源
    var chartDomSource = document.getElementById('siteSource');
    var myChartSource = echarts.init(chartDomSource);
    siteSource && myChartSource.setOption(siteSource);
</script>
</body>
</html>