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
import { KeyboardAvoidState } from '../model/KeyboardAvoidLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_KeyboardAvoid]';
const BUNDLE: string = 'KeyboardAvoid_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for KeyboardAvoidState.contentHeight (90 cases). */
export default function keyboardAvoidStateContentHeightTest(): void {
  describe('KeyboardAvoidStateContentHeightTest', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0001
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0001
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=0) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0001 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(0);
      logInfo(`contentHeight(windowHeightVp=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0001 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0002
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0002
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=57) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0002 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(57);
      logInfo(`contentHeight(windowHeightVp=57): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0002 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0003
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0003
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=112) yields 56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0003 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(112);
      logInfo(`contentHeight(windowHeightVp=112): actual=${actual}`);
      expect(actual).assertEqual(56);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0003 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0004
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0004
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=100) yields 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0004 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(100);
      logInfo(`contentHeight(windowHeightVp=100): actual=${actual}`);
      expect(actual).assertEqual(44);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0004 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0005
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0005
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=360) yields 304
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0005 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(360);
      logInfo(`contentHeight(windowHeightVp=360): actual=${actual}`);
      expect(actual).assertEqual(304);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0005 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0006
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0006
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=720) yields 664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0006 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(720);
      logInfo(`contentHeight(windowHeightVp=720): actual=${actual}`);
      expect(actual).assertEqual(664);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0006 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0007
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0007
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1080) yields 1024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0007 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1080);
      logInfo(`contentHeight(windowHeightVp=1080): actual=${actual}`);
      expect(actual).assertEqual(1024);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0007 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0008
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0008
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1920) yields 1864
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0008 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1920);
      logInfo(`contentHeight(windowHeightVp=1920): actual=${actual}`);
      expect(actual).assertEqual(1864);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0008 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0009
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0009
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=96) yields 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0009 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(96);
      logInfo(`contentHeight(windowHeightVp=96): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0009 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0010
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0010
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=192) yields 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0010 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(192);
      logInfo(`contentHeight(windowHeightVp=192): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0010 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0011
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0011
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=288) yields 232
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0011 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(288);
      logInfo(`contentHeight(windowHeightVp=288): actual=${actual}`);
      expect(actual).assertEqual(232);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0011 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0012
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0012
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=384) yields 328
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0012 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(384);
      logInfo(`contentHeight(windowHeightVp=384): actual=${actual}`);
      expect(actual).assertEqual(328);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0012 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0013
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0013
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=480) yields 424
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0013 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(480);
      logInfo(`contentHeight(windowHeightVp=480): actual=${actual}`);
      expect(actual).assertEqual(424);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0013 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0014
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0014
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=576) yields 520
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0014 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(576);
      logInfo(`contentHeight(windowHeightVp=576): actual=${actual}`);
      expect(actual).assertEqual(520);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0014 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0015
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0015
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=672) yields 616
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0015 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(672);
      logInfo(`contentHeight(windowHeightVp=672): actual=${actual}`);
      expect(actual).assertEqual(616);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0015 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0016
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0016
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=768) yields 712
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0016 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(768);
      logInfo(`contentHeight(windowHeightVp=768): actual=${actual}`);
      expect(actual).assertEqual(712);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0016 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0017
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0017
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=864) yields 808
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0017 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(864);
      logInfo(`contentHeight(windowHeightVp=864): actual=${actual}`);
      expect(actual).assertEqual(808);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0017 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0018
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0018
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=960) yields 904
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0018 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(960);
      logInfo(`contentHeight(windowHeightVp=960): actual=${actual}`);
      expect(actual).assertEqual(904);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0018 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0019
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0019
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1056) yields 1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0019 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1056);
      logInfo(`contentHeight(windowHeightVp=1056): actual=${actual}`);
      expect(actual).assertEqual(1000);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0019 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0020
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0020
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1152) yields 1096
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0020 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1152);
      logInfo(`contentHeight(windowHeightVp=1152): actual=${actual}`);
      expect(actual).assertEqual(1096);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0020 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0021
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0021
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1248) yields 1192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0021 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1248);
      logInfo(`contentHeight(windowHeightVp=1248): actual=${actual}`);
      expect(actual).assertEqual(1192);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0021 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0022
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0022
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1344) yields 1288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0022 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1344);
      logInfo(`contentHeight(windowHeightVp=1344): actual=${actual}`);
      expect(actual).assertEqual(1288);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0022 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0023
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0023
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1440) yields 1384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0023 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1440);
      logInfo(`contentHeight(windowHeightVp=1440): actual=${actual}`);
      expect(actual).assertEqual(1384);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0023 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0024
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0024
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1536) yields 1480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0024 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1536);
      logInfo(`contentHeight(windowHeightVp=1536): actual=${actual}`);
      expect(actual).assertEqual(1480);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0024 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0025
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0025
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1632) yields 1576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0025 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1632);
      logInfo(`contentHeight(windowHeightVp=1632): actual=${actual}`);
      expect(actual).assertEqual(1576);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0025 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0026
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0026
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1728) yields 1672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0026 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1728);
      logInfo(`contentHeight(windowHeightVp=1728): actual=${actual}`);
      expect(actual).assertEqual(1672);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0026 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0027
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0027
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1824) yields 1768
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0027 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1824);
      logInfo(`contentHeight(windowHeightVp=1824): actual=${actual}`);
      expect(actual).assertEqual(1768);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0027 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0028
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0028
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=2016) yields 1960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0028 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(2016);
      logInfo(`contentHeight(windowHeightVp=2016): actual=${actual}`);
      expect(actual).assertEqual(1960);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0028 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0029
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0029
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=2112) yields 2056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0029 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(2112);
      logInfo(`contentHeight(windowHeightVp=2112): actual=${actual}`);
      expect(actual).assertEqual(2056);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0029 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0030
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0030
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=2208) yields 2152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0030 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(2208);
      logInfo(`contentHeight(windowHeightVp=2208): actual=${actual}`);
      expect(actual).assertEqual(2152);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0030 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0031
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0031
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=2304) yields 2248
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0031 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(2304);
      logInfo(`contentHeight(windowHeightVp=2304): actual=${actual}`);
      expect(actual).assertEqual(2248);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0031 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0032
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0032
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=2400) yields 2344
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0032 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(2400);
      logInfo(`contentHeight(windowHeightVp=2400): actual=${actual}`);
      expect(actual).assertEqual(2344);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0032 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0033
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0033
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=2496) yields 2440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0033 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(2496);
      logInfo(`contentHeight(windowHeightVp=2496): actual=${actual}`);
      expect(actual).assertEqual(2440);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0033 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0034
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0034
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=2592) yields 2536
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0034 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(2592);
      logInfo(`contentHeight(windowHeightVp=2592): actual=${actual}`);
      expect(actual).assertEqual(2536);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0034 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0035
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0035
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=2688) yields 2632
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0035 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(2688);
      logInfo(`contentHeight(windowHeightVp=2688): actual=${actual}`);
      expect(actual).assertEqual(2632);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0035 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0036
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0036
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=2784) yields 2728
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0036 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(2784);
      logInfo(`contentHeight(windowHeightVp=2784): actual=${actual}`);
      expect(actual).assertEqual(2728);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0036 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0037
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0037
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=2880) yields 2824
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0037 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(2880);
      logInfo(`contentHeight(windowHeightVp=2880): actual=${actual}`);
      expect(actual).assertEqual(2824);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0037 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0038
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0038
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=2976) yields 2920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0038 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(2976);
      logInfo(`contentHeight(windowHeightVp=2976): actual=${actual}`);
      expect(actual).assertEqual(2920);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0038 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0039
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0039
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=3072) yields 3016
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0039 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(3072);
      logInfo(`contentHeight(windowHeightVp=3072): actual=${actual}`);
      expect(actual).assertEqual(3016);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0039 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0040
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0040
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=3168) yields 3112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0040 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(3168);
      logInfo(`contentHeight(windowHeightVp=3168): actual=${actual}`);
      expect(actual).assertEqual(3112);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0040 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0041
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0041
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=3264) yields 3208
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0041 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(3264);
      logInfo(`contentHeight(windowHeightVp=3264): actual=${actual}`);
      expect(actual).assertEqual(3208);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0041 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0042
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0042
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=3360) yields 3304
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0042 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(3360);
      logInfo(`contentHeight(windowHeightVp=3360): actual=${actual}`);
      expect(actual).assertEqual(3304);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0042 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0043
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0043
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=3456) yields 3400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0043 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(3456);
      logInfo(`contentHeight(windowHeightVp=3456): actual=${actual}`);
      expect(actual).assertEqual(3400);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0043 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0044
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0044
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=3552) yields 3496
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0044 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(3552);
      logInfo(`contentHeight(windowHeightVp=3552): actual=${actual}`);
      expect(actual).assertEqual(3496);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0044 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0045
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0045
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=3648) yields 3592
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0045 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(3648);
      logInfo(`contentHeight(windowHeightVp=3648): actual=${actual}`);
      expect(actual).assertEqual(3592);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0045 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0046
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0046
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=3744) yields 3688
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0046 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(3744);
      logInfo(`contentHeight(windowHeightVp=3744): actual=${actual}`);
      expect(actual).assertEqual(3688);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0046 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0047
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0047
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=3840) yields 3784
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0047 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(3840);
      logInfo(`contentHeight(windowHeightVp=3840): actual=${actual}`);
      expect(actual).assertEqual(3784);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0047 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0048
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0048
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1113.46) yields 1057.46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0048 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1113.46);
      logInfo(`contentHeight(windowHeightVp=1113.46): actual=${actual}`);
      expect(actual).assertClose(1057.46, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0048 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0049
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0049
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1002.5) yields 946.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0049 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1002.5);
      logInfo(`contentHeight(windowHeightVp=1002.5): actual=${actual}`);
      expect(actual).assertClose(946.5, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0049 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0050
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0050
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=922) yields 866
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0050 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(922);
      logInfo(`contentHeight(windowHeightVp=922): actual=${actual}`);
      expect(actual).assertEqual(866);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0050 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0051
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0051
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=709.03) yields 653.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0051 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(709.03);
      logInfo(`contentHeight(windowHeightVp=709.03): actual=${actual}`);
      expect(actual).assertClose(653.03, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0051 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0052
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0052
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=3594) yields 3538
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0052 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(3594);
      logInfo(`contentHeight(windowHeightVp=3594): actual=${actual}`);
      expect(actual).assertEqual(3538);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0052 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0053
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0053
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=2664) yields 2608
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0053 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(2664);
      logInfo(`contentHeight(windowHeightVp=2664): actual=${actual}`);
      expect(actual).assertEqual(2608);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0053 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0054
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0054
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1132) yields 1076
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0054 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1132);
      logInfo(`contentHeight(windowHeightVp=1132): actual=${actual}`);
      expect(actual).assertEqual(1076);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0054 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0055
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0055
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1827) yields 1771
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0055 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1827);
      logInfo(`contentHeight(windowHeightVp=1827): actual=${actual}`);
      expect(actual).assertEqual(1771);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0055 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0056
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0056
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1516.13) yields 1460.13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0056 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1516.13);
      logInfo(`contentHeight(windowHeightVp=1516.13): actual=${actual}`);
      expect(actual).assertClose(1460.13, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0056 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0057
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0057
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=2035) yields 1979
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0057 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(2035);
      logInfo(`contentHeight(windowHeightVp=2035): actual=${actual}`);
      expect(actual).assertEqual(1979);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0057 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0058
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0058
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=719) yields 663
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0058 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(719);
      logInfo(`contentHeight(windowHeightVp=719): actual=${actual}`);
      expect(actual).assertEqual(663);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0058 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0059
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0059
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1752) yields 1696
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0059 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1752);
      logInfo(`contentHeight(windowHeightVp=1752): actual=${actual}`);
      expect(actual).assertEqual(1696);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0059 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0060
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0060
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=65) yields 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0060 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(65);
      logInfo(`contentHeight(windowHeightVp=65): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0060 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0061
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0061
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1150) yields 1094
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0061 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1150);
      logInfo(`contentHeight(windowHeightVp=1150): actual=${actual}`);
      expect(actual).assertEqual(1094);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0061 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0062
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0062
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=3305) yields 3249
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0062 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(3305);
      logInfo(`contentHeight(windowHeightVp=3305): actual=${actual}`);
      expect(actual).assertEqual(3249);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0062 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0063
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0063
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=99) yields 43
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0063 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(99);
      logInfo(`contentHeight(windowHeightVp=99): actual=${actual}`);
      expect(actual).assertEqual(43);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0063 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0064
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0064
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=567.43) yields 511.42999999999995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0064 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(567.43);
      logInfo(`contentHeight(windowHeightVp=567.43): actual=${actual}`);
      expect(actual).assertClose(511.42999999999995, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0064 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0065
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0065
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1951) yields 1895
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0065 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1951);
      logInfo(`contentHeight(windowHeightVp=1951): actual=${actual}`);
      expect(actual).assertEqual(1895);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0065 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0066
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0066
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=3089) yields 3033
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0066 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(3089);
      logInfo(`contentHeight(windowHeightVp=3089): actual=${actual}`);
      expect(actual).assertEqual(3033);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0066 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0067
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0067
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=171) yields 115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0067 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(171);
      logInfo(`contentHeight(windowHeightVp=171): actual=${actual}`);
      expect(actual).assertEqual(115);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0067 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0068
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0068
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=323.3) yields 267.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0068 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(323.3);
      logInfo(`contentHeight(windowHeightVp=323.3): actual=${actual}`);
      expect(actual).assertClose(267.3, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0068 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0069
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0069
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=394.32) yields 338.32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0069 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(394.32);
      logInfo(`contentHeight(windowHeightVp=394.32): actual=${actual}`);
      expect(actual).assertClose(338.32, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0069 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0070
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0070
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=695) yields 639
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0070 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(695);
      logInfo(`contentHeight(windowHeightVp=695): actual=${actual}`);
      expect(actual).assertEqual(639);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0070 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0071
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0071
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1318) yields 1262
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0071 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1318);
      logInfo(`contentHeight(windowHeightVp=1318): actual=${actual}`);
      expect(actual).assertEqual(1262);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0071 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0072
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0072
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1234) yields 1178
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0072 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1234);
      logInfo(`contentHeight(windowHeightVp=1234): actual=${actual}`);
      expect(actual).assertEqual(1178);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0072 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0073
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0073
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=228.94) yields 172.94
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0073 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(228.94);
      logInfo(`contentHeight(windowHeightVp=228.94): actual=${actual}`);
      expect(actual).assertClose(172.94, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0073 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0074
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0074
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=2616) yields 2560
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0074 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(2616);
      logInfo(`contentHeight(windowHeightVp=2616): actual=${actual}`);
      expect(actual).assertEqual(2560);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0074 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0075
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0075
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=904) yields 848
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0075 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(904);
      logInfo(`contentHeight(windowHeightVp=904): actual=${actual}`);
      expect(actual).assertEqual(848);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0075 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0076
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0076
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=3347) yields 3291
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0076 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(3347);
      logInfo(`contentHeight(windowHeightVp=3347): actual=${actual}`);
      expect(actual).assertEqual(3291);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0076 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0077
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0077
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=995.75) yields 939.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0077 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(995.75);
      logInfo(`contentHeight(windowHeightVp=995.75): actual=${actual}`);
      expect(actual).assertClose(939.75, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0077 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0078
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0078
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=504.23) yields 448.23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0078 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(504.23);
      logInfo(`contentHeight(windowHeightVp=504.23): actual=${actual}`);
      expect(actual).assertClose(448.23, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0078 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0079
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0079
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1337) yields 1281
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0079 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1337);
      logInfo(`contentHeight(windowHeightVp=1337): actual=${actual}`);
      expect(actual).assertEqual(1281);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0079 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0080
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0080
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1506.24) yields 1450.24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0080 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1506.24);
      logInfo(`contentHeight(windowHeightVp=1506.24): actual=${actual}`);
      expect(actual).assertClose(1450.24, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0080 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0081
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0081
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1649.55) yields 1593.55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0081 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1649.55);
      logInfo(`contentHeight(windowHeightVp=1649.55): actual=${actual}`);
      expect(actual).assertClose(1593.55, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0081 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0082
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0082
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=147) yields 91
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0082 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(147);
      logInfo(`contentHeight(windowHeightVp=147): actual=${actual}`);
      expect(actual).assertEqual(91);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0082 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0083
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0083
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1907) yields 1851
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0083 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1907);
      logInfo(`contentHeight(windowHeightVp=1907): actual=${actual}`);
      expect(actual).assertEqual(1851);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0083 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0084
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0084
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=368) yields 312
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0084 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(368);
      logInfo(`contentHeight(windowHeightVp=368): actual=${actual}`);
      expect(actual).assertEqual(312);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0084 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0085
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0085
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=3051) yields 2995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0085 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(3051);
      logInfo(`contentHeight(windowHeightVp=3051): actual=${actual}`);
      expect(actual).assertEqual(2995);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0085 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0086
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0086
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=2669) yields 2613
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0086 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(2669);
      logInfo(`contentHeight(windowHeightVp=2669): actual=${actual}`);
      expect(actual).assertEqual(2613);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0086 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0087
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0087
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1411.25) yields 1355.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0087 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1411.25);
      logInfo(`contentHeight(windowHeightVp=1411.25): actual=${actual}`);
      expect(actual).assertClose(1355.25, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0087 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0088
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0088
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=2844) yields 2788
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0088 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(2844);
      logInfo(`contentHeight(windowHeightVp=2844): actual=${actual}`);
      expect(actual).assertEqual(2788);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0088 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0089
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0089
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=225) yields 169
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0089 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(225);
      logInfo(`contentHeight(windowHeightVp=225): actual=${actual}`);
      expect(actual).assertEqual(169);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0089 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0090
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0090
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=556.05) yields 500.04999999999995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0090 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(556.05);
      logInfo(`contentHeight(windowHeightVp=556.05): actual=${actual}`);
      expect(actual).assertClose(500.04999999999995, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0090 end`);
    });
  });
}
