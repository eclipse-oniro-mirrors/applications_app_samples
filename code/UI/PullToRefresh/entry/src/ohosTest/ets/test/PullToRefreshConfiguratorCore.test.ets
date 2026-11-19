/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { PullToRefreshConfigurator } from '@ohos/pulltorefresh/index';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF814;
const TAG: string = 'PullToRefreshConfiguratorCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function newConfig(): PullToRefreshConfigurator {
  return new PullToRefreshConfigurator();
}

export default function pullToRefreshConfiguratorCoreTest(): void {
  describe('PullToRefreshConfiguratorCoreTest', () => {
    // ============================ 默认值 0101-0121 ============================
    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0101
     * @tc.name      testConfigurator0101
     * @tc.desc      Verify default hasRefresh is true and keeps boolean type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0101 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const value: boolean | undefined = config.getHasRefresh();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=true`);
      expect(value).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='boolean'`);
      expect(typeof value).assertEqual('boolean');
      log('testConfigurator0101 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0102
     * @tc.name      testConfigurator0102
     * @tc.desc      Verify default hasLoadMore is true and keeps boolean type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0102 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const value: boolean | undefined = config.getHasLoadMore();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=true`);
      expect(value).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='boolean'`);
      expect(typeof value).assertEqual('boolean');
      log('testConfigurator0102 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0103
     * @tc.name      testConfigurator0103
     * @tc.desc      Verify default listIsPlacement is true and keeps boolean type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0103 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const value: boolean | undefined = config.getListIsPlacement();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=true`);
      expect(value).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='boolean'`);
      expect(typeof value).assertEqual('boolean');
      log('testConfigurator0103 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0104
     * @tc.name      testConfigurator0104
     * @tc.desc      Verify default maxTranslate is 100 and keeps number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0104 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const value: number | undefined = config.getMaxTranslate();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=100`);
      expect(value).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testConfigurator0104 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0105
     * @tc.name      testConfigurator0105
     * @tc.desc      Verify default sensitivity is 0.7 and keeps number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0105 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const value: number | undefined = config.getSensitivity();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=0.7`);
      expect(value).assertEqual(0.7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testConfigurator0105 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0106
     * @tc.name      testConfigurator0106
     * @tc.desc      Verify default animDuration is 150 and keeps number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0106 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const value: number | undefined = config.getAnimDuration();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=150`);
      expect(value).assertEqual(150);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testConfigurator0106 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0107
     * @tc.name      testConfigurator0107
     * @tc.desc      Verify default refreshHeight is 30 and keeps number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0107 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const value: number = config.getRefreshHeight();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=30`);
      expect(value).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testConfigurator0107 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0108
     * @tc.name      testConfigurator0108
     * @tc.desc      Verify derived refreshWidth equals refreshHeight times 4 over 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0108 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const value: number = config.getRefreshWidth();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=40`);
      expect(value).assertEqual(40);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testConfigurator0108 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0109
     * @tc.name      testConfigurator0109
     * @tc.desc      Verify default refreshAnimDuration is 1000 and keeps number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0109 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const value: number | undefined = config.getRefreshAnimDuration();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=1000`);
      expect(value).assertEqual(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testConfigurator0109 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0110
     * @tc.name      testConfigurator0110
     * @tc.desc      Verify default loadImgHeight is 30 and keeps number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0110 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const value: number = config.getLoadImgHeight();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=30`);
      expect(value).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testConfigurator0110 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0111
     * @tc.name      testConfigurator0111
     * @tc.desc      Verify default refreshColor is #999999 and keeps string type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0111 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const value: string = config.getRefreshColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='#999999'`);
      expect(value).assertEqual('#999999');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testConfigurator0111 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0112
     * @tc.name      testConfigurator0112
     * @tc.desc      Verify default refreshBackgroundColor is transparent rgba string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0112 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const value: ResourceColor = config.getRefreshBackgroundColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='rgba(0,0,0,0)'`);
      expect(value).assertEqual('rgba(0,0,0,0)');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testConfigurator0112 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0113
     * @tc.name      testConfigurator0113
     * @tc.desc      Verify default refreshTextColor is #999999 and keeps string type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0113 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const value: ResourceColor = config.getRefreshTextColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='#999999'`);
      expect(value).assertEqual('#999999');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testConfigurator0113 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0114
     * @tc.name      testConfigurator0114
     * @tc.desc      Verify default refreshTextSize is numeric 18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0114 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const value: number | string | Resource = config.getRefreshTextSize();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=18`);
      expect(value).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testConfigurator0114 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0115
     * @tc.name      testConfigurator0115
     * @tc.desc      Verify default loadBackgroundColor is transparent rgba string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0115 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const value: ResourceColor = config.getLoadBackgroundColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='rgba(0,0,0,0)'`);
      expect(value).assertEqual('rgba(0,0,0,0)');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testConfigurator0115 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0116
     * @tc.name      testConfigurator0116
     * @tc.desc      Verify default loadTextColor is #999999 and keeps string type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0116 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const value: ResourceColor = config.getLoadTextColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='#999999'`);
      expect(value).assertEqual('#999999');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testConfigurator0116 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0117
     * @tc.name      testConfigurator0117
     * @tc.desc      Verify default loadTextSize is numeric 18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0117 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const value: number | string | Resource = config.getLoadTextSize();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=18`);
      expect(value).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testConfigurator0117 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0118
     * @tc.name      testConfigurator0118
     * @tc.desc      Verify default loadTextPullUp1 is the pull-up phase one text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0118 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const value: string | undefined = config.getLoadTextPullUp1();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='正在上拉刷新...'`);
      expect(value).assertEqual('正在上拉刷新...');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testConfigurator0118 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0119
     * @tc.name      testConfigurator0119
     * @tc.desc      Verify default loadTextPullUp2 is the pull-up phase two text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0119 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const value: string | undefined = config.getLoadTextPullUp2();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='放开刷新'`);
      expect(value).assertEqual('放开刷新');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testConfigurator0119 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0120
     * @tc.name      testConfigurator0120
     * @tc.desc      Verify default loadTextLoading is the loading text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0120 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const value: string = config.getLoadTextLoading();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='正在玩命加载中...'`);
      expect(value).assertEqual('正在玩命加载中...');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testConfigurator0120 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0121
     * @tc.name      testConfigurator0121
     * @tc.desc      Verify two fresh configurator instances are independent objects.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0121 begin');
      const first: PullToRefreshConfigurator = newConfig();
      const second: PullToRefreshConfigurator = newConfig();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first === second=${first === second}, expected=false`);
      expect(first === second).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.getMaxTranslate()=${first.getMaxTranslate()}`);
      expect(first.getMaxTranslate()).assertEqual(second.getMaxTranslate());
      log('testConfigurator0121 end');
    })

    // ============================ boolean 读写 0122-0133 ============================
    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0122
     * @tc.name      testConfigurator0122
     * @tc.desc      Verify setHasRefresh(false) round-trips through getHasRefresh.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0122 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setHasRefresh(false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getHasRefresh()=${config.getHasRefresh()}`);
      expect(config.getHasRefresh()).assertEqual(false);
      log('testConfigurator0122 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0123
     * @tc.name      testConfigurator0123
     * @tc.desc      Verify setHasRefresh(true) restores the default behavior.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0123 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setHasRefresh(false);
      config.setHasRefresh(true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getHasRefresh()=${config.getHasRefresh()}`);
      expect(config.getHasRefresh()).assertEqual(true);
      log('testConfigurator0123 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0124
     * @tc.name      testConfigurator0124
     * @tc.desc      Verify setHasRefresh returns the same instance for chaining.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0124 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const chained: PullToRefreshConfigurator = config.setHasRefresh(false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual chained === config=${chained === config}, expected=true`);
      expect(chained === config).assertEqual(true);
      log('testConfigurator0124 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0125
     * @tc.name      testConfigurator0125
     * @tc.desc      Verify hasRefresh keeps boolean type after being set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0125 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setHasRefresh(false);
      const value: boolean | undefined = config.getHasRefresh();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='boolean'`);
      expect(typeof value).assertEqual('boolean');
      log('testConfigurator0125 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0126
     * @tc.name      testConfigurator0126
     * @tc.desc      Verify setHasLoadMore(false) round-trips through getHasLoadMore.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0126 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setHasLoadMore(false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getHasLoadMore()=${config.getHasLoadMore()}`);
      expect(config.getHasLoadMore()).assertEqual(false);
      log('testConfigurator0126 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0127
     * @tc.name      testConfigurator0127
     * @tc.desc      Verify setHasLoadMore(true) restores the default behavior.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0127 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setHasLoadMore(false);
      config.setHasLoadMore(true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getHasLoadMore()=${config.getHasLoadMore()}`);
      expect(config.getHasLoadMore()).assertEqual(true);
      log('testConfigurator0127 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0128
     * @tc.name      testConfigurator0128
     * @tc.desc      Verify setHasLoadMore returns the same instance for chaining.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0128 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const chained: PullToRefreshConfigurator = config.setHasLoadMore(false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual chained === config=${chained === config}, expected=true`);
      expect(chained === config).assertEqual(true);
      log('testConfigurator0128 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0129
     * @tc.name      testConfigurator0129
     * @tc.desc      Verify hasLoadMore keeps boolean type after being set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0129 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setHasLoadMore(false);
      const value: boolean | undefined = config.getHasLoadMore();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='boolean'`);
      expect(typeof value).assertEqual('boolean');
      log('testConfigurator0129 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0130
     * @tc.name      testConfigurator0130
     * @tc.desc      Verify setListIsPlacement(false) round-trips through getter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0130 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setListIsPlacement(false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getListIsPlacement()=${config.getListIsPlacement()}`);
      expect(config.getListIsPlacement()).assertEqual(false);
      log('testConfigurator0130 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0131
     * @tc.name      testConfigurator0131
     * @tc.desc      Verify setListIsPlacement(true) restores the default behavior.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0131 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setListIsPlacement(false);
      config.setListIsPlacement(true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getListIsPlacement()=${config.getListIsPlacement()}`);
      expect(config.getListIsPlacement()).assertEqual(true);
      log('testConfigurator0131 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0132
     * @tc.name      testConfigurator0132
     * @tc.desc      Verify setListIsPlacement returns the same instance for chaining.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0132 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const chained: PullToRefreshConfigurator = config.setListIsPlacement(false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual chained === config=${chained === config}, expected=true`);
      expect(chained === config).assertEqual(true);
      log('testConfigurator0132 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0133
     * @tc.name      testConfigurator0133
     * @tc.desc      Verify listIsPlacement keeps boolean type after being set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0133 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setListIsPlacement(false);
      const value: boolean | undefined = config.getListIsPlacement();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='boolean'`);
      expect(typeof value).assertEqual('boolean');
      log('testConfigurator0133 end');
    })

    // ============================ number 读写 0134-0163 ============================
    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0134
     * @tc.name      testConfigurator0134
     * @tc.desc      Verify setMaxTranslate(200) round-trips through getter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0134 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setMaxTranslate(200);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getMaxTranslate()=${config.getMaxTranslate()}`);
      expect(config.getMaxTranslate()).assertEqual(200);
      log('testConfigurator0134 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0135
     * @tc.name      testConfigurator0135
     * @tc.desc      Verify setMaxTranslate accepts negative values verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0135 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setMaxTranslate(-50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getMaxTranslate()=${config.getMaxTranslate()}`);
      expect(config.getMaxTranslate()).assertEqual(-50);
      log('testConfigurator0135 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0136
     * @tc.name      testConfigurator0136
     * @tc.desc      Verify setMaxTranslate returns the same instance for chaining.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0136 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const chained: PullToRefreshConfigurator = config.setMaxTranslate(200);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual chained === config=${chained === config}, expected=true`);
      expect(chained === config).assertEqual(true);
      log('testConfigurator0136 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0137
     * @tc.name      testConfigurator0137
     * @tc.desc      Verify maxTranslate keeps number type after being set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0137 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setMaxTranslate(200);
      const value: number | undefined = config.getMaxTranslate();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testConfigurator0137 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0138
     * @tc.name      testConfigurator0138
     * @tc.desc      Verify setMaxTranslate(0) round-trips through getter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0138 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setMaxTranslate(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getMaxTranslate()=${config.getMaxTranslate()}`);
      expect(config.getMaxTranslate()).assertEqual(0);
      log('testConfigurator0138 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0139
     * @tc.name      testConfigurator0139
     * @tc.desc      Verify setSensitivity(0.5) round-trips through getter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0139 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setSensitivity(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getSensitivity()=${config.getSensitivity()}`);
      expect(config.getSensitivity()).assertEqual(0.5);
      log('testConfigurator0139 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0140
     * @tc.name      testConfigurator0140
     * @tc.desc      Verify setSensitivity accepts values above one verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0140 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setSensitivity(1.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getSensitivity()=${config.getSensitivity()}`);
      expect(config.getSensitivity()).assertEqual(1.5);
      log('testConfigurator0140 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0141
     * @tc.name      testConfigurator0141
     * @tc.desc      Verify setSensitivity returns the same instance for chaining.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0141 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const chained: PullToRefreshConfigurator = config.setSensitivity(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual chained === config=${chained === config}, expected=true`);
      expect(chained === config).assertEqual(true);
      log('testConfigurator0141 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0142
     * @tc.name      testConfigurator0142
     * @tc.desc      Verify sensitivity keeps number type after being set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0142 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setSensitivity(0.5);
      const value: number | undefined = config.getSensitivity();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testConfigurator0142 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0143
     * @tc.name      testConfigurator0143
     * @tc.desc      Verify setSensitivity(0) round-trips through getter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0143 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setSensitivity(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getSensitivity()=${config.getSensitivity()}`);
      expect(config.getSensitivity()).assertEqual(0);
      log('testConfigurator0143 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0144
     * @tc.name      testConfigurator0144
     * @tc.desc      Verify setAnimDuration(300) round-trips through getter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0144 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setAnimDuration(300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getAnimDuration()=${config.getAnimDuration()}`);
      expect(config.getAnimDuration()).assertEqual(300);
      log('testConfigurator0144 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0145
     * @tc.name      testConfigurator0145
     * @tc.desc      Verify setAnimDuration(0) round-trips through getter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0145 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setAnimDuration(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getAnimDuration()=${config.getAnimDuration()}`);
      expect(config.getAnimDuration()).assertEqual(0);
      log('testConfigurator0145 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0146
     * @tc.name      testConfigurator0146
     * @tc.desc      Verify setAnimDuration returns the same instance for chaining.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0146 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const chained: PullToRefreshConfigurator = config.setAnimDuration(300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual chained === config=${chained === config}, expected=true`);
      expect(chained === config).assertEqual(true);
      log('testConfigurator0146 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0147
     * @tc.name      testConfigurator0147
     * @tc.desc      Verify animDuration keeps number type after being set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0147 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setAnimDuration(300);
      const value: number | undefined = config.getAnimDuration();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testConfigurator0147 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0148
     * @tc.name      testConfigurator0148
     * @tc.desc      Verify setAnimDuration accepts large values verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0148 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setAnimDuration(5000);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getAnimDuration()=${config.getAnimDuration()}`);
      expect(config.getAnimDuration()).assertEqual(5000);
      log('testConfigurator0148 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0149
     * @tc.name      testConfigurator0149
     * @tc.desc      Verify setRefreshAnimDuration(2000) round-trips through getter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0149 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setRefreshAnimDuration(2000);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${config.getRefreshAnimDuration()}, expected=2000`);
      expect(config.getRefreshAnimDuration()).assertEqual(2000);
      log('testConfigurator0149 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0150
     * @tc.name      testConfigurator0150
     * @tc.desc      Verify setRefreshAnimDuration(0) round-trips through getter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0150 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setRefreshAnimDuration(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${config.getRefreshAnimDuration()}, expected=0`);
      expect(config.getRefreshAnimDuration()).assertEqual(0);
      log('testConfigurator0150 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0151
     * @tc.name      testConfigurator0151
     * @tc.desc      Verify setRefreshAnimDuration returns the same instance for chaining.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0151 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const chained: PullToRefreshConfigurator = config.setRefreshAnimDuration(2000);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual chained === config=${chained === config}, expected=true`);
      expect(chained === config).assertEqual(true);
      log('testConfigurator0151 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0152
     * @tc.name      testConfigurator0152
     * @tc.desc      Verify refreshAnimDuration keeps number type after being set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0152 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setRefreshAnimDuration(2000);
      const value: number | undefined = config.getRefreshAnimDuration();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testConfigurator0152 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0153
     * @tc.name      testConfigurator0153
     * @tc.desc      Verify setRefreshAnimDuration accepts prime values verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0153 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setRefreshAnimDuration(999);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${config.getRefreshAnimDuration()}, expected=999`);
      expect(config.getRefreshAnimDuration()).assertEqual(999);
      log('testConfigurator0153 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0154
     * @tc.name      testConfigurator0154
     * @tc.desc      Verify setRefreshHeight(60) round-trips through getter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0154 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setRefreshHeight(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getRefreshHeight()=${config.getRefreshHeight()}`);
      expect(config.getRefreshHeight()).assertEqual(60);
      log('testConfigurator0154 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0155
     * @tc.name      testConfigurator0155
     * @tc.desc      Verify setRefreshHeight(0) round-trips through getter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0155 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setRefreshHeight(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getRefreshHeight()=${config.getRefreshHeight()}`);
      expect(config.getRefreshHeight()).assertEqual(0);
      log('testConfigurator0155 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0156
     * @tc.name      testConfigurator0156
     * @tc.desc      Verify setRefreshHeight returns the same instance for chaining.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0156 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const chained: PullToRefreshConfigurator = config.setRefreshHeight(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual chained === config=${chained === config}, expected=true`);
      expect(chained === config).assertEqual(true);
      log('testConfigurator0156 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0157
     * @tc.name      testConfigurator0157
     * @tc.desc      Verify refreshHeight keeps number type after being set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0157 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setRefreshHeight(60);
      const value: number = config.getRefreshHeight();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testConfigurator0157 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0158
     * @tc.name      testConfigurator0158
     * @tc.desc      Verify setRefreshHeight accepts fractional values verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0158 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setRefreshHeight(12.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getRefreshHeight()=${config.getRefreshHeight()}`);
      expect(config.getRefreshHeight()).assertEqual(12.5);
      log('testConfigurator0158 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0159
     * @tc.name      testConfigurator0159
     * @tc.desc      Verify setLoadImgHeight(45) round-trips through getter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0159 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setLoadImgHeight(45);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getLoadImgHeight()=${config.getLoadImgHeight()}`);
      expect(config.getLoadImgHeight()).assertEqual(45);
      log('testConfigurator0159 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0160
     * @tc.name      testConfigurator0160
     * @tc.desc      Verify setLoadImgHeight(0) round-trips through getter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0160 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setLoadImgHeight(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getLoadImgHeight()=${config.getLoadImgHeight()}`);
      expect(config.getLoadImgHeight()).assertEqual(0);
      log('testConfigurator0160 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0161
     * @tc.name      testConfigurator0161
     * @tc.desc      Verify setLoadImgHeight returns the same instance for chaining.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0161 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const chained: PullToRefreshConfigurator = config.setLoadImgHeight(45);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual chained === config=${chained === config}, expected=true`);
      expect(chained === config).assertEqual(true);
      log('testConfigurator0161 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0162
     * @tc.name      testConfigurator0162
     * @tc.desc      Verify loadImgHeight keeps number type after being set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0162 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setLoadImgHeight(45);
      const value: number = config.getLoadImgHeight();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testConfigurator0162 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0163
     * @tc.name      testConfigurator0163
     * @tc.desc      Verify setLoadImgHeight accepts fractional values verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0163 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setLoadImgHeight(99.9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getLoadImgHeight()=${config.getLoadImgHeight()}`);
      expect(config.getLoadImgHeight()).assertEqual(99.9);
      log('testConfigurator0163 end');
    })

    // ============================ 派生 getRefreshWidth 0164-0167 ============================
    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0164
     * @tc.name      testConfigurator0164
     * @tc.desc      Verify refreshWidth derives to 80 after setting height 60.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0164 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setRefreshHeight(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getRefreshWidth()=${config.getRefreshWidth()}`);
      expect(config.getRefreshWidth()).assertEqual(80);
      log('testConfigurator0164 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0165
     * @tc.name      testConfigurator0165
     * @tc.desc      Verify refreshWidth derives to 120 after setting height 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0165 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setRefreshHeight(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getRefreshWidth()=${config.getRefreshWidth()}`);
      expect(config.getRefreshWidth()).assertEqual(120);
      log('testConfigurator0165 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0166
     * @tc.name      testConfigurator0166
     * @tc.desc      Verify refreshWidth derives to zero after setting height zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0166 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setRefreshHeight(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getRefreshWidth()=${config.getRefreshWidth()}`);
      expect(config.getRefreshWidth()).assertEqual(0);
      log('testConfigurator0166 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0167
     * @tc.name      testConfigurator0167
     * @tc.desc      Verify refreshWidth derives to 60 after setting height 45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0167 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setRefreshHeight(45);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getRefreshWidth()=${config.getRefreshWidth()}`);
      expect(config.getRefreshWidth()).assertEqual(60);
      log('testConfigurator0167 end');
    })

    // ============================ 颜色读写 0168-0187 ============================
    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0168
     * @tc.name      testConfigurator0168
     * @tc.desc      Verify setRefreshColor(#FF0000) round-trips through getter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0168 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setRefreshColor('#FF0000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getRefreshColor()=${config.getRefreshColor()}`);
      expect(config.getRefreshColor()).assertEqual('#FF0000');
      log('testConfigurator0168 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0169
     * @tc.name      testConfigurator0169
     * @tc.desc      Verify setRefreshColor accepts rgba strings verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0169 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setRefreshColor('rgba(1,2,3,0.5)');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getRefreshColor()=${config.getRefreshColor()}`);
      expect(config.getRefreshColor()).assertEqual('rgba(1,2,3,0.5)');
      log('testConfigurator0169 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0170
     * @tc.name      testConfigurator0170
     * @tc.desc      Verify setRefreshColor returns the same instance for chaining.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0170 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const chained: PullToRefreshConfigurator = config.setRefreshColor('#FF0000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual chained === config=${chained === config}, expected=true`);
      expect(chained === config).assertEqual(true);
      log('testConfigurator0170 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0171
     * @tc.name      testConfigurator0171
     * @tc.desc      Verify refreshColor keeps string type after being set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0171 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setRefreshColor('#FF0000');
      const value: string = config.getRefreshColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testConfigurator0171 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0172
     * @tc.name      testConfigurator0172
     * @tc.desc      Verify setRefreshTextColor accepts hex strings verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0172 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setRefreshTextColor('#00FF00');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getRefreshTextColor()=${config.getRefreshTextColor()}`);
      expect(config.getRefreshTextColor()).assertEqual('#00FF00');
      log('testConfigurator0172 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0173
     * @tc.name      testConfigurator0173
     * @tc.desc      Verify setRefreshTextColor accepts numeric color values verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0173 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setRefreshTextColor(0x112233);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getRefreshTextColor()=${config.getRefreshTextColor()}`);
      expect(config.getRefreshTextColor()).assertEqual(0x112233);
      log('testConfigurator0173 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0174
     * @tc.name      testConfigurator0174
     * @tc.desc      Verify setRefreshTextColor returns the same instance for chaining.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0174 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const chained: PullToRefreshConfigurator = config.setRefreshTextColor('#00FF00');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual chained === config=${chained === config}, expected=true`);
      expect(chained === config).assertEqual(true);
      log('testConfigurator0174 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0175
     * @tc.name      testConfigurator0175
     * @tc.desc      Verify refreshTextColor keeps number type after numeric set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0175 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setRefreshTextColor(0x112233);
      const value: ResourceColor = config.getRefreshTextColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testConfigurator0175 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0176
     * @tc.name      testConfigurator0176
     * @tc.desc      Verify setRefreshBackgroundColor accepts hex strings verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0176 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setRefreshBackgroundColor('#0000FF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${config.getRefreshBackgroundColor()}`);
      expect(config.getRefreshBackgroundColor()).assertEqual('#0000FF');
      log('testConfigurator0176 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0177
     * @tc.name      testConfigurator0177
     * @tc.desc      Verify setRefreshBackgroundColor accepts numeric values verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0177 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setRefreshBackgroundColor(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${config.getRefreshBackgroundColor()}, expected=255`);
      expect(config.getRefreshBackgroundColor()).assertEqual(255);
      log('testConfigurator0177 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0178
     * @tc.name      testConfigurator0178
     * @tc.desc      Verify setRefreshBackgroundColor returns the same instance for chaining.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0178 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const chained: PullToRefreshConfigurator = config.setRefreshBackgroundColor('#0000FF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual chained === config=${chained === config}, expected=true`);
      expect(chained === config).assertEqual(true);
      log('testConfigurator0178 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0179
     * @tc.name      testConfigurator0179
     * @tc.desc      Verify refreshBackgroundColor keeps number type after numeric set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0179 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setRefreshBackgroundColor(255);
      const value: ResourceColor = config.getRefreshBackgroundColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testConfigurator0179 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0180
     * @tc.name      testConfigurator0180
     * @tc.desc      Verify setLoadTextColor accepts hex strings verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0180 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setLoadTextColor('#ABCDEF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getLoadTextColor()=${config.getLoadTextColor()}`);
      expect(config.getLoadTextColor()).assertEqual('#ABCDEF');
      log('testConfigurator0180 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0181
     * @tc.name      testConfigurator0181
     * @tc.desc      Verify setLoadTextColor accepts numeric values verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0181 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setLoadTextColor(0x000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getLoadTextColor()=${config.getLoadTextColor()}`);
      expect(config.getLoadTextColor()).assertEqual(0x000000);
      log('testConfigurator0181 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0182
     * @tc.name      testConfigurator0182
     * @tc.desc      Verify setLoadTextColor returns the same instance for chaining.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0182 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const chained: PullToRefreshConfigurator = config.setLoadTextColor('#ABCDEF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual chained === config=${chained === config}, expected=true`);
      expect(chained === config).assertEqual(true);
      log('testConfigurator0182 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0183
     * @tc.name      testConfigurator0183
     * @tc.desc      Verify loadTextColor keeps number type after numeric set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0183 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setLoadTextColor(0x000000);
      const value: ResourceColor = config.getLoadTextColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testConfigurator0183 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0184
     * @tc.name      testConfigurator0184
     * @tc.desc      Verify setLoadBackgroundColor accepts rgba strings verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0184 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setLoadBackgroundColor('rgba(9,9,9,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${config.getLoadBackgroundColor()}`);
      expect(config.getLoadBackgroundColor()).assertEqual('rgba(9,9,9,1)');
      log('testConfigurator0184 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0185
     * @tc.name      testConfigurator0185
     * @tc.desc      Verify setLoadBackgroundColor accepts numeric values verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0185 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setLoadBackgroundColor(12345);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${config.getLoadBackgroundColor()}, expected=12345`);
      expect(config.getLoadBackgroundColor()).assertEqual(12345);
      log('testConfigurator0185 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0186
     * @tc.name      testConfigurator0186
     * @tc.desc      Verify setLoadBackgroundColor returns the same instance for chaining.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0186 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const chained: PullToRefreshConfigurator = config.setLoadBackgroundColor(12345);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual chained === config=${chained === config}, expected=true`);
      expect(chained === config).assertEqual(true);
      log('testConfigurator0186 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0187
     * @tc.name      testConfigurator0187
     * @tc.desc      Verify loadBackgroundColor keeps number type after numeric set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0187 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setLoadBackgroundColor(12345);
      const value: ResourceColor = config.getLoadBackgroundColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testConfigurator0187 end');
    })

    // ============================ 字号联合类型 0188-0195 ============================
    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0188
     * @tc.name      testConfigurator0188
     * @tc.desc      Verify setRefreshTextSize accepts vp strings verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0188 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setRefreshTextSize('20vp');
      const value: number | string | Resource = config.getRefreshTextSize();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='20vp'`);
      expect(value).assertEqual('20vp');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testConfigurator0188 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0189
     * @tc.name      testConfigurator0189
     * @tc.desc      Verify setRefreshTextSize accepts numbers verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0189 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setRefreshTextSize(24);
      const value: number | string | Resource = config.getRefreshTextSize();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=24`);
      expect(value).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testConfigurator0189 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0190
     * @tc.name      testConfigurator0190
     * @tc.desc      Verify setRefreshTextSize returns the same instance for chaining.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0190 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const chained: PullToRefreshConfigurator = config.setRefreshTextSize(24);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual chained === config=${chained === config}, expected=true`);
      expect(chained === config).assertEqual(true);
      log('testConfigurator0190 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0191
     * @tc.name      testConfigurator0191
     * @tc.desc      Verify setRefreshTextSize accepts percentage strings verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0191 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setRefreshTextSize('50%');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getRefreshTextSize()=${config.getRefreshTextSize()}`);
      expect(config.getRefreshTextSize()).assertEqual('50%');
      log('testConfigurator0191 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0192
     * @tc.name      testConfigurator0192
     * @tc.desc      Verify setLoadTextSize accepts vp strings verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0192 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setLoadTextSize('20vp');
      const value: number | string | Resource = config.getLoadTextSize();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='20vp'`);
      expect(value).assertEqual('20vp');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testConfigurator0192 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0193
     * @tc.name      testConfigurator0193
     * @tc.desc      Verify setLoadTextSize accepts numbers verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0193 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setLoadTextSize(24);
      const value: number | string | Resource = config.getLoadTextSize();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=24`);
      expect(value).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testConfigurator0193 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0194
     * @tc.name      testConfigurator0194
     * @tc.desc      Verify setLoadTextSize returns the same instance for chaining.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0194 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const chained: PullToRefreshConfigurator = config.setLoadTextSize(24);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual chained === config=${chained === config}, expected=true`);
      expect(chained === config).assertEqual(true);
      log('testConfigurator0194 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0195
     * @tc.name      testConfigurator0195
     * @tc.desc      Verify setLoadTextSize accepts percentage strings verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0195 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setLoadTextSize('30%');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getLoadTextSize()=${config.getLoadTextSize()}`);
      expect(config.getLoadTextSize()).assertEqual('30%');
      log('testConfigurator0195 end');
    })

    // ============================ 文本属性 0196-0204 ============================
    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0196
     * @tc.name      testConfigurator0196
     * @tc.desc      Verify setLoadTextPullUp1 round-trips custom text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0196 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setLoadTextPullUp1('custom up1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getLoadTextPullUp1()=${config.getLoadTextPullUp1()}`);
      expect(config.getLoadTextPullUp1()).assertEqual('custom up1');
      log('testConfigurator0196 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0197
     * @tc.name      testConfigurator0197
     * @tc.desc      Verify setLoadTextPullUp1 accepts empty strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0197 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setLoadTextPullUp1('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getLoadTextPullUp1()=${config.getLoadTextPullUp1()}`);
      expect(config.getLoadTextPullUp1()).assertEqual('');
      log('testConfigurator0197 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0198
     * @tc.name      testConfigurator0198
     * @tc.desc      Verify setLoadTextPullUp1 returns the same instance for chaining.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0198 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const chained: PullToRefreshConfigurator = config.setLoadTextPullUp1('custom up1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual chained === config=${chained === config}, expected=true`);
      expect(chained === config).assertEqual(true);
      log('testConfigurator0198 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0199
     * @tc.name      testConfigurator0199
     * @tc.desc      Verify setLoadTextPullUp2 round-trips custom text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0199 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setLoadTextPullUp2('custom up2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getLoadTextPullUp2()=${config.getLoadTextPullUp2()}`);
      expect(config.getLoadTextPullUp2()).assertEqual('custom up2');
      log('testConfigurator0199 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0200
     * @tc.name      testConfigurator0200
     * @tc.desc      Verify setLoadTextPullUp2 accepts empty strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0200 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setLoadTextPullUp2('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getLoadTextPullUp2()=${config.getLoadTextPullUp2()}`);
      expect(config.getLoadTextPullUp2()).assertEqual('');
      log('testConfigurator0200 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0201
     * @tc.name      testConfigurator0201
     * @tc.desc      Verify setLoadTextPullUp2 returns the same instance for chaining.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0201 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const chained: PullToRefreshConfigurator = config.setLoadTextPullUp2('custom up2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual chained === config=${chained === config}, expected=true`);
      expect(chained === config).assertEqual(true);
      log('testConfigurator0201 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0202
     * @tc.name      testConfigurator0202
     * @tc.desc      Verify setLoadTextLoading round-trips custom text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0202 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setLoadTextLoading('加载中');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getLoadTextLoading()=${config.getLoadTextLoading()}`);
      expect(config.getLoadTextLoading()).assertEqual('加载中');
      log('testConfigurator0202 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0203
     * @tc.name      testConfigurator0203
     * @tc.desc      Verify setLoadTextLoading accepts empty strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0203 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setLoadTextLoading('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getLoadTextLoading()=${config.getLoadTextLoading()}`);
      expect(config.getLoadTextLoading()).assertEqual('');
      log('testConfigurator0203 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0204
     * @tc.name      testConfigurator0204
     * @tc.desc      Verify setLoadTextLoading returns the same instance for chaining.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0204 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const chained: PullToRefreshConfigurator = config.setLoadTextLoading('加载中');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual chained === config=${chained === config}, expected=true`);
      expect(chained === config).assertEqual(true);
      log('testConfigurator0204 end');
    })

    // ============================ 边界与组合 0205-0210 ============================
    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0205
     * @tc.name      testConfigurator0205
     * @tc.desc      Verify independent properties hold values set together.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0205 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setMaxTranslate(300);
      config.setRefreshHeight(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getMaxTranslate()=${config.getMaxTranslate()}`);
      expect(config.getMaxTranslate()).assertEqual(300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getRefreshHeight()=${config.getRefreshHeight()}`);
      expect(config.getRefreshHeight()).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getSensitivity()=${config.getSensitivity()}`);
      expect(config.getSensitivity()).assertEqual(0.7);
      log('testConfigurator0205 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0206
     * @tc.name      testConfigurator0206
     * @tc.desc      Verify a full setter chain configures every property.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0206 begin');
      const config: PullToRefreshConfigurator = newConfig();
      const chained: PullToRefreshConfigurator = config
        .setHasRefresh(false)
        .setHasLoadMore(false)
        .setMaxTranslate(120)
        .setSensitivity(0.8)
        .setListIsPlacement(false)
        .setAnimDuration(250)
        .setRefreshHeight(48)
        .setRefreshColor('#123456')
        .setRefreshAnimDuration(800)
        .setLoadImgHeight(36)
        .setLoadTextSize(20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual chained === config=${chained === config}, expected=true`);
      expect(chained === config).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getHasRefresh()=${config.getHasRefresh()}`);
      expect(config.getHasRefresh()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getHasLoadMore()=${config.getHasLoadMore()}`);
      expect(config.getHasLoadMore()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getMaxTranslate()=${config.getMaxTranslate()}`);
      expect(config.getMaxTranslate()).assertEqual(120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getSensitivity()=${config.getSensitivity()}`);
      expect(config.getSensitivity()).assertEqual(0.8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getListIsPlacement()=${config.getListIsPlacement()}`);
      expect(config.getListIsPlacement()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getAnimDuration()=${config.getAnimDuration()}`);
      expect(config.getAnimDuration()).assertEqual(250);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getRefreshHeight()=${config.getRefreshHeight()}`);
      expect(config.getRefreshHeight()).assertEqual(48);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getRefreshColor()=${config.getRefreshColor()}`);
      expect(config.getRefreshColor()).assertEqual('#123456');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${config.getRefreshAnimDuration()}, expected=800`);
      expect(config.getRefreshAnimDuration()).assertEqual(800);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getLoadImgHeight()=${config.getLoadImgHeight()}`);
      expect(config.getLoadImgHeight()).assertEqual(36);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getLoadTextSize()=${config.getLoadTextSize()}`);
      expect(config.getLoadTextSize()).assertEqual(20);
      log('testConfigurator0206 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0207
     * @tc.name      testConfigurator0207
     * @tc.desc      Verify distinct instances keep independent configuration state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0207 begin');
      const first: PullToRefreshConfigurator = newConfig();
      const second: PullToRefreshConfigurator = newConfig();
      first.setMaxTranslate(500);
      second.setMaxTranslate(20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.getMaxTranslate()=${first.getMaxTranslate()}`);
      expect(first.getMaxTranslate()).assertEqual(500);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.getMaxTranslate()=${second.getMaxTranslate()}`);
      expect(second.getMaxTranslate()).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.getRefreshHeight()=${first.getRefreshHeight()}`);
      expect(first.getRefreshHeight()).assertEqual(second.getRefreshHeight());
      log('testConfigurator0207 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0208
     * @tc.name      testConfigurator0208
     * @tc.desc      Verify repeated writes make the last write win.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0208 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setHasRefresh(false);
      config.setHasRefresh(false);
      config.setHasRefresh(true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getHasRefresh()=${config.getHasRefresh()}`);
      expect(config.getHasRefresh()).assertEqual(true);
      log('testConfigurator0208 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0209
     * @tc.name      testConfigurator0209
     * @tc.desc      Verify maxTranslate accepts very large values verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0209 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setMaxTranslate(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getMaxTranslate()=${config.getMaxTranslate()}`);
      expect(config.getMaxTranslate()).assertEqual(1000000);
      log('testConfigurator0209 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_CONFIGURATOR_0210
     * @tc.name      testConfigurator0210
     * @tc.desc      Verify sensitivity accepts negative values verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigurator0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigurator0210 begin');
      const config: PullToRefreshConfigurator = newConfig();
      config.setSensitivity(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual config.getSensitivity()=${config.getSensitivity()}`);
      expect(config.getSensitivity()).assertEqual(-1);
      log('testConfigurator0210 end');
    })
  })
}
