# 瀵艰埅涓庡竷灞€楂樼骇缁勪欢锛圢avigationAndLayout锛夋祴璇曠敤渚嬪綊妗?
> 鐢ㄤ緥闇€鍦?API 26 璁惧/妯℃嫙鍣ㄦ墽琛屽悗鍥炲～缁撴灉锛涙姌鍙犵湡瀹炴€佷笌 HSP 鎴愬姛鍔犺浇渚濊禆璁惧/鍒嗗寘锛屾湭婊¤冻鏃舵寜鐢ㄤ緥璇存槑璧版ā鎷熸垨鍏滃簳璺緞銆?
## 鐢ㄤ緥琛?
| 鐢ㄤ緥缂栧彿 | 娴嬭瘯鍔熻兘 | 姝ラ | 棰勬湡杈撳嚭 | 缁撴灉 |
|---|---|---|---|---|
| NavigationAndLayout_Launch_001 | 棣栭〉鎷夎捣 | 鍐峰惎鍔?| 棣栭〉涓?4 涓叆鍙ｅ彲瑙?| 寰呮墽琛?|
| NavigationAndLayout_Breakpoint_001 | 鏂偣灞曠ず | 鍐峰惎鍔?| 鏂偣鏂囨湰鍖呭惈 breakpoint= | 寰呮墽琛?|
| NavigationAndLayout_OpenMulti_001 | 鎵撳紑 MultiNavigation | 鐐瑰嚮鍏ュ彛鈫掕繑鍥?| 椤甸潰鎵撳紑骞舵甯歌繑鍥?| 寰呮墽琛?|
| NavigationAndLayout_OpenSplit_001 | 鎵撳紑 SplitLayout | 鐐瑰嚮鍏ュ彛鈫掕繑鍥?| 椤甸潰鎵撳紑骞舵甯歌繑鍥?| 寰呮墽琛?|
| NavigationAndLayout_OpenFold_001 | 鎵撳紑 FoldSplit | 鐐瑰嚮鍏ュ彛鈫掕繑鍥?| 椤甸潰鎵撳紑骞舵甯歌繑鍥?| 寰呮墽琛?|
| NavigationAndLayout_OpenHsp_001 | 鎵撳紑 HSP 椤甸潰 | 鐐瑰嚮鍏ュ彛鈫掕繑鍥?| 椤甸潰鎵撳紑骞舵甯歌繑鍥?| 寰呮墽琛?|
| NavigationAndLayout_MultiHome_001 | MultiNavigation 涓婚〉 | 杩涘叆绀轰緥 | 鍒楄〃椤广€佸叏灞忔寜閽€佹爤鎽樿 HomePage | 寰呮墽琛?|
| NavigationAndLayout_MultiDetail_001 | 璇︽儏椤电瓥鐣?| 鐐瑰嚮鍒楄〃椤?1 | Detail 椤甸潰灞曠ず Alpha item 涓庢弿杩?| 寰呮墽琛?|
| NavigationAndLayout_MultiDetailBack_001 | 璇︽儏杩斿洖 | 璇︽儏椤佃繑鍥?| 鍥炲埌涓婚〉鍒楄〃 | 寰呮墽琛?|
| NavigationAndLayout_MultiFull_001 | 鍏ㄥ睆椤电瓥鐣?| 鎵撳紑鍏ㄥ睆椤碘啋杩斿洖 | FULL_PAGE 椤甸潰鎵撳紑骞惰繑鍥?| 寰呮墽琛?|
| NavigationAndLayout_MultiPushPath_001 | pushPath 閲嶈浇 | 鐐瑰嚮 PushPath with NavPathInfo | 璇︽儏椤靛睍绀?PushPath item | 寰呮墽琛?|
| NavigationAndLayout_MultiPlaceholder_001 | 鍗犱綅椤?| 鐐瑰嚮 Placeholder | 鍔ㄤ綔鎻愮ず鍖呭惈 placeholder | 寰呮墽琛?|
| NavigationAndLayout_MultiStackOps_001 | 鏍堟搷浣?| 璇︽儏鈫扨op鈫扲emove | 杩斿洖涓婚〉锛屽姩浣滄彁绀哄寘鍚?remove | 寰呮墽琛?|
| NavigationAndLayout_MultiDeepStack_001 | 澶氬眰璇︽儏鏍?| 璇︽儏椤佃繛缁笅閽诲啀杩斿洖 | 渚濇灞曠ず Detail 2 / Alpha item | 寰呮墽琛?|
| NavigationAndLayout_MultiHomeStack_001 | 杩斿洖涓婚〉绛栫暐 | 澶氬眰璇︽儏鍚庣偣鍑?Home | 鍥炲埌涓婚〉锛屽姩浣滃惈 popToIndex | 寰呮墽琛?|
| NavigationAndLayout_StackPushReplace_001 | 鏍?push/replace 閲嶈浇 | 閫愰」鐐瑰嚮 pushPath(options)銆乺eplacePath銆乺eplacePathByName | 鏃ュ織渚濇鍚搴旀柟娉曟爣璁?| 寰呮墽琛?|
| NavigationAndLayout_StackRemovePop_001 | 鏍堢Щ闄?鍥為€€ | removeByIndexes銆乸op(result)銆乸opToName銆乸opToIndex(result) | 鏃ュ織鍚搴旂粨鏋?| 寰呮墽琛?|
| NavigationAndLayout_StackQuery_001 | 鏍堟煡璇?| getAllPathName/getParamByIndex/getParamByName/getIndexByName | 鏃ュ織鍚?query size=銆乸aram=true | 寰呮墽琛?|
| NavigationAndLayout_StackAdjust_001 | 鏍堣皟鏁?| moveIndexToTop銆乧lear | 鏃ュ織鍚?moveIndexToTop銆乧lear size=0 | 寰呮墽琛?|
| NavigationAndLayout_StackLayout_001 | 鏍堝竷灞€鑳藉姏 | disableAnimation銆乻witchFullScreenState銆乻etHomeWidthRange銆乲eepBottomPage銆乻etPlaceholderPage | 鏃ュ織鍚叏閮ㄦ柟娉曟爣璁?| 寰呮墽琛?|
| NavigationAndLayout_SplitContent_001 | SplitLayout 瀹瑰櫒 | 杩涘叆绀轰緥 | 瀹瑰櫒鍐呭鍖呭惈 responsive | 寰呮墽琛?|
| NavigationAndLayout_SplitBreakpoint_001 | SplitLayout 鏂偣 | 杩涘叆绀轰緥 | 鏂偣涓庢爮鏁版枃鏈纭?| 寰呮墽琛?|
| NavigationAndLayout_SplitPreview_001 | 涓夋。瀹藉害棰勮 | 杩涘叆绀轰緥 | 500/700/1000vp 棰勮鍧囧瓨鍦?| 寰呮墽琛?|
| NavigationAndLayout_SplitOptional_001 | 鍙€夋枃鏈垏鎹?| 鍒囨崲鍙€夋枃鏈?| 鐘舵€?full text 鈫?primary only | 寰呮墽琛?|
| NavigationAndLayout_FoldReal_001 | FoldSplit 鐪熷疄瀹瑰櫒 | 杩涘叆绀轰緥 | 鐪熷疄瀹瑰櫒瀛樺湪锛岀姸鎬佹枃鏈惈 foldable= | 寰呮墽琛?|
| NavigationAndLayout_FoldSimFolded_001 | 妯℃嫙鎶樺彔鎬?| 鍒囨姌鍙犳€?| 妯″紡鏂囨湰鍚?folded锛岄瑙堝尯瀛樺湪 | 寰呮墽琛?|
| NavigationAndLayout_FoldSimHover_001 | 妯℃嫙鎮仠鎬?| 鍒囨偓鍋滄€?| 妯″紡鏂囨湰鍚?hover | 寰呮墽琛?|
| NavigationAndLayout_FoldSimExpanded_001 | 妯℃嫙灞曞紑鎬?| 鍒囧睍寮€鎬?| 妯″紡鏂囨湰鍚?expanded | 寰呮墽琛?|
| NavigationAndLayout_FoldConfig_001 | 甯冨眬鍙傛暟閰嶇疆 | 閫?3V2/Bottom/寮€鍚姩鐢?| 閰嶇疆鏂囨湰鍚?3V2銆丅OTTOM銆乤nimation=true | 寰呮墽琛?|
| NavigationAndLayout_FoldRatioPosition_001 | 1V1 + TOP 閰嶇疆 | 閫?1V1/Top | 閰嶇疆鏂囨湰鍚?1V1銆乀OP | 寰呮墽琛?|
| NavigationAndLayout_FoldAdvanced_001 | 鎶樺彔楂樼骇鍙傛暟 | 鍒?Perp/HoverExtra/2V3/Extra 寮€鍏?| 閰嶇疆鍚?perp=true銆乻howExtra=true銆乫oldedRatio=2V3銆乪xtra=false | 寰呮墽琛?|
| NavigationAndLayout_HspPage_001 | HSP 椤甸潰 | 杩涘叆绀轰緥 | 鏍囬涓庝袱涓寜閽彲瑙?| 寰呮墽琛?|
| NavigationAndLayout_HspLocalFallback_001 | HSP 鏈湴鍏滃簳 | 鐐瑰嚮鏈湴鍏滃簳椤?| 鍏滃簳椤靛睍绀猴紝鏍堝惈 LocalFallback锛屽彲杩斿洖 | 寰呮墽琛?|
| NavigationAndLayout_HspPush_001 | HSP 鍔ㄦ€佸姞杞?| 鐐瑰嚮浠?HSP 鎵撳紑 | 鎻愮ず HSP 鎴愬姛鎴栧け璐ワ紝澶辫触鑷姩鍏滃簳 | 寰呮墽琛?|
| NavigationAndLayout_HspPushByName_001 | HSP 鎸夊悕璺宠浆 | 鐐瑰嚮 Push HSP page by name | 鎻愮ず HSP 鎴愬姛鎴栧け璐ュ苟鍏滃簳 | 寰呮墽琛?|
| NavigationAndLayout_HspReplace_001 | HSP 鏇挎崲椤甸潰 | 鐐瑰嚮 Replace with HSP page | 鎻愮ず HSP 鎴愬姛鎴栧け璐ュ苟鍏滃簳 | 寰呮墽琛?|
| NavigationAndLayout_HspDestination_001 | HSP pushDestination | 鐐瑰嚮 Push HSP destination | 鎻愮ず HSP 鎴愬姛鎴栧け璐ュ苟鍏滃簳 | 寰呮墽琛?|
| NavigationAndLayout_HspDestinationByName_001 | HSP destinationByName | 鐐瑰嚮 Push HSP destination by name | 鎻愮ず HSP 鎴愬姛鎴栧け璐ュ苟鍏滃簳 | 寰呮墽琛?|
| NavigationAndLayout_HspReplaceByName_001 | HSP replaceByName | 鐐瑰嚮 Replace HSP by name | 鎻愮ず HSP 鎴愬姛鎴栧け璐ュ苟鍏滃簳 | 寰呮墽琛?|
| NavigationAndLayout_HspOptionsPush_001 | HSP options push | pushPath with NavigationOptions | 鎻愮ず HSP 鎴愬姛鎴栧け璐ュ苟鍏滃簳 | 寰呮墽琛?|
| NavigationAndLayout_HspOptionsReplace_001 | HSP options replace | replacePath with NavigationOptions | 鎻愮ず HSP 鎴愬姛鎴栧け璐ュ苟鍏滃簳 | 寰呮墽琛?|
| NavigationAndLayout_HspByNameOnPop_001 | HSP onPop | pushPathByName(onPop) 鍚庤繑鍥?| 鎴愬姛鏃舵彁绀哄惈 onPop锛屽け璐ュ厹搴?| 寰呮墽琛?|
| NavigationAndLayout_HspDestByNameOnPop_001 | HSP dest onPop | pushDestinationByName(onPop) 鍚庤繑鍥?| 鎴愬姛鏃舵彁绀哄惈 onPop锛屽け璐ュ厹搴?| 寰呮墽琛?|
| NavigationAndLayout_LaunchTime_001 | 鍚姩鑰楁椂锛圠2锛?| 鎷夎捣骞剁瓑寰呴椤?| 鑰楁椂 < 15s | 寰呮墽琛?|
| NavigationAndLayout_NavigationLoop_001 | 瀵艰埅绋冲畾鎬э紙L2锛?| Split/Fold 寰€杩?3 娆?| 鏃犲穿婧冿紝椤甸潰姝ｇ‘杩斿洖 | 寰呮墽琛?|
| NavigationAndLayout_LogicBreakpoint_001 | 鏂偣鍗曞厓娴嬭瘯 | 绾€昏緫 | 600/840 杈圭晫涓庢爮鏁版柇瑷€閫氳繃 | 寰呮墽琛?|
| NavigationAndLayout_LogicStack_001 | 瀵艰埅宸ュ叿鍗曞厓娴嬭瘯 | 绾€昏緫 | 绛栫暐鍚嶃€佺┖鏍?澶氶〉鏍堟憳瑕佹纭?| 寰呮墽琛?|
| NavigationAndLayout_LogicFold_001 | 鎶樺彔鐘舵€佸崟鍏冩祴璇?| 绾€昏緫 | folded/half-folded/expanded/unknown 鏄犲皠姝ｇ‘ | 寰呮墽琛?|
| NavigationAndLayout_LogicResponsive_001 | 鍝嶅簲寮忓伐鍏峰崟鍏冩祴璇?| 绾€昏緫 | 缃戞牸妯℃澘/瀹藉睆鍒ゆ柇/鎻忚堪鏂█閫氳繃 | 寰呮墽琛?|
| NavigationAndLayout_LogicFoldConfig_001 | 鎶樺彔閰嶇疆宸ュ叿鍗曞厓娴嬭瘯 | 绾€昏緫 | 姣斾緥/浣嶇疆/鎽樿鏄犲皠姝ｇ‘ | 寰呮墽琛?|
| NavigationAndLayout_LogicWindow_001 | 设备/窗口工具单元测试 | 纯逻辑 | 屏幕信息含 device=、width=，设备类型非空 | Pass（实测） |

