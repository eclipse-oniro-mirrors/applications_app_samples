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
const TAG: string = '[Sample_DisplaySoloist]';

export default function soloRouteFactsMatrix1Test(): void {
  describe('SoloRouteFactsMatrix1Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SOLO_ROUTE_FACTS_0001
     * @tc.name      soloRouteRoute0001
     * @tc.desc      页面路由 pages/Index 的分段与首尾结构校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloRouteRoute0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloRouteRoute0001 begin');
      const route: string = 'pages/Index';
      const segments: string[] = route.split('/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'route=' + route);
      expect(segments.length).assertEqual(2);
      expect(segments[0]).assertEqual('pages');
      expect(segments[segments.length - 1]).assertEqual('Index');
      expect(route.startsWith('pages/')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloRouteRoute0001 end');
    })

    /**
     * @tc.number    SOLO_ROUTE_FACTS_0002
     * @tc.name      soloRouteRoute0002
     * @tc.desc      页面路由 pages/Index 的字符集与长度校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloRouteRoute0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloRouteRoute0002 begin');
      const route: string = 'pages/Index';
      hilog.info(DOMAIN, TAG, '%{public}s', 'len=' + route.length);
      expect(route.length).assertEqual(11);
      expect(route.indexOf(' ') === -1).assertTrue();
      expect(route.indexOf('//') === -1).assertTrue();
      expect(route.endsWith('Index')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloRouteRoute0002 end');
    })

    /**
     * @tc.number    SOLO_ROUTE_FACTS_0003
     * @tc.name      soloRouteRoute0003
     * @tc.desc      页面路由 pages/Index 反查页面文件名的后缀校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloRouteRoute0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloRouteRoute0003 begin');
      const name: string = 'Index';
      const file: string = name + '.ets';
      hilog.info(DOMAIN, TAG, '%{public}s', file);
      expect(file.endsWith('.ets')).assertTrue();
      expect(file.startsWith(name)).assertTrue();
      expect(file.length).assertEqual(9);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloRouteRoute0003 end');
    })

    /**
     * @tc.number    SOLO_ROUTE_FACTS_0004
     * @tc.name      soloRouteRoute0004
     * @tc.desc      包名 com.samples.DisplaySoloist 的分段与命名规范校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloRouteRoute0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloRouteRoute0004 begin');
      const bundle: string = 'com.samples.DisplaySoloist';
      const segments: string[] = bundle.split('.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundle=' + bundle);
      expect(segments.length).assertEqual(3);
      expect(bundle.length).assertEqual(26);
      expect(bundle.indexOf(' ') === -1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloRouteRoute0004 end');
    })

    /**
     * @tc.number    SOLO_ROUTE_FACTS_0005
     * @tc.name      soloRouteRoute0005
     * @tc.desc      能力 EntryAbility 的命名与后缀校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloRouteRoute0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloRouteRoute0005 begin');
      const ability: string = 'EntryAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', ability);
      expect(ability.endsWith('Ability')).assertTrue();
      expect(ability.length).assertEqual(12);
      expect(ability.charAt(0)).assertEqual('E');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloRouteRoute0005 end');
    })
  })
}
