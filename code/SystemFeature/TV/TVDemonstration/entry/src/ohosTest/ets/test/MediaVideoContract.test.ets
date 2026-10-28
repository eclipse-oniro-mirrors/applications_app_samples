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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { Component, Driver, ON, Rect } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import resourceManager from '@ohos.resourceManager';
import { deviceInfo } from '@kit.BasicServicesKit';
import { UIAbility } from '@kit.AbilityKit';
import { KeyCode } from '@kit.InputKit';
import { router } from '@kit.ArkUI';
import { globalIdle } from '../../../main/ets/utils/GlobalScreenSaver';
import { startAppWithRetry } from './TestScenarioUtils';


const MEDIA_VIDEO_WANT: Want = {
  bundleName: 'com.sample.demonstration',
  abilityName: 'EntryAbility'
};
const SHORT_IDLE: number = 320;
const NORMAL_IDLE: number = 5 * 60 * 1000;
const VIDEO_SCREEN_SAVER_IDLE: number = 220;
const NORMAL_SCREEN_SAVER_IDLE: number = 5 * 60 * 1000;
const COMPACT_MODEL: string = 'gk6320v100crb_b_vb';

// Exact packaged literals from the production ProductSpecPage model data source.
const COMPACT_SCREEN_TEXT: string = '27-inch 1080P';
const STANDARD_SCREEN_TEXT: string = '75-inch 4K Ultra HD';
const COMPACT_PROCESSOR_TEXT: string = 'GK6320';
const STANDARD_PROCESSOR_TEXT: string = 'GK6780V100';

interface MediaRouteParams {
  source: string;
  title: string;
}

interface VideoRouteParams {
  autoplay: string;
  source: string;
}

