const String betradarHTML = ''' 
<!DOCTYPE HTML>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>
            Live Match Tracker Demo
        </title>
        {{styles}}
        <style>
            body {
                display: flex;
                justify-content: center;
                margin:0;
                // background: #1e1e1e;
            }
            .widgets {
                width: 100%;
            }
            {{theme}}
        </style>
    </head>
    <body>
      <script>
      let settings = {{setting}};  
      (function(a,b,c,d,e,f,g,h,i){a[e]||(i=a[e]=function(){(a[e].q=a[e].q||[]).push(arguments)},i.l=1*new Date,i.o=f,
      g=b.createElement(c),h=b.getElementsByTagName(c)[0],g.async=1,g.src=d,g.setAttribute("n",e),h.parentNode.insertBefore(g,h)
      )})(window,document,"script", "https://widgets.sir.sportradar.com/{{clientID}}/widgetloader", "SIR", {
          theme: true,
          language: "en"
      });
      SIR("addWidget", ".sr-widget-1", "match.lmtPlus", {
                              matchId: {{matchId}},
                              scoreboard: settings.showScoreboard ? 'compact' : 'disable',
                              momentum: 'disable',
                              collapseTo: 'disable',
                              showOdds: false,
                              disablePitchStripes: true,
                              disablePitchNoise: true,
                              disablePitchSpotlights: true,
                              disableFooterStats: true,
                              disableWidgetHeader: true,
                              forceTeamInvert: settings.forceTeamInvert,
                              silent: true,
                              onTrack: function (param) {
                                if (param === 'load_error' || param === 'license_error') {
                                  callHandler("error",param);
                                } else {
                                  reportHeight();
                                }
                              },
                              ...settings,
        }); 
        function reportHeight() {
          const height = document.documentElement.scrollHeight || document.body.scrollHeight;
          callHandler("height",height);
        }
        function callHandler(type, data){
          if (window.flutter_inappwebview && window.flutter_inappwebview.callHandler) {
              window.flutter_inappwebview.callHandler('message', {"type":type,"data":data});
          }
        }
        </script>
        <div class="widgets">
            <div><div class="sr-widget sr-widget-1"></div></div>
        </div>
    </body>
</html>
''';
