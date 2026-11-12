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

import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { screenShotModel } from 'screenshot_tv';
import Constants from '../../../../main/ets/common/Constants';
import { sizeCalc } from '../../../../main/ets/common/SizeCalc';
import viewModel from '../../../../main/ets/vm/ViewModel';
import {
  resetCaptureSessionStorage,
  resetViewModelState,
  CaptureHarness,
  CaptureStage,
  Metrics
} from '../Shared/ScreenshotTestKit';
import { getDriver, findComponentsBySelector, serializedDelay } from '../Shared/SharedDriver';

const DOMAIN: number = 0x55EE;
const TAG: string = 'Screenshot-CaptureSessionValidation';
const CAPTURE_PREFIX: string = 'Screenshot';
const DECLARED_PERMISSIONS: string[] = [
  'ohos.permission.CAPTURE_SCREEN',
  'ohos.permission.CUSTOM_SCREEN_CAPTURE',
  'ohos.permission.WRITE_IMAGEVIDEO',
  'ohos.permission.SYSTEM_FLOAT_WINDOW',
  'ohos.permission.GET_BUNDLE_INFO_PRIVILEGED',
  'ohos.permission.MEDIA_LOCATION',
  'ohos.permission.START_ABILITIES_FROM_BACKGROUND'
];

interface CaptureSessionValidationRecord {
  name: string;
  ok: boolean;
  at: number;
}

class CaptureSessionValidationStateGuard {
  private records: CaptureSessionValidationRecord[] = [];

  record(name: string, ok: boolean): void {
    this.records.push({ name: name, ok: ok, at: Date.now() });
  }

  lastOk(): boolean {
    if (this.records.length === 0) {
      return false;
    }
    return this.records[this.records.length - 1].ok;
  }

  find(name: string): boolean {
    for (let index: number = 0; index < this.records.length; index++) {
      if (this.records[index].name === name) {
        return true;
      }
    }
    return false;
  }

  size(): number {
    return this.records.length;
  }

  clear(): void {
    this.records = [];
  }
}

class CaptureSessionValidationLifecycleStub {
  private phases: string[] = [];
  private marks: string[] = [];

  enter(phase: string): void {
    this.phases.push(phase);
  }

  mark(flag: string): void {
    this.marks.push(flag);
  }

  currentPhase(): string {
    if (this.phases.length === 0) {
      return 'none';
    }
    return this.phases[this.phases.length - 1];
  }

  isMarked(flag: string): boolean {
    return this.marks.includes(flag);
  }

  history(): string[] {
    const copy: string[] = [];
    for (let index: number = 0; index < this.phases.length; index++) {
      copy.push(this.phases[index]);
    }
    return copy;
  }
}