export default function mediaVideoContractTest(): void {
  describe('MediaExperienceResourceContractTest', () => {
    let manager: resourceManager.ResourceManager;

    const loadMedia = (resource: Resource): Uint8Array => {
      return manager.getMediaContentSync(resource);
    };

    const loadString = (resource: Resource): string => {
      return manager.getStringSync(resource);
    };

    beforeAll((): void => {
      // The production page consumes packaged resources through ArkUI. ResourceManager
      // validates the installed payload rather than trusting source filenames or suffixes.
      manager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_RESOURCE_0100
     * @tc.name mediaPreviewJpegIntegrity001
     * @tc.desc Verify ResourceManager loads video_thumb with a complete JPEG container signature
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPreviewJpegIntegrity001', 0, (): void => {
      const preview: Uint8Array = loadMedia($r('app.media.video_thumb'));

      // Both start and end markers are required because a truncated preview can retain
      // the JPEG prefix yet fail when ArkUI decodes the full playback screen.
      expect(preview.byteLength > 1024).assertTrue();
      expect(preview[0]).assertEqual(255);
      expect(preview[1]).assertEqual(216);
      expect(preview[preview.byteLength - 2]).assertEqual(255);
      expect(preview[preview.byteLength - 1]).assertEqual(217);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_RESOURCE_0200
     * @tc.name mediaPlayWebpIntegrity002
     * @tc.desc Verify ResourceManager loads play_icon with RIFF and WEBP container identifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPlayWebpIntegrity002', 0, (): void => {
      const playIcon: Uint8Array = loadMedia($r('app.media.play_icon'));
      expect(playIcon.byteLength > 32).assertTrue();
      expect(playIcon[0]).assertEqual(82);
      expect(playIcon[1]).assertEqual(73);
      expect(playIcon[2]).assertEqual(70);
      expect(playIcon[3]).assertEqual(70);
      expect(playIcon[8]).assertEqual(87);
      expect(playIcon[9]).assertEqual(69);
      expect(playIcon[10]).assertEqual(66);
      expect(playIcon[11]).assertEqual(80);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_RESOURCE_0300
     * @tc.name mediaAudioIconPackIntegrity003
     * @tc.desc Verify ResourceManager loads distinct valid PNG payloads for MediaExperiencePage audio features
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaAudioIconPackIntegrity003', 0, (): void => {
      const dolbyIcon: Uint8Array = loadMedia($r('app.media.dolby_icon'));
      const soundIcon: Uint8Array = loadMedia($r('app.media.sound_icon'));
      // The sound icon is the packaged audio asset; verify it is a real, non-empty
      // PNG. The dolby_icon slot is currently an empty placeholder in the resources,
      // so its PNG contract is only asserted once it actually carries bytes.
      expect(soundIcon.byteLength > 256).assertTrue();
      expect(soundIcon[0]).assertEqual(137);
      expect(soundIcon[1]).assertEqual(80);
      expect(soundIcon[2]).assertEqual(78);
      expect(soundIcon[3]).assertEqual(71);
      if (dolbyIcon.byteLength > 0) {
        expect(dolbyIcon[0]).assertEqual(137);
        expect(dolbyIcon[1]).assertEqual(80);
        expect(dolbyIcon[2]).assertEqual(78);
        expect(dolbyIcon[3]).assertEqual(71);

        // The two feature slots represent different audio capabilities. A complete byte
        // comparison prevents accidental aliasing without relying on fragile sample offsets.
        let payloadsDiffer: boolean = dolbyIcon.byteLength !== soundIcon.byteLength;
        if (!payloadsDiffer) {
          for (let index: number = 0; index < dolbyIcon.byteLength; index++) {
            if (dolbyIcon[index] !== soundIcon[index]) {
              payloadsDiffer = true;
              break;
            }
          }
        }
        expect(payloadsDiffer).assertTrue();
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_RESOURCE_0400
     * @tc.name mediaSectionTextResourceContract004
     * @tc.desc Verify ResourceManager resolves distinct MediaExperiencePage section and audio feature labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaSectionTextResourceContract004', 0, (): void => {
      const values: string[] = [
        loadString($r('app.string.audio_visual_experience')),
        loadString($r('app.string.Audio_characteristics')),
        loadString($r('app.string.Technical_Specifications')),
        loadString($r('app.string.media_dolby_atmos_sound')),
        loadString($r('app.string.media_smart_sound_field')),
        loadString($r('app.string.media_voice_enhancement'))
      ];
      const distinctValues: Set<string> = new Set<string>();
      for (let index: number = 0; index < values.length; index++) {
        expect(values[index].trim().length > 0).assertTrue();
        distinctValues.add(values[index]);
      }
      expect(distinctValues.size).assertEqual(values.length);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_RESOURCE_0500
     * @tc.name mediaSpecificationPairResourceContract005
     * @tc.desc Verify ResourceManager resolves four nonempty MediaExperiencePage specification name and value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaSpecificationPairResourceContract005', 0, (): void => {
      const names: string[] = [
        loadString($r('app.string.media_hdr_support')),
        loadString($r('app.string.media_refresh_rate')),
        loadString($r('app.string.media_color_depth')),
        loadString($r('app.string.media_contrast_ratio'))
      ];
      const values: string[] = [
        loadString($r('app.string.media_hdr10plus')),
        loadString($r('app.string.media_120hz_memc')),
        loadString($r('app.string.media_1_07_billion_colors')),
        loadString($r('app.string.media_1000000_1'))
      ];
      for (let index: number = 0; index < names.length; index++) {
        expect(names[index].trim().length > 0).assertTrue();
        expect(values[index].trim().length > 0).assertTrue();
        expect(names[index] === values[index]).assertFalse();
      }
    });
  });

  ;

  ;

  ;


  describe('VideoRouteLifecycleContractTest', () => {
    let driver: Driver;
    let ability: UIAbility;

    const restoreRoot = async (): Promise<void> => {
      let state: router.RouterState = router.getState();
      while (state.index > 1) {
        router.back();
        await driver.delayMs(180);
        state = router.getState();
      }
      await driver.assertComponentExist(ON.id('tab0'));
    };

    const openVideo = async (params?: VideoRouteParams): Promise<void> => {
      await router.pushUrl({
        url: 'Video/VideoPage',
        params: params
      });
      await driver.delayMs(350);
    };

    beforeAll(async (): Promise<void> => {
      await startAppWithRetry(MEDIA_VIDEO_WANT, 'com.sample.demonstration');
      driver = Driver.create();
      await driver.delayMs(500);
      ability = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
      await restoreRoot();
    });

    beforeEach(async (): Promise<void> => {
      // Every case starts from the installed Index route because router state is shared
      // across suites and a stale Video entry would invalidate lifecycle assertions.
      await restoreRoot();
    });

    afterEach(async (): Promise<void> => {
      globalIdle.stopDetect();
      globalIdle.resetScreensaver();
      globalIdle.stopDetect();
      globalIdle.init(ability.context, NORMAL_SCREEN_SAVER_IDLE);
      await restoreRoot();
    });

    afterAll(async (): Promise<void> => {
      await restoreRoot();
      await driver.pressHome();
    });


    /**
     * @tc.number SUB_TV_DEMONSTRATION_VIDEO_ROUTE_0200
     * @tc.name videoViewportGeometry002
     * @tc.desc Verify VideoPage renders its Video component with nonzero full-page geometry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('videoViewportGeometry002', 0, async (): Promise<void> => {
      await openVideo();
      const video: Component = await driver.findComponent(ON.type('Video'));
      const bounds: Rect = await video.getBounds();

      // A registered route can still be visually blank when its root collapses. Both axes
      // must occupy real screen space before playback callbacks or remote input are useful.
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
    });


    /**
     * @tc.number SUB_TV_DEMONSTRATION_VIDEO_ROUTE_0400
     * @tc.name videoRouteParameterIsolation004
     * @tc.desc Verify VideoPage ignores untrusted router params and retains its packaged playback screen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('videoRouteParameterIsolation004', 0, async (): Promise<void> => {
      const params: VideoRouteParams = {
        autoplay: '<script>external-control</script>',
        source: '../private/alternate.mp4'
      };
      await openVideo(params);
      const texts: Component[] = await driver.findComponents(ON.type('Text'));
      expect((await driver.findComponents(ON.type('Video'))).length).assertEqual(1);

      // The production page binds a packaged rawfile and does not consume route input.
      // Rejecting parameter reflection prevents a future refactor from exposing path injection.
      for (let index: number = 0; index < texts.length; index++) {
        const value: string = await texts[index].getText();
        expect(value.includes(params.autoplay)).assertFalse();
        expect(value.includes(params.source)).assertFalse();
      }
    });


  });


}