## 瑕嗙洊鐭╅樀

| 缁村害 | 瑕嗙洊椤?| 鐢ㄤ緥 |
|---|---|---|
| 椤甸潰 | 棣栭〉銆丮ultiNavigation銆丼plitLayout銆丗oldSplit銆丠SP | 6 鏉″叆鍙ｇ敤渚?|
| MultiNavigation | 鍏ㄩ儴 push/replace/pop/remove/query/move/clear/layout API + 澶氬眰涓嬮捇 | 14 鏉?|
| SplitLayout | 瀹瑰櫒鍐呭銆佹柇鐐?鏍忔暟銆佷笁妗ｅ搴﹂瑙堛€佸彲閫夋枃鏈?| 4 鏉?|
| FoldSplitContainer | 鐪熷疄瀹瑰櫒銆佷笁鎬佹ā鎷熴€佹瘮渚?浣嶇疆/鍔ㄧ敾銆乸erp/showExtra/浜屽垎鏍?| 7 鏉?|
| NavPushPathHelper | 6 涓柟娉?+ NavigationOptions 閲嶈浇 + onPop 鍥炶皟 + 澶辫触鍏滃簳 | 12 鏉?|
| 宸ュ叿绫?| BreakpointUtils銆丗oldConfigUtils銆丯avigationUtils銆丏eviceUtils | 5 鏉￠€昏緫鍗曟祴 + entry/src/test 鏈湴鍗曟祴 |
| 闈炲姛鑳?| 鍚姩鑰楁椂銆佸鑸惊鐜?| 2 鏉?|

瑕嗙洊缁熻锛氶〉闈?5/5銆佺粍浠?4/4銆佹姌鍙犱笁鎬?3/3锛堟ā鎷燂級銆佹柇鐐硅竟鐣?5 涓€笺€丮ultiNavPathStack 鏂规硶鍏ㄨ鐩栥€丠SP 6 鏂规硶 + 閲嶈浇 + onPop銆佹姌鍙犲叏鍙傛暟銆佸搷搴斿紡宸ュ叿锛涘叡 50 鏉★紙鍙︽湁鏈湴鍗曟祴 3 鏉★級銆?
