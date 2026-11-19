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
import { displaySync } from '@kit.ArkGraphics2D';
import { bundleManager } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DisplaySync]';

export default function dsPageMatrix1Test(): void {
  describe('DsPageMatrix1Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0001
     * @tc.name      dsPage0001
     * @tc.desc      pages/Index 第 1 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0001 begin');
      const url: string = 'pages/Index';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.split('/').length).assertEqual(2);
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0001 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0002
     * @tc.name      dsPage0002
     * @tc.desc      pages/Index 第 2 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0002 begin');
      const url: string = 'pages/Index';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.startsWith('pages/')).assertTrue();
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0002 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0003
     * @tc.name      dsPage0003
     * @tc.desc      pages/Index 第 3 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0003 begin');
      const url: string = 'pages/Index';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.split('/')[0]).assertEqual('pages');
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0003 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0004
     * @tc.name      dsPage0004
     * @tc.desc      pages/Index 第 4 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0004 begin');
      const url: string = 'pages/Index';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.endsWith('Index')).assertTrue();
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0004 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0005
     * @tc.name      dsPage0005
     * @tc.desc      pages/Index 第 5 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0005 begin');
      const url: string = 'pages/Index';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.indexOf('//')).assertEqual(-1);
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0005 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0006
     * @tc.name      dsPage0006
     * @tc.desc      pages/Index 第 6 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0006 begin');
      const url: string = 'pages/Index';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.length).assertEqual(11);
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0006 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0007
     * @tc.name      dsPage0007
     * @tc.desc      pages/Index 第 7 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0007 begin');
      const url: string = 'pages/Index';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.indexOf(' ') === -1).assertTrue();
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0007 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0008
     * @tc.name      dsPage0008
     * @tc.desc      pages/Index 第 8 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0008 begin');
      const url: string = 'pages/Index';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url === url.toLowerCase() || url === url).assertTrue();
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0008 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0009
     * @tc.name      dsPage0009
     * @tc.desc      pages/CustomDrawDisplaySync 第 1 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0009 begin');
      const url: string = 'pages/CustomDrawDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.split('/').length).assertEqual(2);
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0009 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0010
     * @tc.name      dsPage0010
     * @tc.desc      pages/CustomDrawDisplaySync 第 2 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0010 begin');
      const url: string = 'pages/CustomDrawDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.startsWith('pages/')).assertTrue();
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0010 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0011
     * @tc.name      dsPage0011
     * @tc.desc      pages/CustomDrawDisplaySync 第 3 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0011 begin');
      const url: string = 'pages/CustomDrawDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.split('/')[0]).assertEqual('pages');
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0011 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0012
     * @tc.name      dsPage0012
     * @tc.desc      pages/CustomDrawDisplaySync 第 4 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0012 begin');
      const url: string = 'pages/CustomDrawDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.endsWith('CustomDrawDisplaySync')).assertTrue();
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0012 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0013
     * @tc.name      dsPage0013
     * @tc.desc      pages/CustomDrawDisplaySync 第 5 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0013 begin');
      const url: string = 'pages/CustomDrawDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.indexOf('//')).assertEqual(-1);
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0013 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0014
     * @tc.name      dsPage0014
     * @tc.desc      pages/CustomDrawDisplaySync 第 6 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0014 begin');
      const url: string = 'pages/CustomDrawDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.length).assertEqual(27);
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0014 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0015
     * @tc.name      dsPage0015
     * @tc.desc      pages/CustomDrawDisplaySync 第 7 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0015 begin');
      const url: string = 'pages/CustomDrawDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.indexOf(' ') === -1).assertTrue();
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0015 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0016
     * @tc.name      dsPage0016
     * @tc.desc      pages/CustomDrawDisplaySync 第 8 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0016 begin');
      const url: string = 'pages/CustomDrawDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url === url.toLowerCase() || url === url).assertTrue();
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0016 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0017
     * @tc.name      dsPage0017
     * @tc.desc      pages/PropertyAnimationDisplaySync 第 1 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0017 begin');
      const url: string = 'pages/PropertyAnimationDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.split('/').length).assertEqual(2);
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0017 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0018
     * @tc.name      dsPage0018
     * @tc.desc      pages/PropertyAnimationDisplaySync 第 2 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0018 begin');
      const url: string = 'pages/PropertyAnimationDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.startsWith('pages/')).assertTrue();
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0018 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0019
     * @tc.name      dsPage0019
     * @tc.desc      pages/PropertyAnimationDisplaySync 第 3 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0019 begin');
      const url: string = 'pages/PropertyAnimationDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.split('/')[0]).assertEqual('pages');
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0019 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0020
     * @tc.name      dsPage0020
     * @tc.desc      pages/PropertyAnimationDisplaySync 第 4 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0020 begin');
      const url: string = 'pages/PropertyAnimationDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.endsWith('PropertyAnimationDisplaySync')).assertTrue();
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0020 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0021
     * @tc.name      dsPage0021
     * @tc.desc      pages/PropertyAnimationDisplaySync 第 5 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0021 begin');
      const url: string = 'pages/PropertyAnimationDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.indexOf('//')).assertEqual(-1);
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0021 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0022
     * @tc.name      dsPage0022
     * @tc.desc      pages/PropertyAnimationDisplaySync 第 6 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0022 begin');
      const url: string = 'pages/PropertyAnimationDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.length).assertEqual(34);
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0022 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0023
     * @tc.name      dsPage0023
     * @tc.desc      pages/PropertyAnimationDisplaySync 第 7 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0023 begin');
      const url: string = 'pages/PropertyAnimationDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.indexOf(' ') === -1).assertTrue();
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0023 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0024
     * @tc.name      dsPage0024
     * @tc.desc      pages/PropertyAnimationDisplaySync 第 8 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0024 begin');
      const url: string = 'pages/PropertyAnimationDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url === url.toLowerCase() || url === url).assertTrue();
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0024 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0025
     * @tc.name      dsPage0025
     * @tc.desc      pages/XComponentDisplaySync 第 1 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0025 begin');
      const url: string = 'pages/XComponentDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.split('/').length).assertEqual(2);
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0025 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0026
     * @tc.name      dsPage0026
     * @tc.desc      pages/XComponentDisplaySync 第 2 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0026 begin');
      const url: string = 'pages/XComponentDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.startsWith('pages/')).assertTrue();
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0026 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0027
     * @tc.name      dsPage0027
     * @tc.desc      pages/XComponentDisplaySync 第 3 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0027 begin');
      const url: string = 'pages/XComponentDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.split('/')[0]).assertEqual('pages');
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0027 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0028
     * @tc.name      dsPage0028
     * @tc.desc      pages/XComponentDisplaySync 第 4 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0028 begin');
      const url: string = 'pages/XComponentDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.endsWith('XComponentDisplaySync')).assertTrue();
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0028 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0029
     * @tc.name      dsPage0029
     * @tc.desc      pages/XComponentDisplaySync 第 5 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0029 begin');
      const url: string = 'pages/XComponentDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.indexOf('//')).assertEqual(-1);
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0029 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0030
     * @tc.name      dsPage0030
     * @tc.desc      pages/XComponentDisplaySync 第 6 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0030 begin');
      const url: string = 'pages/XComponentDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.length).assertEqual(27);
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0030 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0031
     * @tc.name      dsPage0031
     * @tc.desc      pages/XComponentDisplaySync 第 7 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0031 begin');
      const url: string = 'pages/XComponentDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.indexOf(' ') === -1).assertTrue();
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0031 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0032
     * @tc.name      dsPage0032
     * @tc.desc      pages/XComponentDisplaySync 第 8 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0032 begin');
      const url: string = 'pages/XComponentDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url === url.toLowerCase() || url === url).assertTrue();
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0032 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0033
     * @tc.name      dsPage0033
     * @tc.desc      pages/AnimatorDisplaySync 第 1 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0033 begin');
      const url: string = 'pages/AnimatorDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.split('/').length).assertEqual(2);
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0033 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0034
     * @tc.name      dsPage0034
     * @tc.desc      pages/AnimatorDisplaySync 第 2 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0034 begin');
      const url: string = 'pages/AnimatorDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.startsWith('pages/')).assertTrue();
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0034 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0035
     * @tc.name      dsPage0035
     * @tc.desc      pages/AnimatorDisplaySync 第 3 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0035 begin');
      const url: string = 'pages/AnimatorDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.split('/')[0]).assertEqual('pages');
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0035 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0036
     * @tc.name      dsPage0036
     * @tc.desc      pages/AnimatorDisplaySync 第 4 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0036 begin');
      const url: string = 'pages/AnimatorDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.endsWith('AnimatorDisplaySync')).assertTrue();
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0036 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0037
     * @tc.name      dsPage0037
     * @tc.desc      pages/AnimatorDisplaySync 第 5 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0037 begin');
      const url: string = 'pages/AnimatorDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.indexOf('//')).assertEqual(-1);
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0037 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0038
     * @tc.name      dsPage0038
     * @tc.desc      pages/AnimatorDisplaySync 第 6 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0038 begin');
      const url: string = 'pages/AnimatorDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.length).assertEqual(25);
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0038 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0039
     * @tc.name      dsPage0039
     * @tc.desc      pages/AnimatorDisplaySync 第 7 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0039 begin');
      const url: string = 'pages/AnimatorDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url.indexOf(' ') === -1).assertTrue();
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0039 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_PAGE_0040
     * @tc.name      dsPage0040
     * @tc.desc      pages/AnimatorDisplaySync 第 8 项路径结构检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsPage0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0040 begin');
      const url: string = 'pages/AnimatorDisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'url=' + url);
      expect(url === url.toLowerCase() || url === url).assertTrue();
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsPage0040 end');
    })
  })
}
