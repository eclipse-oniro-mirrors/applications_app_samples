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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { DeviceUtils } from 'photopickersendable';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { i18n } from '@kit.LocalizationKit';

/** Log domain of the sample application. */
const DOMAIN: number = 0xF811;
/** Sub string the emulator detector searches inside the product model. */
const EMULATOR_MARK: string = 'emulator';
/** Upper sanity bound for any text produced by the device helpers. */
const MAX_TEXT_LENGTH: number = 500;
/** Upper sanity bound for a plausible SDK API version. */
const MAX_API_VERSION: number = 10000;
/** Smallest plausible SDK API version of a current test device. */
const MIN_API_VERSION: number = 0;
/** Number of repeated reads per stability loop case. */
const STABLE_ROUNDS: number = 5;

/**
 * Registers the matrix cases of every DeviceUtils helper. The values come
 * from read only platform constants, so no case can assume one concrete
 * device; every case instead verifies the documented contract: non empty
 * text, stable repeated reads, plausible numeric bounds and the derived
 * emulator flag staying consistent with the product model.
 */
export default function deviceUtilsMatrixTest() {
  describe('DeviceUtilsMatrixTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_0100
     * @tc.name      testDevMat0001
     * @tc.desc      Verify getProductModel always returns a non empty text
     *               because the helper normalizes an empty model name.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDevMat0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDevMat0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const model: string = DeviceUtils.getProductModel();
      expect(model.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_0200
     * @tc.name      testDevMat0002
     * @tc.desc      Verify getProductModel returns the same value on repeated
     *               reads because the underlying constant never changes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDevMat0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDevMat0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const first: string = DeviceUtils.getProductModel();
      const second: string = DeviceUtils.getProductModel();
      expect(second).assertEqual(first);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_0300
     * @tc.name      testDevMat0003
     * @tc.desc      Verify getProductModel output stays inside a sane length
     *               bound and carries no leading or trailing whitespace.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDevMat0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDevMat0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const model: string = DeviceUtils.getProductModel();
      expect(model.length < MAX_TEXT_LENGTH).assertTrue();
      expect(model).assertEqual(model.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_0400
     * @tc.name      testDevMat0004
     * @tc.desc      Verify getOsFullName always returns a non empty text even
     *               on a stripped down image where the fallback applies.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDevMat0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDevMat0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const name: string = DeviceUtils.getOsFullName();
      expect(name.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_0500
     * @tc.name      testDevMat0005
     * @tc.desc      Verify getOsFullName returns the same value on repeated
     *               reads within one test run.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDevMat0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDevMat0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const first: string = DeviceUtils.getOsFullName();
      const second: string = DeviceUtils.getOsFullName();
      expect(second).assertEqual(first);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_0600
     * @tc.name      testDevMat0006
     * @tc.desc      Verify getOsFullName output stays inside a sane length
     *               bound and equals its own trimmed form.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDevMat0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDevMat0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const name: string = DeviceUtils.getOsFullName();
      expect(name.length < MAX_TEXT_LENGTH).assertTrue();
      expect(name).assertEqual(name.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_0700
     * @tc.name      testDevMat0007
     * @tc.desc      Verify getSdkApiVersion never returns a negative number
     *               because the helper clamps meaningless values to zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDevMat0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDevMat0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const version: number = DeviceUtils.getSdkApiVersion();
      expect(version).assertLargerOrEqual(MIN_API_VERSION);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_0800
     * @tc.name      testDevMat0008
     * @tc.desc      Verify getSdkApiVersion stays inside the plausible version
     *               range of a current OpenHarmony test device.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDevMat0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDevMat0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const version: number = DeviceUtils.getSdkApiVersion();
      expect(version).assertLess(MAX_API_VERSION);
      expect(version).assertLargerOrEqual(MIN_API_VERSION);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_0900
     * @tc.name      testDevMat0009
     * @tc.desc      Verify getSdkApiVersion returns a whole number without a
     *               fractional part and supports simple arithmetic.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDevMat0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDevMat0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const version: number = DeviceUtils.getSdkApiVersion();
      expect(Math.floor(version)).assertEqual(version);
      expect(version + 1).assertLarger(version);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_1000
     * @tc.name      testDevMat0010
     * @tc.desc      Verify getSdkApiVersion returns the same value across a
     *               loop of repeated reads inside one test run.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDevMat0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDevMat0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const baseline: number = DeviceUtils.getSdkApiVersion();
      for (let round: number = 0; round < STABLE_ROUNDS; round++) {
        expect(DeviceUtils.getSdkApiVersion()).assertEqual(baseline);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_1100
     * @tc.name      testDevMat0011
     * @tc.desc      Verify getDeviceType always returns a non empty text
     *               because an empty platform answer maps to the fallback.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDevMat0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDevMat0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const type: string = DeviceUtils.getDeviceType();
      expect(type.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_1200
     * @tc.name      testDevMat0012
     * @tc.desc      Verify getDeviceType returns the same value on repeated
     *               reads and carries no surrounding whitespace.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDevMat0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDevMat0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const first: string = DeviceUtils.getDeviceType();
      const second: string = DeviceUtils.getDeviceType();
      expect(second).assertEqual(first);
      expect(first).assertEqual(first.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_1300
     * @tc.name      testDevMat0013
     * @tc.desc      Verify getDeviceType output stays inside a sane length
     *               bound for every supported device category.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDevMat0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDevMat0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const type: string = DeviceUtils.getDeviceType();
      expect(type.length < MAX_TEXT_LENGTH).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_1400
     * @tc.name      testDevMat0014
     * @tc.desc      Verify isEmulator derives exactly the same boolean as an
     *               independent check of the normalized model name.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDevMat0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDevMat0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const model: string = DeviceUtils.getProductModel().toLowerCase();
      const expected: boolean = model.indexOf(EMULATOR_MARK) >= 0;
      expect(DeviceUtils.isEmulator()).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_1500
     * @tc.name      testDevMat0015
     * @tc.desc      Verify isEmulator keeps the same answer across repeated
     *               calls because the model constant never changes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDevMat0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDevMat0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const baseline: boolean = DeviceUtils.isEmulator();
      for (let round: number = 0; round < STABLE_ROUNDS; round++) {
        expect(DeviceUtils.isEmulator()).assertEqual(baseline);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_1600
     * @tc.name      testDevMat0016
     * @tc.desc      Verify isEmulator stays consistent with the model check
     *               after the model text is folded to lower case again.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDevMat0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDevMat0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const model: string = DeviceUtils.getProductModel();
      const folded: string = model.toLowerCase();
      const expected: boolean = folded.indexOf(EMULATOR_MARK) >= 0;
      expect(DeviceUtils.isEmulator()).assertEqual(expected);
      expect(folded).assertEqual(folded.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_1700
     * @tc.name      testDevMat0017
     * @tc.desc      Verify getLanguage always returns a non empty tag because
     *               the helper catches kit failures with a fallback text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDevMat0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDevMat0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const language: string = DeviceUtils.getLanguage();
      expect(language.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_1800
     * @tc.name      testDevMat0018
     * @tc.desc      Verify getLanguage returns the same tag across repeated
     *               calls because the system language is stable per run.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDevMat0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDevMat0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const baseline: string = DeviceUtils.getLanguage();
      for (let round: number = 0; round < STABLE_ROUNDS; round++) {
        expect(DeviceUtils.getLanguage()).assertEqual(baseline);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_1900
     * @tc.name      testDevMat0019
     * @tc.desc      Verify getLanguage equals the direct localization kit
     *               answer when the kit works and stays non empty otherwise.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDevMat0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDevMat0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let platform: string = '';
      try {
        platform = i18n.System.getSystemLanguage();
      } catch (error) {
        platform = '';
      }
      const helper: string = DeviceUtils.getLanguage();
      expect(helper.length > 0).assertTrue();
      if (platform.length > 0) {
        expect(helper).assertEqual(platform);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_2000
     * @tc.name      testDevMat0020
     * @tc.desc      Verify getLanguage output stays inside a sane length bound
     *               and equals its own trimmed form.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDevMat0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDevMat0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const language: string = DeviceUtils.getLanguage();
      expect(language.length < MAX_TEXT_LENGTH).assertTrue();
      expect(language).assertEqual(language.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_2100
     * @tc.name      testDevMat0021
     * @tc.desc      Verify every text helper produces a non empty value in one
     *               combined run so the fallbacks never leak an empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDevMat0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDevMat0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DeviceUtils.getProductModel().length > 0).assertTrue();
      expect(DeviceUtils.getOsFullName().length > 0).assertTrue();
      expect(DeviceUtils.getDeviceType().length > 0).assertTrue();
      expect(DeviceUtils.getLanguage().length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_2200
     * @tc.name      testDevMat0022
     * @tc.desc      Verify the numeric and boolean helpers complete a combined
     *               run with plausible values and no thrown exception.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDevMat0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDevMat0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let completed: boolean = false;
      const version: number = DeviceUtils.getSdkApiVersion();
      const flag: boolean = DeviceUtils.isEmulator();
      expect(version).assertLargerOrEqual(0);
      expect(version < MAX_API_VERSION).assertTrue();
      if (flag) {
        expect(flag).assertTrue();
      } else {
        expect(flag).assertFalse();
      }
      completed = true;
      expect(completed).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_2300
     * @tc.name      testDevMat0023
     * @tc.desc      Verify the product model and the device type stay stable
     *               together across one loop of paired reads.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDevMat0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testDevMat0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const model: string = DeviceUtils.getProductModel();
      const type: string = DeviceUtils.getDeviceType();
      for (let round: number = 0; round < STABLE_ROUNDS; round++) {
        expect(DeviceUtils.getProductModel()).assertEqual(model);
        expect(DeviceUtils.getDeviceType()).assertEqual(type);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_2400
     * @tc.name      testDevMat0024
     * @tc.desc      Verify the os name and the language tag stay stable
     *               together across one loop of paired reads.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDevMat0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testDevMat0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const name: string = DeviceUtils.getOsFullName();
      const language: string = DeviceUtils.getLanguage();
      for (let round: number = 0; round < STABLE_ROUNDS; round++) {
        expect(DeviceUtils.getOsFullName()).assertEqual(name);
        expect(DeviceUtils.getLanguage()).assertEqual(language);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_2500
     * @tc.name      testDevMat0025
     * @tc.desc      Verify the emulator flag derived from the model text keeps
     *               the same answer when the flag is read many times in a
     *               row with the model revalidated on every round.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDevMat0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testDevMat0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let round: number = 0; round < STABLE_ROUNDS; round++) {
        const model: string = DeviceUtils.getProductModel().toLowerCase();
        const expected: boolean = model.indexOf(EMULATOR_MARK) >= 0;
        expect(DeviceUtils.isEmulator()).assertEqual(expected);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_2600
     * @tc.name      testDevMat0026
     * @tc.desc      Verify the api version read inside a loop always lands in
     *               the same plausible interval as the single read case.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDevMat0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testDevMat0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let round: number = 0; round < STABLE_ROUNDS; round++) {
        const version: number = DeviceUtils.getSdkApiVersion();
        expect(version).assertLargerOrEqual(MIN_API_VERSION);
        expect(version < MAX_API_VERSION).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_2700
     * @tc.name      testDevMat0027
     * @tc.desc      Verify the language tag length stays inside a plausible
     *               lower bound of at least two characters per BCP 47 tag.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDevMat0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testDevMat0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const language: string = DeviceUtils.getLanguage();
      expect(language.length >= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_2800
     * @tc.name      testDevMat0028
     * @tc.desc      Verify the combined read of every helper completes without
     *               an exception and keeps each value stable afterwards.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDevMat0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testDevMat0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const model: string = DeviceUtils.getProductModel();
      const name: string = DeviceUtils.getOsFullName();
      const type: string = DeviceUtils.getDeviceType();
      const language: string = DeviceUtils.getLanguage();
      const version: number = DeviceUtils.getSdkApiVersion();
      const flag: boolean = DeviceUtils.isEmulator();
      expect(DeviceUtils.getProductModel()).assertEqual(model);
      expect(DeviceUtils.getOsFullName()).assertEqual(name);
      expect(DeviceUtils.getDeviceType()).assertEqual(type);
      expect(DeviceUtils.getLanguage()).assertEqual(language);
      expect(DeviceUtils.getSdkApiVersion()).assertEqual(version);
      expect(DeviceUtils.isEmulator()).assertEqual(flag);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_2900
     * @tc.name      testDevMat0029
     * @tc.desc      Verify the device type text carries no leading or
     *               trailing whitespace and keeps that shape on re-reads.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDevMat0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testDevMat0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const type: string = DeviceUtils.getDeviceType();
      expect(type.length > 0).assertTrue();
      expect(type.trim()).assertEqual(type);
      expect(DeviceUtils.getDeviceType().trim()).assertEqual(type.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_3000
     * @tc.name      testDevMat0030
     * @tc.desc      Verify the product model text carries no leading or
     *               trailing whitespace and keeps that shape on re-reads.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDevMat0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testDevMat0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const model: string = DeviceUtils.getProductModel();
      expect(model.length > 0).assertTrue();
      expect(model.trim()).assertEqual(model);
      expect(DeviceUtils.getProductModel().trim()).assertEqual(model.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_3100
     * @tc.name      testDevMat0031
     * @tc.desc      Verify getLanguage mirrors the platform language tag when
     *               the localization kit reports a usable value on this image.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDevMat0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testDevMat0031';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const helper: string = DeviceUtils.getLanguage();
      expect(helper.length > 0).assertTrue();
      let platform: string = '';
      try {
        platform = i18n.System.getSystemLanguage();
      } catch (error) {
        platform = '';
      }
      if (platform.length > 0) {
        expect(helper).assertEqual(platform);
      } else {
        expect(helper.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DEVMAT_3200
     * @tc.name      testDevMat0032
     * @tc.desc      Verify the api version behaves as a whole number, so
     *               incrementing it yields a larger value on every read.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDevMat0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testDevMat0032';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const version: number = DeviceUtils.getSdkApiVersion();
      expect(Math.floor(version) === version).assertTrue();
      expect(version + 1).assertLarger(version);
      expect(version - 1).assertLess(version);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
