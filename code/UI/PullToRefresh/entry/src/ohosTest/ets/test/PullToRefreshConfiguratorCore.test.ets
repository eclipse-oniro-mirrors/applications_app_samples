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
  });
}
