<!DOCTYPE html>
<html lang="zh-CN" xmlns="http://www.w3.org/1999/html">
  <#assign title=settings.links_title!'友情链接'>
  <#import "template/common/header.ftl" as headInfo>
  <@headInfo.head title="${title}" type="links"/>
  <#import "template/macro/tail.ftl" as tailInfo>
  <style>
    .note.warning {
      background-color: #fdf8ea;
      border-left-color: #f0ad4e;
    }
    .note.primary {
      background-color: #f5f0fa;
      border-left-color: #6f42c1;
    }
    .note.info {
      background-color: #eef7fa;
      border-left-color: #428bca;
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
    }
    .links-box {
      margin: 0 auto;
    }
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
    div.note {
      position: relative;
      margin-top: 0.5rem;
      margin-bottom: 0.5rem;
      padding: 1.2rem 16px 1.2rem 16px;
      padding-left: calc(16px + 16px);
      border-radius: 4px;
      background: #f6f6f6;
      border-left: 4px solid #767676;
    }
  </style>
  <body>
    <div id="Joe">
      <#include "template/common/navbar.ftl">
      <div class="joe_container joe_main_container page-links${(settings.aside_position=='left')?then(' revert','')}">
        <div class="joe_main">
          <div class="joe_detail">
            <h1 class="joe_detail__title txt-shadow">${title}</h1>
            <#include "template/macro/links_item.ftl">
            <#assign logo_default=(settings.links_logo_default?? && settings.links_logo_default!='')?then(settings.links_logo_default, BASE_RES_URL+'/source/img/icon_qiye.png')>
            <#assign colors=["#F8D800", "#0396FF", "#EA5455", "#7367F0", "#32CCBC", "#F6416C", "#32B76E", "#9F44D3", "#F55555", "#736EFE", "#E96D71", "#DE4313", "#D939CD", "#4C83FF", "#F072B6", "#C346C2", "#5961F9", "#FD6585", "#5569E8", "#FFC600", "#FA742B", "#5151E5", "#BB4E75", "#FF52E5", "#4DA037", "#15D1E2", "#F067B4", "#F067B4", "#ff9a9e", "#00f2fe", "#4facfe", "#f093fb", "#6fa3ef", "#bc99c4", "#46c47c", "#f9bb3c", "#e8583d", "#f68e5f"]>
            <#assign omits=settings.links_omit?trim!''>
            <article class="joe_detail__article animated fadeIn">
              <h5>友链列表<#if omits == ''><@linkTag method="count"><span class="totals">${count!0} 条</span></@linkTag></#if></h5>
              <#if settings.links_type?ends_with('group')>
                <@linkTag method="${(settings.links_type == 'group')?then('listTeams', 'listTeamsByRandom')}">
                    <#assign flag = 0>
                    <#list teams as team>
                      <#if omits?index_of(team.team) == -1>
                        <div class="links-group">
                          ${team.team!}
                          <@links_item links=team.links />
                        </div>
                      <#else>
                        <#assign flag++>
                      </#if>
                    </#list>
                  <#if teams?size == 0 || flag == teams?size>
                    <div class="joe_nodata">${settings.links_empty_text!}</div>
                  </#if>
                </@linkTag>
              <#else>
                <@linkTag method="${(settings.links_type == 'list')?then('list', 'listByRandom')}">
                  <#assign nextRandom = .now?string["HHmmssSSS"]?number>
                  <@links_item links=links />
                </@linkTag>
              </#if>
            </article>
            <hr>
            <div align="center"><img src="https://images.chenmx.net/blog/20200701175738.gif" width="300"></div>
            <p>🍜   <strong>友链申请要求</strong>：</p>
            <div class="note">
              <p>
                1.<strong>网站证书<span style="color: darksalmon">未过期</span>，谢绝资源网站~</strong> <br>
                2.<strong>申请前请将我添加至您的友链页面哦~</strong> <br>
                3.<strong>原则上要求您的<span style="color:orange">博客主页</span>被百度或者 Google 等<span style="color:#9929ff">搜索引擎收录</span></strong> <br>
                4.<strong>新站点（<span style="color: #9d0006">建站时间不超过三个月）</span> 请维护一段时间后再来申请，不接受一时起兴的博客</strong>
              </p>
            </div>
            <br/>
            <p>🍭  <strong>友链申明</strong>：</p>
            <div class="note no-icon">
              <p>
                <a href="https://www.chenmx.net/?p=337" target="_blank" title="自动友链管理工具" style="color: #0a0a0a;">
                  1.<strong>自动清理已阵亡友链，请爱护你的小站。如更换了链接信息请至留言板留言！</strong>
                </a>
                <br>
                  2.<strong>没事多来留言，小站永远欢迎😘</strong></p>
            </div>
            <br />

            <p>🍉  <strong>申请格式</strong>：</p>
            <div class="note no-icon">
              <blockquote>
                <strong>昵称：  <span style="color:#ea5455">晓果冻</span></strong>
                <br><strong>链接： <a href="https://www.chenmx.net" style="color: #990055;">https://www.chenmx.net</a></strong>
                <br><strong>头像： <a href="https://chen-1302214763.cos.ap-beijing.myqcloud.com/blog.jpg" target="_blank" rel="noopener" style="color: orange;">https://chen-1302214763.cos.ap-beijing.myqcloud.com/blog.jpg</a></strong>
                <br><strong>描述： <span style="color:#9929ff">是你呀，晓果冻！</span></strong>
              </blockquote>
            </div>
            <br />
            <div class="note warning">
              <p>
                <strong>将对应内容替换为你的信息并保证头像和链接为<span  style="color: red">https</span>开头，发送至
                  <a href="https://www.chenmx.net/s/messageboard" target="_blank" title="闲来无事不如一起来唠唠嗑😘" style="color: #0000ff;">
                    <span style="color: #0000ff">留言板</span>
                  </a>
                  即可👌
                </strong>
              </p>
            </div>
            <hr>
          </div>

          <#--  目前友链页无法评论  -->
          <#--  <div class="joe_comment">
            <@global.comment target=links type="links" />
          </div>  -->
        </div>
        <#if settings.enable_links_aside!false>
          <#include "template/common/aside.ftl">
        </#if>
      </div>
      <#include "template/common/actions.ftl">
      <#include "template/common/footer.ftl">
    </div>
    <@tailInfo.tail type="links"/> 
  </body>
</html>