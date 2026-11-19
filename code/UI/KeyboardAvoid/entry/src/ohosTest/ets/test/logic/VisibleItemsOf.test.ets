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
import { visibleItemsOf } from '../model/KeyboardAvoidLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_KeyboardAvoid]';
const BUNDLE: string = 'KeyboardAvoid_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for visibleItemsOf (96 cases). */
export default function visibleItemsOfTest(): void {
  describe('VisibleItemsOfTest', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0001
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0001
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=0, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_VisibleItemsOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0001 begin`);
      const actual: number = visibleItemsOf(0, 0, 0);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0001 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0002
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0002
     * @tc.desc      visibleItemsOf(windowHeightVp=1920, keyboardHeightVp=1, itemHeightVp=2) returns 959
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_VisibleItemsOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0002 begin`);
      const actual: number = visibleItemsOf(1920, 1, 2);
      logInfo(`visibleItemsOf(windowHeightVp=1920, keybo...: actual=${actual}`);
      expect(actual).assertEqual(959);
      logInfo(`${BUNDLE}VisibleItemsOf_0002 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0003
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0003
     * @tc.desc      visibleItemsOf(windowHeightVp=1920, keyboardHeightVp=1080, itemHeightVp=96) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0003 begin`);
      const actual: number = visibleItemsOf(1920, 1080, 96);
      logInfo(`visibleItemsOf(windowHeightVp=1920, keybo...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}VisibleItemsOf_0003 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0004
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0004
     * @tc.desc      visibleItemsOf(windowHeightVp=720, keyboardHeightVp=10, itemHeightVp=1) returns 710
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0004 begin`);
      const actual: number = visibleItemsOf(720, 10, 1);
      logInfo(`visibleItemsOf(windowHeightVp=720, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(710);
      logInfo(`${BUNDLE}VisibleItemsOf_0004 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0005
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0005
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=2, itemHeightVp=2) returns 539
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0005 begin`);
      const actual: number = visibleItemsOf(1080, 2, 2);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(539);
      logInfo(`${BUNDLE}VisibleItemsOf_0005 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0006
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0006
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=0, itemHeightVp=3) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0006 begin`);
      const actual: number = visibleItemsOf(1080, 0, 3);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}VisibleItemsOf_0006 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0007
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0007
     * @tc.desc      visibleItemsOf(windowHeightVp=360, keyboardHeightVp=100, itemHeightVp=3) returns 86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0007 begin`);
      const actual: number = visibleItemsOf(360, 100, 3);
      logInfo(`visibleItemsOf(windowHeightVp=360, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(86);
      logInfo(`${BUNDLE}VisibleItemsOf_0007 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0008
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0008
     * @tc.desc      visibleItemsOf(windowHeightVp=96, keyboardHeightVp=-1, itemHeightVp=3) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0008 begin`);
      const actual: number = visibleItemsOf(96, -1, 3);
      logInfo(`visibleItemsOf(windowHeightVp=96, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}VisibleItemsOf_0008 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0009
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0009
     * @tc.desc      visibleItemsOf(windowHeightVp=96, keyboardHeightVp=0, itemHeightVp=1) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0009 begin`);
      const actual: number = visibleItemsOf(96, 0, 1);
      logInfo(`visibleItemsOf(windowHeightVp=96, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}VisibleItemsOf_0009 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0010
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0010
     * @tc.desc      visibleItemsOf(windowHeightVp=360, keyboardHeightVp=2, itemHeightVp=10) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0010 begin`);
      const actual: number = visibleItemsOf(360, 2, 10);
      logInfo(`visibleItemsOf(windowHeightVp=360, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}VisibleItemsOf_0010 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0011
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0011
     * @tc.desc      visibleItemsOf(windowHeightVp=100, keyboardHeightVp=0, itemHeightVp=1) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0011 begin`);
      const actual: number = visibleItemsOf(100, 0, 1);
      logInfo(`visibleItemsOf(windowHeightVp=100, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}VisibleItemsOf_0011 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0012
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0012
     * @tc.desc      visibleItemsOf(windowHeightVp=1920, keyboardHeightVp=3, itemHeightVp=720) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0012 begin`);
      const actual: number = visibleItemsOf(1920, 3, 720);
      logInfo(`visibleItemsOf(windowHeightVp=1920, keybo...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}VisibleItemsOf_0012 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0013
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0013
     * @tc.desc      visibleItemsOf(windowHeightVp=1920, keyboardHeightVp=100, itemHeightVp=96) returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0013 begin`);
      const actual: number = visibleItemsOf(1920, 100, 96);
      logInfo(`visibleItemsOf(windowHeightVp=1920, keybo...: actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}VisibleItemsOf_0013 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0014
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0014
     * @tc.desc      visibleItemsOf(windowHeightVp=1920, keyboardHeightVp=96, itemHeightVp=3) returns 608
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0014 begin`);
      const actual: number = visibleItemsOf(1920, 96, 3);
      logInfo(`visibleItemsOf(windowHeightVp=1920, keybo...: actual=${actual}`);
      expect(actual).assertEqual(608);
      logInfo(`${BUNDLE}VisibleItemsOf_0014 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0015
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0015
     * @tc.desc      visibleItemsOf(windowHeightVp=720, keyboardHeightVp=2, itemHeightVp=3) returns 239
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0015 begin`);
      const actual: number = visibleItemsOf(720, 2, 3);
      logInfo(`visibleItemsOf(windowHeightVp=720, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(239);
      logInfo(`${BUNDLE}VisibleItemsOf_0015 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0016
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0016
     * @tc.desc      visibleItemsOf(windowHeightVp=720, keyboardHeightVp=0, itemHeightVp=1) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0016 begin`);
      const actual: number = visibleItemsOf(720, 0, 1);
      logInfo(`visibleItemsOf(windowHeightVp=720, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}VisibleItemsOf_0016 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0017
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0017
     * @tc.desc      visibleItemsOf(windowHeightVp=3, keyboardHeightVp=1, itemHeightVp=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0017 begin`);
      const actual: number = visibleItemsOf(3, 1, 2);
      logInfo(`visibleItemsOf(windowHeightVp=3, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}VisibleItemsOf_0017 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0018
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0018
     * @tc.desc      visibleItemsOf(windowHeightVp=1920, keyboardHeightVp=720, itemHeightVp=2) returns 600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0018 begin`);
      const actual: number = visibleItemsOf(1920, 720, 2);
      logInfo(`visibleItemsOf(windowHeightVp=1920, keybo...: actual=${actual}`);
      expect(actual).assertEqual(600);
      logInfo(`${BUNDLE}VisibleItemsOf_0018 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0019
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0019
     * @tc.desc      visibleItemsOf(windowHeightVp=720, keyboardHeightVp=-1, itemHeightVp=96) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0019 begin`);
      const actual: number = visibleItemsOf(720, -1, 96);
      logInfo(`visibleItemsOf(windowHeightVp=720, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}VisibleItemsOf_0019 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0020
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0020
     * @tc.desc      visibleItemsOf(windowHeightVp=360, keyboardHeightVp=100, itemHeightVp=10) returns 26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0020 begin`);
      const actual: number = visibleItemsOf(360, 100, 10);
      logInfo(`visibleItemsOf(windowHeightVp=360, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(26);
      logInfo(`${BUNDLE}VisibleItemsOf_0020 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0021
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0021
     * @tc.desc      visibleItemsOf(windowHeightVp=1920, keyboardHeightVp=720, itemHeightVp=10) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0021 begin`);
      const actual: number = visibleItemsOf(1920, 720, 10);
      logInfo(`visibleItemsOf(windowHeightVp=1920, keybo...: actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}VisibleItemsOf_0021 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0022
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0022
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=-1, itemHeightVp=100) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0022 begin`);
      const actual: number = visibleItemsOf(1080, -1, 100);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}VisibleItemsOf_0022 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0023
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0023
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=-1, itemHeightVp=1) returns 1081
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0023 begin`);
      const actual: number = visibleItemsOf(1080, -1, 1);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(1081);
      logInfo(`${BUNDLE}VisibleItemsOf_0023 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0024
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0024
     * @tc.desc      visibleItemsOf(windowHeightVp=1920, keyboardHeightVp=96, itemHeightVp=1) returns 1824
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0024 begin`);
      const actual: number = visibleItemsOf(1920, 96, 1);
      logInfo(`visibleItemsOf(windowHeightVp=1920, keybo...: actual=${actual}`);
      expect(actual).assertEqual(1824);
      logInfo(`${BUNDLE}VisibleItemsOf_0024 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0025
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0025
     * @tc.desc      visibleItemsOf(windowHeightVp=1920, keyboardHeightVp=-1, itemHeightVp=1) returns 1921
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0025 begin`);
      const actual: number = visibleItemsOf(1920, -1, 1);
      logInfo(`visibleItemsOf(windowHeightVp=1920, keybo...: actual=${actual}`);
      expect(actual).assertEqual(1921);
      logInfo(`${BUNDLE}VisibleItemsOf_0025 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0026
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0026
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=100, itemHeightVp=1) returns 980
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0026 begin`);
      const actual: number = visibleItemsOf(1080, 100, 1);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(980);
      logInfo(`${BUNDLE}VisibleItemsOf_0026 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0027
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0027
     * @tc.desc      visibleItemsOf(windowHeightVp=360, keyboardHeightVp=-1, itemHeightVp=10) returns 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0027 begin`);
      const actual: number = visibleItemsOf(360, -1, 10);
      logInfo(`visibleItemsOf(windowHeightVp=360, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(36);
      logInfo(`${BUNDLE}VisibleItemsOf_0027 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0028
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0028
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=100, itemHeightVp=100) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0028 begin`);
      const actual: number = visibleItemsOf(1080, 100, 100);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}VisibleItemsOf_0028 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0029
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0029
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=10, itemHeightVp=96) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0029 begin`);
      const actual: number = visibleItemsOf(1080, 10, 96);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}VisibleItemsOf_0029 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0030
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0030
     * @tc.desc      visibleItemsOf(windowHeightVp=1920, keyboardHeightVp=1, itemHeightVp=10) returns 191
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0030 begin`);
      const actual: number = visibleItemsOf(1920, 1, 10);
      logInfo(`visibleItemsOf(windowHeightVp=1920, keybo...: actual=${actual}`);
      expect(actual).assertEqual(191);
      logInfo(`${BUNDLE}VisibleItemsOf_0030 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0031
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0031
     * @tc.desc      visibleItemsOf(windowHeightVp=100, keyboardHeightVp=96, itemHeightVp=1) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0031 begin`);
      const actual: number = visibleItemsOf(100, 96, 1);
      logInfo(`visibleItemsOf(windowHeightVp=100, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}VisibleItemsOf_0031 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0032
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0032
     * @tc.desc      visibleItemsOf(windowHeightVp=1920, keyboardHeightVp=360, itemHeightVp=100) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0032 begin`);
      const actual: number = visibleItemsOf(1920, 360, 100);
      logInfo(`visibleItemsOf(windowHeightVp=1920, keybo...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}VisibleItemsOf_0032 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0033
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0033
     * @tc.desc      visibleItemsOf(windowHeightVp=360, keyboardHeightVp=1, itemHeightVp=2) returns 179
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0033 begin`);
      const actual: number = visibleItemsOf(360, 1, 2);
      logInfo(`visibleItemsOf(windowHeightVp=360, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(179);
      logInfo(`${BUNDLE}VisibleItemsOf_0033 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0034
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0034
     * @tc.desc      visibleItemsOf(windowHeightVp=720, keyboardHeightVp=100, itemHeightVp=3) returns 206
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0034 begin`);
      const actual: number = visibleItemsOf(720, 100, 3);
      logInfo(`visibleItemsOf(windowHeightVp=720, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(206);
      logInfo(`${BUNDLE}VisibleItemsOf_0034 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0035
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0035
     * @tc.desc      visibleItemsOf(windowHeightVp=1920, keyboardHeightVp=0, itemHeightVp=3) returns 640
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0035 begin`);
      const actual: number = visibleItemsOf(1920, 0, 3);
      logInfo(`visibleItemsOf(windowHeightVp=1920, keybo...: actual=${actual}`);
      expect(actual).assertEqual(640);
      logInfo(`${BUNDLE}VisibleItemsOf_0035 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0036
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0036
     * @tc.desc      visibleItemsOf(windowHeightVp=1920, keyboardHeightVp=100, itemHeightVp=3) returns 606
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0036 begin`);
      const actual: number = visibleItemsOf(1920, 100, 3);
      logInfo(`visibleItemsOf(windowHeightVp=1920, keybo...: actual=${actual}`);
      expect(actual).assertEqual(606);
      logInfo(`${BUNDLE}VisibleItemsOf_0036 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0037
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0037
     * @tc.desc      visibleItemsOf(windowHeightVp=10, keyboardHeightVp=0, itemHeightVp=2) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0037 begin`);
      const actual: number = visibleItemsOf(10, 0, 2);
      logInfo(`visibleItemsOf(windowHeightVp=10, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}VisibleItemsOf_0037 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0038
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0038
     * @tc.desc      visibleItemsOf(windowHeightVp=360, keyboardHeightVp=10, itemHeightVp=1) returns 350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0038 begin`);
      const actual: number = visibleItemsOf(360, 10, 1);
      logInfo(`visibleItemsOf(windowHeightVp=360, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(350);
      logInfo(`${BUNDLE}VisibleItemsOf_0038 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0039
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0039
     * @tc.desc      visibleItemsOf(windowHeightVp=10, keyboardHeightVp=1, itemHeightVp=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0039 begin`);
      const actual: number = visibleItemsOf(10, 1, 3);
      logInfo(`visibleItemsOf(windowHeightVp=10, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}VisibleItemsOf_0039 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0040
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0040
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=2, itemHeightVp=1) returns 1078
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0040 begin`);
      const actual: number = visibleItemsOf(1080, 2, 1);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(1078);
      logInfo(`${BUNDLE}VisibleItemsOf_0040 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0041
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0041
     * @tc.desc      visibleItemsOf(windowHeightVp=1920, keyboardHeightVp=3, itemHeightVp=3) returns 639
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0041 begin`);
      const actual: number = visibleItemsOf(1920, 3, 3);
      logInfo(`visibleItemsOf(windowHeightVp=1920, keybo...: actual=${actual}`);
      expect(actual).assertEqual(639);
      logInfo(`${BUNDLE}VisibleItemsOf_0041 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0042
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0042
     * @tc.desc      visibleItemsOf(windowHeightVp=360, keyboardHeightVp=96, itemHeightVp=3) returns 88
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0042 begin`);
      const actual: number = visibleItemsOf(360, 96, 3);
      logInfo(`visibleItemsOf(windowHeightVp=360, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(88);
      logInfo(`${BUNDLE}VisibleItemsOf_0042 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0043
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0043
     * @tc.desc      visibleItemsOf(windowHeightVp=1920, keyboardHeightVp=0, itemHeightVp=1) returns 1920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0043 begin`);
      const actual: number = visibleItemsOf(1920, 0, 1);
      logInfo(`visibleItemsOf(windowHeightVp=1920, keybo...: actual=${actual}`);
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}VisibleItemsOf_0043 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0044
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0044
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=96, itemHeightVp=10) returns 98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0044 begin`);
      const actual: number = visibleItemsOf(1080, 96, 10);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(98);
      logInfo(`${BUNDLE}VisibleItemsOf_0044 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0045
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0045
     * @tc.desc      visibleItemsOf(windowHeightVp=96, keyboardHeightVp=1, itemHeightVp=3) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0045 begin`);
      const actual: number = visibleItemsOf(96, 1, 3);
      logInfo(`visibleItemsOf(windowHeightVp=96, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}VisibleItemsOf_0045 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0046
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0046
     * @tc.desc      visibleItemsOf(windowHeightVp=1920, keyboardHeightVp=720, itemHeightVp=3) returns 400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0046 begin`);
      const actual: number = visibleItemsOf(1920, 720, 3);
      logInfo(`visibleItemsOf(windowHeightVp=1920, keybo...: actual=${actual}`);
      expect(actual).assertEqual(400);
      logInfo(`${BUNDLE}VisibleItemsOf_0046 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0047
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0047
     * @tc.desc      visibleItemsOf(windowHeightVp=720, keyboardHeightVp=0, itemHeightVp=3) returns 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0047 begin`);
      const actual: number = visibleItemsOf(720, 0, 3);
      logInfo(`visibleItemsOf(windowHeightVp=720, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`${BUNDLE}VisibleItemsOf_0047 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0048
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0048
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=100, itemHeightVp=2) returns 490
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0048 begin`);
      const actual: number = visibleItemsOf(1080, 100, 2);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(490);
      logInfo(`${BUNDLE}VisibleItemsOf_0048 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0049
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0049
     * @tc.desc      visibleItemsOf(windowHeightVp=100, keyboardHeightVp=10, itemHeightVp=3) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0049 begin`);
      const actual: number = visibleItemsOf(100, 10, 3);
      logInfo(`visibleItemsOf(windowHeightVp=100, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}VisibleItemsOf_0049 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0050
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0050
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=-1, itemHeightVp=2) returns 540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0050 begin`);
      const actual: number = visibleItemsOf(1080, -1, 2);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(540);
      logInfo(`${BUNDLE}VisibleItemsOf_0050 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0051
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0051
     * @tc.desc      visibleItemsOf(windowHeightVp=1920, keyboardHeightVp=-1, itemHeightVp=100) returns 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0051 begin`);
      const actual: number = visibleItemsOf(1920, -1, 100);
      logInfo(`visibleItemsOf(windowHeightVp=1920, keybo...: actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}VisibleItemsOf_0051 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0052
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0052
     * @tc.desc      visibleItemsOf(windowHeightVp=100, keyboardHeightVp=2, itemHeightVp=2) returns 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0052 begin`);
      const actual: number = visibleItemsOf(100, 2, 2);
      logInfo(`visibleItemsOf(windowHeightVp=100, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(49);
      logInfo(`${BUNDLE}VisibleItemsOf_0052 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0053
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0053
     * @tc.desc      visibleItemsOf(windowHeightVp=720, keyboardHeightVp=96, itemHeightVp=2) returns 312
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0053 begin`);
      const actual: number = visibleItemsOf(720, 96, 2);
      logInfo(`visibleItemsOf(windowHeightVp=720, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(312);
      logInfo(`${BUNDLE}VisibleItemsOf_0053 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0054
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0054
     * @tc.desc      visibleItemsOf(windowHeightVp=360, keyboardHeightVp=96, itemHeightVp=2) returns 132
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0054 begin`);
      const actual: number = visibleItemsOf(360, 96, 2);
      logInfo(`visibleItemsOf(windowHeightVp=360, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(132);
      logInfo(`${BUNDLE}VisibleItemsOf_0054 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0055
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0055
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=100, itemHeightVp=3) returns 326
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0055 begin`);
      const actual: number = visibleItemsOf(1080, 100, 3);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(326);
      logInfo(`${BUNDLE}VisibleItemsOf_0055 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0056
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0056
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=1, itemHeightVp=1) returns 1079
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0056 begin`);
      const actual: number = visibleItemsOf(1080, 1, 1);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(1079);
      logInfo(`${BUNDLE}VisibleItemsOf_0056 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0057
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0057
     * @tc.desc      visibleItemsOf(windowHeightVp=360, keyboardHeightVp=96, itemHeightVp=1) returns 264
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0057 begin`);
      const actual: number = visibleItemsOf(360, 96, 1);
      logInfo(`visibleItemsOf(windowHeightVp=360, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(264);
      logInfo(`${BUNDLE}VisibleItemsOf_0057 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0058
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0058
     * @tc.desc      visibleItemsOf(windowHeightVp=360, keyboardHeightVp=1, itemHeightVp=3) returns 119
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0058 begin`);
      const actual: number = visibleItemsOf(360, 1, 3);
      logInfo(`visibleItemsOf(windowHeightVp=360, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(119);
      logInfo(`${BUNDLE}VisibleItemsOf_0058 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0059
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0059
     * @tc.desc      visibleItemsOf(windowHeightVp=1920, keyboardHeightVp=720, itemHeightVp=100) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0059 begin`);
      const actual: number = visibleItemsOf(1920, 720, 100);
      logInfo(`visibleItemsOf(windowHeightVp=1920, keybo...: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}VisibleItemsOf_0059 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0060
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0060
     * @tc.desc      visibleItemsOf(windowHeightVp=720, keyboardHeightVp=1, itemHeightVp=1) returns 719
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0060 begin`);
      const actual: number = visibleItemsOf(720, 1, 1);
      logInfo(`visibleItemsOf(windowHeightVp=720, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(719);
      logInfo(`${BUNDLE}VisibleItemsOf_0060 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0061
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0061
     * @tc.desc      visibleItemsOf(windowHeightVp=100, keyboardHeightVp=10, itemHeightVp=2) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0061 begin`);
      const actual: number = visibleItemsOf(100, 10, 2);
      logInfo(`visibleItemsOf(windowHeightVp=100, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}VisibleItemsOf_0061 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0062
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0062
     * @tc.desc      visibleItemsOf(windowHeightVp=100, keyboardHeightVp=1, itemHeightVp=1) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0062 begin`);
      const actual: number = visibleItemsOf(100, 1, 1);
      logInfo(`visibleItemsOf(windowHeightVp=100, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}VisibleItemsOf_0062 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0063
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0063
     * @tc.desc      visibleItemsOf(windowHeightVp=96, keyboardHeightVp=3, itemHeightVp=1) returns 93
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0063 begin`);
      const actual: number = visibleItemsOf(96, 3, 1);
      logInfo(`visibleItemsOf(windowHeightVp=96, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(93);
      logInfo(`${BUNDLE}VisibleItemsOf_0063 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0064
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0064
     * @tc.desc      visibleItemsOf(windowHeightVp=1920, keyboardHeightVp=1080, itemHeightVp=3) returns 280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0064 begin`);
      const actual: number = visibleItemsOf(1920, 1080, 3);
      logInfo(`visibleItemsOf(windowHeightVp=1920, keybo...: actual=${actual}`);
      expect(actual).assertEqual(280);
      logInfo(`${BUNDLE}VisibleItemsOf_0064 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0065
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0065
     * @tc.desc      visibleItemsOf(windowHeightVp=96, keyboardHeightVp=3, itemHeightVp=2) returns 46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0065 begin`);
      const actual: number = visibleItemsOf(96, 3, 2);
      logInfo(`visibleItemsOf(windowHeightVp=96, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(46);
      logInfo(`${BUNDLE}VisibleItemsOf_0065 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0066
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0066
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=3, itemHeightVp=3) returns 359
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0066 begin`);
      const actual: number = visibleItemsOf(1080, 3, 3);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(359);
      logInfo(`${BUNDLE}VisibleItemsOf_0066 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0067
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0067
     * @tc.desc      visibleItemsOf(windowHeightVp=96, keyboardHeightVp=2, itemHeightVp=1) returns 94
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0067 begin`);
      const actual: number = visibleItemsOf(96, 2, 1);
      logInfo(`visibleItemsOf(windowHeightVp=96, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(94);
      logInfo(`${BUNDLE}VisibleItemsOf_0067 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0068
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0068
     * @tc.desc      visibleItemsOf(windowHeightVp=720, keyboardHeightVp=96, itemHeightVp=3) returns 208
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0068 begin`);
      const actual: number = visibleItemsOf(720, 96, 3);
      logInfo(`visibleItemsOf(windowHeightVp=720, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(208);
      logInfo(`${BUNDLE}VisibleItemsOf_0068 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0069
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0069
     * @tc.desc      visibleItemsOf(windowHeightVp=1920, keyboardHeightVp=360, itemHeightVp=96) returns 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0069 begin`);
      const actual: number = visibleItemsOf(1920, 360, 96);
      logInfo(`visibleItemsOf(windowHeightVp=1920, keybo...: actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}VisibleItemsOf_0069 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0070
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0070
     * @tc.desc      visibleItemsOf(windowHeightVp=360, keyboardHeightVp=10, itemHeightVp=3) returns 116
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0070 begin`);
      const actual: number = visibleItemsOf(360, 10, 3);
      logInfo(`visibleItemsOf(windowHeightVp=360, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(116);
      logInfo(`${BUNDLE}VisibleItemsOf_0070 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0071
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0071
     * @tc.desc      visibleItemsOf(windowHeightVp=1920, keyboardHeightVp=360, itemHeightVp=10) returns 156
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0071 begin`);
      const actual: number = visibleItemsOf(1920, 360, 10);
      logInfo(`visibleItemsOf(windowHeightVp=1920, keybo...: actual=${actual}`);
      expect(actual).assertEqual(156);
      logInfo(`${BUNDLE}VisibleItemsOf_0071 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0072
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0072
     * @tc.desc      visibleItemsOf(windowHeightVp=720, keyboardHeightVp=100, itemHeightVp=100) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0072 begin`);
      const actual: number = visibleItemsOf(720, 100, 100);
      logInfo(`visibleItemsOf(windowHeightVp=720, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}VisibleItemsOf_0072 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0073
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0073
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=1, itemHeightVp=10) returns 107
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0073 begin`);
      const actual: number = visibleItemsOf(1080, 1, 10);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(107);
      logInfo(`${BUNDLE}VisibleItemsOf_0073 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0074
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0074
     * @tc.desc      visibleItemsOf(windowHeightVp=720, keyboardHeightVp=100, itemHeightVp=10) returns 62
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0074 begin`);
      const actual: number = visibleItemsOf(720, 100, 10);
      logInfo(`visibleItemsOf(windowHeightVp=720, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(62);
      logInfo(`${BUNDLE}VisibleItemsOf_0074 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0075
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0075
     * @tc.desc      visibleItemsOf(windowHeightVp=96, keyboardHeightVp=1, itemHeightVp=2) returns 47
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0075 begin`);
      const actual: number = visibleItemsOf(96, 1, 2);
      logInfo(`visibleItemsOf(windowHeightVp=96, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(47);
      logInfo(`${BUNDLE}VisibleItemsOf_0075 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0076
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0076
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=720, itemHeightVp=2) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0076 begin`);
      const actual: number = visibleItemsOf(1080, 720, 2);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}VisibleItemsOf_0076 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0077
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0077
     * @tc.desc      visibleItemsOf(windowHeightVp=360, keyboardHeightVp=100, itemHeightVp=2) returns 130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0077 begin`);
      const actual: number = visibleItemsOf(360, 100, 2);
      logInfo(`visibleItemsOf(windowHeightVp=360, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(130);
      logInfo(`${BUNDLE}VisibleItemsOf_0077 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0078
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0078
     * @tc.desc      visibleItemsOf(windowHeightVp=1, keyboardHeightVp=0, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0078 begin`);
      const actual: number = visibleItemsOf(1, 0, 0);
      logInfo(`visibleItemsOf(windowHeightVp=1, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0078 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0079
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0079
     * @tc.desc      visibleItemsOf(windowHeightVp=-1, keyboardHeightVp=0, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0079 begin`);
      const actual: number = visibleItemsOf(-1, 0, 0);
      logInfo(`visibleItemsOf(windowHeightVp=-1, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0079 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0080
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0080
     * @tc.desc      visibleItemsOf(windowHeightVp=100, keyboardHeightVp=0, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0080 begin`);
      const actual: number = visibleItemsOf(100, 0, 0);
      logInfo(`visibleItemsOf(windowHeightVp=100, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0080 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0081
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0081
     * @tc.desc      visibleItemsOf(windowHeightVp=360, keyboardHeightVp=0, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0081 begin`);
      const actual: number = visibleItemsOf(360, 0, 0);
      logInfo(`visibleItemsOf(windowHeightVp=360, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0081 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0082
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0082
     * @tc.desc      visibleItemsOf(windowHeightVp=720, keyboardHeightVp=0, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0082 begin`);
      const actual: number = visibleItemsOf(720, 0, 0);
      logInfo(`visibleItemsOf(windowHeightVp=720, keyboa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0082 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0083
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0083
     * @tc.desc      visibleItemsOf(windowHeightVp=1080, keyboardHeightVp=0, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0083 begin`);
      const actual: number = visibleItemsOf(1080, 0, 0);
      logInfo(`visibleItemsOf(windowHeightVp=1080, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0083 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0084
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0084
     * @tc.desc      visibleItemsOf(windowHeightVp=1920, keyboardHeightVp=0, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0084 begin`);
      const actual: number = visibleItemsOf(1920, 0, 0);
      logInfo(`visibleItemsOf(windowHeightVp=1920, keybo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0084 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0085
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0085
     * @tc.desc      visibleItemsOf(windowHeightVp=2, keyboardHeightVp=0, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0085 begin`);
      const actual: number = visibleItemsOf(2, 0, 0);
      logInfo(`visibleItemsOf(windowHeightVp=2, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0085 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0086
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0086
     * @tc.desc      visibleItemsOf(windowHeightVp=3, keyboardHeightVp=0, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0086 begin`);
      const actual: number = visibleItemsOf(3, 0, 0);
      logInfo(`visibleItemsOf(windowHeightVp=3, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0086 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0087
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0087
     * @tc.desc      visibleItemsOf(windowHeightVp=10, keyboardHeightVp=0, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0087 begin`);
      const actual: number = visibleItemsOf(10, 0, 0);
      logInfo(`visibleItemsOf(windowHeightVp=10, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0087 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0088
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0088
     * @tc.desc      visibleItemsOf(windowHeightVp=96, keyboardHeightVp=0, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0088 begin`);
      const actual: number = visibleItemsOf(96, 0, 0);
      logInfo(`visibleItemsOf(windowHeightVp=96, keyboar...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0088 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0089
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0089
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=1, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0089 begin`);
      const actual: number = visibleItemsOf(0, 1, 0);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0089 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0090
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0090
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=-1, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_VisibleItemsOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0090 begin`);
      const actual: number = visibleItemsOf(0, -1, 0);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0090 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0091
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0091
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=100, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0091 begin`);
      const actual: number = visibleItemsOf(0, 100, 0);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0091 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0092
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0092
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=360, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0092 begin`);
      const actual: number = visibleItemsOf(0, 360, 0);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0092 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0093
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0093
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=720, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0093 begin`);
      const actual: number = visibleItemsOf(0, 720, 0);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0093 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0094
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0094
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=1080, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0094 begin`);
      const actual: number = visibleItemsOf(0, 1080, 0);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0094 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0095
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0095
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=1920, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0095 begin`);
      const actual: number = visibleItemsOf(0, 1920, 0);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0095 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_VISIBLE_ITEMS_OF_0096
     * @tc.name      KeyboardAvoid_VisibleItemsOf_0096
     * @tc.desc      visibleItemsOf(windowHeightVp=0, keyboardHeightVp=2, itemHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_VisibleItemsOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}VisibleItemsOf_0096 begin`);
      const actual: number = visibleItemsOf(0, 2, 0);
      logInfo(`visibleItemsOf(windowHeightVp=0, keyboard...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}VisibleItemsOf_0096 end`);
    });
  });
}
