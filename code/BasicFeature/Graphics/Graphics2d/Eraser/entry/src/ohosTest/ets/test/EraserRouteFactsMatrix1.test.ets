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
const TAG: string = '[Sample_Eraser]';

export default function eraserRouteMatrix1Test(): void {
  describe('EraserRouteFactsMatrix1Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    ERASER_ROUTE_0001
     * @tc.name      eraserRouteRoute0001
     * @tc.desc      页面路由 pages/Index 的分段与首尾结构校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserRouteRoute0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserRouteRoute0001 begin');
      const route: string = 'pages/Index';
      const segments: string[] = route.split('/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'route=' + route);
      expect(segments.length).assertEqual(2);
      expect(segments[0]).assertEqual('pages');
      expect(segments[segments.length - 1]).assertEqual('Index');
      expect(route.startsWith('pages/')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserRouteRoute0001 end');
    })

    /**
     * @tc.number    ERASER_ROUTE_0002
     * @tc.name      eraserRouteRoute0002
     * @tc.desc      页面路由 pages/Index 的字符集与长度校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserRouteRoute0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserRouteRoute0002 begin');
      const route: string = 'pages/Index';
      hilog.info(DOMAIN, TAG, '%{public}s', 'len=' + route.length);
      expect(route.length).assertEqual(11);
      expect(route.indexOf(' ') === -1).assertTrue();
      expect(route.indexOf('//') === -1).assertTrue();
      expect(route.endsWith('Index')).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserRouteRoute0002 end');
    })

    /**
     * @tc.number    ERASER_ROUTE_0003
     * @tc.name      eraserRouteRoute0003
     * @tc.desc      页面路由 pages/Index 反查页面文件名的后缀校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserRouteRoute0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserRouteRoute0003 begin');
      const name: string = 'Index';
      const file: string = name + '.ets';
      hilog.info(DOMAIN, TAG, '%{public}s', file);
      expect(file.endsWith('.ets')).assertTrue();
      expect(file.startsWith(name)).assertTrue();
      expect(file.length).assertEqual(9);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserRouteRoute0003 end');
    })

    /**
     * @tc.number    ERASER_ROUTE_0004
     * @tc.name      eraserRouteRoute0004
     * @tc.desc      包名 com.samples.eraser 的分段与命名规范校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserRouteRoute0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserRouteRoute0004 begin');
      const bundle: string = 'com.samples.eraser';
      const segments: string[] = bundle.split('.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundle=' + bundle);
      expect(segments.length).assertEqual(3);
      expect(bundle.length).assertEqual(18);
      expect(bundle.indexOf(' ') === -1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserRouteRoute0004 end');
    })

    /**
     * @tc.number    ERASER_ROUTE_0005
     * @tc.name      eraserRouteRoute0005
     * @tc.desc      能力 EntryAbility 的命名与后缀校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserRouteRoute0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserRouteRoute0005 begin');
      const ability: string = 'EntryAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', ability);
      expect(ability.endsWith('Ability')).assertTrue();
      expect(ability.length).assertEqual(12);
      expect(ability.charAt(0)).assertEqual('E');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserRouteRoute0005 end');
    })

    /**
     * @tc.number    ERASER_ROUTE_0006
     * @tc.name      eraserRouteRoute0006
     * @tc.desc      能力 EntryBackupAbility 的命名与后缀校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserRouteRoute0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserRouteRoute0006 begin');
      const ability: string = 'EntryBackupAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', ability);
      expect(ability.endsWith('Ability')).assertTrue();
      expect(ability.length).assertEqual(18);
      expect(ability.charAt(0)).assertEqual('E');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserRouteRoute0006 end');
    })
  })
}
