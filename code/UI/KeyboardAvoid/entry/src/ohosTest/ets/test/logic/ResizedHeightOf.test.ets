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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { resizedHeightOf } from '../model/KeyboardAvoidLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_KeyboardAvoid]';
const BUNDLE: string = 'KeyboardAvoid_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for resizedHeightOf (96 cases). */
export default function resizedHeightOfTest(): void {
  describe('ResizedHeightOfTest', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0001
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0001
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_ResizedHeightOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0001 begin`);
      const actual: number = resizedHeightOf(0, 0);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResizedHeightOf_0001 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0002
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0002
     * @tc.desc      resizedHeightOf(windowHeightVp=0, keyboardHeightVp=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_ResizedHeightOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0002 begin`);
      const actual: number = resizedHeightOf(0, -1);
      logInfo(`resizedHeightOf(windowHeightVp=0, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ResizedHeightOf_0002 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0003
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0003
     * @tc.desc      resizedHeightOf(windowHeightVp=1, keyboardHeightVp=-1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ResizedHeightOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0003 begin`);
      const actual: number = resizedHeightOf(1, -1);
      logInfo(`resizedHeightOf(windowHeightVp=1, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ResizedHeightOf_0003 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0004
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0004
     * @tc.desc      resizedHeightOf(windowHeightVp=100, keyboardHeightVp=0) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0004 begin`);
      const actual: number = resizedHeightOf(100, 0);
      logInfo(`resizedHeightOf(windowHeightVp=100, keybo...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ResizedHeightOf_0004 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0005
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0005
     * @tc.desc      resizedHeightOf(windowHeightVp=100, keyboardHeightVp=1) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0005 begin`);
      const actual: number = resizedHeightOf(100, 1);
      logInfo(`resizedHeightOf(windowHeightVp=100, keybo...: actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}ResizedHeightOf_0005 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0006
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0006
     * @tc.desc      resizedHeightOf(windowHeightVp=100, keyboardHeightVp=-1) returns 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ResizedHeightOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0006 begin`);
      const actual: number = resizedHeightOf(100, -1);
      logInfo(`resizedHeightOf(windowHeightVp=100, keybo...: actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}ResizedHeightOf_0006 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0007
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0007
     * @tc.desc      resizedHeightOf(windowHeightVp=100, keyboardHeightVp=2) returns 98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0007 begin`);
      const actual: number = resizedHeightOf(100, 2);
      logInfo(`resizedHeightOf(windowHeightVp=100, keybo...: actual=${actual}`);
      expect(actual).assertEqual(98);
      logInfo(`${BUNDLE}ResizedHeightOf_0007 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0008
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0008
     * @tc.desc      resizedHeightOf(windowHeightVp=100, keyboardHeightVp=3) returns 97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0008 begin`);
      const actual: number = resizedHeightOf(100, 3);
      logInfo(`resizedHeightOf(windowHeightVp=100, keybo...: actual=${actual}`);
      expect(actual).assertEqual(97);
      logInfo(`${BUNDLE}ResizedHeightOf_0008 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0009
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0009
     * @tc.desc      resizedHeightOf(windowHeightVp=100, keyboardHeightVp=10) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0009 begin`);
      const actual: number = resizedHeightOf(100, 10);
      logInfo(`resizedHeightOf(windowHeightVp=100, keybo...: actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}ResizedHeightOf_0009 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0010
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0010
     * @tc.desc      resizedHeightOf(windowHeightVp=100, keyboardHeightVp=96) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0010 begin`);
      const actual: number = resizedHeightOf(100, 96);
      logInfo(`resizedHeightOf(windowHeightVp=100, keybo...: actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}ResizedHeightOf_0010 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0011
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0011
     * @tc.desc      resizedHeightOf(windowHeightVp=360, keyboardHeightVp=0) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0011 begin`);
      const actual: number = resizedHeightOf(360, 0);
      logInfo(`resizedHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}ResizedHeightOf_0011 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0012
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0012
     * @tc.desc      resizedHeightOf(windowHeightVp=360, keyboardHeightVp=1) returns 359
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0012 begin`);
      const actual: number = resizedHeightOf(360, 1);
      logInfo(`resizedHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(359);
      logInfo(`${BUNDLE}ResizedHeightOf_0012 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0013
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0013
     * @tc.desc      resizedHeightOf(windowHeightVp=360, keyboardHeightVp=-1) returns 361
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ResizedHeightOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0013 begin`);
      const actual: number = resizedHeightOf(360, -1);
      logInfo(`resizedHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(361);
      logInfo(`${BUNDLE}ResizedHeightOf_0013 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0014
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0014
     * @tc.desc      resizedHeightOf(windowHeightVp=360, keyboardHeightVp=100) returns 260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0014 begin`);
      const actual: number = resizedHeightOf(360, 100);
      logInfo(`resizedHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(260);
      logInfo(`${BUNDLE}ResizedHeightOf_0014 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0015
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0015
     * @tc.desc      resizedHeightOf(windowHeightVp=360, keyboardHeightVp=2) returns 358
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0015 begin`);
      const actual: number = resizedHeightOf(360, 2);
      logInfo(`resizedHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(358);
      logInfo(`${BUNDLE}ResizedHeightOf_0015 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0016
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0016
     * @tc.desc      resizedHeightOf(windowHeightVp=360, keyboardHeightVp=3) returns 357
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0016 begin`);
      const actual: number = resizedHeightOf(360, 3);
      logInfo(`resizedHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(357);
      logInfo(`${BUNDLE}ResizedHeightOf_0016 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0017
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0017
     * @tc.desc      resizedHeightOf(windowHeightVp=360, keyboardHeightVp=10) returns 350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0017 begin`);
      const actual: number = resizedHeightOf(360, 10);
      logInfo(`resizedHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(350);
      logInfo(`${BUNDLE}ResizedHeightOf_0017 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0018
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0018
     * @tc.desc      resizedHeightOf(windowHeightVp=360, keyboardHeightVp=96) returns 264
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0018 begin`);
      const actual: number = resizedHeightOf(360, 96);
      logInfo(`resizedHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(264);
      logInfo(`${BUNDLE}ResizedHeightOf_0018 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0019
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0019
     * @tc.desc      resizedHeightOf(windowHeightVp=360, keyboardHeightVp=192) returns 168
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0019 begin`);
      const actual: number = resizedHeightOf(360, 192);
      logInfo(`resizedHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(168);
      logInfo(`${BUNDLE}ResizedHeightOf_0019 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0020
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0020
     * @tc.desc      resizedHeightOf(windowHeightVp=360, keyboardHeightVp=288) returns 72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0020 begin`);
      const actual: number = resizedHeightOf(360, 288);
      logInfo(`resizedHeightOf(windowHeightVp=360, keybo...: actual=${actual}`);
      expect(actual).assertEqual(72);
      logInfo(`${BUNDLE}ResizedHeightOf_0020 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0021
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0021
     * @tc.desc      resizedHeightOf(windowHeightVp=720, keyboardHeightVp=0) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0021 begin`);
      const actual: number = resizedHeightOf(720, 0);
      logInfo(`resizedHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}ResizedHeightOf_0021 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0022
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0022
     * @tc.desc      resizedHeightOf(windowHeightVp=720, keyboardHeightVp=1) returns 719
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0022 begin`);
      const actual: number = resizedHeightOf(720, 1);
      logInfo(`resizedHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(719);
      logInfo(`${BUNDLE}ResizedHeightOf_0022 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0023
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0023
     * @tc.desc      resizedHeightOf(windowHeightVp=720, keyboardHeightVp=-1) returns 721
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ResizedHeightOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0023 begin`);
      const actual: number = resizedHeightOf(720, -1);
      logInfo(`resizedHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(721);
      logInfo(`${BUNDLE}ResizedHeightOf_0023 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0024
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0024
     * @tc.desc      resizedHeightOf(windowHeightVp=720, keyboardHeightVp=100) returns 620
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0024 begin`);
      const actual: number = resizedHeightOf(720, 100);
      logInfo(`resizedHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(620);
      logInfo(`${BUNDLE}ResizedHeightOf_0024 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0025
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0025
     * @tc.desc      resizedHeightOf(windowHeightVp=720, keyboardHeightVp=2) returns 718
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0025 begin`);
      const actual: number = resizedHeightOf(720, 2);
      logInfo(`resizedHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(718);
      logInfo(`${BUNDLE}ResizedHeightOf_0025 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0026
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0026
     * @tc.desc      resizedHeightOf(windowHeightVp=720, keyboardHeightVp=3) returns 717
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0026 begin`);
      const actual: number = resizedHeightOf(720, 3);
      logInfo(`resizedHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(717);
      logInfo(`${BUNDLE}ResizedHeightOf_0026 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0027
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0027
     * @tc.desc      resizedHeightOf(windowHeightVp=720, keyboardHeightVp=10) returns 710
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0027 begin`);
      const actual: number = resizedHeightOf(720, 10);
      logInfo(`resizedHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(710);
      logInfo(`${BUNDLE}ResizedHeightOf_0027 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0028
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0028
     * @tc.desc      resizedHeightOf(windowHeightVp=720, keyboardHeightVp=96) returns 624
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0028 begin`);
      const actual: number = resizedHeightOf(720, 96);
      logInfo(`resizedHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(624);
      logInfo(`${BUNDLE}ResizedHeightOf_0028 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0029
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0029
     * @tc.desc      resizedHeightOf(windowHeightVp=720, keyboardHeightVp=192) returns 528
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0029 begin`);
      const actual: number = resizedHeightOf(720, 192);
      logInfo(`resizedHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(528);
      logInfo(`${BUNDLE}ResizedHeightOf_0029 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0030
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0030
     * @tc.desc      resizedHeightOf(windowHeightVp=720, keyboardHeightVp=288) returns 432
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0030 begin`);
      const actual: number = resizedHeightOf(720, 288);
      logInfo(`resizedHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(432);
      logInfo(`${BUNDLE}ResizedHeightOf_0030 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0031
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0031
     * @tc.desc      resizedHeightOf(windowHeightVp=720, keyboardHeightVp=384) returns 336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0031 begin`);
      const actual: number = resizedHeightOf(720, 384);
      logInfo(`resizedHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(336);
      logInfo(`${BUNDLE}ResizedHeightOf_0031 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0032
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0032
     * @tc.desc      resizedHeightOf(windowHeightVp=720, keyboardHeightVp=480) returns 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0032 begin`);
      const actual: number = resizedHeightOf(720, 480);
      logInfo(`resizedHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`${BUNDLE}ResizedHeightOf_0032 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0033
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0033
     * @tc.desc      resizedHeightOf(windowHeightVp=720, keyboardHeightVp=576) returns 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0033 begin`);
      const actual: number = resizedHeightOf(720, 576);
      logInfo(`resizedHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(144);
      logInfo(`${BUNDLE}ResizedHeightOf_0033 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0034
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0034
     * @tc.desc      resizedHeightOf(windowHeightVp=720, keyboardHeightVp=672) returns 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0034 begin`);
      const actual: number = resizedHeightOf(720, 672);
      logInfo(`resizedHeightOf(windowHeightVp=720, keybo...: actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`${BUNDLE}ResizedHeightOf_0034 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0035
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0035
     * @tc.desc      resizedHeightOf(windowHeightVp=1080, keyboardHeightVp=0) returns 1080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0035 begin`);
      const actual: number = resizedHeightOf(1080, 0);
      logInfo(`resizedHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}ResizedHeightOf_0035 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0036
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0036
     * @tc.desc      resizedHeightOf(windowHeightVp=1080, keyboardHeightVp=1) returns 1079
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0036 begin`);
      const actual: number = resizedHeightOf(1080, 1);
      logInfo(`resizedHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1079);
      logInfo(`${BUNDLE}ResizedHeightOf_0036 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0037
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0037
     * @tc.desc      resizedHeightOf(windowHeightVp=1080, keyboardHeightVp=-1) returns 1081
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ResizedHeightOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0037 begin`);
      const actual: number = resizedHeightOf(1080, -1);
      logInfo(`resizedHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1081);
      logInfo(`${BUNDLE}ResizedHeightOf_0037 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0038
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0038
     * @tc.desc      resizedHeightOf(windowHeightVp=1080, keyboardHeightVp=100) returns 980
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0038 begin`);
      const actual: number = resizedHeightOf(1080, 100);
      logInfo(`resizedHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(980);
      logInfo(`${BUNDLE}ResizedHeightOf_0038 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0039
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0039
     * @tc.desc      resizedHeightOf(windowHeightVp=1080, keyboardHeightVp=2) returns 1078
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0039 begin`);
      const actual: number = resizedHeightOf(1080, 2);
      logInfo(`resizedHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1078);
      logInfo(`${BUNDLE}ResizedHeightOf_0039 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0040
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0040
     * @tc.desc      resizedHeightOf(windowHeightVp=1080, keyboardHeightVp=3) returns 1077
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0040 begin`);
      const actual: number = resizedHeightOf(1080, 3);
      logInfo(`resizedHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1077);
      logInfo(`${BUNDLE}ResizedHeightOf_0040 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0041
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0041
     * @tc.desc      resizedHeightOf(windowHeightVp=1080, keyboardHeightVp=10) returns 1070
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0041 begin`);
      const actual: number = resizedHeightOf(1080, 10);
      logInfo(`resizedHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1070);
      logInfo(`${BUNDLE}ResizedHeightOf_0041 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0042
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0042
     * @tc.desc      resizedHeightOf(windowHeightVp=1080, keyboardHeightVp=96) returns 984
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0042 begin`);
      const actual: number = resizedHeightOf(1080, 96);
      logInfo(`resizedHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(984);
      logInfo(`${BUNDLE}ResizedHeightOf_0042 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0043
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0043
     * @tc.desc      resizedHeightOf(windowHeightVp=1080, keyboardHeightVp=192) returns 888
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0043 begin`);
      const actual: number = resizedHeightOf(1080, 192);
      logInfo(`resizedHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(888);
      logInfo(`${BUNDLE}ResizedHeightOf_0043 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0044
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0044
     * @tc.desc      resizedHeightOf(windowHeightVp=1080, keyboardHeightVp=288) returns 792
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0044 begin`);
      const actual: number = resizedHeightOf(1080, 288);
      logInfo(`resizedHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(792);
      logInfo(`${BUNDLE}ResizedHeightOf_0044 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0045
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0045
     * @tc.desc      resizedHeightOf(windowHeightVp=1080, keyboardHeightVp=384) returns 696
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0045 begin`);
      const actual: number = resizedHeightOf(1080, 384);
      logInfo(`resizedHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(696);
      logInfo(`${BUNDLE}ResizedHeightOf_0045 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0046
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0046
     * @tc.desc      resizedHeightOf(windowHeightVp=1080, keyboardHeightVp=480) returns 600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0046 begin`);
      const actual: number = resizedHeightOf(1080, 480);
      logInfo(`resizedHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(600);
      logInfo(`${BUNDLE}ResizedHeightOf_0046 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0047
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0047
     * @tc.desc      resizedHeightOf(windowHeightVp=1080, keyboardHeightVp=576) returns 504
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0047 begin`);
      const actual: number = resizedHeightOf(1080, 576);
      logInfo(`resizedHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(504);
      logInfo(`${BUNDLE}ResizedHeightOf_0047 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0048
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0048
     * @tc.desc      resizedHeightOf(windowHeightVp=1080, keyboardHeightVp=672) returns 408
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0048 begin`);
      const actual: number = resizedHeightOf(1080, 672);
      logInfo(`resizedHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(408);
      logInfo(`${BUNDLE}ResizedHeightOf_0048 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0049
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0049
     * @tc.desc      resizedHeightOf(windowHeightVp=1080, keyboardHeightVp=768) returns 312
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0049 begin`);
      const actual: number = resizedHeightOf(1080, 768);
      logInfo(`resizedHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(312);
      logInfo(`${BUNDLE}ResizedHeightOf_0049 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0050
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0050
     * @tc.desc      resizedHeightOf(windowHeightVp=1080, keyboardHeightVp=864) returns 216
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0050 begin`);
      const actual: number = resizedHeightOf(1080, 864);
      logInfo(`resizedHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(216);
      logInfo(`${BUNDLE}ResizedHeightOf_0050 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0051
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0051
     * @tc.desc      resizedHeightOf(windowHeightVp=1080, keyboardHeightVp=960) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0051 begin`);
      const actual: number = resizedHeightOf(1080, 960);
      logInfo(`resizedHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}ResizedHeightOf_0051 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0052
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0052
     * @tc.desc      resizedHeightOf(windowHeightVp=1080, keyboardHeightVp=1056) returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0052 begin`);
      const actual: number = resizedHeightOf(1080, 1056);
      logInfo(`resizedHeightOf(windowHeightVp=1080, keyb...: actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}ResizedHeightOf_0052 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0053
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0053
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=0) returns 1920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0053 begin`);
      const actual: number = resizedHeightOf(1920, 0);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}ResizedHeightOf_0053 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0054
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0054
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=1) returns 1919
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0054 begin`);
      const actual: number = resizedHeightOf(1920, 1);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1919);
      logInfo(`${BUNDLE}ResizedHeightOf_0054 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0055
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0055
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=-1) returns 1921
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ResizedHeightOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0055 begin`);
      const actual: number = resizedHeightOf(1920, -1);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1921);
      logInfo(`${BUNDLE}ResizedHeightOf_0055 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0056
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0056
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=100) returns 1820
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0056 begin`);
      const actual: number = resizedHeightOf(1920, 100);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1820);
      logInfo(`${BUNDLE}ResizedHeightOf_0056 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0057
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0057
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=360) returns 1560
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0057 begin`);
      const actual: number = resizedHeightOf(1920, 360);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1560);
      logInfo(`${BUNDLE}ResizedHeightOf_0057 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0058
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0058
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=720) returns 1200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0058 begin`);
      const actual: number = resizedHeightOf(1920, 720);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1200);
      logInfo(`${BUNDLE}ResizedHeightOf_0058 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0059
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0059
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=1080) returns 840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0059 begin`);
      const actual: number = resizedHeightOf(1920, 1080);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(840);
      logInfo(`${BUNDLE}ResizedHeightOf_0059 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0060
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0060
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=2) returns 1918
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0060 begin`);
      const actual: number = resizedHeightOf(1920, 2);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1918);
      logInfo(`${BUNDLE}ResizedHeightOf_0060 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0061
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0061
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=3) returns 1917
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0061 begin`);
      const actual: number = resizedHeightOf(1920, 3);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1917);
      logInfo(`${BUNDLE}ResizedHeightOf_0061 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0062
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0062
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=10) returns 1910
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0062 begin`);
      const actual: number = resizedHeightOf(1920, 10);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1910);
      logInfo(`${BUNDLE}ResizedHeightOf_0062 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0063
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0063
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=96) returns 1824
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0063 begin`);
      const actual: number = resizedHeightOf(1920, 96);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1824);
      logInfo(`${BUNDLE}ResizedHeightOf_0063 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0064
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0064
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=192) returns 1728
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0064 begin`);
      const actual: number = resizedHeightOf(1920, 192);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1728);
      logInfo(`${BUNDLE}ResizedHeightOf_0064 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0065
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0065
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=288) returns 1632
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0065 begin`);
      const actual: number = resizedHeightOf(1920, 288);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1632);
      logInfo(`${BUNDLE}ResizedHeightOf_0065 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0066
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0066
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=384) returns 1536
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0066 begin`);
      const actual: number = resizedHeightOf(1920, 384);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1536);
      logInfo(`${BUNDLE}ResizedHeightOf_0066 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0067
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0067
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=480) returns 1440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0067 begin`);
      const actual: number = resizedHeightOf(1920, 480);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1440);
      logInfo(`${BUNDLE}ResizedHeightOf_0067 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0068
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0068
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=576) returns 1344
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0068 begin`);
      const actual: number = resizedHeightOf(1920, 576);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1344);
      logInfo(`${BUNDLE}ResizedHeightOf_0068 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0069
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0069
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=672) returns 1248
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0069 begin`);
      const actual: number = resizedHeightOf(1920, 672);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1248);
      logInfo(`${BUNDLE}ResizedHeightOf_0069 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0070
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0070
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=768) returns 1152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0070 begin`);
      const actual: number = resizedHeightOf(1920, 768);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1152);
      logInfo(`${BUNDLE}ResizedHeightOf_0070 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0071
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0071
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=864) returns 1056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0071 begin`);
      const actual: number = resizedHeightOf(1920, 864);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(1056);
      logInfo(`${BUNDLE}ResizedHeightOf_0071 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0072
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0072
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=960) returns 960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0072 begin`);
      const actual: number = resizedHeightOf(1920, 960);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(960);
      logInfo(`${BUNDLE}ResizedHeightOf_0072 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0073
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0073
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=1056) returns 864
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0073 begin`);
      const actual: number = resizedHeightOf(1920, 1056);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(864);
      logInfo(`${BUNDLE}ResizedHeightOf_0073 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0074
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0074
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=1152) returns 768
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0074 begin`);
      const actual: number = resizedHeightOf(1920, 1152);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(768);
      logInfo(`${BUNDLE}ResizedHeightOf_0074 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0075
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0075
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=1248) returns 672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0075 begin`);
      const actual: number = resizedHeightOf(1920, 1248);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(672);
      logInfo(`${BUNDLE}ResizedHeightOf_0075 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0076
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0076
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=1344) returns 576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0076 begin`);
      const actual: number = resizedHeightOf(1920, 1344);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(576);
      logInfo(`${BUNDLE}ResizedHeightOf_0076 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0077
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0077
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=1440) returns 480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0077 begin`);
      const actual: number = resizedHeightOf(1920, 1440);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(480);
      logInfo(`${BUNDLE}ResizedHeightOf_0077 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0078
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0078
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=1536) returns 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0078 begin`);
      const actual: number = resizedHeightOf(1920, 1536);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(384);
      logInfo(`${BUNDLE}ResizedHeightOf_0078 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0079
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0079
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=1632) returns 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0079 begin`);
      const actual: number = resizedHeightOf(1920, 1632);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(288);
      logInfo(`${BUNDLE}ResizedHeightOf_0079 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0080
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0080
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=1728) returns 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0080 begin`);
      const actual: number = resizedHeightOf(1920, 1728);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`${BUNDLE}ResizedHeightOf_0080 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0081
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0081
     * @tc.desc      resizedHeightOf(windowHeightVp=1920, keyboardHeightVp=1824) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0081 begin`);
      const actual: number = resizedHeightOf(1920, 1824);
      logInfo(`resizedHeightOf(windowHeightVp=1920, keyb...: actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}ResizedHeightOf_0081 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0082
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0082
     * @tc.desc      resizedHeightOf(windowHeightVp=2, keyboardHeightVp=-1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ResizedHeightOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0082 begin`);
      const actual: number = resizedHeightOf(2, -1);
      logInfo(`resizedHeightOf(windowHeightVp=2, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}ResizedHeightOf_0082 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0083
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0083
     * @tc.desc      resizedHeightOf(windowHeightVp=10, keyboardHeightVp=0) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0083 begin`);
      const actual: number = resizedHeightOf(10, 0);
      logInfo(`resizedHeightOf(windowHeightVp=10, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ResizedHeightOf_0083 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0084
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0084
     * @tc.desc      resizedHeightOf(windowHeightVp=10, keyboardHeightVp=1) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0084 begin`);
      const actual: number = resizedHeightOf(10, 1);
      logInfo(`resizedHeightOf(windowHeightVp=10, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}ResizedHeightOf_0084 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0085
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0085
     * @tc.desc      resizedHeightOf(windowHeightVp=10, keyboardHeightVp=-1) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ResizedHeightOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0085 begin`);
      const actual: number = resizedHeightOf(10, -1);
      logInfo(`resizedHeightOf(windowHeightVp=10, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}ResizedHeightOf_0085 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0086
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0086
     * @tc.desc      resizedHeightOf(windowHeightVp=10, keyboardHeightVp=2) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0086 begin`);
      const actual: number = resizedHeightOf(10, 2);
      logInfo(`resizedHeightOf(windowHeightVp=10, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}ResizedHeightOf_0086 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0087
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0087
     * @tc.desc      resizedHeightOf(windowHeightVp=10, keyboardHeightVp=3) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0087 begin`);
      const actual: number = resizedHeightOf(10, 3);
      logInfo(`resizedHeightOf(windowHeightVp=10, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}ResizedHeightOf_0087 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0088
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0088
     * @tc.desc      resizedHeightOf(windowHeightVp=96, keyboardHeightVp=1) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0088 begin`);
      const actual: number = resizedHeightOf(96, 1);
      logInfo(`resizedHeightOf(windowHeightVp=96, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}ResizedHeightOf_0088 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0089
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0089
     * @tc.desc      resizedHeightOf(windowHeightVp=96, keyboardHeightVp=2) returns 94
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0089 begin`);
      const actual: number = resizedHeightOf(96, 2);
      logInfo(`resizedHeightOf(windowHeightVp=96, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(94);
      logInfo(`${BUNDLE}ResizedHeightOf_0089 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0090
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0090
     * @tc.desc      resizedHeightOf(windowHeightVp=96, keyboardHeightVp=3) returns 93
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0090 begin`);
      const actual: number = resizedHeightOf(96, 3);
      logInfo(`resizedHeightOf(windowHeightVp=96, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(93);
      logInfo(`${BUNDLE}ResizedHeightOf_0090 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0091
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0091
     * @tc.desc      resizedHeightOf(windowHeightVp=96, keyboardHeightVp=10) returns 86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0091 begin`);
      const actual: number = resizedHeightOf(96, 10);
      logInfo(`resizedHeightOf(windowHeightVp=96, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(86);
      logInfo(`${BUNDLE}ResizedHeightOf_0091 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0092
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0092
     * @tc.desc      resizedHeightOf(windowHeightVp=192, keyboardHeightVp=1) returns 191
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0092 begin`);
      const actual: number = resizedHeightOf(192, 1);
      logInfo(`resizedHeightOf(windowHeightVp=192, keybo...: actual=${actual}`);
      expect(actual).assertEqual(191);
      logInfo(`${BUNDLE}ResizedHeightOf_0092 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0093
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0093
     * @tc.desc      resizedHeightOf(windowHeightVp=192, keyboardHeightVp=-1) returns 193
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ResizedHeightOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0093 begin`);
      const actual: number = resizedHeightOf(192, -1);
      logInfo(`resizedHeightOf(windowHeightVp=192, keybo...: actual=${actual}`);
      expect(actual).assertEqual(193);
      logInfo(`${BUNDLE}ResizedHeightOf_0093 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0094
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0094
     * @tc.desc      resizedHeightOf(windowHeightVp=192, keyboardHeightVp=100) returns 92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0094 begin`);
      const actual: number = resizedHeightOf(192, 100);
      logInfo(`resizedHeightOf(windowHeightVp=192, keybo...: actual=${actual}`);
      expect(actual).assertEqual(92);
      logInfo(`${BUNDLE}ResizedHeightOf_0094 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0095
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0095
     * @tc.desc      resizedHeightOf(windowHeightVp=192, keyboardHeightVp=2) returns 190
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0095 begin`);
      const actual: number = resizedHeightOf(192, 2);
      logInfo(`resizedHeightOf(windowHeightVp=192, keybo...: actual=${actual}`);
      expect(actual).assertEqual(190);
      logInfo(`${BUNDLE}ResizedHeightOf_0095 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_RESIZED_HEIGHT_OF_0096
     * @tc.name      KeyboardAvoid_ResizedHeightOf_0096
     * @tc.desc      resizedHeightOf(windowHeightVp=192, keyboardHeightVp=3) returns 189
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ResizedHeightOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ResizedHeightOf_0096 begin`);
      const actual: number = resizedHeightOf(192, 3);
      logInfo(`resizedHeightOf(windowHeightVp=192, keybo...: actual=${actual}`);
      expect(actual).assertEqual(189);
      logInfo(`${BUNDLE}ResizedHeightOf_0096 end`);
    });
  });
}
