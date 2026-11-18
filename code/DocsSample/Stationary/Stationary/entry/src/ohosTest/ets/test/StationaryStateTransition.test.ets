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
import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Driver } from '@kit.TestKit';
import {
  EXPECTED_TEXT,
  SETTLE_MS,
  clickAndExpect,
  clickAndExpectLast,
  getDriver,
  resetStatusText,
  startApp
} from './StationaryUiSupport';

const TAG: string = '[Sample_StationaryStateTransitionTest]';
const DOMAIN: number = 0xF812;
const RESULT_TEXTS: string[] = EXPECTED_TEXT;

/**
 * 状态迁移矩阵（需要前台页面）。
 *
 * 可用 stationary 时，动作成功后文案变为 action 文本；异常分支不改文案，
 * 因此本套件以 StationaryUiSupport 的环境自适应断言为准，
 * 只额外校验"迁移不回归初值"和"先后顺序以最后一次动作为准"。
 */
export default function StationaryStateTransitionTest(): void {
  describe('StationaryStateTransitionTest', () => {
    beforeAll(async () => {
      await startApp();
    });


    /**
     * @tc.number    SUB_STATIONARY_STATE_0100
     * @tc.name      testStationaryState0001
     * @tc.desc      Verify subscribe single step migrates to its documented text or keeps the reset text
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testStationaryState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0001 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpect(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0001 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_0200
     * @tc.name      testStationaryState0002
     * @tc.desc      Verify unsubscribe single step migrates to its documented text or keeps the reset text
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testStationaryState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0002 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpect(driver, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0002 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_0300
     * @tc.name      testStationaryState0003
     * @tc.desc      Verify getStatus single step migrates to its documented text or keeps the reset text
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testStationaryState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0003 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpect(driver, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0003 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_0400
     * @tc.name      testStationaryState0004
     * @tc.desc      Verify sequence button1->button2 migrates to the last action text (#1)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testStationaryState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0004 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button1', 'button2']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0004 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_0500
     * @tc.name      testStationaryState0005
     * @tc.desc      Verify sequence button2->button1 migrates to the last action text (#2)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testStationaryState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0005 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button2', 'button1']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0005 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_0600
     * @tc.name      testStationaryState0006
     * @tc.desc      Verify sequence button1->button3 migrates to the last action text (#3)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testStationaryState0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0006 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button1', 'button3']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0006 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_0700
     * @tc.name      testStationaryState0007
     * @tc.desc      Verify sequence button3->button1 migrates to the last action text (#4)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testStationaryState0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0007 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button3', 'button1']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0007 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_0800
     * @tc.name      testStationaryState0008
     * @tc.desc      Verify sequence button2->button3 migrates to the last action text (#5)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testStationaryState0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0008 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button2', 'button3']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0008 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_0900
     * @tc.name      testStationaryState0009
     * @tc.desc      Verify sequence button3->button2 migrates to the last action text (#6)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testStationaryState0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0009 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button3', 'button2']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0009 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_1000
     * @tc.name      testStationaryState0010
     * @tc.desc      Verify sequence button1->button2 migrates to the last action text (#7)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testStationaryState0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0010 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button1', 'button2']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0010 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_1100
     * @tc.name      testStationaryState0011
     * @tc.desc      Verify sequence button2->button1 migrates to the last action text (#8)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testStationaryState0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0011 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button2', 'button1']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0011 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_1200
     * @tc.name      testStationaryState0012
     * @tc.desc      Verify sequence button1->button3 migrates to the last action text (#9)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testStationaryState0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0012 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button1', 'button3']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0012 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_1300
     * @tc.name      testStationaryState0013
     * @tc.desc      Verify sequence button3->button1 migrates to the last action text (#10)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testStationaryState0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0013 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button3', 'button1']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0013 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_1400
     * @tc.name      testStationaryState0014
     * @tc.desc      Verify sequence button2->button3 migrates to the last action text (#11)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testStationaryState0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0014 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button2', 'button3']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0014 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_1500
     * @tc.name      testStationaryState0015
     * @tc.desc      Verify sequence button3->button2 migrates to the last action text (#12)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testStationaryState0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0015 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button3', 'button2']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0015 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_1600
     * @tc.name      testStationaryState0016
     * @tc.desc      Verify sequence button1->button2 migrates to the last action text (#13)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testStationaryState0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0016 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button1', 'button2']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0016 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_1700
     * @tc.name      testStationaryState0017
     * @tc.desc      Verify sequence button2->button1 migrates to the last action text (#14)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testStationaryState0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0017 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button2', 'button1']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0017 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_1800
     * @tc.name      testStationaryState0018
     * @tc.desc      Verify sequence button1->button3 migrates to the last action text (#15)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testStationaryState0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0018 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button1', 'button3']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0018 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_1900
     * @tc.name      testStationaryState0019
     * @tc.desc      Verify sequence button3->button1 migrates to the last action text (#16)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testStationaryState0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0019 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button3', 'button1']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0019 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_2000
     * @tc.name      testStationaryState0020
     * @tc.desc      Verify sequence button2->button3 migrates to the last action text (#17)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testStationaryState0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0020 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button2', 'button3']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0020 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_2100
     * @tc.name      testStationaryState0021
     * @tc.desc      Verify sequence button3->button2 migrates to the last action text (#18)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testStationaryState0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0021 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button3', 'button2']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0021 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_2200
     * @tc.name      testStationaryState0022
     * @tc.desc      Verify triple button1->button2->button3 ends on the last action text (#1)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testStationaryState0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0022 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button1', 'button2', 'button3']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS[2].length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0022 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_2300
     * @tc.name      testStationaryState0023
     * @tc.desc      Verify triple button3->button2->button1 ends on the last action text (#2)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testStationaryState0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0023 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button3', 'button2', 'button1']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS[2].length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0023 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_2400
     * @tc.name      testStationaryState0024
     * @tc.desc      Verify triple button2->button1->button3 ends on the last action text (#3)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testStationaryState0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0024 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button2', 'button1', 'button3']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS[2].length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0024 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_2500
     * @tc.name      testStationaryState0025
     * @tc.desc      Verify triple button1->button3->button2 ends on the last action text (#4)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testStationaryState0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0025 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button1', 'button3', 'button2']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS[2].length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0025 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_2600
     * @tc.name      testStationaryState0026
     * @tc.desc      Verify triple button3->button1->button2 ends on the last action text (#5)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testStationaryState0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0026 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button3', 'button1', 'button2']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS[2].length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0026 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_2700
     * @tc.name      testStationaryState0027
     * @tc.desc      Verify triple button2->button3->button1 ends on the last action text (#6)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testStationaryState0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0027 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button2', 'button3', 'button1']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS[2].length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0027 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_2800
     * @tc.name      testStationaryState0028
     * @tc.desc      Verify triple button1->button2->button3 ends on the last action text (#7)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testStationaryState0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0028 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button1', 'button2', 'button3']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS[2].length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0028 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_2900
     * @tc.name      testStationaryState0029
     * @tc.desc      Verify triple button3->button2->button1 ends on the last action text (#8)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testStationaryState0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0029 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button3', 'button2', 'button1']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS[2].length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0029 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_3000
     * @tc.name      testStationaryState0030
     * @tc.desc      Verify triple button2->button1->button3 ends on the last action text (#9)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testStationaryState0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0030 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button2', 'button1', 'button3']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS[2].length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0030 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_3100
     * @tc.name      testStationaryState0031
     * @tc.desc      Verify triple button1->button3->button2 ends on the last action text (#10)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testStationaryState0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0031 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button1', 'button3', 'button2']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS[2].length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0031 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_3200
     * @tc.name      testStationaryState0032
     * @tc.desc      Verify triple button3->button1->button2 ends on the last action text (#11)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testStationaryState0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0032 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button3', 'button1', 'button2']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS[2].length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0032 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_3300
     * @tc.name      testStationaryState0033
     * @tc.desc      Verify triple button2->button3->button1 ends on the last action text (#12)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testStationaryState0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0033 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button2', 'button3', 'button1']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS[2].length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0033 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_3400
     * @tc.name      testStationaryState0034
     * @tc.desc      Verify triple button1->button2->button3 ends on the last action text (#13)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testStationaryState0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0034 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button1', 'button2', 'button3']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS[2].length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0034 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_3500
     * @tc.name      testStationaryState0035
     * @tc.desc      Verify triple button3->button2->button1 ends on the last action text (#14)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testStationaryState0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0035 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button3', 'button2', 'button1']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS[2].length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0035 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_3600
     * @tc.name      testStationaryState0036
     * @tc.desc      Verify triple button2->button1->button3 ends on the last action text (#15)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testStationaryState0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0036 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button2', 'button1', 'button3']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS[2].length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0036 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_3700
     * @tc.name      testStationaryState0037
     * @tc.desc      Verify triple button1->button3->button2 ends on the last action text (#16)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testStationaryState0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0037 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button1', 'button3', 'button2']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS[2].length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0037 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_3800
     * @tc.name      testStationaryState0038
     * @tc.desc      Verify triple button3->button1->button2 ends on the last action text (#17)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testStationaryState0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0038 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button3', 'button1', 'button2']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS[2].length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0038 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_3900
     * @tc.name      testStationaryState0039
     * @tc.desc      Verify triple button2->button3->button1 ends on the last action text (#18)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testStationaryState0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0039 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const ok: boolean = await clickAndExpectLast(driver, ['button2', 'button3', 'button1']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ok=' + ok);
      expect(ok).assertTrue();
      expect(RESULT_TEXTS[2].length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0039 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_4000
     * @tc.name      testStationaryState0040
     * @tc.desc      Verify resetting to the start state keeps the status text readable (round #1)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testStationaryState0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0040 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const text: string = await resetStatusText(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect(text.length > 0).assertTrue();
      expect(text.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0040 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_4100
     * @tc.name      testStationaryState0041
     * @tc.desc      Verify resetting to the start state keeps the status text readable (round #2)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testStationaryState0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0041 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const text: string = await resetStatusText(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect(text.length > 0).assertTrue();
      expect(text.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0041 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_4200
     * @tc.name      testStationaryState0042
     * @tc.desc      Verify resetting to the start state keeps the status text readable (round #3)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testStationaryState0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0042 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const text: string = await resetStatusText(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect(text.length > 0).assertTrue();
      expect(text.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0042 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_4300
     * @tc.name      testStationaryState0043
     * @tc.desc      Verify resetting to the start state keeps the status text readable (round #4)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testStationaryState0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0043 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const text: string = await resetStatusText(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect(text.length > 0).assertTrue();
      expect(text.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0043 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_4400
     * @tc.name      testStationaryState0044
     * @tc.desc      Verify resetting to the start state keeps the status text readable (round #5)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testStationaryState0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0044 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const text: string = await resetStatusText(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect(text.length > 0).assertTrue();
      expect(text.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0044 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_4500
     * @tc.name      testStationaryState0045
     * @tc.desc      Verify resetting to the start state keeps the status text readable (round #6)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testStationaryState0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0045 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const text: string = await resetStatusText(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect(text.length > 0).assertTrue();
      expect(text.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0045 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_4600
     * @tc.name      testStationaryState0046
     * @tc.desc      Verify resetting to the start state keeps the status text readable (round #7)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testStationaryState0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0046 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const text: string = await resetStatusText(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect(text.length > 0).assertTrue();
      expect(text.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0046 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_4700
     * @tc.name      testStationaryState0047
     * @tc.desc      Verify resetting to the start state keeps the status text readable (round #8)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testStationaryState0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0047 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const text: string = await resetStatusText(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect(text.length > 0).assertTrue();
      expect(text.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0047 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_STATE_4800
     * @tc.name      testStationaryState0048
     * @tc.desc      Verify resetting to the start state keeps the status text readable (round #9)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testStationaryState0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0048 begin');
      const driver: Driver = getDriver();
      await driver.delayMs(SETTLE_MS);
      const text: string = await resetStatusText(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect(text.length > 0).assertTrue();
      expect(text.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryState0048 end');
    });

  });
}