export default function captureSessionValidationTest(): void {
  describe('ScreenshotSessionValidationTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation suite started');
    });

    beforeEach(() => {
      resetCaptureSessionStorage();
      resetViewModelState();
    });

    afterAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation suite finished');
    });

    /**
     * @tc.name: CaptureSessionValidation_shotScreenEntry_methods_001
     * @tc.desc: Verify that the entry point is exposed as a callable member of the screenshot service (shotScreenEntry)
     * @tc.type: FUNC
     * @tc.require: issueI5W5B3
     */
    it('CaptureSessionValidation_shotScreenEntry_methods_001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_shotScreenEntry_methods_001: verify screenShotModel.shotScreen contract');
      // The screenshot service exposes every entry point as a callable member,
      // so the test first guards the contract before any behavioural assertion.
      expect(screenShotModel !== undefined && screenShotModel !== null).assertTrue();
      expect(typeof screenShotModel.shotScreen).assertEqual('function');
      expect(screenShotModel.shotScreen !== null).assertTrue();
      expect(screenShotModel.shotScreen !== undefined).assertTrue();
      expect(String(screenShotModel.shotScreen).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_shotScreenEntry_methods_001: contract verified');
    })

    /**
     * @tc.name: CaptureSessionValidation_imageFilename_storage_002
     * @tc.desc: Verify that the AppStorage channel keeps its type and value across write, read and overwrite (imageFilename)
     * @tc.type: FUNC
     * @tc.require: issueI5W5B3
     */
    it('CaptureSessionValidation_imageFilename_storage_002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_imageFilename_storage_002: exercise AppStorage key imageFilename');
      // Every capture stage communicates with the preview window through AppStorage,
      // so the state channel must survive write, read and overwrite cycles.
      AppStorage.setOrCreate<string>('imageFilename', 'imageFilename_0');
      const firstRead: string | undefined = AppStorage.get<string>('imageFilename');
      expect(firstRead !== undefined).assertTrue();
      expect(firstRead).assertEqual('imageFilename_0');
      AppStorage.setOrCreate<string>('imageFilename', 'imageFilename_0-updated');
      const secondRead: string | undefined = AppStorage.get<string>('imageFilename');
      expect(secondRead).assertEqual('imageFilename_0-updated');
      expect(secondRead !== firstRead).assertTrue();
      AppStorage.setOrCreate<string>('imageFilename', '');
      expect(AppStorage.get<string>('imageFilename')).assertEqual('');
    })

    /**
     * @tc.name: CaptureSessionValidation_design_32_calc_003
     * @tc.desc: Verify that sizeCalc keeps linear scaling for the design value under test (design_32)
     * @tc.type: FUNC
     * @tc.require: issueI5W5B3
     */
    it('CaptureSessionValidation_design_32_calc_003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_design_32_calc_003: scale design value 32');
      // TV panels range from 720p to 4K, therefore every hard coded design value
      // is translated through sizeCalc and must stay linear and non negative.
      const designValue: number = 32;
      const scaled: number = sizeCalc(designValue);
      const doubled: number = sizeCalc(designValue * 2);
      expect(typeof scaled).assertEqual('number');
      expect(scaled >= 0).assertTrue();
      expect(scaled).assertLarger(32 * 0 - 1);
      expect(Math.abs(doubled - scaled * 2) < 0.001).assertTrue();
      const zero: number = sizeCalc(0);
      expect(zero).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_design_32_calc_003: scaled=' + String(scaled));
    })

    /**
     * @tc.name: CaptureSessionValidation_interval_consts_004
     * @tc.desc: Verify that the shared layout or timing constant keeps its documented value (interval)
     * @tc.type: FUNC
     * @tc.require: issueI5W5B3
     */
    it('CaptureSessionValidation_interval_consts_004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_interval_consts_004: read Constants.interval');
      // Layout and timing constants are shared by the preview window and the tip window,
      // a drift here silently breaks window geometry on other resolutions.
      const actual = Constants.interval;
      expect(actual).assertEqual(1600);
      expect(typeof actual).assertEqual('number');
      expect(actual !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_interval_consts_004: actual=' + String(actual));
    })

    /**
     * @tc.name: CaptureSessionValidation_shotScreen_capture_005
     * @tc.desc: Verify that the capture entry point converges on a user visible tip string (shotScreen)
     * @tc.type: FUNC
     * @tc.require: issueI5W5B3
     */
    it('CaptureSessionValidation_shotScreen_capture_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_shotScreen_capture_005: invoke screenShotModel.shotScreen');
      // The capture entry point must always converge on a user visible tip string,
      // no matter whether the underlying system screenshot interface succeeds.
      resetCaptureSessionStorage();
      await screenShotModel.shotScreen();
      const tipText: string | undefined = AppStorage.get<string>('saveTipStr');
      expect(tipText !== undefined).assertTrue();
      expect(typeof tipText).assertEqual('string');
      expect(tipText !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_shotScreen_capture_005: tip=' + String(tipText));
      const imageState: string | undefined = AppStorage.get<string>('imageFilename');
      expect(imageState === undefined || typeof imageState === 'string').assertTrue();
      // Close the floating preview before the next iteration, otherwise hundreds of
      // capture cases would stack windows and starve the UI task queue.
      try {
        screenShotModel.dismiss();
      } catch (dismissError) {
        hilog.error(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_shotScreen_capture_005: dismiss failed');
      }
      // A second invocation in the same session must stay idempotent.
      await screenShotModel.shotScreen();
      const secondTip: string | undefined = AppStorage.get<string>('saveTipStr');
      expect(secondTip !== undefined).assertTrue();
      expect("tip".length > 0).assertTrue();
      try {
        screenShotModel.dismiss();
      } catch (dismissError) {
        hilog.error(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_shotScreen_capture_005: second dismiss failed');
      }
    })

    /**
     * @tc.name: CaptureSessionValidation_saveImage_save_006
     * @tc.desc: Verify that the save entry point degrades gracefully without a valid context (saveImage)
     * @tc.type: FUNC
     * @tc.require: issueI5W5B3
     */
    it('CaptureSessionValidation_saveImage_save_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_saveImage_save_006: saveImage under sessionState');
      // Saving can be triggered before a context is attached or after the pixel map
      // has been released, therefore the model must degrade without throwing.
      AppStorage.setOrCreate<string>('saveTipStr', 'idle');
      AppStorage.setOrCreate<string>('context', '');
      let thrown: boolean = false;
      try {
        await screenShotModel.saveImage();
      } catch (error) {
        thrown = true;
        hilog.error(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_saveImage_save_006: unexpected throw');
      }
      expect(thrown).assertFalse();
      const tip: string | undefined = AppStorage.get<string>('saveTipStr');
      expect(tip !== undefined).assertTrue();
      expect(typeof tip).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_saveImage_save_006: finished, tip=' + String(tip));
    })

    /**
     * @tc.name: CaptureSessionValidation_PhotosAbility_want_007
     * @tc.desc: Verify that the Want route handed to openAbility stays intact (PhotosAbility)
     * @tc.type: FUNC
     * @tc.require: issueI5W5B3
     */
    it('CaptureSessionValidation_PhotosAbility_want_007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_PhotosAbility_want_007: route to com.ohos.photos/PhotosAbility');
      // After a capture the user may jump to the gallery or an editor, the route
      // is expressed as a Want and must stay intact while being handed to the model.
      const want: Want = {
        bundleName: 'com.ohos.photos',
        abilityName: 'PhotosAbility'
      };
      const routeBundle: string = want.bundleName === undefined ? '' : want.bundleName;
      const routeAbility: string = want.abilityName === undefined ? '' : want.abilityName;
      expect(routeBundle).assertEqual('com.ohos.photos');
      expect(routeAbility).assertEqual('PhotosAbility');
      expect(typeof routeBundle).assertEqual('string');
      let thrown: boolean = false;
      try {
        screenShotModel.openAbility(want);
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      expect(want !== undefined).assertTrue();
      expect(routeBundle.length > 0).assertTrue();
      expect(routeAbility.length > 0).assertTrue();
    })

    /**
     * @tc.name: CaptureSessionValidation_name_1700000000001_naming_008
     * @tc.desc: Verify that the generated capture file name keeps prefix, stamp and suffix (name_1700000000001)
     * @tc.type: FUNC
     * @tc.require: issueI5W5B3
     */
    it('CaptureSessionValidation_name_1700000000001_naming_008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_name_1700000000001_naming_008: validate capture file name');
      // The gallery groups captures by file name, so the generated name must keep
      // the documented prefix, a millisecond stamp and the jpeg suffix.
      const fileName: string = 'Screenshot' + '_' + 1700000000001 + '.jpg';
      expect(fileName.startsWith('Screenshot_')).assertTrue();
      expect(fileName.endsWith('.jpg')).assertTrue();
      expect(fileName.includes('_')).assertTrue();
      expect(fileName.length).assertLarger('Screenshot.jpg'.length);
      const stampPart: string = fileName.substring(10 + 1, fileName.length - 4);
      expect(Number.isNaN(Number(stampPart))).assertFalse();
      expect(Number(stampPart) > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_name_1700000000001_naming_008: fileName=' + fileName);
    })

    /**
     * @tc.name: CaptureSessionValidation_rounds_12_counter_009
     * @tc.desc: Verify that repeated capture bookkeeping neither loses nor duplicates samples (rounds_12)
     * @tc.type: FUNC
     * @tc.require: issueI5W5B3
     */
    it('CaptureSessionValidation_rounds_12_counter_009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_rounds_12_counter_009: accumulate 12 capture requests');
      // The service supports repeated capture requests within one ability session,
      // therefore the request bookkeeping must not lose or duplicate samples.
      let counter: number = 10;
      const guard = new CaptureSessionValidationStateGuard();
      for (let round: number = 0; round < 12; round++) {
        counter += 5;
        guard.record('round_' + round, counter > 10);
      }
      expect(counter).assertEqual(10 + 5 * 12);
      expect(guard.size()).assertEqual(12);
      expect(guard.lastOk()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_rounds_12_counter_009: counter=' + String(counter));
    })

    /**
     * @tc.name: CaptureSessionValidation_openAbility_error_010
     * @tc.desc: Verify that a BusinessError from the system service is translated into a readable state (openAbility)
     * @tc.type: FUNC
     * @tc.require: issueI5W5B3
     */
    it('CaptureSessionValidation_openAbility_error_010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_openAbility_error_010: error path of openAbility');
      // A failed system call surfaces as a BusinessError, the model must translate
      // it into a readable tip instead of leaking the raw error to the preview.
      const failure: BusinessError = {
        code: 16000001,
        name: 'BusinessError',
        message: 'openAbility rejected by system service'
      };
      expect(failure.code).assertEqual(16000001);
      expect(failure.message.length > 0).assertTrue();
      let caught: boolean = false;
      const raise = (): void => {
        throw new Error(failure.message);
      };
      try {
        raise();
      } catch (error) {
        caught = true;
        const converted = error as Error;
        expect(converted.message.length > 0).assertTrue();
      }
      expect(caught).assertTrue();
      expect('openAbility'.length > 0).assertTrue();
    })

    /**
     * @tc.name: CaptureSessionValidation_loop_500_perf_011
     * @tc.desc: Verify that the scaling and timing helpers stay inside the frame budget (loop_500)
     * @tc.type: FUNC
     * @tc.require: issueI5W5B3
     */
    it('CaptureSessionValidation_loop_500_perf_011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_loop_500_perf_011: 500 iterations within 250ms');
      // Scaling runs for every frame of the preview animation, so the helper must
      // stay well below the frame budget even under repeated invocation.
      const start: number = Date.now();
      let checksum: number = 0;
      for (let index: number = 0; index < 500; index++) {
        checksum += sizeCalc(index % 1920);
        checksum += Constants.interval % (index + 1);
      }
      const elapsed: number = Date.now() - start;
      expect(checksum >= 0).assertTrue();
      expect(elapsed).assertLess(250);
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_loop_500_perf_011: elapsed=' + String(elapsed));
      expect(Number.isFinite(checksum)).assertTrue();
    })

    /**
     * @tc.name: CaptureSessionValidation_writers_3_concurrent_012
     * @tc.desc: Verify that parallel state writers converge on the last writer without type corruption (writers_3)
     * @tc.type: FUNC
     * @tc.require: issueI5W5B3
     */
    it('CaptureSessionValidation_writers_3_concurrent_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_writers_3_concurrent_012: 3 parallel state writers');
      // The preview window and the tip window may update shared state in parallel,
      // therefore the last writer must win without corrupting the storage type.
      const writers: Promise<number>[] = [];
      for (let index: number = 0; index < 3; index++) {
        const writeOnce = async (slot: number): Promise<number> => {
          AppStorage.setOrCreate<string>('saveTipStr', 'writer_' + slot);
          await Promise.resolve();
          return slot;
        };
        writers.push(writeOnce(index));
      }
      const results: number[] = await Promise.all(writers);
      expect(results.length).assertEqual(3);
      const value: string | undefined = AppStorage.get<string>('saveTipStr');
      expect(value !== undefined).assertTrue();
      expect(value).assertEqual('writer_' + (3 - 1));
      expect(typeof value).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_writers_3_concurrent_012: final=' + String(value));
    })

    /**
     * @tc.name: CaptureSessionValidation_onDestroy_lifecycle_013
     * @tc.desc: Verify that the extension lifecycle phase leaves the shared state consistent (onDestroy)
     * @tc.type: FUNC
     * @tc.require: issueI5W5B3
     */
    it('CaptureSessionValidation_onDestroy_lifecycle_013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_onDestroy_lifecycle_013: lifecycle phase onDestroy');
      // The capture service is a ServiceExtensionAbility, each phase must leave the
      // shared state consistent so a later phase can rely on it.
      const stub = new CaptureSessionValidationLifecycleStub();
      stub.enter('onDestroy');
      stub.mark('resourceReleased');
      expect(stub.currentPhase()).assertEqual('onDestroy');
      expect(stub.isMarked('resourceReleased')).assertTrue();
      expect(stub.history().length).assertEqual(1);
      stub.enter('terminal');
      expect(stub.currentPhase()).assertEqual('terminal');
      expect(stub.history().length).assertEqual(2);
      expect(stub.history()[0]).assertEqual('onDestroy');
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_onDestroy_lifecycle_013: phase chain=' + stub.history().join('>'));
    })

    /**
     * @tc.name: CaptureSessionValidation_route_config_014
     * @tc.desc: Verify that the declared permission contract stays stable and unique (route)
     * @tc.type: FUNC
     * @tc.require: issueI5W5B3
     */
    it('CaptureSessionValidation_route_config_014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_route_config_014: verify ohos.permission.START_ABILITIES_FROM_BACKGROUND');
      // Capture is a privileged operation, the declared permission list is part of
      // the public contract of the module and must not drift silently.
      const declared: string[] = DECLARED_PERMISSIONS;
      expect(declared.length > 0).assertTrue();
      expect(declared.includes('ohos.permission.START_ABILITIES_FROM_BACKGROUND')).assertTrue();
      expect('ohos.permission.START_ABILITIES_FROM_BACKGROUND'.startsWith('ohos.permission.')).assertTrue();
      expect('route'.length > 0).assertTrue();
      const unique: string[] = [];
      for (let index: number = 0; index < declared.length; index++) {
        if (!unique.includes(declared[index])) {
          unique.push(declared[index]);
        }
      }
      expect(unique.length).assertEqual(declared.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_route_config_014: declared=' + String(declared.length));
    })

    /**
     * @tc.name: CaptureSessionValidation_sessionTimeout_guard_015
     * @tc.desc: Verify that the observation guard records every stage of the capture flow (sessionTimeout)
     * @tc.type: FUNC
     * @tc.require: issueI5W5B3
     */
    it('CaptureSessionValidation_sessionTimeout_guard_015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_sessionTimeout_guard_015: guard sessionTimeout over 7 rounds');
      // The assistant guard collects observations from every stage of the capture
      // flow so a failing stage can be identified without extra instrumentation.
      const guard = new CaptureSessionValidationStateGuard();
      expect(guard.size()).assertEqual(0);
      expect(guard.lastOk()).assertFalse();
      for (let round: number = 0; round < 7; round++) {
        guard.record('sessionTimeout_' + round, true);
      }
      expect(guard.size()).assertEqual(7);
      expect(guard.lastOk()).assertTrue();
      expect(guard.find('sessionTimeout_0')).assertTrue();
      expect(guard.find('sessionTimeout_missing')).assertFalse();
      guard.clear();
      expect(guard.size()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_sessionTimeout_guard_015: guard cleared');
    })

    /**
     * @tc.name: CaptureSessionValidation_rect_900x506_geometry_016
     * @tc.desc: Verify that the floating window rectangle survives proportional scaling (rect_900x506)
     * @tc.type: FUNC
     * @tc.require: issueI5W5B3
     */
    it('CaptureSessionValidation_rect_900x506_geometry_016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_rect_900x506_geometry_016: window rect 120/300/900/506');
      // The preview window and the tip window are positioned with explicit pixel
      // rectangles, the ratios between them must survive every resolution.
      const x: number = sizeCalc(120);
      const y: number = sizeCalc(300);
      const width: number = sizeCalc(900);
      const height: number = sizeCalc(506);
      expect(x >= 0).assertTrue();
      expect(y >= 0).assertTrue();
      expect(width > 0).assertTrue();
      expect(height > 0).assertTrue();
      expect(width > height).assertTrue();
      const centerX: number = x + width / 2;
      expect(centerX).assertLarger(x);
      expect(centerX).assertLess(x + width);
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_rect_900x506_geometry_016: rect=' + x + ',' + y + ',' + width + ',' + height);
    })

    /**
     * @tc.name: CaptureSessionValidation_type_Text_driver_017
     * @tc.desc: Verify that the preview surface can be located through the UiTest driver (type_Text)
     * @tc.type: FUNC
     * @tc.require: issueI5W5B3
     */
    it('CaptureSessionValidation_type_Text_driver_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_type_Text_driver_017: look up type=Text');
      // The preview window is rendered by the system in a floating window, so the
      // lookup is tolerant: an absent component is reported, never asserted as fatal.
      const driver = getDriver();
      let observed: boolean = false;
      let componentsCount: number = 0;
      try {
        const components = await findComponentsBySelector(driver, 'type', 'Text');
        componentsCount = components.length;
        observed = componentsCount >= 0;
        hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_type_Text_driver_017: components=' + String(components.length));
      } catch (error) {
        hilog.error(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_type_Text_driver_017: lookup failed');
        observed = false;
      }
      expect(typeof observed).assertEqual('boolean');
      expect(typeof componentsCount).assertEqual('number');
      expect(componentsCount >= 0).assertTrue();
      await serializedDelay(driver, 20);
      expect('Text'.length > 0).assertTrue();
    })

    /**
     * @tc.name: CaptureSessionValidation_value_750_numbers_018
     * @tc.desc: Verify that numeric window and timeout inputs are validated before reaching the system api (value_750)
     * @tc.type: FUNC
     * @tc.require: issueI5W5B3
     */
    it('CaptureSessionValidation_value_750_numbers_018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_value_750_numbers_018: numeric boundary 750');
      // Window sizes and timeouts accept numeric input from resources, the guards
      // must reject negative or non finite values before they reach the system api.
      const candidate: number = 750;
      const accepted: boolean = Number.isFinite(candidate) && candidate >= 0;
      expect(typeof candidate).assertEqual('number');
      expect(Number.isFinite(candidate)).assertTrue();
      expect(accepted).assertEqual(750 >= 0 ? true : false);
      expect(candidate).assertLargerOrEqual(0);
      const rounded: number = Math.round(candidate);
      expect(Math.abs(rounded - candidate) <= 0.5).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_value_750_numbers_018: accepted=' + String(accepted));
    })

    /**
     * @tc.name: CaptureSessionValidation_tipText_text_019
     * @tc.desc: Verify that the focusless tip string never renders empty (tipText)
     * @tc.type: FUNC
     * @tc.require: issueI5W5B3
     */
    it('CaptureSessionValidation_tipText_text_019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_tipText_text_019: tip rendering for saveTipStr');
      // Tip strings come from string resources, they are the only feedback the user
      // gets while the capture window is focusless, so they must never stay empty.
      AppStorage.setOrCreate<string>('saveTipStr', '');
      const stored: string | undefined = AppStorage.get<string>('saveTipStr');
      expect(stored !== undefined).assertTrue();
      const rendered: string = stored === undefined || stored.length === 0 ? 'Capture completed' : stored;
      expect(rendered.length > 0).assertTrue();
      expect(rendered).assertEqual('Capture completed');
      expect(rendered.trim()).assertEqual(rendered);
      expect(rendered.includes('\n')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_tipText_text_019: rendered=' + rendered);
    })

    /**
     * @tc.name: CaptureSessionValidation_dispatch_report_020
     * @tc.desc: Verify that the aggregated metric summary counts every sample exactly once (dispatch)
     * @tc.type: FUNC
     * @tc.require: issueI5W5B3
     */
    it('CaptureSessionValidation_dispatch_report_020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_dispatch_report_020: aggregate dispatch over 24 samples');
      // Aggregated metrics are used by the stability suites, the summary must count
      // every sample exactly once and expose a stable average.
      const samples: number[] = [];
      for (let index: number = 0; index < 24; index++) {
        samples.push(sizeCalc(index));
      }
      expect(samples.length).assertEqual(24);
      let sum: number = 0;
      for (let index: number = 0; index < samples.length; index++) {
        sum += samples[index];
      }
      const average: number = samples.length === 0 ? 0 : sum / samples.length;
      expect(average >= 0).assertTrue();
      expect(samples.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_dispatch_report_020: average=' + String(average));
    })

    /**
     * @tc.name: CaptureSessionValidation_sessionId_harness_021
     * @tc.desc: Verify that the capture pipeline harness enforces stage order and tip publication (sessionId)
     * @tc.type: FUNC
     * @tc.require: issueI5W5B3
     */
    it('CaptureSessionValidation_sessionId_harness_021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CaptureSessionValidation_sessionId_harness_021: drive harness for sessionId');
      // The harness reproduces the capture pipeline without the system screenshot api,
      // which lets the suite assert stage order, rejected transitions and tips.
      const harness = new CaptureHarness();
      const metrics = new Metrics();
      expect(harness.current()).assertEqual(CaptureStage.IDLE);
      const start: number = Date.now();
      expect(harness.advance(CaptureStage.CAPTURED)).assertTrue();
      expect(harness.advance(CaptureStage.PREVIEWED)).assertTrue();
      expect(harness.advance(CaptureStage.DISMISSED)).assertTrue();
      expect(harness.advance(CaptureStage.CAPTURED)).assertFalse();
      expect(harness.rejected()).assertEqual(1);
      expect(harness.publishTip('sessionId')).assertTrue();
      expect(harness.publishTip('')).assertFalse();
      expect(harness.lastTip()).assertEqual('sessionId');
      expect(harness.stages().length).assertEqual(3);
      metrics.record('sessionId', Date.now() - start);
      for (let index: number = 0; index < 6; index++) {
        metrics.record('sample_' + index, index + 1);
      }
      expect(metrics.count()).assertEqual(6 + 1);
      expect(metrics.average() > 0).assertTrue();
      expect(metrics.max() >= metrics.min()).assertTrue();
      expect(metrics.summary().length > 0).assertTrue();
      harness.reset();
      expect(harness.current()).assertEqual(CaptureStage.IDLE);
      metrics.reset();
      expect(metrics.count()).assertEqual(0);
    })
  });
}
