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

import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver, MatchPattern, ON, abilityDelegatorRegistry as AbilityDelegatorRegistry } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'com.example.customcamera_js';
const ABILITY: string = 'EntryAbility';
const TAG: string = 'YUVTest';
const DOMAIN: number = 0xF811;

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, duration);
  });
}

async function startApp(): Promise<Driver> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1500);
  return Driver.create();
}

// The permission dialogs appear one by one after launch, so wait for each and match the allow buttons by keyword.
async function grantPermissions(driver: Driver): Promise<number> {
  let count: number = 0;
  let missCount: number = 0;
  for (let i = 0; i < 10 && missCount < 2; i++) {
    let allow: Component | undefined = undefined;
    try {
      allow = await driver.waitForComponent(ON.text('允许', MatchPattern.CONTAINS), 1000);
    } catch (error) {
      allow = undefined;
    }
    if (!allow) {
      missCount++;
      continue;
    }
    missCount = 0;
    await allow.click();
    count++;
    await sleep(300);
  }
  return count;
}

async function ensureCamera(driver: Driver): Promise<boolean> {
  if (await driver.findComponent(ON.id('TakePicture'))) {
    return true;
  }
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1500);
  await grantPermissions(driver);
  await sleep(1500);
  if (!await driver.findComponent(ON.id('TakePicture'))) {
// The board shows a wake-up hint when the camera sleeps after the dialogs, so tap the screen once.
    await driver.click(360, 640);
    await sleep(1500);
  }
  const ready: Component = await driver.waitForComponent(ON.id('TakePicture'), 3000);
  return ready !== undefined;
}

async function getText(driver: Driver, id: string): Promise<string> {
  const component: Component = await driver.findComponent(ON.id(id));
  if (!component) {
    return '';
  }
  return await component.getText();
}

async function clickId(driver: Driver, id: string): Promise<boolean> {
  let component: Component = await driver.findComponent(ON.id(id));
  if (!component) {
    component = await driver.waitForComponent(ON.id(id), 3000);
  }
  if (!component) {
    log('component not found: ' + id);
    return false;
  }
  await component.click();
  return true;
}

async function captureAndWaitUri(driver: Driver, previous: string): Promise<string> {
  expect(await clickId(driver, 'TakePicture')).assertTrue();
  let uri: string = await getText(driver, 'thumbnailUrl');
  for (let i = 0; i < 20 && (uri.length === 0 || uri === previous); i++) {
    await sleep(300);
    uri = await getText(driver, 'thumbnailUrl');
  }
  return uri;
}

