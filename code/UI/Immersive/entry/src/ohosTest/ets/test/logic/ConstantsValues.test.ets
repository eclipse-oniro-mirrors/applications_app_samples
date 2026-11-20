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
import { Constants } from '../../../../main/ets/bridge/ImmersiveBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Immersive]';
const BUNDLE: string = 'Immersive_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for Constants (22 cases). */
export default function constantsValuesTest(): void {
  describe('ConstantsValuesTest', (): void => {
    /**
     * @tc.number    SUB_IMMERSIVE_CONSTANTS_VALUES_0001
     * @tc.name      Immersive_ConstantsValues_0001
     * @tc.desc      Constants.NUMBER_1 keeps value 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Immersive_ConstantsValues_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ConstantsValues_0001 begin`);
      const actual: number = Constants.NUMBER_1;
      logInfo(`Constants.NUMBER_1: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ConstantsValues_0001 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTANTS_VALUES_0002
     * @tc.name      Immersive_ConstantsValues_0002
     * @tc.desc      Constants.NUMBER_6 keeps value 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Immersive_ConstantsValues_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ConstantsValues_0002 begin`);
      const actual: number = Constants.NUMBER_6;
      logInfo(`Constants.NUMBER_6: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}ConstantsValues_0002 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTANTS_VALUES_0003
     * @tc.name      Immersive_ConstantsValues_0003
     * @tc.desc      Constants.NUMBER_10 keeps value 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_ConstantsValues_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConstantsValues_0003 begin`);
      const actual: number = Constants.NUMBER_10;
      logInfo(`Constants.NUMBER_10: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ConstantsValues_0003 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTANTS_VALUES_0004
     * @tc.name      Immersive_ConstantsValues_0004
     * @tc.desc      Constants.NUMBER_20 keeps value 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_ConstantsValues_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConstantsValues_0004 begin`);
      const actual: number = Constants.NUMBER_20;
      logInfo(`Constants.NUMBER_20: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}ConstantsValues_0004 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTANTS_VALUES_0005
     * @tc.name      Immersive_ConstantsValues_0005
     * @tc.desc      Constants.NUMBER_16 keeps value 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_ConstantsValues_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConstantsValues_0005 begin`);
      const actual: number = Constants.NUMBER_16;
      logInfo(`Constants.NUMBER_16: actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}ConstantsValues_0005 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTANTS_VALUES_0006
     * @tc.name      Immersive_ConstantsValues_0006
     * @tc.desc      Constants.NUMBER_17 keeps value 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_ConstantsValues_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConstantsValues_0006 begin`);
      const actual: number = Constants.NUMBER_17;
      logInfo(`Constants.NUMBER_17: actual=${actual}`);
      expect(actual).assertEqual(17);
      logInfo(`${BUNDLE}ConstantsValues_0006 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTANTS_VALUES_0007
     * @tc.name      Immersive_ConstantsValues_0007
     * @tc.desc      Constants.NUMBER_700 keeps value 700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_ConstantsValues_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConstantsValues_0007 begin`);
      const actual: number = Constants.NUMBER_700;
      logInfo(`Constants.NUMBER_700: actual=${actual}`);
      expect(actual).assertEqual(700);
      logInfo(`${BUNDLE}ConstantsValues_0007 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTANTS_VALUES_0008
     * @tc.name      Immersive_ConstantsValues_0008
     * @tc.desc      Constants.WARN_TOAST_DURATION keeps value 800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_ConstantsValues_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConstantsValues_0008 begin`);
      const actual: number = Constants.WARN_TOAST_DURATION;
      logInfo(`Constants.WARN_TOAST_DURATION: actual=${actual}`);
      expect(actual).assertEqual(800);
      logInfo(`${BUNDLE}ConstantsValues_0008 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTANTS_VALUES_0009
     * @tc.name      Immersive_ConstantsValues_0009
     * @tc.desc      Constants.COMMENTS_LIST_CACHE keeps value 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_ConstantsValues_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConstantsValues_0009 begin`);
      const actual: number = Constants.COMMENTS_LIST_CACHE;
      logInfo(`Constants.COMMENTS_LIST_CACHE: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ConstantsValues_0009 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTANTS_VALUES_0010
     * @tc.name      Immersive_ConstantsValues_0010
     * @tc.desc      Constants.COMMENTS_DEFAULT_USERNAME keeps value "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_ConstantsValues_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConstantsValues_0010 begin`);
      const actual: string = Constants.COMMENTS_DEFAULT_USERNAME;
      logInfo(`Constants.COMMENTS_DEFAULT_USERNAME: actual=${actual}`);
      expect(actual).assertEqual('\u4e70\u5bb6');
      logInfo(`${BUNDLE}ConstantsValues_0010 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTANTS_VALUES_0011
     * @tc.name      Immersive_ConstantsValues_0011
     * @tc.desc      Constants.COMMENT_ITEM_SPACE keeps value 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_ConstantsValues_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConstantsValues_0011 begin`);
      const actual: number = Constants.COMMENT_ITEM_SPACE;
      logInfo(`Constants.COMMENT_ITEM_SPACE: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}ConstantsValues_0011 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTANTS_VALUES_0012
     * @tc.name      Immersive_ConstantsValues_0012
     * @tc.desc      Constants.COMMENT_DIALOG_SCALE keeps value 0.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_ConstantsValues_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConstantsValues_0012 begin`);
      const actual: number = Constants.COMMENT_DIALOG_SCALE;
      logInfo(`Constants.COMMENT_DIALOG_SCALE: actual=${actual}`);
      expect(actual).assertClose(0.67, PRECISION);
      logInfo(`${BUNDLE}ConstantsValues_0012 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTANTS_VALUES_0013
     * @tc.name      Immersive_ConstantsValues_0013
     * @tc.desc      Constants.COMMENT_DIALOG_CLOSE_DURATION keeps value 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_ConstantsValues_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConstantsValues_0013 begin`);
      const actual: number = Constants.COMMENT_DIALOG_CLOSE_DURATION;
      logInfo(`Constants.COMMENT_DIALOG_CLOSE_DURATION: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}ConstantsValues_0013 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTANTS_VALUES_0014
     * @tc.name      Immersive_ConstantsValues_0014
     * @tc.desc      Constants.COMMENT_DIALOG_MIN_HEIGHT keeps value 250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_ConstantsValues_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConstantsValues_0014 begin`);
      const actual: number = Constants.COMMENT_DIALOG_MIN_HEIGHT;
      logInfo(`Constants.COMMENT_DIALOG_MIN_HEIGHT: actual=${actual}`);
      expect(actual).assertEqual(250);
      logInfo(`${BUNDLE}ConstantsValues_0014 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTANTS_VALUES_0015
     * @tc.name      Immersive_ConstantsValues_0015
     * @tc.desc      Constants.COMMENT_DIALOG_RECOVERY_TIME keeps value 400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_ConstantsValues_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConstantsValues_0015 begin`);
      const actual: number = Constants.COMMENT_DIALOG_RECOVERY_TIME;
      logInfo(`Constants.COMMENT_DIALOG_RECOVERY_TIME: actual=${actual}`);
      expect(actual).assertEqual(400);
      logInfo(`${BUNDLE}ConstantsValues_0015 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTANTS_VALUES_0016
     * @tc.name      Immersive_ConstantsValues_0016
     * @tc.desc      Constants.BOTTOM_STATUS_HEIGHT keeps value 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_ConstantsValues_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConstantsValues_0016 begin`);
      const actual: number = Constants.BOTTOM_STATUS_HEIGHT;
      logInfo(`Constants.BOTTOM_STATUS_HEIGHT: actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}ConstantsValues_0016 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTANTS_VALUES_0017
     * @tc.name      Immersive_ConstantsValues_0017
     * @tc.desc      Constants.NUMBER_2 keeps value 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_ConstantsValues_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConstantsValues_0017 begin`);
      const actual: number = Constants.NUMBER_2;
      logInfo(`Constants.NUMBER_2: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ConstantsValues_0017 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTANTS_VALUES_0018
     * @tc.name      Immersive_ConstantsValues_0018
     * @tc.desc      Constants.TEST_COMMENTS_COUNT keeps value 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_ConstantsValues_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConstantsValues_0018 begin`);
      const actual: number = Constants.TEST_COMMENTS_COUNT;
      logInfo(`Constants.TEST_COMMENTS_COUNT: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ConstantsValues_0018 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTANTS_VALUES_0019
     * @tc.name      Immersive_ConstantsValues_0019
     * @tc.desc      Constants.COMMENT_SPACE keeps value 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_ConstantsValues_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConstantsValues_0019 begin`);
      const actual: number = Constants.COMMENT_SPACE;
      logInfo(`Constants.COMMENT_SPACE: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ConstantsValues_0019 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTANTS_VALUES_0020
     * @tc.name      Immersive_ConstantsValues_0020
     * @tc.desc      Constants.COMMENT_CONTENT_SPACE keeps value 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_ConstantsValues_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConstantsValues_0020 begin`);
      const actual: number = Constants.COMMENT_CONTENT_SPACE;
      logInfo(`Constants.COMMENT_CONTENT_SPACE: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ConstantsValues_0020 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTANTS_VALUES_0021
     * @tc.name      Immersive_ConstantsValues_0021
     * @tc.desc      Constants.COMMENT_DIALOG_TRANS_DURATION keeps value 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_ConstantsValues_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConstantsValues_0021 begin`);
      const actual: number = Constants.COMMENT_DIALOG_TRANS_DURATION;
      logInfo(`Constants.COMMENT_DIALOG_TRANS_DURATION: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}ConstantsValues_0021 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTANTS_VALUES_0022
     * @tc.name      Immersive_ConstantsValues_0022
     * @tc.desc      Constants.COMMENT_PAN_GESTURE_DISTANCE keeps value 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_ConstantsValues_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConstantsValues_0022 begin`);
      const actual: number = Constants.COMMENT_PAN_GESTURE_DISTANCE;
      logInfo(`Constants.COMMENT_PAN_GESTURE_DISTANCE: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}ConstantsValues_0022 end`);
    });
  });
}
