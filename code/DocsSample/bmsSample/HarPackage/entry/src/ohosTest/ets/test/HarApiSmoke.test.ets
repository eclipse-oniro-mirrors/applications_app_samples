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

import { describe, beforeEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { bundleManager } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit';
import { Component, Driver, ON, On } from '@kit.TestKit';
import { func, func2, nativeAdd } from 'library';
import {
  APP_NAME,
  BUNDLE_NAME,
  ENTRY_MODULE,
  LIB_FUNC_RESULT,
  LIB_FUNC2_RESULT,
  PngOracle,
  VENDOR,
  VERSION_CODE,
  VERSION_NAME,
  entryContext,
  launchHome,
  selfBundle,
  stopHome
} from './shared/HarProbe';
import { paceTurn, sleepMs } from './shared/TestPace';
import { logCase } from './shared/TestLog';

const WAIT_SHOW_MS: number = 5000;
const CLICK_SETTLE_MS: number = 500;
const INITIAL_TEXT: string = 'Hello World';
const FUNC_TEXT: string = 'func return: ' + LIB_FUNC_RESULT;
const NATIVE_TEXT: string = 'result: 3';

let sharedDriver: Driver | null = null;

function driver(): Driver {
  if (sharedDriver === null) {
    sharedDriver = Driver.create();
  }
  return sharedDriver;
}

function resources(): resourceManager.ResourceManager {
  return entryContext().resourceManager;
}

export default function harApiSmokeTest() {
  describe('HarApiSmoke', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(async () => {
      await stopHome();
    });

    /**
     * @tc.number    SUB_HARPACKAGE_SMOKE_0100
     * @tc.name      testFuncExported0001
     * @tc.desc      Call func exported by the HAR entry and check the fixed string
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFuncExported0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value: string = func();
      logCase('testFuncExported0001', `func=${value}`);
      expect(value).assertEqual(LIB_FUNC_RESULT);
      expect(value.length).assertEqual(8);
      {
      const value: string = func2();
      logCase('testFunc2Exported0001', `func2=${value}`);
      expect(value).assertEqual(LIB_FUNC2_RESULT);
      expect(value.length).assertEqual(9);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_SMOKE_0300
     * @tc.name      testNativeAddExported0001
     * @tc.desc      Call nativeAdd from the HAR NAPI module and check the sum
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeAddExported0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value: number = nativeAdd(1, 2);
      logCase('testNativeAddExported0001', `nativeAdd(1,2)=${value}`);
      expect(value).assertEqual(3);
      expect(nativeAdd(-5, 5)).assertEqual(0);
      expect(nativeAdd(0.25, 0.75)).assertEqual(1);
      {
      const info: bundleManager.BundleInfo = await selfBundle();
      logCase('testSelfBundleIdentity0001', `name=${info.name} version=${info.versionName}`);
      expect(info.name).assertEqual(BUNDLE_NAME);
      expect(info.versionName).assertEqual(VERSION_NAME);
      expect(info.versionCode).assertEqual(VERSION_CODE);
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      expect(info.vendor).assertEqual(VENDOR);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_SMOKE_0500
     * @tc.name      testEntryModuleListed0001
     * @tc.desc      Query own bundle info and check the entry module is installed
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryModuleListed0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const names: string[] = info.hapModulesInfo.map((item: bundleManager.HapModuleInfo) => item.name);
      logCase('testEntryModuleListed0001', `modules=${names.join(',')}`);
      expect(names.indexOf(ENTRY_MODULE) >= 0).assertTrue();
      {
      const strings: resourceManager.ResourceManager = resources();
      logCase('testHarApiStringResource0001', `app_name=${strings.getStringByNameSync('app_name')}`);
      expect(strings.getStringByNameSync('app_name')).assertEqual(APP_NAME);
      expect(strings.getStringByNameSync('page_show')).assertEqual('page from package');
      expect(strings.getStringByNameSync('hello_har')).assertEqual('');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_SMOKE_0700
     * @tc.name      testHarApiMediaResource0001
     * @tc.desc      Read the library media resource and check the PNG header
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarApiMediaResource0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const bytes: Uint8Array = resources().getMediaByNameSync('icon_har');
      logCase('testHarApiMediaResource0001', `bytes=${bytes.length} png=${PngOracle.hasSignature(bytes)}`);
      expect(PngOracle.hasSignature(bytes)).assertTrue();
      expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
      expect(PngOracle.width(bytes) > 0).assertTrue();
      {
      await launchHome();
      const textFilter: On = ON.text(INITIAL_TEXT).type('Text');
      const initial: Component | null = await driver().waitForComponent(textFilter, WAIT_SHOW_MS);
      logCase('testIndexPageUi0001', `initialFound=${initial !== null}`);
      expect(initial !== null).assertTrue();
      const funcButton: Component | null = await driver().waitForComponent(ON.id('button'), WAIT_SHOW_MS);
      expect(funcButton !== null).assertTrue();
      await funcButton.click();
      await sleepMs(CLICK_SETTLE_MS);
      expect(await driver().waitForComponent(ON.text(FUNC_TEXT).type('Text'), WAIT_SHOW_MS) !== null).assertTrue();
      const nativeButton: Component | null = await driver().waitForComponent(ON.id('nativeAdd'), WAIT_SHOW_MS);
      expect(nativeButton !== null).assertTrue();
      await nativeButton.click();
      await sleepMs(CLICK_SETTLE_MS);
      expect(await driver().waitForComponent(ON.text(NATIVE_TEXT).type('Text'), WAIT_SHOW_MS) !== null).assertTrue();
      }
    });
  });
}
