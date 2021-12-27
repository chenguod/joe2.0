<style xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
  .github-badge {
    display: inline-block;
    border-radius: 4px;
    text-shadow: none;
    font-size: 12px;
    color: #fff;
    line-height: 15px;
    background-color: #abbac3;
    margin-bottom: 5px;
  }
  .github-badge .badge-subject {
    display: inline-block;
    background-color: #4d4d4d;
    padding: 4px 4px 4px 6px;
    border-top-left-radius: 4px;
    border-bottom-left-radius: 4px;
  }
  .github-badge .badge-value {
    display: inline-block;
    padding: 4px 6px 4px 4px;
    border-top-right-radius: 4px;
    border-bottom-right-radius: 4px;
  }
  .github-badge .bg-blue {
    background-color: #007ec6!important;
  }
  .github-badge .bg-red {
    background-color: #e05d44!important;
  }
  .github-badge .bg-brightgreen {
    background-color: #4dc820!important;
  }
  .github-badge .bg-orange {
    background-color: orange!important;
  }
  .github-badge .bg-blueviolet {
    background-color: #8833d7!important;
  }
  .site-footer {
    padding: 2%;
  }
  .footertext p {
      margin-bottom: 8px
  }

  .foo-logo {
      width: 30px;
      height: 30px;
      opacity: .3;
      margin: 0 auto;
      background-size: cover;
      background-position: center center;
      background-repeat: no-repeat;
      animation: poi-deg 12s infinite linear;
      -webkit-animation: poi-deg 12s infinite linear;
  }
  .rotating {
      -webkit-animation: rotating 3s linear infinite;
      animation: rotating 3s linear infinite;
  }
  .iconfont {
      font-family: "iconfont";
      font-size: 16px;
      font-style: normal;
      -webkit-font-smoothing: antialiased;
      -moz-osx-font-smoothing: grayscale;
  }
</style>
<footer class="joe_footer site-footer">

      <div class="item">
      <div class="footertext">
          <p class="foo-logo" style="background-image: url('https://images.chenmx.net/blog/sakura.svg');"></p>

          <a href="https://www.upyun.com/?utm_source=lianmeng&utm_medium=referral" style="color: #909399;display:flex;justify-content: center;align-content: center;"><span style="line-height:30px;">本站由</span>
              <img src="https://images.chenmx.net/youpaiyun5.png" align="absmiddle" width="59px" height="30px">
              <span style="line-height:30px;">提供加速服务</span>
          </a>
          <br>
      </div>

       <div align="center">
          <p>
              © ${.now?string("yyyy")}&nbsp;
              <i class="iconfont icon-sakura rotating" style="color: #ffc0cb;display:inline-block"></i>
              &nbsp;${(user.nickname)!}&nbsp;
              <a href="https://beian.miit.gov.cn/" target="_blank" style="color: #909399;">${settings.icp}</a>
          </p>
          <br>
       </div>
       <div align="center">
           <div class="github-badge">
               <a style="color: #fff" rel="license" href="http://halo.run" target="_blank" title="由 Halo 驱动" data-pjax-state="">
                   <span class="badge-subject">Powered</span><span class="badge-value bg-blue">Halo</span>
               </a>
           </div>
           <div class="github-badge">
               <a style="color: #fff" rel="license" href="https://github.com/qinhua/halo-theme-joe2.0" target="_blank" title="本站主题为 Joe2.0 主题" data-pjax-state="">
                   <span class="badge-subject">Theme</span><span class="badge-value bg-red">Joe2.0</span>
               </a>
           </div>
           <div class="github-badge">
               <a style="color: #fff" rel="license" href="https://cloud.tencent.com/" target="_blank" title="运行于腾讯云轻量服务器" data-pjax-state="">
                   <span class="badge-subject">Hosted</span><span class="badge-value bg-brightgreen">腾讯云</span>
               </a>
           </div>
           <div class="github-badge">
               <a style="color: #fff" href="https://www.chenmx.net/s/statistics" target="_top" title="数据来源于百度统计" data-pjax-state="">
                   <span class="badge-subject">访客数</span><span class="badge-value bg-orange" id="site_uv" target="_blank" title="本站访客量"></span>
               </a>
           </div>
           <div class="github-badge">
               <a style="color: #fff" href="https://www.chenmx.net/s/statistics" target="_top" title="数据来源于百度统计" data-pjax-state="">
                   <span class="badge-subject">访问量</span><span class="badge-value bg-orange" id="site_pv" target="_blank" title="本站浏览量"></span>
               </a>
           </div>
           <div class="github-badge">
               <span class="badge-subject">运行</span><span class="badge-value bg-blueviolet" target="_blank" title="本站已运行"><span id="site_run_date"></span></span>
           </div>
       </div>
    </div>
</footer>
<script type="text/javascript">
    show_site_count();
    //统计访问量
    function show_site_count() {
        $.ajax({
            url: "https://www.chenmx.net/baidu/siteCount",
            type: "GET",
            contentType: "application/json",
            dataType: "json",
            success: function (response) {
                $("#site_pv").html(response.data.pv);
                $("#site_uv").html(response.data.uv);
            }
        })
    };

    show_date_time();
    // 建站时间统计
    function show_date_time() {
        const birthDay = new Date(
            /^\d+$/g.test(ThemeConfig.birthday)
                ? +ThemeConfig.birthday
                : ThemeConfig.birthday
        );
        const today = +new Date();
        const timePast = today - birthDay.getTime();
        let day = timePast / (1000 * 24 * 60 * 60);
        let dayPast = Math.floor(day);
        day = String(dayPast).padStart(2, 0)+'天';
        document.getElementById("site_run_date").innerHTML=day;
    }
</script>