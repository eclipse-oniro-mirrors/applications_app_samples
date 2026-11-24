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

import { describe, beforeAll, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Driver, Component, ON } from '@ohos.UiTest';
import { launchEntryAbility, getDriver, clickUiIfFound, waitForUiComponent, findUiOrNull } from './CryptoVolumeHelper';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CryptoFramework]';

export default function uiSeqTest() {
  describe('UiSeq', () => {

    beforeAll(async () => {
      // 套件只拉起一次应用，用例间由 afterEach 复位到加密 tab
      const launched: boolean = await launchEntryAbility();
      if (launched) {
        await getDriver().delayMs(1500);
      }
    });

    afterEach(async () => {
      // 每个用例结束切回加密 tab，保证用例间界面状态独立
      const driver: Driver = getDriver();
      const tab0: Component | null = await findUiOrNull(driver, ON.id('0'));
      if (tab0 !== null) {
        await tab0.click();
        await driver.delayMs(300);
      } else {
        // tab 栏不可达说明界面被系统弹层占用，按返回并重新拉起恢复已知状态
        try {
          await driver.pressBack();
        } catch (e) {
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'pressBack skipped');
        }
        const launched: boolean = await launchEntryAbility();
        if (launched) {
          await driver.delayMs(1500);
        }
      }
    });

    /**
     * @tc.name   testUiSeq0001
     * @tc.number SUB_CryptoFramework_UISEQ_01_0001
     * @tc.desc   tab 0 to button encryptionBtn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0001 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '0');
      const actResult: Component | null = await waitForUiComponent(driver, 'encryptionBtn');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0001 end');
    });

    /**
     * @tc.name   testUiSeq0002
     * @tc.number SUB_CryptoFramework_UISEQ_01_0002
     * @tc.desc   tab 1 to button decryptionBtn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0002 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '1');
      const actResult: Component | null = await waitForUiComponent(driver, 'decryptionBtn');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0002 end');
    });

    /**
     * @tc.name   testUiSeq0003
     * @tc.number SUB_CryptoFramework_UISEQ_01_0003
     * @tc.desc   tab 2 to button signBtn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0003 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '2');
      const actResult: Component | null = await waitForUiComponent(driver, 'signBtn');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0003 end');
    });

    /**
     * @tc.name   testUiSeq0004
     * @tc.number SUB_CryptoFramework_UISEQ_01_0004
     * @tc.desc   tab 3 to button verifyBtn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0004 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '3');
      const actResult: Component | null = await waitForUiComponent(driver, 'verifyBtn');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0004 end');
    });

    /**
     * @tc.name   testUiSeq0005
     * @tc.number SUB_CryptoFramework_UISEQ_01_0005
     * @tc.desc   tab 0 to button encryptAesGenKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0005 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '0');
      const actResult: Component | null = await waitForUiComponent(driver, 'encryptAesGenKey');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0005 end');
    });

    /**
     * @tc.name   testUiSeq0006
     * @tc.number SUB_CryptoFramework_UISEQ_01_0006
     * @tc.desc   tab 2 to button encryptRsaGenKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0006 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '2');
      const actResult: Component | null = await waitForUiComponent(driver, 'encryptRsaGenKey');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0006 end');
    });

    /**
     * @tc.name   testUiSeq0007
     * @tc.number SUB_CryptoFramework_UISEQ_01_0007
     * @tc.desc   tab 1 to button decryptionBtn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0007 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '1');
      const actResult: Component | null = await waitForUiComponent(driver, 'decryptionBtn');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0007 end');
    });

    /**
     * @tc.name   testUiSeq0008
     * @tc.number SUB_CryptoFramework_UISEQ_01_0008
     * @tc.desc   tab 3 to button verifyBtn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0008 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '3');
      const actResult: Component | null = await waitForUiComponent(driver, 'verifyBtn');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0008 end');
    });

    /**
     * @tc.name   testUiSeq0009
     * @tc.number SUB_CryptoFramework_UISEQ_01_0009
     * @tc.desc   tab 0 to button encryptionBtn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0009 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '0');
      const actResult: Component | null = await waitForUiComponent(driver, 'encryptionBtn');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0009 end');
    });

    /**
     * @tc.name   testUiSeq0010
     * @tc.number SUB_CryptoFramework_UISEQ_01_0010
     * @tc.desc   tab 2 to button signBtn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0010 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '2');
      const actResult: Component | null = await waitForUiComponent(driver, 'signBtn');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0010 end');
    });

    /**
     * @tc.name   testUiSeq0011
     * @tc.number SUB_CryptoFramework_UISEQ_01_0011
     * @tc.desc   tab 3 to button verifyBtn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0011 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '3');
      const actResult: Component | null = await waitForUiComponent(driver, 'verifyBtn');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0011 end');
    });

    /**
     * @tc.name   testUiSeq0012
     * @tc.number SUB_CryptoFramework_UISEQ_01_0012
     * @tc.desc   tab 0 to button encryptionBtn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0012 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '0');
      const actResult: Component | null = await waitForUiComponent(driver, 'encryptionBtn');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0012 end');
    });

    /**
     * @tc.name   testUiSeq0013
     * @tc.number SUB_CryptoFramework_UISEQ_01_0013
     * @tc.desc   tab 2 to button encryptRsaGenKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0013 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '2');
      const actResult: Component | null = await waitForUiComponent(driver, 'encryptRsaGenKey');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0013 end');
    });

    /**
     * @tc.name   testUiSeq0014
     * @tc.number SUB_CryptoFramework_UISEQ_01_0014
     * @tc.desc   tab 1 to button decryptionBtn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0014 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '1');
      const actResult: Component | null = await waitForUiComponent(driver, 'decryptionBtn');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0014 end');
    });

    /**
     * @tc.name   testUiSeq0015
     * @tc.number SUB_CryptoFramework_UISEQ_01_0015
     * @tc.desc   tab 0 to button encryptAesGenKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0015 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '0');
      const actResult: Component | null = await waitForUiComponent(driver, 'encryptAesGenKey');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0015 end');
    });

    /**
     * @tc.name   testUiSeq0016
     * @tc.number SUB_CryptoFramework_UISEQ_01_0016
     * @tc.desc   tab 3 to button verifyBtn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0016 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '3');
      const actResult: Component | null = await waitForUiComponent(driver, 'verifyBtn');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0016 end');
    });

    /**
     * @tc.name   testUiSeq0017
     * @tc.number SUB_CryptoFramework_UISEQ_01_0017
     * @tc.desc   tab 1 to button decryptionBtn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0017 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '1');
      const actResult: Component | null = await waitForUiComponent(driver, 'decryptionBtn');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0017 end');
    });

    /**
     * @tc.name   testUiSeq0018
     * @tc.number SUB_CryptoFramework_UISEQ_01_0018
     * @tc.desc   tab 2 to button signBtn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0018 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '2');
      const actResult: Component | null = await waitForUiComponent(driver, 'signBtn');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0018 end');
    });

    /**
     * @tc.name   testUiSeq0019
     * @tc.number SUB_CryptoFramework_UISEQ_01_0019
     * @tc.desc   tab 3 to button verifyBtn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0019 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '3');
      const actResult: Component | null = await waitForUiComponent(driver, 'verifyBtn');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0019 end');
    });

    /**
     * @tc.name   testUiSeq0020
     * @tc.number SUB_CryptoFramework_UISEQ_01_0020
     * @tc.desc   tab 1 to button decryptionBtn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0020 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '1');
      const actResult: Component | null = await waitForUiComponent(driver, 'decryptionBtn');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0020 end');
    });

    /**
     * @tc.name   testUiSeq0021
     * @tc.number SUB_CryptoFramework_UISEQ_01_0021
     * @tc.desc   tab 0 to button encryptionBtn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0021 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '0');
      const actResult: Component | null = await waitForUiComponent(driver, 'encryptionBtn');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0021 end');
    });

    /**
     * @tc.name   testUiSeq0022
     * @tc.number SUB_CryptoFramework_UISEQ_01_0022
     * @tc.desc   tab 3 to button verifyBtn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0022 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '3');
      const actResult: Component | null = await waitForUiComponent(driver, 'verifyBtn');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0022 end');
    });

    /**
     * @tc.name   testUiSeq0023
     * @tc.number SUB_CryptoFramework_UISEQ_01_0023
     * @tc.desc   tab 2 to button signBtn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0023 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '2');
      const actResult: Component | null = await waitForUiComponent(driver, 'signBtn');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0023 end');
    });

    /**
     * @tc.name   testUiSeq0024
     * @tc.number SUB_CryptoFramework_UISEQ_01_0024
     * @tc.desc   tab 0 to button encryptionBtn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0024 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '0');
      const actResult: Component | null = await waitForUiComponent(driver, 'encryptionBtn');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0024 end');
    });

    /**
     * @tc.name   testUiSeq0025
     * @tc.number SUB_CryptoFramework_UISEQ_01_0025
     * @tc.desc   tab 1 to button decryptionBtn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0025 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '1');
      const actResult: Component | null = await waitForUiComponent(driver, 'decryptionBtn');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0025 end');
    });

    /**
     * @tc.name   testUiSeq0026
     * @tc.number SUB_CryptoFramework_UISEQ_01_0026
     * @tc.desc   tab 0 to button encryptionBtn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0026 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '0');
      const actResult: Component | null = await waitForUiComponent(driver, 'encryptionBtn');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0026 end');
    });

    /**
     * @tc.name   testUiSeq0027
     * @tc.number SUB_CryptoFramework_UISEQ_01_0027
     * @tc.desc   tab 2 to button signBtn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0027 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '2');
      const actResult: Component | null = await waitForUiComponent(driver, 'signBtn');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0027 end');
    });

    /**
     * @tc.name   testUiSeq0028
     * @tc.number SUB_CryptoFramework_UISEQ_01_0028
     * @tc.desc   tab 3 to button verifyBtn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0028 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '3');
      const actResult: Component | null = await waitForUiComponent(driver, 'verifyBtn');
      const actClickable: boolean = actResult === null ? false : await actResult.isClickable();
      const result: Component | null = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actClickable));
      expect(actClickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0028 end');
    });

    /**
     * @tc.name   testUiSeq0029
     * @tc.number SUB_CryptoFramework_UISEQ_01_0029
     * @tc.desc   点击加密 tab 后解密页按钮不可定位（跨页负向对照）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0029 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickUiIfFound(driver, '0');
      const encryptBtn: Component | null = await waitForUiComponent(driver, 'encryptionBtn');
      const decryptBtn: Component | null = await findUiOrNull(driver, ON.id('decryptionBtn'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(decryptBtn === null), 'true');
      expect(clicked).assertTrue();
      expect(encryptBtn === null).assertFalse();
      expect(decryptBtn === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0029 end');
    });

  });
}
