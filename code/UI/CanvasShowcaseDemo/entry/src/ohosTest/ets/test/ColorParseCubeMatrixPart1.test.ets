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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { delayTick } from './shared/AsyncYield';
import { ColorUtil, ColorRgba } from '../../../main/ets/model/utils/ColorUtil';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF817;
const TAG: string = '[Sample_Canvas]';

export default function ColorParseCubeMatrixPart1Test(): void {
  describe('ColorParseCubeMatrixPart1', () => {

    /**
     * @tc.number    SUB_CANVAS_CPCP1_0100
     * @tc.name      testParseCube0001
     * @tc.desc      Verify parseHex(#0F107F) returns (15, 16, 127).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseCube0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCube0001 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#0F107F');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(15);
        expect(c.g).assertEqual(16);
        expect(c.b).assertEqual(127);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCube0001 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPCP1_0200
     * @tc.name      testParseCube0002
     * @tc.desc      Verify parseHex(#8010FF) returns (128, 16, 255).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseCube0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCube0002 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#8010FF');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(128);
        expect(c.g).assertEqual(16);
        expect(c.b).assertEqual(255);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCube0002 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPCP1_0300
     * @tc.name      testParseCube0003
     * @tc.desc      Verify parseHex(#FF7F00) returns (255, 127, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseCube0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCube0003 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#FF7F00');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(255);
        expect(c.g).assertEqual(127);
        expect(c.b).assertEqual(0);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCube0003 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPCP1_0400
     * @tc.name      testParseCube0004
     * @tc.desc      Verify parseHex(#007F10) returns (0, 127, 16).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseCube0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCube0004 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#007F10');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(0);
        expect(c.g).assertEqual(127);
        expect(c.b).assertEqual(16);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCube0004 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPCP1_0500
     * @tc.name      testParseCube0005
     * @tc.desc      Verify parseHex(#102030) returns (16, 32, 48).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseCube0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCube0005 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#102030');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(16);
        expect(c.g).assertEqual(32);
        expect(c.b).assertEqual(48);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCube0005 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPCP1_0600
     * @tc.name      testParseCube0006
     * @tc.desc      Verify parseHex(#A0B0C0) returns (160, 176, 192).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseCube0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCube0006 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#A0B0C0');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(160);
        expect(c.g).assertEqual(176);
        expect(c.b).assertEqual(192);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCube0006 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPCP1_0700
     * @tc.name      testParseCube0007
     * @tc.desc      Verify parseHex(#0F0F0F) returns (15, 15, 15).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseCube0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCube0007 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#0F0F0F');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(15);
        expect(c.g).assertEqual(15);
        expect(c.b).assertEqual(15);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCube0007 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPCP1_0800
     * @tc.name      testParseCube0008
     * @tc.desc      Verify parseHex(#010101) returns (1, 1, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseCube0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCube0008 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#010101');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(1);
        expect(c.g).assertEqual(1);
        expect(c.b).assertEqual(1);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCube0008 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPCP1_0900
     * @tc.name      testParseCube0009
     * @tc.desc      Verify parseHex(#7F7F7F) returns (127, 127, 127).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseCube0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCube0009 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#7F7F7F');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(127);
        expect(c.g).assertEqual(127);
        expect(c.b).assertEqual(127);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCube0009 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPCP1_1000
     * @tc.name      testParseCube0010
     * @tc.desc      Verify parseHex(#00FF00) returns (0, 255, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseCube0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCube0010 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#00FF00');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(0);
        expect(c.g).assertEqual(255);
        expect(c.b).assertEqual(0);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCube0010 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPCP1_1100
     * @tc.name      testParseCube0011
     * @tc.desc      Verify parseHex(#FF00FF) returns (255, 0, 255).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseCube0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCube0011 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#FF00FF');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(255);
        expect(c.g).assertEqual(0);
        expect(c.b).assertEqual(255);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCube0011 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CPCP1_1200
     * @tc.name      testParseCube0012
     * @tc.desc      Verify parseHex(#123ABC) returns (18, 58, 188).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseCube0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCube0012 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#123ABC');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(18);
        expect(c.g).assertEqual(58);
        expect(c.b).assertEqual(188);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCube0012 end');
    })

  })
}
