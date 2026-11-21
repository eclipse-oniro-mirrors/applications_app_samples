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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import resourceManager from '@ohos.resourceManager';
import Logger from '../../utils/Logger';
import {
  ALL_MEDIA_NAMES,
  APP_ICON_NAMES,
  CYCLE_ICONS,
  LISTEN_ICONS,
  MENU_ICONS,
  PLAYBACK_ICONS,
  POSITION_ICONS,
  expectedMediaEdge,
  hasPngSignature,
  readPngHeight,
  readPngWidth
} from '../common/ResourceExpectation';
import {
  BUNDLE,
  BUNDLE_NAME,
  MODULE_NAME,
  SETTLE_PAGE,
  SuiteTag
} from '../common/TestConstant';
import {
  createDriver,
  ensureAppVisible,
  getAppMediaByName,
  getAppResourceManager,
  getTestResourceManager,
  launchApp,
  sleep
} from '../common/UiFlowHelper';

const TAG: string = SuiteTag.MEDIA;
const MIN_PNG_BYTES: number = 500;

async function assertIconGroup(rm: resourceManager.ResourceManager,
  names: Array<string>): Promise<void> {
  const failures: Array<string> = [];
  for (let i: number = 0; i < names.length; i++) {
    const name: string = names[i];
    const bytes: Uint8Array = await getAppMediaByName(rm, name);
    if (!hasPngSignature(bytes)) {
      failures.push(name + ':signature');
      continue;
    }
    const edge: number = expectedMediaEdge(name);
    if (readPngWidth(bytes) !== edge || readPngHeight(bytes) !== edge) {
      failures.push(name + ':' + readPngWidth(bytes) + 'x' + readPngHeight(bytes));
    }
    if (bytes.length < MIN_PNG_BYTES) {
      failures.push(name + ':size');
    }
  }
  Logger.info(TAG, 'iconGroup failures=' + failures.join(','));
  expect(failures.length).assertEqual(0);
}

async function rejectOfMediaByName(rm: resourceManager.ResourceManager, name: string): Promise<boolean> {
  try {
    await getAppMediaByName(rm, name);
    return false;
  } catch (error) {
    return true;
  }
}

/**
 * Media resource contract. Every PNG referenced by the page is decoded from the
 * installed application resources and checked for a valid signature and for
 * the edge length declared by the asset set.
 */
