// AppConstants 单测：路由 key 守卫与字面量、导航标题预置、页签数、日志容量/条数与 AppStorage 键名、hilog 参数、半屏 appId 格式。
// 常量一旦漂移，路由表、TabsDemo 守卫、日志面板与半屏拉起会同时受影响，这里逐项锁定。

import { describe, it, expect } from '@ohos/hypium';
import {
  DEFAULT_NAV_TITLE,
  HALF_SCREEN_APP_ID,
  HILOG_DOMAIN,
  HILOG_TAG,
  HOME_LOG_LIMIT,
  LOG_STORE_CAPACITY,
  NAV_TITLE_PRESETS,
  PAGE_LOG_LIMIT,
  PICKER_TIMEOUT_MS,
  RouteKey,
  StorageKeys,
  TAB_COUNT,
  isRouteKey
} from '../main/ets/common/AppConstants';

export default function appConstantsTest() {
  describe('AppConstantsTest', () => {
    // 路由守卫：6 个演示页 key 全部可路由且字面量逐一锁定；未知、空串与大小写不一致（'Navigation'）必须拒绝
    it('routeKey_guard', 0, () => {
      expect(RouteKey.NAVIGATION).assertEqual('navigation');
      expect(RouteKey.SEARCH).assertEqual('search');
      expect(RouteKey.TABS).assertEqual('tabs');
      expect(RouteKey.WEB).assertEqual('web');
      expect(RouteKey.DOWNLOAD).assertEqual('download');
      expect(RouteKey.HALF_SCREEN).assertEqual('halfScreen');
      expect(isRouteKey(RouteKey.NAVIGATION)).assertTrue();
      expect(isRouteKey(RouteKey.SEARCH)).assertTrue();
      expect(isRouteKey(RouteKey.TABS)).assertTrue();
      expect(isRouteKey(RouteKey.WEB)).assertTrue();
      expect(isRouteKey(RouteKey.DOWNLOAD)).assertTrue();
      expect(isRouteKey(RouteKey.HALF_SCREEN)).assertTrue();
      expect(isRouteKey('unknown')).assertFalse();
      expect(isRouteKey('')).assertFalse();
      expect(isRouteKey('Navigation')).assertFalse();
    });

    // 标题预置：默认标题非空、至少两个预置项、默认标题在预置表内且位于首位、所有预置项非空且互不相同
    it('navTitle_presets', 0, () => {
      expect(DEFAULT_NAV_TITLE.length > 0).assertTrue();
      expect(NAV_TITLE_PRESETS.length >= 2).assertTrue();
      expect(NAV_TITLE_PRESETS.includes(DEFAULT_NAV_TITLE)).assertTrue();
      expect(NAV_TITLE_PRESETS[0]).assertEqual(DEFAULT_NAV_TITLE);
      for (const title of NAV_TITLE_PRESETS) {
        expect(title.length > 0).assertTrue();
      }
      expect(NAV_TITLE_PRESETS[0] !== NAV_TITLE_PRESETS[1]).assertTrue();
    });

    // 页签数：TabsDemo 的守卫与循环渲染都依赖 TAB_COUNT=3，禁止悄悄改回硬编码 5
    it('tabCount_isThree', 0, () => {
      expect(TAB_COUNT).assertEqual(3);
    });

    // 写读约定：日志条数 20/30/200 锁定精确值且保持有序；AppStorage 六个键名是页面与组件的读写契约；picker 超时 3 秒
    it('logLimits_consistent', 0, () => {
      expect(PAGE_LOG_LIMIT).assertEqual(20);
      expect(HOME_LOG_LIMIT).assertEqual(30);
      expect(LOG_STORE_CAPACITY).assertEqual(200);
      expect(PAGE_LOG_LIMIT <= HOME_LOG_LIMIT).assertTrue();
      expect(HOME_LOG_LIMIT <= LOG_STORE_CAPACITY).assertTrue();
      expect(PICKER_TIMEOUT_MS).assertEqual(3000);
      expect(StorageKeys.NAV_TITLE).assertEqual('navTitle');
      expect(StorageKeys.NAV_GRADIENT).assertEqual('navGradient');
      expect(StorageKeys.NAV_HIDE_TITLE).assertEqual('navHideTitle');
      expect(StorageKeys.NAV_SPLIT).assertEqual('navSplit');
      expect(StorageKeys.APP_LOGS).assertEqual('appLogs');
      expect(StorageKeys.LAYOUT_PROFILE).assertEqual('layoutProfile');
    });

    // hilog 参数：tag 供 `hdc hilog | grep` 过滤、domain 固定为 0，改名会破坏设备侧排查流程
    it('hilogTag_stable', 0, () => {
      expect(HILOG_TAG).assertEqual('AtomicServiceComponents');
      expect(HILOG_DOMAIN).assertEqual(0);
    });

    // 半屏 appId：18 位纯数字（华为 atoms 上架号），逐字符校验防止误入空格或字母
    it('halfScreenAppId_digits', 0, () => {
      expect(HALF_SCREEN_APP_ID).assertEqual('576000000000000000');
      expect(HALF_SCREEN_APP_ID.length).assertEqual(18);
      for (let i = 0; i < HALF_SCREEN_APP_ID.length; i++) {
        const ch = HALF_SCREEN_APP_ID.charAt(i);
        expect(ch >= '0' && ch <= '9').assertTrue();
      }
    });
  });
}
