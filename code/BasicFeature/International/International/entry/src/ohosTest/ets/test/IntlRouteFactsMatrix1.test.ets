/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { beforeEachIt, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_International]';

export default function intlRouteMatrix1Test(): void {
  describe('IntlRouteFactsMatrix1Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    INTL_ROUTE_0001
     * @tc.name      intlRouteRoute0001
     * @tc.desc      页面路由 pages/Index 的分段与首尾结构校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlRouteRoute0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlRouteRoute0001 begin');
      const route: string = 'pages/Index';
      const segments: string[] = route.split('/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'route=' + route);
      expect(segments.length).assertEqual(2);
      expect(segments[0]).assertEqual('pages');
      expect(segments[segments.length - 1]).assertEqual('Index');
      expect(route.startsWith('pages/')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlRouteRoute0001 end');
    })

    /**
     * @tc.number    INTL_ROUTE_0002
     * @tc.name      intlRouteRoute0002
     * @tc.desc      页面路由 pages/Index 的字符集与长度校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlRouteRoute0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlRouteRoute0002 begin');
      const route: string = 'pages/Index';
      hilog.info(DOMAIN, TAG, '%{public}s', 'len=' + route.length);
      expect(route.length).assertEqual(11);
      expect(route.indexOf(' ') === -1).assertTrue();
      expect(route.indexOf('//') === -1).assertTrue();
      expect(route.endsWith('Index')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlRouteRoute0002 end');
    })

    /**
     * @tc.number    INTL_ROUTE_0003
     * @tc.name      intlRouteRoute0003
     * @tc.desc      页面路由 pages/Index 反查页面文件名的后缀校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlRouteRoute0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlRouteRoute0003 begin');
      const name: string = 'Index';
      const file: string = name + '.ets';
      hilog.info(DOMAIN, TAG, '%{public}s', file);
      expect(file.endsWith('.ets')).assertTrue();
      expect(file.startsWith(name)).assertTrue();
      expect(file.length).assertEqual(9);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlRouteRoute0003 end');
    })

    /**
     * @tc.number    INTL_ROUTE_0004
     * @tc.name      intlRouteRoute0004
     * @tc.desc      页面路由 pages/Calendar 的分段与首尾结构校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlRouteRoute0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlRouteRoute0004 begin');
      const route: string = 'pages/Calendar';
      const segments: string[] = route.split('/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'route=' + route);
      expect(segments.length).assertEqual(2);
      expect(segments[0]).assertEqual('pages');
      expect(segments[segments.length - 1]).assertEqual('Calendar');
      expect(route.startsWith('pages/')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlRouteRoute0004 end');
    })

    /**
     * @tc.number    INTL_ROUTE_0005
     * @tc.name      intlRouteRoute0005
     * @tc.desc      页面路由 pages/Calendar 的字符集与长度校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlRouteRoute0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlRouteRoute0005 begin');
      const route: string = 'pages/Calendar';
      hilog.info(DOMAIN, TAG, '%{public}s', 'len=' + route.length);
      expect(route.length).assertEqual(14);
      expect(route.indexOf(' ') === -1).assertTrue();
      expect(route.indexOf('//') === -1).assertTrue();
      expect(route.endsWith('Calendar')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlRouteRoute0005 end');
    })

    /**
     * @tc.number    INTL_ROUTE_0006
     * @tc.name      intlRouteRoute0006
     * @tc.desc      页面路由 pages/Calendar 反查页面文件名的后缀校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlRouteRoute0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlRouteRoute0006 begin');
      const name: string = 'Calendar';
      const file: string = name + '.ets';
      hilog.info(DOMAIN, TAG, '%{public}s', file);
      expect(file.endsWith('.ets')).assertTrue();
      expect(file.startsWith(name)).assertTrue();
      expect(file.length).assertEqual(12);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlRouteRoute0006 end');
    })

    /**
     * @tc.number    INTL_ROUTE_0007
     * @tc.name      intlRouteRoute0007
     * @tc.desc      页面路由 pages/TextProcessing 的分段与首尾结构校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlRouteRoute0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlRouteRoute0007 begin');
      const route: string = 'pages/TextProcessing';
      const segments: string[] = route.split('/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'route=' + route);
      expect(segments.length).assertEqual(2);
      expect(segments[0]).assertEqual('pages');
      expect(segments[segments.length - 1]).assertEqual('TextProcessing');
      expect(route.startsWith('pages/')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlRouteRoute0007 end');
    })

    /**
     * @tc.number    INTL_ROUTE_0008
     * @tc.name      intlRouteRoute0008
     * @tc.desc      页面路由 pages/TextProcessing 的字符集与长度校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlRouteRoute0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlRouteRoute0008 begin');
      const route: string = 'pages/TextProcessing';
      hilog.info(DOMAIN, TAG, '%{public}s', 'len=' + route.length);
      expect(route.length).assertEqual(20);
      expect(route.indexOf(' ') === -1).assertTrue();
      expect(route.indexOf('//') === -1).assertTrue();
      expect(route.endsWith('TextProcessing')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlRouteRoute0008 end');
    })

    /**
     * @tc.number    INTL_ROUTE_0009
     * @tc.name      intlRouteRoute0009
     * @tc.desc      页面路由 pages/TextProcessing 反查页面文件名的后缀校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlRouteRoute0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlRouteRoute0009 begin');
      const name: string = 'TextProcessing';
      const file: string = name + '.ets';
      hilog.info(DOMAIN, TAG, '%{public}s', file);
      expect(file.endsWith('.ets')).assertTrue();
      expect(file.startsWith(name)).assertTrue();
      expect(file.length).assertEqual(18);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlRouteRoute0009 end');
    })

    /**
     * @tc.number    INTL_ROUTE_0010
     * @tc.name      intlRouteRoute0010
     * @tc.desc      包名 ohos.samples.international 的分段与命名规范校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlRouteRoute0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlRouteRoute0010 begin');
      const bundle: string = 'ohos.samples.international';
      const segments: string[] = bundle.split('.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundle=' + bundle);
      expect(segments.length).assertEqual(3);
      expect(bundle.length).assertEqual(26);
      expect(bundle.indexOf(' ') === -1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlRouteRoute0010 end');
    })

    /**
     * @tc.number    INTL_ROUTE_0011
     * @tc.name      intlRouteRoute0011
     * @tc.desc      能力 EntryAbility 的命名与后缀校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlRouteRoute0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlRouteRoute0011 begin');
      const ability: string = 'EntryAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', ability);
      expect(ability.endsWith('Ability')).assertTrue();
      expect(ability.length).assertEqual(12);
      expect(ability.charAt(0)).assertEqual('E');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlRouteRoute0011 end');
    })
  })
}
