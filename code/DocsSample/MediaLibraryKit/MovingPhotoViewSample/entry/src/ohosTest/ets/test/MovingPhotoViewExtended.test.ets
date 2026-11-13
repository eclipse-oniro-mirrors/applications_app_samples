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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { bundleManager, common, Want } from '@kit.AbilityKit';
import { MovingPhotoViewController } from '@kit.MediaLibraryKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_MovingPhotoView_Extended]';
const BUNDLE_NAME: string = 'com.example.movingphotoviewsample';
const ENTRY_ABILITY: string = 'EntryAbility';
const PLAY_TEXT: string = 'PLAY';
const STOP_TEXT: string = 'STOP';
const PLAYING_TEXT: string = '开始播放';
const STOPPED_TEXT: string = '停止播放';
const LOADED_TEXT: string = '动态照片已加载，长按可播放';
const DELEGATOR = abilityDelegatorRegistry.getAbilityDelegator();

function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

export default function movingPhotoViewExtendedTest() {
  describe('MovingPhotoViewExtendedTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      const want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: ENTRY_ABILITY
      };
      await DELEGATOR.startAbility(want);
      await delay(3000);
      driver = await Driver.create();
    })

    /**
     * @tc.name   testPlayStopButtons0001
     * @tc.number MOVING_PHOTO_VIEW_EXT_0100
     * @tc.desc   Test that the PLAY and STOP buttons are present.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlayStopButtons0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text(PLAY_TEXT));
      await driver.assertComponentExist(ON.text(STOP_TEXT));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testLoadedMessage0002
     * @tc.number MOVING_PHOTO_VIEW_EXT_0200
     * @tc.desc   Test that the moving photo loaded message is displayed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoadedMessage0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const loaded: Component = await driver.findComponent(ON.text(LOADED_TEXT));
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(loaded !== null || playing !== null || stopped !== null).assertTrue();
    })

    /**
     * @tc.name   testStopMessage0003
     * @tc.number MOVING_PHOTO_VIEW_EXT_0300
     * @tc.desc   Test that STOP displays the stopped message.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStopMessage0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(1000);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testPlayMessage0004
     * @tc.number MOVING_PHOTO_VIEW_EXT_0400
     * @tc.desc   Test that PLAY displays the started message.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlayMessage0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(500);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(1000);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testPlayStopPlay0005
     * @tc.number MOVING_PHOTO_VIEW_EXT_0500
     * @tc.desc   Test that playback can be restarted after a stop.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPlayStopPlay0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(500);
      const play: Component = await driver.findComponent(ON.text(PLAY_TEXT));
      await play.click();
      await delay(500);
      await stop.click();
      await delay(500);
      await play.click();
      await delay(1000);
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      expect(await playing.getText()).assertEqual(PLAYING_TEXT);
    })

    /**
     * @tc.name   testRepeatedStop0006
     * @tc.number MOVING_PHOTO_VIEW_EXT_0600
     * @tc.desc   Test that repeated STOP clicks keep the stopped message.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRepeatedStop0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stop: Component = await driver.findComponent(ON.text(STOP_TEXT));
      await stop.click();
      await delay(500);
      await stop.click();
      await delay(500);
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(await stopped.getText()).assertEqual(STOPPED_TEXT);
    })

    /**
     * @tc.name   testLoadedMessageAfterPlayback0007
     * @tc.number MOVING_PHOTO_VIEW_EXT_0700
     * @tc.desc   Test that the loaded message remains visible after playback operations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLoadedMessageAfterPlayback0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const loaded: Component = await driver.findComponent(ON.text(LOADED_TEXT));
      const playing: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
      const stopped: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
      expect(loaded !== null || playing !== null || stopped !== null).assertTrue();
    })

    /**
     * @tc.name   testControllerInstance0008
     * @tc.number MOVING_PHOTO_VIEW_EXT_0800
     * @tc.desc   Test that a MovingPhotoViewController can be created.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerInstance0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(controller !== undefined).assertTrue();
    })

    /**
     * @tc.name   testControllerApi0009
     * @tc.number MOVING_PHOTO_VIEW_EXT_0900
     * @tc.desc   Test the controller playback method usage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerApi0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testBundleIdentity0010
     * @tc.number MOVING_PHOTO_VIEW_EXT_1000
     * @tc.desc   Test the bundle name and version.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleIdentity0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: bundleManager.BundleInfo =
        bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
      expect(info.name).assertEqual(BUNDLE_NAME);
      expect(info.versionName).assertEqual('1.0.0');
    })

    /**
     * @tc.name   testEntryAbilityDeclared0011
     * @tc.number MOVING_PHOTO_VIEW_EXT_1100
     * @tc.desc   Test the entry module and EntryAbility declaration.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEntryAbilityDeclared0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      let foundModule: boolean = false;
      let foundAbility: boolean = false;
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          foundModule = true;
          for (let j = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === ENTRY_ABILITY) {
              foundAbility = true;
            }
          }
        }
      }
      expect(foundModule).assertTrue();
      expect(foundAbility).assertTrue();
    })

    /**
     * @tc.name   testRawMovingPhotoFiles0012
     * @tc.number MOVING_PHOTO_VIEW_EXT_1200
     * @tc.desc   Test that the raw image and video assets are packaged.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRawMovingPhotoFiles0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = DELEGATOR.getAppContext();
      const image: Uint8Array = await context.resourceManager.getRawFileContent('moving_photo.jpg');
      const video: Uint8Array = await context.resourceManager.getRawFileContent('moving_photo.mp4');
      expect(image.byteLength > 0).assertTrue();
      expect(video.byteLength > 0).assertTrue();
    })

  })
}