export default function resourceMediaTest(): void {
  describe('LottieResourceMediaTest', (): void => {
    let driver: Driver;
    let appRm: resourceManager.ResourceManager | null = null;

    beforeAll(async (): Promise<void> => {
      driver = await createDriver();
      await ensureAppVisible(driver);
      appRm = await getAppResourceManager();
      if (appRm === null) {
        await launchApp();
        await sleep(SETTLE_PAGE);
        appRm = await getAppResourceManager();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_MEDIA_0100
     * @tc.name allMediaHavePngSignature001
     * @tc.desc Verify every media resource of the application starts with a PNG signature
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'allMediaHavePngSignature_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'allMediaHavePngSignature_001 begin');
      const check01: boolean = appRm !== null;
      Logger.info(TAG, 'allMediaHavePngSignature_001, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (appRm === null) {
        return;
      }
      const invalid: Array<string> = [];
      for (let i: number = 0; i < ALL_MEDIA_NAMES.length; i++) {
        const name: string = ALL_MEDIA_NAMES[i];
        const bytes: Uint8Array = await getAppMediaByName(appRm, name);
        if (!hasPngSignature(bytes)) {
          invalid.push(name);
        }
      }
      const check02: number = invalid.length;
      Logger.info(TAG, 'allMediaHavePngSignature_001, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual(0);
      Logger.info(TAG, 'allMediaHavePngSignature_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_MEDIA_0200
     * @tc.name playbackIconsHaveExpectedEdges002
     * @tc.desc Verify the playback control icons decode to 200 by 200 pixels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'playbackIconsHaveExpectedEdges_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'playbackIconsHaveExpectedEdges_002 begin');
      const check01: boolean = appRm !== null;
      Logger.info(TAG, 'playbackIconsHaveExpectedEdges_002, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (appRm === null) {
        return;
      }
      await assertIconGroup(appRm, PLAYBACK_ICONS);
      Logger.info(TAG, 'playbackIconsHaveExpectedEdges_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_MEDIA_0300
     * @tc.name cycleIconsHaveExpectedEdges003
     * @tc.desc Verify the cycle control icons decode to 200 by 200 pixels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'cycleIconsHaveExpectedEdges_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'cycleIconsHaveExpectedEdges_003 begin');
      const check01: boolean = appRm !== null;
      Logger.info(TAG, 'cycleIconsHaveExpectedEdges_003, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (appRm === null) {
        return;
      }
      await assertIconGroup(appRm, CYCLE_ICONS);
      Logger.info(TAG, 'cycleIconsHaveExpectedEdges_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_MEDIA_0400
     * @tc.name positionIconsHaveExpectedEdges004
     * @tc.desc Verify the position control icons decode to 200 by 200 pixels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'positionIconsHaveExpectedEdges_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'positionIconsHaveExpectedEdges_004 begin');
      const check01: boolean = appRm !== null;
      Logger.info(TAG, 'positionIconsHaveExpectedEdges_004, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (appRm === null) {
        return;
      }
      await assertIconGroup(appRm, POSITION_ICONS);
      Logger.info(TAG, 'positionIconsHaveExpectedEdges_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_MEDIA_0500
     * @tc.name listenIconsHaveExpectedEdges005
     * @tc.desc Verify the listener control icons decode to 200 by 200 pixels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'listenIconsHaveExpectedEdges_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'listenIconsHaveExpectedEdges_005 begin');
      const check01: boolean = appRm !== null;
      Logger.info(TAG, 'listenIconsHaveExpectedEdges_005, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (appRm === null) {
        return;
      }
      await assertIconGroup(appRm, LISTEN_ICONS);
      Logger.info(TAG, 'listenIconsHaveExpectedEdges_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_MEDIA_0600
     * @tc.name menuIconsHaveExpectedEdges006
     * @tc.desc Verify the speed, direction and destroy icons decode to 200 by 200 pixels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'menuIconsHaveExpectedEdges_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'menuIconsHaveExpectedEdges_006 begin');
      const check01: boolean = appRm !== null;
      Logger.info(TAG, 'menuIconsHaveExpectedEdges_006, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (appRm === null) {
        return;
      }
      await assertIconGroup(appRm, MENU_ICONS);
      Logger.info(TAG, 'menuIconsHaveExpectedEdges_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_MEDIA_0700
     * @tc.name applicationIconEdge007
     * @tc.desc Verify the application icon decodes to its declared 114 by 114 pixels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'applicationIconEdge_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'applicationIconEdge_007 begin');
      const check01: boolean = appRm !== null;
      Logger.info(TAG, 'applicationIconEdge_007, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (appRm === null) {
        return;
      }
      await assertIconGroup(appRm, APP_ICON_NAMES);
      Logger.info(TAG, 'applicationIconEdge_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_MEDIA_0800
     * @tc.name everyMediaHasMinimumPayload008
     * @tc.desc Verify every media resource carries a non-trivial payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'everyMediaHasMinimumPayload_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'everyMediaHasMinimumPayload_008 begin');
      const check01: boolean = appRm !== null;
      Logger.info(TAG, 'everyMediaHasMinimumPayload_008, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (appRm === null) {
        return;
      }
      const small: Array<string> = [];
      for (let i: number = 0; i < ALL_MEDIA_NAMES.length; i++) {
        const name: string = ALL_MEDIA_NAMES[i];
        const bytes: Uint8Array = await getAppMediaByName(appRm, name);
        if (bytes.length < MIN_PNG_BYTES) {
          small.push(name + ':' + bytes.length);
        }
      }
      const check02: number = small.length;
      Logger.info(TAG, 'everyMediaHasMinimumPayload_008, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual(0);
      Logger.info(TAG, 'everyMediaHasMinimumPayload_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_MEDIA_0900
     * @tc.name repeatedMediaReadsStable009
     * @tc.desc Verify repeated reads of every media resource return the same length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'repeatedMediaReadsStable_009', 0, async (): Promise<void> => {
      Logger.info(TAG, 'repeatedMediaReadsStable_009 begin');
      const check01: boolean = appRm !== null;
      Logger.info(TAG, 'repeatedMediaReadsStable_009, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (appRm === null) {
        return;
      }
      const unstable: Array<string> = [];
      for (let i: number = 0; i < ALL_MEDIA_NAMES.length; i++) {
        const name: string = ALL_MEDIA_NAMES[i];
        const first: Uint8Array = await getAppMediaByName(appRm, name);
        const second: Uint8Array = await getAppMediaByName(appRm, name);
        if (first.length !== second.length) {
          unstable.push(name);
        }
      }
      const check02: number = unstable.length;
      Logger.info(TAG, 'repeatedMediaReadsStable_009, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual(0);
      Logger.info(TAG, 'repeatedMediaReadsStable_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_MEDIA_1000
     * @tc.name testModuleIconContent010
     * @tc.desc Verify the test module icon resolves through getMediaContent as a PNG
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'testModuleIconContent_010', 0, async (): Promise<void> => {
      Logger.info(TAG, 'testModuleIconContent_010 begin');
      const testRm: resourceManager.ResourceManager = getTestResourceManager();
      const bytes: Uint8Array = await testRm.getMediaContent($r('app.media.icon'));
      const check01: boolean = hasPngSignature(bytes);
      Logger.info(TAG, 'testModuleIconContent_010, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = bytes.length > 0;
      Logger.info(TAG, 'testModuleIconContent_010, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'testModuleIconContent_010 end, length=' + bytes.length);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_MEDIA_1100
     * @tc.name testModuleIconBase64Present011
     * @tc.desc Verify the base64 form of the test icon returns a non-empty payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'testModuleIconBase64Present_011', 0, async (): Promise<void> => {
      Logger.info(TAG, 'testModuleIconBase64Present_011 begin');
      const testRm: resourceManager.ResourceManager = getTestResourceManager();
      const base64: string = await testRm.getMediaContentBase64($r('app.media.icon'));
      const check01: boolean = base64.length > 0;
      Logger.info(TAG, 'testModuleIconBase64Present_011, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'testModuleIconBase64Present_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_MEDIA_1200
     * @tc.name missingMediaByNameRejected012
     * @tc.desc Verify reading an unknown media name is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'missingMediaByNameRejected_012', 0, async (): Promise<void> => {
      Logger.info(TAG, 'missingMediaByNameRejected_012 begin');
      const check01: boolean = appRm !== null;
      Logger.info(TAG, 'missingMediaByNameRejected_012, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (appRm === null) {
        return;
      }
      const rejected: boolean = await rejectOfMediaByName(appRm, 'lottie_missing_media_key');
      const check02: boolean = rejected;
      Logger.info(TAG, 'missingMediaByNameRejected_012, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'missingMediaByNameRejected_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_MEDIA_1300
     * @tc.name emptyMediaNameRejected013
     * @tc.desc Verify reading an empty media name is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'emptyMediaNameRejected_013', 0, async (): Promise<void> => {
      Logger.info(TAG, 'emptyMediaNameRejected_013 begin');
      const check01: boolean = appRm !== null;
      Logger.info(TAG, 'emptyMediaNameRejected_013, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (appRm === null) {
        return;
      }
      const rejected: boolean = await rejectOfMediaByName(appRm, '');
      const check02: boolean = rejected;
      Logger.info(TAG, 'emptyMediaNameRejected_013, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'emptyMediaNameRejected_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_MEDIA_1400
     * @tc.name invalidMediaResourceRejected014
     * @tc.desc Verify getMediaContent rejects a resource id that does not exist
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'invalidMediaResourceRejected_014', 0, async (): Promise<void> => {
      Logger.info(TAG, 'invalidMediaResourceRejected_014 begin');
      const testRm: resourceManager.ResourceManager = getTestResourceManager();
      const invalid: Resource = {
        bundleName: BUNDLE_NAME,
        moduleName: MODULE_NAME,
        id: 0x7FFFFFE,
        type: 10007,
        params: []
      };
      let rejected: boolean = false;
      try {
        await testRm.getMediaContent(invalid);
      } catch (error) {
        rejected = true;
      }
      const check01: boolean = rejected;
      Logger.info(TAG, 'invalidMediaResourceRejected_014, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'invalidMediaResourceRejected_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_MEDIA_1500
     * @tc.name stringPassedToMediaRejected015
     * @tc.desc Verify getMediaContent rejects a resource that is a plain string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'stringPassedToMediaRejected_015', 0, async (): Promise<void> => {
      Logger.info(TAG, 'stringPassedToMediaRejected_015 begin');
      const testRm: resourceManager.ResourceManager = getTestResourceManager();
      let rejected: boolean = false;
      try {
        await testRm.getMediaContent($r('app.string.play_pause'));
      } catch (error) {
        rejected = true;
      }
      const check01: boolean = rejected;
      Logger.info(TAG, 'stringPassedToMediaRejected_015, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'stringPassedToMediaRejected_015 end');
    });
  });
}
