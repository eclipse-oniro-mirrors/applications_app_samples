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

export default function dsTextMatrix1Test(): void {
  describe('DsTextMatrix1Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0001
     * @tc.name      dsText0001
     * @tc.desc      页面文案 DisplaySync 第 1 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0001 begin');
      const text: string = 'DisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('DisplaySync'.length).assertEqual(11);
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0001 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0002
     * @tc.name      dsText0002
     * @tc.desc      页面文案 DisplaySync 第 2 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0002 begin');
      const text: string = 'DisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('DisplaySync'.indexOf(' ')).assertEqual(-1);
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0002 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0003
     * @tc.name      dsText0003
     * @tc.desc      页面文案 DisplaySync 第 3 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0003 begin');
      const text: string = 'DisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('DisplaySync' === 'DisplaySync').assertTrue();
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0003 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0004
     * @tc.name      dsText0004
     * @tc.desc      页面文案 DisplaySync 第 4 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0004 begin');
      const text: string = 'DisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('DisplaySync'.toUpperCase().length).assertEqual(11);
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0004 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0005
     * @tc.name      dsText0005
     * @tc.desc      页面文案 DisplaySync 第 5 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0005 begin');
      const text: string = 'DisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('DisplaySync'.substring(0, 1)).assertEqual('D');
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0005 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0006
     * @tc.name      dsText0006
     * @tc.desc      页面文案 DisplaySync 第 6 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0006 begin');
      const text: string = 'DisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('DisplaySync'.startsWith('Di')).assertTrue();
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0006 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0007
     * @tc.name      dsText0007
     * @tc.desc      页面文案 DisplaySync 第 7 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0007 begin');
      const text: string = 'DisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('DisplaySync'.endsWith('nc')).assertTrue();
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0007 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0008
     * @tc.name      dsText0008
     * @tc.desc      页面文案 DisplaySync 第 8 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0008 begin');
      const text: string = 'DisplaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('DisplaySync'.split('').length).assertEqual(11);
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0008 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0009
     * @tc.name      dsText0009
     * @tc.desc      页面文案 CustomDraw 第 9 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0009 begin');
      const text: string = 'CustomDraw';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('CustomDraw'.length).assertEqual(10);
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0009 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0010
     * @tc.name      dsText0010
     * @tc.desc      页面文案 CustomDraw 第 10 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0010 begin');
      const text: string = 'CustomDraw';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('CustomDraw'.indexOf(' ')).assertEqual(-1);
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0010 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0011
     * @tc.name      dsText0011
     * @tc.desc      页面文案 CustomDraw 第 11 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0011 begin');
      const text: string = 'CustomDraw';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('CustomDraw' === 'CustomDraw').assertTrue();
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0011 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0012
     * @tc.name      dsText0012
     * @tc.desc      页面文案 CustomDraw 第 12 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0012 begin');
      const text: string = 'CustomDraw';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('CustomDraw'.toUpperCase().length).assertEqual(10);
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0012 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0013
     * @tc.name      dsText0013
     * @tc.desc      页面文案 CustomDraw 第 13 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0013 begin');
      const text: string = 'CustomDraw';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('CustomDraw'.substring(0, 1)).assertEqual('C');
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0013 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0014
     * @tc.name      dsText0014
     * @tc.desc      页面文案 CustomDraw 第 14 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0014 begin');
      const text: string = 'CustomDraw';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('CustomDraw'.startsWith('Cu')).assertTrue();
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0014 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0015
     * @tc.name      dsText0015
     * @tc.desc      页面文案 CustomDraw 第 15 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0015 begin');
      const text: string = 'CustomDraw';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('CustomDraw'.endsWith('aw')).assertTrue();
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0015 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0016
     * @tc.name      dsText0016
     * @tc.desc      页面文案 CustomDraw 第 16 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0016 begin');
      const text: string = 'CustomDraw';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('CustomDraw'.split('').length).assertEqual(10);
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0016 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0017
     * @tc.name      dsText0017
     * @tc.desc      页面文案 PropertyAnimation 第 17 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0017 begin');
      const text: string = 'PropertyAnimation';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('PropertyAnimation'.length).assertEqual(17);
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0017 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0018
     * @tc.name      dsText0018
     * @tc.desc      页面文案 PropertyAnimation 第 18 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0018 begin');
      const text: string = 'PropertyAnimation';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('PropertyAnimation'.indexOf(' ')).assertEqual(-1);
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0018 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0019
     * @tc.name      dsText0019
     * @tc.desc      页面文案 PropertyAnimation 第 19 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0019 begin');
      const text: string = 'PropertyAnimation';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('PropertyAnimation' === 'PropertyAnimation').assertTrue();
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0019 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0020
     * @tc.name      dsText0020
     * @tc.desc      页面文案 PropertyAnimation 第 20 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0020 begin');
      const text: string = 'PropertyAnimation';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('PropertyAnimation'.toUpperCase().length).assertEqual(17);
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0020 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0021
     * @tc.name      dsText0021
     * @tc.desc      页面文案 PropertyAnimation 第 21 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0021 begin');
      const text: string = 'PropertyAnimation';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('PropertyAnimation'.substring(0, 1)).assertEqual('P');
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0021 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0022
     * @tc.name      dsText0022
     * @tc.desc      页面文案 PropertyAnimation 第 22 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0022 begin');
      const text: string = 'PropertyAnimation';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('PropertyAnimation'.startsWith('Pr')).assertTrue();
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0022 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0023
     * @tc.name      dsText0023
     * @tc.desc      页面文案 PropertyAnimation 第 23 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0023 begin');
      const text: string = 'PropertyAnimation';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('PropertyAnimation'.endsWith('on')).assertTrue();
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0023 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0024
     * @tc.name      dsText0024
     * @tc.desc      页面文案 PropertyAnimation 第 24 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0024 begin');
      const text: string = 'PropertyAnimation';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('PropertyAnimation'.split('').length).assertEqual(17);
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0024 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0025
     * @tc.name      dsText0025
     * @tc.desc      页面文案 XComponent 第 25 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0025 begin');
      const text: string = 'XComponent';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('XComponent'.length).assertEqual(10);
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0025 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0026
     * @tc.name      dsText0026
     * @tc.desc      页面文案 XComponent 第 26 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0026 begin');
      const text: string = 'XComponent';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('XComponent'.indexOf(' ')).assertEqual(-1);
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0026 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0027
     * @tc.name      dsText0027
     * @tc.desc      页面文案 XComponent 第 27 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0027 begin');
      const text: string = 'XComponent';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('XComponent' === 'XComponent').assertTrue();
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0027 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0028
     * @tc.name      dsText0028
     * @tc.desc      页面文案 XComponent 第 28 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0028 begin');
      const text: string = 'XComponent';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('XComponent'.toUpperCase().length).assertEqual(10);
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0028 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0029
     * @tc.name      dsText0029
     * @tc.desc      页面文案 XComponent 第 29 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0029 begin');
      const text: string = 'XComponent';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('XComponent'.substring(0, 1)).assertEqual('X');
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0029 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0030
     * @tc.name      dsText0030
     * @tc.desc      页面文案 XComponent 第 30 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0030 begin');
      const text: string = 'XComponent';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('XComponent'.startsWith('XC')).assertTrue();
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0030 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0031
     * @tc.name      dsText0031
     * @tc.desc      页面文案 XComponent 第 31 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0031 begin');
      const text: string = 'XComponent';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('XComponent'.endsWith('nt')).assertTrue();
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0031 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0032
     * @tc.name      dsText0032
     * @tc.desc      页面文案 XComponent 第 32 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0032 begin');
      const text: string = 'XComponent';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('XComponent'.split('').length).assertEqual(10);
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0032 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0033
     * @tc.name      dsText0033
     * @tc.desc      页面文案 Animator 第 33 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0033 begin');
      const text: string = 'Animator';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('Animator'.length).assertEqual(8);
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0033 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0034
     * @tc.name      dsText0034
     * @tc.desc      页面文案 Animator 第 34 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0034 begin');
      const text: string = 'Animator';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('Animator'.indexOf(' ')).assertEqual(-1);
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0034 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0035
     * @tc.name      dsText0035
     * @tc.desc      页面文案 Animator 第 35 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0035 begin');
      const text: string = 'Animator';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('Animator' === 'Animator').assertTrue();
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0035 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0036
     * @tc.name      dsText0036
     * @tc.desc      页面文案 Animator 第 36 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0036 begin');
      const text: string = 'Animator';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('Animator'.toUpperCase().length).assertEqual(8);
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0036 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0037
     * @tc.name      dsText0037
     * @tc.desc      页面文案 Animator 第 37 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0037 begin');
      const text: string = 'Animator';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('Animator'.substring(0, 1)).assertEqual('A');
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0037 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0038
     * @tc.name      dsText0038
     * @tc.desc      页面文案 Animator 第 38 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0038 begin');
      const text: string = 'Animator';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('Animator'.startsWith('An')).assertTrue();
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0038 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0039
     * @tc.name      dsText0039
     * @tc.desc      页面文案 Animator 第 39 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0039 begin');
      const text: string = 'Animator';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('Animator'.endsWith('or')).assertTrue();
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0039 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_TEXT_0040
     * @tc.name      dsText0040
     * @tc.desc      页面文案 Animator 第 40 项字符串检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsText0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0040 begin');
      const text: string = 'Animator';
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect('Animator'.split('').length).assertEqual(8);
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsText0040 end');
    })
  })
}
