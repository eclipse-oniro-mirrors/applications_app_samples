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
import resourceManager from '@ohos.resourceManager';
import i18n from '@ohos.i18n';
import util from '@ohos.util';
import window from '@ohos.window';
import display from '@ohos.display';
import UIAbility from '@ohos.app.ability.UIAbility';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver } from '@ohos.UiTest';
import Logger from '../Logger';
import { BUNDLE, SETTLE_PAGE, TAG } from '../common/TestConstant';
import { ensureAppVisible, getTopAbility, launchApp, sleep } from '../common/UiFlowHelper';
import { yieldToEventLoop } from '../common/TestYield';
/**
 * Alternate API entry points for the same resources.
 * Each family in this suite uses a second entry point that the earlier suites
 * never called: the density overload of the base64 media read, the navigation
 * indicator avoid area, the preferred language list, the URL safe base64
 * alphabet and the streaming decoder. The point is to prove the alternate path
 * exists and agrees with the primary one.
 */
const manager: resourceManager.ResourceManager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
function primarySubtag(tag: string): string {
  let cut: number = tag.length;
  const hyphen: number = tag.indexOf('-');
  const underscore: number = tag.indexOf('_');
  if (hyphen !== -1) {
    cut = hyphen;
  }
  if (underscore !== -1 && underscore < cut) {
    cut = underscore;
  }
  return tag.substring(0, cut);
}
export default function alternateApiPathTest() {
  describe('AlternateApiPathTest', () => {
    let win: window.Window | null = null;
    let screenHeight: number = 0;
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
      const driver: Driver = Driver.create();
      await launchApp();
      await sleep(SETTLE_PAGE);
      await ensureAppVisible(driver);
      screenHeight = display.getDefaultDisplaySync().height;
      const ability: UIAbility | null = await getTopAbility();
      if (ability !== null) {
        win = await window.getTopWindow(ability.context);
      }
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ALTPATH_0100
     * @tc.name DensityBase64Readable001
     * @tc.desc Verify the base64 media read accepts an explicit density
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DensityBase64Readable_001', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'DensityBase64Readable_001 begin');
      const encoded: string = await manager.getMediaContentBase64($r('app.media.Zoologist'), 160);
      expect(encoded.length !== 0).assertTrue();
      Logger.info(TAG, 'DensityBase64Readable_001 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ALTPATH_0200
     * @tc.name DensityBase64IsDataUri002
     * @tc.desc Verify the density overload still returns a data URI
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DensityBase64IsDataUri_002', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'DensityBase64IsDataUri_002 begin');
      const encoded: string = await manager.getMediaContentBase64($r('app.media.add'), 320);
      expect(encoded.startsWith('data:image/')).assertTrue();
      Logger.info(TAG, 'DensityBase64IsDataUri_002 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ALTPATH_0300
     * @tc.name DensityReadSharesHeaderWithDefault003
     * @tc.desc Verify the density overload keeps the media type reported by the default read
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DensityReadSharesHeaderWithDefault_003', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'DensityReadSharesHeaderWithDefault_003 begin');
      const atDensity: string = await manager.getMediaContentBase64($r('app.media.Chef'), 480);
      const atDefault: string = await manager.getMediaContentBase64($r('app.media.Chef'));
      const densityHeader: string = atDensity.substring(0, atDensity.indexOf(';base64,'));
      const defaultHeader: string = atDefault.substring(0, atDefault.indexOf(';base64,'));
      expect(densityHeader).assertEqual(defaultHeader);
      Logger.info(TAG, 'DensityReadSharesHeaderWithDefault_003 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ALTPATH_0400
     * @tc.name PreferredLanguagesPresent004
     * @tc.desc Verify the preferred language list is not empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PreferredLanguagesPresent_004', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'PreferredLanguagesPresent_004 begin');
      const languages: Array<string> = i18n.System.getPreferredLanguageList();
      expect(languages.length !== 0).assertTrue();
      Logger.info(TAG, 'PreferredLanguagesPresent_004 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ALTPATH_0500
     * @tc.name PreferredLanguagesNonEmptyEntries005
     * @tc.desc Verify every preferred language entry is a non empty tag
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PreferredLanguagesNonEmptyEntries_005', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'PreferredLanguagesNonEmptyEntries_005 begin');
      const languages: Array<string> = i18n.System.getPreferredLanguageList();
      let empty: number = 0;
      for (let index: number = 0; index < languages.length; index++) {
        if (languages[index].length === 0) {
          empty += 1;
        }
      }
      expect(empty).assertEqual(0);
      Logger.info(TAG, 'PreferredLanguagesNonEmptyEntries_005 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ALTPATH_0600
     * @tc.name PreferredFirstMatchesSystem006
     * @tc.desc Verify the top preferred tag and the system language share their primary subtag
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PreferredFirstMatchesSystem_006', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'PreferredFirstMatchesSystem_006 begin');
      const languages: Array<string> = i18n.System.getPreferredLanguageList();
      const systemLanguage: string = i18n.System.getSystemLanguage();
      expect(primarySubtag(languages[0])).assertEqual(primarySubtag(systemLanguage));
      Logger.info(TAG, 'PreferredFirstMatchesSystem_006 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ALTPATH_0700
     * @tc.name UrlSafeAlphabetDiffers007
     * @tc.desc Verify the URL safe alphabet differs from the basic alphabet on the same bytes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UrlSafeAlphabetDiffers_007', 0, (): void => {
      Logger.info(TAG, 'UrlSafeAlphabetDiffers_007 begin');
      const helper: util.Base64Helper = new util.Base64Helper();
      const bytes: Uint8Array = new Uint8Array(2);
      bytes[0] = 0xFB;
      bytes[1] = 0xFF;
      const basic: string = helper.encodeToStringSync(bytes, util.Type.BASIC);
      const urlSafe: string = helper.encodeToStringSync(bytes, util.Type.BASIC_URL_SAFE);
      expect(basic).assertContain('+');
      expect(urlSafe).assertContain('-');
      Logger.info(TAG, 'UrlSafeAlphabetDiffers_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ALTPATH_0800
     * @tc.name BasicEqualsDefault008
     * @tc.desc Verify the explicit basic alphabet matches the default encoding
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'BasicEqualsDefault_008', 0, (): void => {
      Logger.info(TAG, 'BasicEqualsDefault_008 begin');
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoder: util.TextEncoder = new util.TextEncoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('publish');
      expect(helper.encodeToStringSync(bytes, util.Type.BASIC))
        .assertEqual(helper.encodeToStringSync(bytes));
      Logger.info(TAG, 'BasicEqualsDefault_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ALTPATH_0900
     * @tc.name StreamDecodeMatchesDecode009
     * @tc.desc Verify the streaming decoder agrees with the one shot decoder for ascii
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StreamDecodeMatchesDecode_009', 0, (): void => {
      Logger.info(TAG, 'StreamDecodeMatchesDecode_009 begin');
      const encoder: util.TextEncoder = new util.TextEncoder('utf-8');
      const decoder: util.TextDecoder = util.TextDecoder.create('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('stream text');
      expect(decoder.decodeWithStream(bytes)).assertEqual(decoder.decodeToString(bytes));
      Logger.info(TAG, 'StreamDecodeMatchesDecode_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ALTPATH_1000
     * @tc.name StreamDecodeChinese010
     * @tc.desc Verify the streaming decoder restores CJK text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StreamDecodeChinese_010', 0, (): void => {
      Logger.info(TAG, 'StreamDecodeChinese_010 begin');
      const encoder: util.TextEncoder = new util.TextEncoder('utf-8');
      const decoder: util.TextDecoder = util.TextDecoder.create('utf-8');
      const text: string = '来杯香槟';
      expect(decoder.decodeWithStream(encoder.encodeInto(text))).assertEqual(text);
      Logger.info(TAG, 'StreamDecodeChinese_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ALTPATH_1100
     * @tc.name DensityPayloadDecodable011
     * @tc.desc Verify the density payload decodes back to image bytes through the helper
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DensityPayloadDecodable_011', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'DensityPayloadDecodable_011 begin');
      const encoded: string = await manager.getMediaContentBase64($r('app.media.Scientist'), 480);
      const marker: number = encoded.indexOf(';base64,');
      const helper: util.Base64Helper = new util.Base64Helper();
      const decoded: Uint8Array = helper.decodeSync(encoded.substring(marker + 8));
      expect(decoded.length !== 0).assertTrue();
      Logger.info(TAG, 'DensityPayloadDecodable_011 end');
      done();
    });
  });
}