export default function yuvTest() {
  describe('YUVTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      const driver: Driver = await startApp();
      await sleep(500);
      const granted: number = await grantPermissions(driver);
      log('beforeAll granted: ' + granted);
      await sleep(500);
      log('beforeAll end');
    });

    /**
     * @tc.number    SUB_YUV_CAMERA_UI_0100
     * @tc.name      testGrantPermissionsB0001
     * @tc.desc      Grant the remaining permission dialogs and wait for the camera preview.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testGrantPermissionsB0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          const ready: Component = await driver.waitForComponent(ON.id('TakePicture'), 5000);
          log('take picture ready: ' + (ready !== undefined));
          expect(await ready.getId()).assertEqual('TakePicture');
        } catch (err) {
          log('testGrantPermissionsB0001 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_YUV_CAMERA_UI_0200
     * @tc.name      testLaunchAndCameraUI0002
     * @tc.desc      Launch the camera and verify preview and all main controls exist.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testLaunchAndCameraUI0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensureCamera(driver)).assertTrue();
          const ids: string[] = [
            'cameraPreview', 'TakePicture', 'Album', 'switchCameraBtn', 'zoom_1', 'zoom_5', 'zoom_10',
            'modeButton', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'settingButtonsView',
            'operateButtonsView'
          ];
          for (let i = 0; i < ids.length; i++) {
            const component: Component = await driver.findComponent(ON.id(ids[i]));
            log(ids[i] + '=' + (component !== undefined));
            expect(await component.getId()).assertEqual(ids[i]);
          }
          const modeText: string = await getText(driver, 'modeButton');
          const normalizedMode: string = modeText === '拍照' ? 'Photo' : modeText;
          expect(normalizedMode).assertEqual('Photo');
        } catch (err) {
          log('testLaunchAndCameraUI0002 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_YUV_CAMERA_UI_0300
     * @tc.name      testPreviewFocusBox0003
     * @tc.desc      Tap the preview and verify the focus box appears.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testPreviewFocusBox0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensureCamera(driver)).assertTrue();
          expect(await clickId(driver, 'cameraPreview')).assertTrue();
          await sleep(500);
          const focus: Component = await driver.findComponent(ON.id('focusBox'));
          log('focusBox=' + (focus !== undefined));
          expect(await focus.getId()).assertEqual('focusBox');
        } catch (err) {
          log('testPreviewFocusBox0003 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_YUV_CAMERA_UI_0400
     * @tc.name      testCapturePhoto0004
     * @tc.desc      Capture a photo and verify the media-library URI callback fires.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCapturePhoto0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensureCamera(driver)).assertTrue();
          const before: string = await getText(driver, 'thumbnailUrl');
          const uri: string = await captureAndWaitUri(driver, before);
          log('capture uri: ' + uri);
          expect(uri.length > 0).assertTrue();
          expect(uri).assertContain('file://');
        } catch (err) {
          log('testCapturePhoto0004 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_YUV_CAMERA_UI_0500
     * @tc.name      testCaptureTwice0005
     * @tc.desc      Capture twice and verify the thumbnail URI changes.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCaptureTwice0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensureCamera(driver)).assertTrue();
          const first: string = await captureAndWaitUri(driver, '');
          expect(first.length > 0).assertTrue();
          const second: string = await captureAndWaitUri(driver, first);
          log('first=' + first + ' second=' + second);
          expect(second.length > 0).assertTrue();
          expect(second === first).assertFalse();
        } catch (err) {
          log('testCaptureTwice0005 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_YUV_CAMERA_UI_0600
     * @tc.name      testZoomButtons0006
     * @tc.desc      Click the 5x, 10x and 1x zoom buttons; the page must stay responsive.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testZoomButtons0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensureCamera(driver)).assertTrue();
          expect(await clickId(driver, 'zoom_5')).assertTrue();
          await sleep(800);
          expect(await clickId(driver, 'zoom_10')).assertTrue();
          await sleep(800);
          expect(await clickId(driver, 'zoom_1')).assertTrue();
          await sleep(600);
          const preview: Component = await driver.findComponent(ON.id('cameraPreview'));
          expect(await preview.getId()).assertEqual('cameraPreview');
        } catch (err) {
          log('testZoomButtons0006 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_YUV_CAMERA_UI_0700
     * @tc.name      testSwitchCamera0007
     * @tc.desc      Switch to the other camera and back; the preview controls must survive.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testSwitchCamera0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensureCamera(driver)).assertTrue();
          expect(await clickId(driver, 'switchCameraBtn')).assertTrue();
          await sleep(2500);
          expect(await ensureCamera(driver)).assertTrue();
          const preview: Component = await driver.findComponent(ON.id('cameraPreview'));
          expect(await preview.getId()).assertEqual('cameraPreview');
          expect(await clickId(driver, 'switchCameraBtn')).assertTrue();
          await sleep(2500);
          expect(await ensureCamera(driver)).assertTrue();
        } catch (err) {
          log('testSwitchCamera0007 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_YUV_CAMERA_UI_0800
     * @tc.name      testGridLineToggle0008
     * @tc.desc      Toggle the assistive grid line twice; the page must stay responsive.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testGridLineToggle0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensureCamera(driver)).assertTrue();
          expect(await clickId(driver, 'gridLineBtn')).assertTrue();
          await sleep(500);
          expect(await clickId(driver, 'gridLineBtn')).assertTrue();
          await sleep(500);
          const preview: Component = await driver.findComponent(ON.id('cameraPreview'));
          expect(await preview.getId()).assertEqual('cameraPreview');
        } catch (err) {
          log('testGridLineToggle0008 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_YUV_CAMERA_UI_0900
     * @tc.name      testFlashMenu0009
     * @tc.desc      Open the flash menu, verify an option, then close it.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testFlashMenu0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensureCamera(driver)).assertTrue();
          expect(await clickId(driver, 'flashBtn')).assertTrue();
          await sleep(600);
          const autoItem: Component = await driver.findComponent(ON.text('auto'));
          log('flash menu auto item=' + (autoItem !== undefined));
          expect(await autoItem.getText()).assertContain('auto');
          await driver.pressBack();
          await sleep(500);
          const preview: Component = await driver.findComponent(ON.id('cameraPreview'));
          expect(await preview.getId()).assertEqual('cameraPreview');
        } catch (err) {
          log('testFlashMenu0009 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_YUV_CAMERA_UI_1000
     * @tc.name      testPhotoModeToggle0010
     * @tc.desc      Toggle single/double photo mode and capture afterwards.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testPhotoModeToggle0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensureCamera(driver)).assertTrue();
          expect(await clickId(driver, 'photoModeBtn')).assertTrue();
          await sleep(800);
          expect(await clickId(driver, 'photoModeBtn')).assertTrue();
          await sleep(800);
          const before: string = await getText(driver, 'thumbnailUrl');
          const uri: string = await captureAndWaitUri(driver, before);
          log('capture after mode toggle: ' + uri);
          expect(uri.length > 0).assertTrue();
        } catch (err) {
          log('testPhotoModeToggle0010 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_YUV_CAMERA_UI_1100
     * @tc.name      testModeButton0011
     * @tc.desc      Verify the photo mode label and that tapping it keeps the camera alive.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testModeButton0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensureCamera(driver)).assertTrue();
          const modeText: string = await getText(driver, 'modeButton');
          const normalizedMode: string = modeText === '拍照' ? 'Photo' : modeText;
          expect(normalizedMode).assertEqual('Photo');
          expect(await clickId(driver, 'modeButton')).assertTrue();
          await sleep(1500);
          expect(await ensureCamera(driver)).assertTrue();
        } catch (err) {
          log('testModeButton0011 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_YUV_CAMERA_UI_1200
     * @tc.name      testCameraStillAlive0012
     * @tc.desc      Final check: camera preview and capture button remain available.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCameraStillAlive0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensureCamera(driver)).assertTrue();
          const preview: Component = await driver.findComponent(ON.id('cameraPreview'));
          const takePicture: Component = await driver.findComponent(ON.id('TakePicture'));
          expect(await preview.getId()).assertEqual('cameraPreview');
          expect(await takePicture.getId()).assertEqual('TakePicture');
        } catch (err) {
          log('testCameraStillAlive0012 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });
  });
}
