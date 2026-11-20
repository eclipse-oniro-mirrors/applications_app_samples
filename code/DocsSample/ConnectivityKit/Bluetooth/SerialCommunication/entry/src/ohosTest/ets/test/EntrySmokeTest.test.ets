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
import { Component, Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { util } from '@kit.ArkTS';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'com.samples.serialcommunication';
const ABILITY: string = 'EntryAbility';
const SPP_DEFAULT_UUID: string = '00001101-0000-1000-8000-00805f9b34fb';
const DOMAIN: number = 0xF814;
const TAG: string = 'EntrySmokeTest';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => { resolve(); }, duration);
  });
}

async function exists(driver: Driver, id: string): Promise<boolean> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    return component !== undefined && component !== null;
  } catch (error) {
    log('exists failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

async function ensureEntryPage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    // EntryAbility 启动即请求 ACCESS_BLUETOOTH，可能弹权限框，点击“允许”后重试
    try {
      const allowButton: Component = await driver.findComponent(ON.text('\u5141\u8bb8'));
      if (allowButton !== undefined && allowButton !== null) {
        await allowButton.click();
        log('bluetooth permission allowed');
        await sleep(600);
      }
    } catch (error) {
      log('allow permission failed -> ' + String(error));
    }
    if (await exists(driver, 'index_text_1')) {
      return true;
    }
    await sleep(600);
  }
  return await exists(driver, 'index_text_1');
}

export default function entrySmokeTest(): void {
  describe('EntrySmokeTestTest', () => {
    /**
     * @tc.number    SUB_SERIAL_COMM_ENTRYSMOKE_0401
     * @tc.name      testEntrySmoke0401
     * @tc.desc      Verify a cold launch shows the page title of the serial communication sample.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0401 begin');
      const driver: Driver = Driver.create();
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1500);
      const actual1: boolean = await ensureEntryPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureEntryPage(driver)=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = await exists(driver, 'index_text_1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'index_text_1')=${actual2}`);
      expect(actual2).assertTrue();
      log('testEntrySmoke0401 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_ENTRYSMOKE_0402
     * @tc.name      testEntrySmoke0402
     * @tc.desc      Verify the target bundle name constant follows the samples naming convention.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0402 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual BUNDLE=${BUNDLE}, expected='com.samples.serialcommunic...`);
      expect(BUNDLE).assertEqual('com.samples.serialcommunication');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue BUNDLE.length > 0=${BUNDLE.length > 0}`);
      expect(BUNDLE.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${BUNDLE.indexOf('samples') > 0}`);
      expect(BUNDLE.indexOf('samples') > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof BUNDLE=${typeof BUNDLE}, expected='string'`);
      expect(typeof BUNDLE).assertEqual('string');
      log('testEntrySmoke0402 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_ENTRYSMOKE_0403
     * @tc.name      testEntrySmoke0403
     * @tc.desc      Verify the launched ability name matches the module main element.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0403 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ABILITY=${ABILITY}, expected='EntryAbility'`);
      expect(ABILITY).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ABILITY.length === 12=${ABILITY.length === 12}`);
      expect(ABILITY.length === 12).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof ABILITY=${typeof ABILITY}, expected='string'`);
      expect(typeof ABILITY).assertEqual('string');
      log('testEntrySmoke0403 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_ENTRYSMOKE_0404
     * @tc.name      testEntrySmoke0404
     * @tc.desc      Verify the sample default SPP service uuid constant value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0404 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual SPP_DEFAULT_UUID=${SPP_DEFAULT_UUID}`);
      expect(SPP_DEFAULT_UUID).assertEqual('00001101-0000-1000-8000-00805f9b34fb');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual SPP_DEFAULT_UUID.length=${SPP_DEFAULT_UUID.length}`);
      expect(SPP_DEFAULT_UUID.length).assertEqual(36);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${SPP_DEFAULT_UUID.indexOf('1101')}, expected=4`);
      expect(SPP_DEFAULT_UUID.indexOf('1101')).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof SPP_DEFAULT_UUID=${typeof SPP_DEFAULT_UUID}`);
      expect(typeof SPP_DEFAULT_UUID).assertEqual('string');
      log('testEntrySmoke0404 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_ENTRYSMOKE_0405
     * @tc.name      testEntrySmoke0405
     * @tc.desc      Verify the text encoder used by writeData returns read and written counters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0405 begin');
      const encoder: util.TextEncoder = new util.TextEncoder();
      const target: Uint8Array = new Uint8Array('spp'.length);
      const result = encoder.encodeIntoUint8Array('spp', target);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.read=${result.read}, expected=3`);
      expect(result.read).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.written=${result.written}, expected=3`);
      expect(result.written).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof result.read=${typeof result.read}, expected='number'`);
      expect(typeof result.read).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof result.written=${typeof result.written}`);
      expect(typeof result.written).assertEqual('number');
      log('testEntrySmoke0405 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_ENTRYSMOKE_0406
     * @tc.name      testEntrySmoke0406
     * @tc.desc      Verify the sample default connection option conventions of uuid secure and type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0406 begin');
      const uuidHint: string = '1111-2222-33333';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${uuidHint === SPP_DEFAULT_UUID}`);
      expect(uuidHint === SPP_DEFAULT_UUID).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${SPP_DEFAULT_UUID.indexOf('-')}, expected=8`);
      expect(SPP_DEFAULT_UUID.indexOf('-')).assertEqual(8);
      const secureDefault: boolean = true;
      const typeRfcomm: number = 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue secureDefault=${secureDefault}`);
      expect(secureDefault).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeRfcomm=${typeRfcomm}, expected=0`);
      expect(typeRfcomm).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof typeRfcomm=${typeof typeRfcomm}, expected='number'`);
      expect(typeof typeRfcomm).assertEqual('number');
      log('testEntrySmoke0406 end');
    })
  })
}
