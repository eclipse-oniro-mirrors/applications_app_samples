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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Constants } from '../../../main/ets/bridge/ImmersiveBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'ImmersiveConstantsCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function immersiveConstantsCoreTest(): void {
  describe('ImmersiveConstantsCoreTest', () => {
    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0001
     * @tc.name      testImmersiveConst0001
     * @tc.desc      Verify NUMBER_1 keeps its declared value of 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0001 begin');
      const value: number = Constants.NUMBER_1;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=1`);
      expect(value).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testImmersiveConst0001 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0002
     * @tc.name      testImmersiveConst0002
     * @tc.desc      Verify NUMBER_2 keeps its declared value of 1 as in source.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0002 begin');
      const value: number = Constants.NUMBER_2;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=1`);
      expect(value).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testImmersiveConst0002 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0003
     * @tc.name      testImmersiveConst0003
     * @tc.desc      Verify NUMBER_6 keeps its declared value of 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0003 begin');
      const value: number = Constants.NUMBER_6;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=6`);
      expect(value).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testImmersiveConst0003 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0004
     * @tc.name      testImmersiveConst0004
     * @tc.desc      Verify NUMBER_10 keeps its declared value of 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0004 begin');
      const value: number = Constants.NUMBER_10;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=10`);
      expect(value).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testImmersiveConst0004 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0005
     * @tc.name      testImmersiveConst0005
     * @tc.desc      Verify NUMBER_20 keeps its declared value of 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0005 begin');
      const value: number = Constants.NUMBER_20;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=20`);
      expect(value).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testImmersiveConst0005 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0006
     * @tc.name      testImmersiveConst0006
     * @tc.desc      Verify NUMBER_16 keeps its declared value of 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0006 begin');
      const value: number = Constants.NUMBER_16;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=16`);
      expect(value).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testImmersiveConst0006 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0007
     * @tc.name      testImmersiveConst0007
     * @tc.desc      Verify NUMBER_17 keeps its declared value of 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0007 begin');
      const value: number = Constants.NUMBER_17;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=17`);
      expect(value).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testImmersiveConst0007 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0008
     * @tc.name      testImmersiveConst0008
     * @tc.desc      Verify NUMBER_700 keeps its declared value of 700.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0008 begin');
      const value: number = Constants.NUMBER_700;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=700`);
      expect(value).assertEqual(700);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testImmersiveConst0008 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0009
     * @tc.name      testImmersiveConst0009
     * @tc.desc      Verify WARN_TOAST_DURATION equals 800.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0009 begin');
      const value: number = Constants.WARN_TOAST_DURATION;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=800`);
      expect(value).assertEqual(800);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testImmersiveConst0009 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0010
     * @tc.name      testImmersiveConst0010
     * @tc.desc      Verify TEST_COMMENTS_COUNT equals 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0010 begin');
      const value: number = Constants.TEST_COMMENTS_COUNT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=10`);
      expect(value).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testImmersiveConst0010 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0011
     * @tc.name      testImmersiveConst0011
     * @tc.desc      Verify COMMENTS_LIST_CACHE equals 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0011 begin');
      const value: number = Constants.COMMENTS_LIST_CACHE;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=5`);
      expect(value).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testImmersiveConst0011 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0012
     * @tc.name      testImmersiveConst0012
     * @tc.desc      Verify COMMENTS_DEFAULT_USERNAME equals the declared buyer label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0012 begin');
      const value: string = Constants.COMMENTS_DEFAULT_USERNAME;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='\u4e70\u5bb6'`);
      expect(value).assertEqual('\u4e70\u5bb6');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testImmersiveConst0012 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0013
     * @tc.name      testImmersiveConst0013
     * @tc.desc      Verify COMMENT_SPACE equals 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0013 begin');
      const value: number = Constants.COMMENT_SPACE;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=10`);
      expect(value).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testImmersiveConst0013 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0014
     * @tc.name      testImmersiveConst0014
     * @tc.desc      Verify COMMENT_ITEM_SPACE equals 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0014 begin');
      const value: number = Constants.COMMENT_ITEM_SPACE;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=8`);
      expect(value).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testImmersiveConst0014 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0015
     * @tc.name      testImmersiveConst0015
     * @tc.desc      Verify COMMENT_CONTENT_SPACE equals 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0015 begin');
      const value: number = Constants.COMMENT_CONTENT_SPACE;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=5`);
      expect(value).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testImmersiveConst0015 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0016
     * @tc.name      testImmersiveConst0016
     * @tc.desc      Verify COMMENT_DIALOG_SCALE equals 0.67.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0016 begin');
      const value: number = Constants.COMMENT_DIALOG_SCALE;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=0.67`);
      expect(value).assertEqual(0.67);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testImmersiveConst0016 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0017
     * @tc.name      testImmersiveConst0017
     * @tc.desc      Verify COMMENT_DIALOG_CLOSE_DURATION equals 300.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0017 begin');
      const value: number = Constants.COMMENT_DIALOG_CLOSE_DURATION;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=300`);
      expect(value).assertEqual(300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testImmersiveConst0017 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0018
     * @tc.name      testImmersiveConst0018
     * @tc.desc      Verify COMMENT_DIALOG_TRANS_DURATION equals 300.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0018 begin');
      const value: number = Constants.COMMENT_DIALOG_TRANS_DURATION;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=300`);
      expect(value).assertEqual(300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testImmersiveConst0018 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0019
     * @tc.name      testImmersiveConst0019
     * @tc.desc      Verify COMMENT_DIALOG_MIN_HEIGHT equals 250.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0019 begin');
      const value: number = Constants.COMMENT_DIALOG_MIN_HEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=250`);
      expect(value).assertEqual(250);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testImmersiveConst0019 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0020
     * @tc.name      testImmersiveConst0020
     * @tc.desc      Verify COMMENT_DIALOG_RECOVERY_TIME equals 400.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0020 begin');
      const value: number = Constants.COMMENT_DIALOG_RECOVERY_TIME;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=400`);
      expect(value).assertEqual(400);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testImmersiveConst0020 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0021
     * @tc.name      testImmersiveConst0021
     * @tc.desc      Verify COMMENT_PAN_GESTURE_DISTANCE equals 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0021 begin');
      const value: number = Constants.COMMENT_PAN_GESTURE_DISTANCE;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=20`);
      expect(value).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testImmersiveConst0021 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0022
     * @tc.name      testImmersiveConst0022
     * @tc.desc      Verify BOTTOM_STATUS_HEIGHT equals 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0022 begin');
      const value: number = Constants.BOTTOM_STATUS_HEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=25`);
      expect(value).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testImmersiveConst0022 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0023
     * @tc.name      testImmersiveConst0023
     * @tc.desc      Verify all NUMBER_* members keep number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0023 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Constants.NUMBER_1=${typeof Constants.NUMBER_1}`);
      expect(typeof Constants.NUMBER_1).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Constants.NUMBER_2=${typeof Constants.NUMBER_2}`);
      expect(typeof Constants.NUMBER_2).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Constants.NUMBER_6=${typeof Constants.NUMBER_6}`);
      expect(typeof Constants.NUMBER_6).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Constants.NUMBER_10=${typeof Constants.NUMBER_10}`);
      expect(typeof Constants.NUMBER_10).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Constants.NUMBER_20=${typeof Constants.NUMBER_20}`);
      expect(typeof Constants.NUMBER_20).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Constants.NUMBER_16=${typeof Constants.NUMBER_16}`);
      expect(typeof Constants.NUMBER_16).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Constants.NUMBER_17=${typeof Constants.NUMBER_17}`);
      expect(typeof Constants.NUMBER_17).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Constants.NUMBER_700=${typeof Constants.NUMBER_700}`);
      expect(typeof Constants.NUMBER_700).assertEqual('number');
      log('testImmersiveConst0023 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0024
     * @tc.name      testImmersiveConst0024
     * @tc.desc      Verify animation duration constants are finite positive numbers.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0024 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Number.isFinite(Constants.WARN_TOAST_DURATION)}`);
      expect(Number.isFinite(Constants.WARN_TOAST_DURATION)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Number.isFinite(Constants.COMMENT_DIALOG_CLOSE_DURATION)`);
      expect(Number.isFinite(Constants.COMMENT_DIALOG_CLOSE_DURATION)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Number.isFinite(Constants.COMMENT_DIALOG_TRANS_DURATION)`);
      expect(Number.isFinite(Constants.COMMENT_DIALOG_TRANS_DURATION)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Number.isFinite(Constants.COMMENT_DIALOG_RECOVERY_TIME)`);
      expect(Number.isFinite(Constants.COMMENT_DIALOG_RECOVERY_TIME)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Constants.WARN_TOAST_DURATION > 0}`);
      expect(Constants.WARN_TOAST_DURATION > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Constants.COMMENT_DIALOG_CLOSE_DURATION > 0}`);
      expect(Constants.COMMENT_DIALOG_CLOSE_DURATION > 0).assertTrue();
      log('testImmersiveConst0024 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0025
     * @tc.name      testImmersiveConst0025
     * @tc.desc      Verify spacing constants are all positive numbers.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0025 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Constants.COMMENT_SPACE > 0=${Constants.COMMENT_SPACE > 0}`);
      expect(Constants.COMMENT_SPACE > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Constants.COMMENT_ITEM_SPACE > 0}`);
      expect(Constants.COMMENT_ITEM_SPACE > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Constants.COMMENT_CONTENT_SPACE > 0}`);
      expect(Constants.COMMENT_CONTENT_SPACE > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Constants.BOTTOM_STATUS_HEIGHT > 0}`);
      expect(Constants.BOTTOM_STATUS_HEIGHT > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Constants.COMMENT_PAN_GESTURE_DISTANCE > 0}`);
      expect(Constants.COMMENT_PAN_GESTURE_DISTANCE > 0).assertTrue();
      log('testImmersiveConst0025 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0026
     * @tc.name      testImmersiveConst0026
     * @tc.desc      Verify dialog scale is strictly between 0 and 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0026 begin');
      const scale: number = Constants.COMMENT_DIALOG_SCALE;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue scale > 0=${scale > 0}`);
      expect(scale > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue scale < 1=${scale < 1}`);
      expect(scale < 1).assertTrue();
      log('testImmersiveConst0026 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0027
     * @tc.name      testImmersiveConst0027
     * @tc.desc      Verify repeated reads of constants stay consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0027 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Constants.TEST_COMMENTS_COUNT === Constants.TEST_COMMENTS_...`);
      expect(Constants.TEST_COMMENTS_COUNT === Constants.TEST_COMMENTS_COUNT).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Constants.COMMENT_DIALOG_SCALE === Constants.COMMENT_DIALO...`);
      expect(Constants.COMMENT_DIALOG_SCALE === Constants.COMMENT_DIALOG_SCALE).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Constants.NUMBER_10 === Constants.NUMBER_10}`);
      expect(Constants.NUMBER_10 === Constants.NUMBER_10).assertTrue();
      log('testImmersiveConst0027 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0028
     * @tc.name      testImmersiveConst0028
     * @tc.desc      Verify default comment username is a non-empty string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0028 begin');
      const username: string = Constants.COMMENTS_DEFAULT_USERNAME;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue username.length > 0=${username.length > 0}`);
      expect(username.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof username=${typeof username}, expected='string'`);
      expect(typeof username).assertEqual('string');
      log('testImmersiveConst0028 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0029
     * @tc.name      testImmersiveConst0029
     * @tc.desc      Verify animation durations stay in a reasonable range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0029 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Constants.WARN_TOAST_DURATION >= 100}`);
      expect(Constants.WARN_TOAST_DURATION >= 100).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Constants.COMMENT_DIALOG_CLOSE_DURATION >= 100}`);
      expect(Constants.COMMENT_DIALOG_CLOSE_DURATION >= 100).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Constants.COMMENT_DIALOG_TRANS_DURATION >= 100}`);
      expect(Constants.COMMENT_DIALOG_TRANS_DURATION >= 100).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Constants.COMMENT_DIALOG_RECOVERY_TIME >= 100}`);
      expect(Constants.COMMENT_DIALOG_RECOVERY_TIME >= 100).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Constants.WARN_TOAST_DURATION <= 5000}`);
      expect(Constants.WARN_TOAST_DURATION <= 5000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Constants.COMMENT_DIALOG_RECOVERY_TIME <= 5000}`);
      expect(Constants.COMMENT_DIALOG_RECOVERY_TIME <= 5000).assertTrue();
      log('testImmersiveConst0029 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CONSTCORE_0030
     * @tc.name      testImmersiveConst0030
     * @tc.desc      Verify large numeric members are distinct and greater than one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImmersiveConst0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImmersiveConst0030 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Constants.NUMBER_10 > 1=${Constants.NUMBER_10 > 1}`);
      expect(Constants.NUMBER_10 > 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Constants.NUMBER_20 > 1=${Constants.NUMBER_20 > 1}`);
      expect(Constants.NUMBER_20 > 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Constants.NUMBER_16 > 1=${Constants.NUMBER_16 > 1}`);
      expect(Constants.NUMBER_16 > 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Constants.NUMBER_17 > 1=${Constants.NUMBER_17 > 1}`);
      expect(Constants.NUMBER_17 > 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Constants.NUMBER_700 > 1=${Constants.NUMBER_700 > 1}`);
      expect(Constants.NUMBER_700 > 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Constants.NUMBER_10 !== Constants.NUMBER_20}`);
      expect(Constants.NUMBER_10 !== Constants.NUMBER_20).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Constants.NUMBER_16 !== Constants.NUMBER_17}`);
      expect(Constants.NUMBER_16 !== Constants.NUMBER_17).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Constants.NUMBER_700 !== Constants.NUMBER_10}`);
      expect(Constants.NUMBER_700 !== Constants.NUMBER_10).assertTrue();
      log('testImmersiveConst0030 end');
    })
  })
}
