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
import { beforeAll, beforeEach, describe, it as hypiumIt, expect as hypiumExpect, TestType, Size, Level, Assert } from '@ohos/hypium';
import { Component, Driver, ON, abilityDelegatorRegistry } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE_NAME: string = 'com.demo.avrecorder01';
const ABILITY_NAME: string = 'EntryAbility';
const DOMAIN: number = 0xF811;
const delegator = abilityDelegatorRegistry.getAbilityDelegator();
const driver: Driver = Driver.create();

function log(message: string): void {
  hilog.info(DOMAIN, 'avRecorderNdkUi', '%{public}s', message);
}

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => resolve(), duration);
  });
}

async function existsById(id: string): Promise<boolean> {
  try {
    await driver.assertComponentExist(ON.id(id));
    return true;
  } catch (err) {
    return false;
  }
}

async function waitForId(id: string, attempts: number): Promise<boolean> {
  for (let index = 0; index < attempts; index++) {
    if (await existsById(id)) { return true; }
    await sleep(300);
  }
  return false;
}

async function ensureIndex(): Promise<boolean> {
  for (let index = 0; index < 4; index++) {
    if (await waitForId('videoRecorderPage', 2)) { return true; }
    await driver.pressBack();
    await sleep(800);
  }
  return false;
}

async function openPage(pageId: string): Promise<boolean> {
  if (!await ensureIndex()) { return false; }
  if (!await waitForId(pageId, 10)) { return false; }
  const entry: Component = await driver.findComponent(ON.id(pageId));
  if (!entry) { return false; }
  await entry.click();
  await sleep(1200);
  return true;
}

async function grantPermissions(): Promise<void> {
  for (let index: number = 0; index < 6; index++) {
    const allow: Component = await driver.waitForComponent(ON.text('允许'), 1500);
    if (!allow) { break; }
    await allow.click();
    await sleep(800);
  }
}

async function clickId(id: string): Promise<boolean> {
  if (!await waitForId(id, 10)) { return false; }
  const component: Component = await driver.findComponent(ON.id(id));
  if (!component) { return false; }
  await component.click();
  return true;
}

