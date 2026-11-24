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
import { hilog } from '@kit.PerformanceAnalysisKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const DOMAIN: number = 0xF812;
const TAG: string = 'WindowStartIconAdAssetsTest';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/**
 * Loads a media resource as binary content.
 */
async function loadMedia(resource: Resource): Promise<Uint8Array> {
  return await delegator.getAppContext().resourceManager.getMediaContent(resource);
}

export default function adResourceAssetsTest(): void {
  describe('AdResourceAssetsTest', () => {
    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADCOLOR_0307
     * @tc.name      testWindowStartIconAdColor0307
     * @tc.desc      Verify the advertising animation gif media loads with content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdColor0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdColor0307 begin');
      const content: Uint8Array = await loadMedia($r('app.media.enter_app_animation'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger content.length=${content.length}, expected=0`);
      expect(content.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof content.length=${typeof content.length}`);
      expect(typeof content.length).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${content instanceof Uint8Array}`);
      expect(content instanceof Uint8Array).assertTrue();
      log('testWindowStartIconAdColor0307 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADCOLOR_0308
     * @tc.name      testWindowStartIconAdColor0308
     * @tc.desc      Verify the advertising animation binary starts with the GIF signature.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdColor0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdColor0308 begin');
      const content: Uint8Array = await loadMedia($r('app.media.enter_app_animation'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger content.length=${content.length}, expected=6`);
      expect(content.length).assertLarger(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual content[0]=${content[0]}, expected=0x47`);
      expect(content[0]).assertEqual(0x47);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual content[1]=${content[1]}, expected=0x49`);
      expect(content[1]).assertEqual(0x49);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual content[2]=${content[2]}, expected=0x46`);
      expect(content[2]).assertEqual(0x46);
      log('testWindowStartIconAdColor0308 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADCOLOR_0309
     * @tc.name      testWindowStartIconAdColor0309
     * @tc.desc      Verify the layered icon background png loads with the PNG signature.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdColor0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdColor0309 begin');
      const content: Uint8Array = await loadMedia($r('app.media.background'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger content.length=${content.length}, expected=8`);
      expect(content.length).assertLarger(8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual content[0]=${content[0]}, expected=0x89`);
      expect(content[0]).assertEqual(0x89);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual content[1]=${content[1]}, expected=0x50`);
      expect(content[1]).assertEqual(0x50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual content[2]=${content[2]}, expected=0x4E`);
      expect(content[2]).assertEqual(0x4E);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual content[3]=${content[3]}, expected=0x47`);
      expect(content[3]).assertEqual(0x47);
      log('testWindowStartIconAdColor0309 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADCOLOR_0310
     * @tc.name      testWindowStartIconAdColor0310
     * @tc.desc      Verify the layered icon foreground png loads with the PNG signature.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdColor0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdColor0310 begin');
      const content: Uint8Array = await loadMedia($r('app.media.foreground'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger content.length=${content.length}, expected=8`);
      expect(content.length).assertLarger(8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual content[0]=${content[0]}, expected=0x89`);
      expect(content[0]).assertEqual(0x89);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual content[1]=${content[1]}, expected=0x50`);
      expect(content[1]).assertEqual(0x50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual content[2]=${content[2]}, expected=0x4E`);
      expect(content[2]).assertEqual(0x4E);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual content[3]=${content[3]}, expected=0x47`);
      expect(content[3]).assertEqual(0x47);
      log('testWindowStartIconAdColor0310 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADCOLOR_0311
     * @tc.name      testWindowStartIconAdColor0311
     * @tc.desc      Verify the gif and png binaries are different media payloads.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdColor0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdColor0311 begin');
      const gif: Uint8Array = await loadMedia($r('app.media.enter_app_animation'));
      const png: Uint8Array = await loadMedia($r('app.media.background'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse gif[0] === png[0]=${gif[0] === png[0]}`);
      expect(gif[0] === png[0]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger gif.length=${gif.length}, expected=0`);
      expect(gif.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger png.length=${png.length}, expected=0`);
      expect(png.length).assertLarger(0);
      log('testWindowStartIconAdColor0311 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADCOLOR_0312
     * @tc.name      testWindowStartIconAdColor0312
     * @tc.desc      Verify the gif version byte encodes a valid GIF87a or GIF89a variant.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdColor0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdColor0312 begin');
      const gif: Uint8Array = await loadMedia($r('app.media.enter_app_animation'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger gif.length=${gif.length}, expected=6`);
      expect(gif.length).assertLarger(6);
      const versionByte: number = gif[3];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${versionByte === 0x38 || versionByte === 0x39}`);
      expect(versionByte === 0x38 || versionByte === 0x39).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual gif[0]=${gif[0]}, expected=0x47`);
      expect(gif[0]).assertEqual(0x47);
      log('testWindowStartIconAdColor0312 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADCOLOR_0313
     * @tc.name      testWindowStartIconAdColor0313
     * @tc.desc      Verify the layered background and foreground pngs differ in content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdColor0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdColor0313 begin');
      const background: Uint8Array = await loadMedia($r('app.media.background'));
      const foreground: Uint8Array = await loadMedia($r('app.media.foreground'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger background.length=${background.length}, expected=8`);
      expect(background.length).assertLarger(8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger foreground.length=${foreground.length}, expected=8`);
      expect(foreground.length).assertLarger(8);
      let samePrefix: boolean = true;
      const probe: number = background.length < foreground.length ? background.length : foreground.length;
      const limit: number = probe < 32 ? probe : 32;
      let diffFound: boolean = false;
      for (let i: number = 0; i < limit; i++) {
        if (background[i] !== foreground[i]) {
          diffFound = true;
          break;
        }
      }
      samePrefix = !diffFound && background.length === foreground.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse samePrefix=${samePrefix}`);
      expect(samePrefix).assertFalse();
      log('testWindowStartIconAdColor0313 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADCOLOR_0316
     * @tc.name      testWindowStartIconAdColor0316
     * @tc.desc      Verify the gif and foreground png keep their distinct signatures.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdColor0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdColor0316 begin');
      const gif: Uint8Array = await loadMedia($r('app.media.enter_app_animation'));
      const foreground: Uint8Array = await loadMedia($r('app.media.foreground'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual gif[0]=${gif[0]}, expected=0x47`);
      expect(gif[0]).assertEqual(0x47);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual foreground[0]=${foreground[0]}, expected=0x89`);
      expect(foreground[0]).assertEqual(0x89);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse gif[0] === foreground[0]=${gif[0] === foreground[0]}`);
      expect(gif[0] === foreground[0]).assertFalse();
      log('testWindowStartIconAdColor0316 end');
    })
  })
}