const TAG: string = '[Sample_avRecorderNativeUi]';

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function avRecorderNativeUiTest(): void {
  describe('avRecorderNdkUiTest', () => {
    beforeAll(async () => {
      const want: Want = { bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME };
      await delegator.startAbility(want);
      await sleep(2500);
      await grantPermissions();
      await sleep(1000);
      await ensureIndex();
    })
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKUI_0001
     * @tc.name      testExtRecAudioNativeUi0000
     * @tc.desc      Audio Native page check 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecAudioNativeUi0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openPage('audioRecorderNDKPage')).assertTrue();
      expect(await waitForId('audioStartNDK', 10)).assertTrue();
      expect(await existsById('audioStartNDK')).assertTrue();
      expect(await existsById('audioStopNDK') || await existsById('audioStartNDK')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKUI_0002
     * @tc.name      testExtRecAudioNativeUi0001
     * @tc.desc      Audio Native page check 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecAudioNativeUi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openPage('audioRecorderNDKPage')).assertTrue();
      expect(await waitForId('audioStartNDK', 10)).assertTrue();
      expect(await existsById('audioStartNDK')).assertTrue();
      expect(await existsById('audioStopNDK') || await existsById('audioStartNDK')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKUI_0003
     * @tc.name      testExtRecAudioNativeUi0002
     * @tc.desc      Audio Native page check 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecAudioNativeUi0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openPage('audioRecorderNDKPage')).assertTrue();
      expect(await waitForId('audioStartNDK', 10)).assertTrue();
      expect(await existsById('audioStartNDK')).assertTrue();
      expect(await existsById('audioStopNDK') || await existsById('audioStartNDK')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKUI_0004
     * @tc.name      testExtRecAudioNativeUi0003
     * @tc.desc      Audio Native page check 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecAudioNativeUi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openPage('audioRecorderNDKPage')).assertTrue();
      expect(await waitForId('audioStartNDK', 10)).assertTrue();
      expect(await existsById('audioStartNDK')).assertTrue();
      expect(await existsById('audioStopNDK') || await existsById('audioStartNDK')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKUI_0005
     * @tc.name      testExtRecAudioNativeUi0004
     * @tc.desc      Audio Native page check 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecAudioNativeUi0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openPage('audioRecorderNDKPage')).assertTrue();
      expect(await waitForId('audioStartNDK', 10)).assertTrue();
      expect(await existsById('audioStartNDK')).assertTrue();
      expect(await existsById('audioStopNDK') || await existsById('audioStartNDK')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKUI_0006
     * @tc.name      testExtRecAudioNativeUi0005
     * @tc.desc      Audio Native page check 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecAudioNativeUi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openPage('audioRecorderNDKPage')).assertTrue();
      expect(await waitForId('audioStartNDK', 10)).assertTrue();
      expect(await existsById('audioStartNDK')).assertTrue();
      expect(await existsById('audioStopNDK') || await existsById('audioStartNDK')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKUI_0007
     * @tc.name      testExtRecAudioNativeUi0006
     * @tc.desc      Audio Native page check 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecAudioNativeUi0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openPage('audioRecorderNDKPage')).assertTrue();
      expect(await waitForId('audioStartNDK', 10)).assertTrue();
      expect(await existsById('audioStartNDK')).assertTrue();
      expect(await existsById('audioStopNDK') || await existsById('audioStartNDK')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKUI_0008
     * @tc.name      testExtRecAudioNativeUi0007
     * @tc.desc      Audio Native page check 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecAudioNativeUi0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openPage('audioRecorderNDKPage')).assertTrue();
      expect(await waitForId('audioStartNDK', 10)).assertTrue();
      expect(await existsById('audioStartNDK')).assertTrue();
      expect(await existsById('audioStopNDK') || await existsById('audioStartNDK')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKUI_0009
     * @tc.name      testExtRecAudioNativeUi0008
     * @tc.desc      Audio Native page check 9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecAudioNativeUi0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openPage('audioRecorderNDKPage')).assertTrue();
      expect(await waitForId('audioStartNDK', 10)).assertTrue();
      expect(await existsById('audioStartNDK')).assertTrue();
      expect(await existsById('audioStopNDK') || await existsById('audioStartNDK')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKUI_0010
     * @tc.name      testExtRecAudioNativeUi0009
     * @tc.desc      Audio Native page check 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecAudioNativeUi0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openPage('audioRecorderNDKPage')).assertTrue();
      expect(await waitForId('audioStartNDK', 10)).assertTrue();
      expect(await existsById('audioStartNDK')).assertTrue();
      expect(await existsById('audioStopNDK') || await existsById('audioStartNDK')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKUI_0011
     * @tc.name      testExtRecVideoNativeUi0000
     * @tc.desc      Video Native page check 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecVideoNativeUi0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openPage('videoRecorderNDKPage')).assertTrue();
      expect(await waitForId('videoStartNDK', 10)).assertTrue();
      expect(await existsById('videoStartNDK')).assertTrue();
      expect(await existsById('videoStopNDK') || await existsById('videoStartNDK')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKUI_0012
     * @tc.name      testExtRecVideoNativeUi0001
     * @tc.desc      Video Native page check 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecVideoNativeUi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openPage('videoRecorderNDKPage')).assertTrue();
      expect(await waitForId('videoStartNDK', 10)).assertTrue();
      expect(await existsById('videoStartNDK')).assertTrue();
      expect(await existsById('videoStopNDK') || await existsById('videoStartNDK')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKUI_0013
     * @tc.name      testExtRecVideoNativeUi0002
     * @tc.desc      Video Native page check 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecVideoNativeUi0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openPage('videoRecorderNDKPage')).assertTrue();
      expect(await waitForId('videoStartNDK', 10)).assertTrue();
      expect(await existsById('videoStartNDK')).assertTrue();
      expect(await existsById('videoStopNDK') || await existsById('videoStartNDK')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKUI_0014
     * @tc.name      testExtRecVideoNativeUi0003
     * @tc.desc      Video Native page check 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecVideoNativeUi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openPage('videoRecorderNDKPage')).assertTrue();
      expect(await waitForId('videoStartNDK', 10)).assertTrue();
      expect(await existsById('videoStartNDK')).assertTrue();
      expect(await existsById('videoStopNDK') || await existsById('videoStartNDK')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKUI_0015
     * @tc.name      testExtRecVideoNativeUi0004
     * @tc.desc      Video Native page check 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecVideoNativeUi0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openPage('videoRecorderNDKPage')).assertTrue();
      expect(await waitForId('videoStartNDK', 10)).assertTrue();
      expect(await existsById('videoStartNDK')).assertTrue();
      expect(await existsById('videoStopNDK') || await existsById('videoStartNDK')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKUI_0016
     * @tc.name      testExtRecVideoNativeUi0005
     * @tc.desc      Video Native page check 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecVideoNativeUi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openPage('videoRecorderNDKPage')).assertTrue();
      expect(await waitForId('videoStartNDK', 10)).assertTrue();
      expect(await existsById('videoStartNDK')).assertTrue();
      expect(await existsById('videoStopNDK') || await existsById('videoStartNDK')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKUI_0017
     * @tc.name      testExtRecVideoNativeUi0006
     * @tc.desc      Video Native page check 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecVideoNativeUi0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openPage('videoRecorderNDKPage')).assertTrue();
      expect(await waitForId('videoStartNDK', 10)).assertTrue();
      expect(await existsById('videoStartNDK')).assertTrue();
      expect(await existsById('videoStopNDK') || await existsById('videoStartNDK')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKUI_0018
     * @tc.name      testExtRecVideoNativeUi0007
     * @tc.desc      Video Native page check 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecVideoNativeUi0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openPage('videoRecorderNDKPage')).assertTrue();
      expect(await waitForId('videoStartNDK', 10)).assertTrue();
      expect(await existsById('videoStartNDK')).assertTrue();
      expect(await existsById('videoStopNDK') || await existsById('videoStartNDK')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKUI_0019
     * @tc.name      testExtRecVideoNativeUi0008
     * @tc.desc      Video Native page check 9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecVideoNativeUi0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openPage('videoRecorderNDKPage')).assertTrue();
      expect(await waitForId('videoStartNDK', 10)).assertTrue();
      expect(await existsById('videoStartNDK')).assertTrue();
      expect(await existsById('videoStopNDK') || await existsById('videoStartNDK')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKUI_0020
     * @tc.name      testExtRecVideoNativeUi0009
     * @tc.desc      Video Native page check 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecVideoNativeUi0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openPage('videoRecorderNDKPage')).assertTrue();
      expect(await waitForId('videoStartNDK', 10)).assertTrue();
      expect(await existsById('videoStartNDK')).assertTrue();
      expect(await existsById('videoStopNDK') || await existsById('videoStartNDK')).assertTrue();
    })
  });
}
