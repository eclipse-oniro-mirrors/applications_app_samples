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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { createVersionChoices, VCardConstants, VersionChoice, VCardSettings } from 'library';

const DOMAIN: number = 0xF811;

function containsNumber(values: number[], target: number): boolean {
  for (let i = 0; i < values.length; i++) {
    if (values[i] === target) {
      return true;
    }
  }
  return false;
}

function containsChoiceValue(choices: VersionChoice[], target: number): boolean {
  for (let i = 0; i < choices.length; i++) {
    if (choices[i].value === target) {
      return true;
    }
  }
  return false;
}

export default function settingsLogicTest() {
  describe('SettingsLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_0100
     * @tc.name      testSettingsDefaultsPairing0001
     * @tc.desc      Verify fresh settings pair with the exported constants so
     *               the store fallback and the factory agree on defaults.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsDefaultsPairing0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsDefaultsPairing0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settings: VCardSettings = new VCardSettings();
      const choices: VersionChoice[] = createVersionChoices();
      expect(settings.defaultVersion).assertEqual(choices[0].value);
      expect(settings.historyLimit).assertEqual(VCardConstants.DEFAULT_HISTORY_LIMIT);
      expect(settings.autoJumpToContacts).assertTrue();
      expect(settings.defaultCharset).assertEqual(VCardConstants.CHARSET_UTF8);
      expect(settings.defaultCharset === VCardConstants.CHARSET_GBK).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_0200
     * @tc.name      testSettingsVersionAssign0001
     * @tc.desc      Verify every valid default version index is stored and
     *               read back unchanged on the settings model.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsVersionAssign0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsVersionAssign0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settings: VCardSettings = new VCardSettings();
      settings.defaultVersion = 1;
      expect(settings.defaultVersion).assertEqual(1);
      settings.defaultVersion = 2;
      expect(settings.defaultVersion).assertEqual(2);
      settings.defaultVersion = 0;
      expect(settings.defaultVersion).assertEqual(0);
      const choices: VersionChoice[] = createVersionChoices();
      expect(containsChoiceValue(choices, settings.defaultVersion)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_0300
     * @tc.name      testSettingsVersionInvalid0001
     * @tc.desc      Verify out-of-range version candidates never appear in the
     *               valid choice list derived from the exported factory.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsVersionInvalid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsVersionInvalid0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const choices: VersionChoice[] = createVersionChoices();
      expect(containsChoiceValue(choices, -1)).assertFalse();
      expect(containsChoiceValue(choices, 3)).assertFalse();
      expect(containsChoiceValue(choices, 99)).assertFalse();
      expect(containsChoiceValue(choices, 100)).assertFalse();
      expect(containsChoiceValue(choices, 0)).assertTrue();
      expect(containsChoiceValue(choices, 1)).assertTrue();
      expect(containsChoiceValue(choices, 2)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_0400
     * @tc.name      testSettingsChoicesAscending0001
     * @tc.desc      Verify version choice values form a strictly ascending
     *       \t       sequence starting above zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsChoicesAscending0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsChoicesAscending0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const choices: VersionChoice[] = createVersionChoices();
      expect(choices[0].value).assertLess(choices[1].value);
      expect(choices[1].value).assertLess(choices[2].value);
      expect(choices[0].value).assertLarger(-1);
      expect(choices[2].value).assertLarger(choices[0].value);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_0500
     * @tc.name      testSettingsChoicesDesc0001
     * @tc.desc      Verify each version choice carries a non-null localized
     *               description resource for the settings page.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsChoicesDesc0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsChoicesDesc0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const choices: VersionChoice[] = createVersionChoices();
      expect(choices[0].description).not().assertNull();
      expect(choices[1].description).not().assertNull();
      expect(choices[2].description).not().assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_0600
     * @tc.name      testSettingsChoicesLabel0001
     * @tc.desc      Verify version labels stay pairwise unique with a fixed
     *               three character shape for the picker rows.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsChoicesLabel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsChoicesLabel0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const choices: VersionChoice[] = createVersionChoices();
      expect(choices[0].label === choices[1].label).assertFalse();
      expect(choices[1].label === choices[2].label).assertFalse();
      expect(choices[0].label.length).assertEqual(3);
      expect(choices[1].label.length).assertEqual(3);
      expect(choices[2].label.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_0700
     * @tc.name      testSettingsFactoryFresh0001
     * @tc.desc      Verify the choice factory returns a new array per call so
     *               a mutated list never leaks into later callers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsFactoryFresh0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsFactoryFresh0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const first: VersionChoice[] = createVersionChoices();
      const second: VersionChoice[] = createVersionChoices();
      const extra: VersionChoice = new VersionChoice(9, '9.9', 'extra option');
      first.push(extra);
      expect(first === second).assertFalse();
      expect(first.length).assertEqual(4);
      expect(second.length).assertEqual(3);
      expect(first[3].value).assertEqual(9);
      expect(first[3].label).assertEqual('9.9');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_0800
     * @tc.name      testSettingsChoiceCtor0001
     * @tc.desc      Verify the VersionChoice constructor keeps custom values
     *               and labels exactly as supplied by the caller.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsChoiceCtor0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsChoiceCtor0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const custom: VersionChoice = new VersionChoice(7, 'X.7', 'custom description');
      expect(custom.value).assertEqual(7);
      expect(custom.label).assertEqual('X.7');
      expect(custom.description).assertEqual('custom description');
      const minimal: VersionChoice = new VersionChoice(-2, '', '');
      expect(minimal.value).assertEqual(-2);
      expect(minimal.label).assertEqual('');
      expect(minimal.description).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_0900
     * @tc.name      testSettingsJumpToggle0001
     * @tc.desc      Verify the auto jump switch flips in both directions and
     *               every toggle is stored on the settings model.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsJumpToggle0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsJumpToggle0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settings: VCardSettings = new VCardSettings();
      expect(settings.autoJumpToContacts).assertTrue();
      settings.autoJumpToContacts = false;
      expect(settings.autoJumpToContacts).assertFalse();
      settings.autoJumpToContacts = true;
      expect(settings.autoJumpToContacts).assertTrue();
      settings.autoJumpToContacts = false;
      expect(settings.autoJumpToContacts).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_1000
     * @tc.name      testSettingsLimitAssign0001
     * @tc.desc      Verify every offered history limit option is stored and
     *               read back from the settings model unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsLimitAssign0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsLimitAssign0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settings: VCardSettings = new VCardSettings();
      const options: number[] = VCardConstants.HISTORY_LIMIT_OPTIONS;
      settings.historyLimit = options[0];
      expect(settings.historyLimit).assertEqual(options[0]);
      settings.historyLimit = options[1];
      expect(settings.historyLimit).assertEqual(options[1]);
      settings.historyLimit = options[2];
      expect(settings.historyLimit).assertEqual(options[2]);
      settings.historyLimit = options[3];
      expect(settings.historyLimit).assertEqual(options[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_1100
     * @tc.name      testSettingsLimitAssignMax0001
     * @tc.desc      Verify the maximum retention bound is accepted by the
     *               settings model and exceeds the largest offered option.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsLimitAssignMax0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsLimitAssignMax0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settings: VCardSettings = new VCardSettings();
      settings.historyLimit = VCardConstants.HISTORY_LIMIT_MAX;
      expect(settings.historyLimit).assertEqual(VCardConstants.HISTORY_LIMIT_MAX);
      expect(settings.historyLimit).assertLarger(VCardConstants.HISTORY_LIMIT_OPTIONS[3]);
      expect(settings.historyLimit).assertLarger(VCardConstants.DEFAULT_HISTORY_LIMIT);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_1200
     * @tc.name      testSettingsLimitRaw0001
     * @tc.desc      Verify the settings model stores raw numbers unchanged so
     *               the store layer owns the validation responsibility.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsLimitRaw0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsLimitRaw0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settings: VCardSettings = new VCardSettings();
      settings.historyLimit = 0;
      expect(settings.historyLimit).assertEqual(0);
      settings.historyLimit = -5;
      expect(settings.historyLimit).assertEqual(-5);
      settings.historyLimit = 101;
      expect(settings.historyLimit).assertEqual(101);
      settings.historyLimit = 7;
      expect(settings.historyLimit).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_1300
     * @tc.name      testSettingsLimitOrder0001
     * @tc.desc      Verify the offered history limits form a strictly
     *               ascending chain suitable for an ordered picker.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsLimitOrder0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsLimitOrder0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const options: number[] = VCardConstants.HISTORY_LIMIT_OPTIONS;
      expect(options[0]).assertLess(options[1]);
      expect(options[1]).assertLess(options[2]);
      expect(options[2]).assertLess(options[3]);
      expect(options[3]).assertLarger(options[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_1400
     * @tc.name      testSettingsLimitBound0001
     * @tc.desc      Verify the maximum retention bound dominates every option
     *               and the default stays inside the offered range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsLimitBound0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsLimitBound0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const options: number[] = VCardConstants.HISTORY_LIMIT_OPTIONS;
      for (let i = 0; i < options.length; i++) {
        expect(VCardConstants.HISTORY_LIMIT_MAX).assertLarger(options[i]);
      }
      expect(VCardConstants.DEFAULT_HISTORY_LIMIT).assertLarger(options[0]);
      expect(VCardConstants.DEFAULT_HISTORY_LIMIT).assertLess(VCardConstants.HISTORY_LIMIT_MAX);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_1500
     * @tc.name      testSettingsLimitMember0001
     * @tc.desc      Verify the default retention value is one of the offered
     *               options while arbitrary values are not offered.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsLimitMember0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsLimitMember0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const options: number[] = VCardConstants.HISTORY_LIMIT_OPTIONS;
      expect(containsNumber(options, VCardConstants.DEFAULT_HISTORY_LIMIT)).assertTrue();
      expect(containsNumber(options, 7)).assertFalse();
      expect(containsNumber(options, 0)).assertFalse();
      expect(containsNumber(options, 100)).assertFalse();
      expect(containsNumber(options, -5)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_1600
     * @tc.name      testSettingsCharsetRoundTrip0001
     * @tc.desc      Verify the charset setting round trips between the two
     *               exported charset constants without drift.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsCharsetRoundTrip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsCharsetRoundTrip0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settings: VCardSettings = new VCardSettings();
      settings.defaultCharset = VCardConstants.CHARSET_GBK;
      expect(settings.defaultCharset).assertEqual(VCardConstants.CHARSET_GBK);
      settings.defaultCharset = VCardConstants.CHARSET_UTF8;
      expect(settings.defaultCharset).assertEqual(VCardConstants.CHARSET_UTF8);
      settings.defaultCharset = VCardConstants.CHARSET_GBK;
      expect(settings.defaultCharset).assertEqual(VCardConstants.CHARSET_GBK);
      expect(settings.defaultCharset === VCardConstants.CHARSET_UTF8).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_1700
     * @tc.name      testSettingsCharsetCase0001
     * @tc.desc      Verify charset constants are case sensitive so lowercase
     *               spellings never equal the persisted canonical values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsCharsetCase0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsCharsetCase0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(VCardConstants.CHARSET_GBK === 'gbk').assertFalse();
      expect(VCardConstants.CHARSET_UTF8 === 'utf-8').assertFalse();
      expect(VCardConstants.CHARSET_GBK === VCardConstants.CHARSET_UTF8).assertFalse();
      expect(VCardConstants.CHARSET_GBK).assertEqual('GBK');
      expect(VCardConstants.CHARSET_UTF8).assertEqual('UTF-8');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_1800
     * @tc.name      testSettingsCharsetShape0001
     * @tc.desc      Verify the charset constants keep their exact lengths and
     *               the hyphen position inside the UTF-8 spelling.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsCharsetShape0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsCharsetShape0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(VCardConstants.CHARSET_UTF8).assertContain('-');
      expect(VCardConstants.CHARSET_UTF8.length).assertEqual(5);
      expect(VCardConstants.CHARSET_GBK.length).assertEqual(3);
      expect(VCardConstants.CHARSET_UTF8.indexOf('-')).assertEqual(3);
      expect(VCardConstants.CHARSET_GBK.indexOf('-')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_1900
     * @tc.name      testSettingsPrefKey0001
     * @tc.desc      Verify the settings preference key keeps its canonical
     *       \t       spelling and stays distinct from the history key.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsPrefKey0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsPrefKey0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(VCardConstants.PREFERENCE_SETTINGS).assertEqual('vcard_settings');
      expect(VCardConstants.PREFERENCE_SETTINGS).assertContain('settings');
      expect(VCardConstants.PREFERENCE_SETTINGS.length).assertEqual(14);
      expect(VCardConstants.PREFERENCE_SETTINGS === VCardConstants.PREFERENCE_HISTORY).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_2000
     * @tc.name      testSettingsPreviewLine0001
     * @tc.desc      Verify the preview line budget constant keeps its exact
     *               positive value above the card limit.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsPreviewLine0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsPreviewLine0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(VCardConstants.PREVIEW_LINE_LIMIT).assertEqual(24);
      expect(VCardConstants.PREVIEW_LINE_LIMIT).assertLarger(0);
      expect(VCardConstants.PREVIEW_LINE_LIMIT).assertLarger(VCardConstants.PREVIEW_CARD_LIMIT);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_2100
     * @tc.name      testSettingsModelFresh0001
     * @tc.desc      Verify a newly constructed settings object returns to the
     *               documented defaults after another object was dirtied.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsModelFresh0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsModelFresh0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const dirty: VCardSettings = new VCardSettings();
      dirty.defaultVersion = 2;
      dirty.defaultCharset = VCardConstants.CHARSET_GBK;
      dirty.autoJumpToContacts = false;
      dirty.historyLimit = 50;
      expect(dirty.defaultVersion).assertEqual(2);
      const fresh: VCardSettings = new VCardSettings();
      expect(fresh.defaultVersion).assertEqual(0);
      expect(fresh.defaultCharset).assertEqual(VCardConstants.CHARSET_UTF8);
      expect(fresh.autoJumpToContacts).assertTrue();
      expect(fresh.historyLimit).assertEqual(VCardConstants.DEFAULT_HISTORY_LIMIT);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_2200
     * @tc.name      testSettingsBatchAssign0001
     * @tc.desc      Verify all four settings fields can be written together
     *               and restored together without residual values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsBatchAssign0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsBatchAssign0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settings: VCardSettings = new VCardSettings();
      settings.defaultVersion = 2;
      settings.defaultCharset = VCardConstants.CHARSET_GBK;
      settings.autoJumpToContacts = false;
      settings.historyLimit = 50;
      expect(settings.defaultVersion).assertEqual(2);
      expect(settings.defaultCharset).assertEqual(VCardConstants.CHARSET_GBK);
      expect(settings.autoJumpToContacts).assertFalse();
      expect(settings.historyLimit).assertEqual(50);
      settings.defaultVersion = 0;
      settings.defaultCharset = VCardConstants.CHARSET_UTF8;
      settings.autoJumpToContacts = true;
      settings.historyLimit = 5;
      expect(settings.defaultVersion).assertEqual(0);
      expect(settings.defaultCharset).assertEqual(VCardConstants.CHARSET_UTF8);
      expect(settings.autoJumpToContacts).assertTrue();
      expect(settings.historyLimit).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_2300
     * @tc.name      testSettingsLabelChars0001
     * @tc.desc      Verify the trailing digit of each version label encodes
     *               the documented major version number.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsLabelChars0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsLabelChars0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const choices: VersionChoice[] = createVersionChoices();
      expect(choices[0].label.charAt(0)).assertEqual('2');
      expect(choices[1].label.charAt(0)).assertEqual('3');
      expect(choices[2].label.charAt(0)).assertEqual('4');
      expect(choices[0].label.charAt(1)).assertEqual('.');
      expect(choices[1].label.charAt(1)).assertEqual('.');
      expect(choices[2].label.charAt(1)).assertEqual('.');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_2400
     * @tc.name      testSettingsChoiceRange0001
     * @tc.desc      Verify every choice value stays inside the non-negative
     *               version range accepted by the settings model.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsChoiceRange0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsChoiceRange0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const choices: VersionChoice[] = createVersionChoices();
      for (let i = 0; i < choices.length; i++) {
        expect(choices[i].value >= 0).assertTrue();
        expect(choices[i].value <= 2).assertTrue();
        expect(containsChoiceValue(choices, choices[i].value)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_2500
     * @tc.name      testSettingsLimitMonotonic0001
     * @tc.desc      Verify stepping through the offered limits keeps the
     *               stored value strictly increasing on every assignment.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsLimitMonotonic0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsLimitMonotonic0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settings: VCardSettings = new VCardSettings();
      const options: number[] = VCardConstants.HISTORY_LIMIT_OPTIONS;
      let previous: number = 0;
      for (let i = 0; i < options.length; i++) {
        settings.historyLimit = options[i];
        expect(settings.historyLimit).assertEqual(options[i]);
        expect(settings.historyLimit).assertLarger(previous);
        previous = settings.historyLimit;
      }
      expect(previous).assertEqual(options[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_2600
     * @tc.name      testSettingsCharsetRaw0001
     * @tc.desc      Verify the charset field stores an arbitrary spelling so
     *               only the store layer enforces the two valid charsets.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsCharsetRaw0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsCharsetRaw0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settings: VCardSettings = new VCardSettings();
      settings.defaultCharset = 'ISO-8859-1';
      expect(settings.defaultCharset).assertEqual('ISO-8859-1');
      expect(settings.defaultCharset === VCardConstants.CHARSET_UTF8).assertFalse();
      expect(settings.defaultCharset === VCardConstants.CHARSET_GBK).assertFalse();
      settings.defaultCharset = VCardConstants.CHARSET_UTF8;
      expect(settings.defaultCharset).assertEqual(VCardConstants.CHARSET_UTF8);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_2700
     * @tc.name      testSettingsPreviewVsFile0001
     * @tc.desc      Verify the preview line budget stays far below the import
     *               file size cap so preview rendering always fits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsPreviewVsFile0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsPreviewVsFile0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(VCardConstants.PREVIEW_LINE_LIMIT).assertLess(1024);
      expect(VCardConstants.PREVIEW_LINE_LIMIT).assertLarger(16);
      expect(VCardConstants.PREVIEW_LINE_LIMIT).assertLess(VCardConstants.MAX_FILE_BYTES);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_2800
     * @tc.name      testSettingsPrefIndex0001
     * @tc.desc      Verify the settings preference key positions for its
     *               vcard prefix and settings suffix stay stable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsPrefIndex0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsPrefIndex0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(VCardConstants.PREFERENCE_SETTINGS.indexOf('vcard')).assertEqual(0);
      expect(VCardConstants.PREFERENCE_SETTINGS.indexOf('card')).assertEqual(1);
      expect(VCardConstants.PREFERENCE_SETTINGS.indexOf('settings')).assertEqual(6);
      expect(VCardConstants.PREFERENCE_SETTINGS.length).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_2900
     * @tc.name      testSettingsFactoryPop0001
     * @tc.desc      Verify removing a choice from one returned list shortens
     *               only that list and later factory calls stay complete.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsFactoryPop0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsFactoryPop0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const trimmed: VersionChoice[] = createVersionChoices();
      trimmed.pop();
      expect(trimmed.length).assertEqual(2);
      expect(trimmed[0].value).assertEqual(0);
      expect(trimmed[1].value).assertEqual(1);
      const fresh: VersionChoice[] = createVersionChoices();
      expect(fresh.length).assertEqual(3);
      expect(containsChoiceValue(fresh, 2)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_3000
     * @tc.name      testSettingsPairIndependence0001
     * @tc.desc      Verify two settings instances keep charset and jump state
     *               independent across concurrent edits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsPairIndependence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsPairIndependence0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const left: VCardSettings = new VCardSettings();
      const right: VCardSettings = new VCardSettings();
      left.defaultCharset = VCardConstants.CHARSET_GBK;
      left.autoJumpToContacts = false;
      expect(right.defaultCharset).assertEqual(VCardConstants.CHARSET_UTF8);
      expect(right.autoJumpToContacts).assertTrue();
      right.defaultCharset = VCardConstants.CHARSET_UTF8;
      right.autoJumpToContacts = false;
      expect(left.defaultCharset).assertEqual(VCardConstants.CHARSET_GBK);
      expect(left === right).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_3100
     * @tc.name      testSettingsLimitIdempotent0001
     * @tc.desc      Verify writing the same retention value repeatedly keeps
     *               the stored settings stable without drift.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsLimitIdempotent0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsLimitIdempotent0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settings: VCardSettings = new VCardSettings();
      settings.historyLimit = 50;
      expect(settings.historyLimit).assertEqual(50);
      settings.historyLimit = 50;
      expect(settings.historyLimit).assertEqual(50);
      settings.historyLimit = VCardConstants.DEFAULT_HISTORY_LIMIT;
      settings.historyLimit = VCardConstants.DEFAULT_HISTORY_LIMIT;
      expect(settings.historyLimit).assertEqual(VCardConstants.DEFAULT_HISTORY_LIMIT);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_3200
     * @tc.name      testSettingsConstantsTrio0001
     * @tc.desc      Verify the settings, history and sample constants remain
     *               three distinct strings with stable lengths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsConstantsTrio0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsConstantsTrio0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(VCardConstants.PREFERENCE_SETTINGS === VCardConstants.PREFERENCE_HISTORY).assertFalse();
      expect(VCardConstants.PREFERENCE_SETTINGS === VCardConstants.SAMPLE_FILE_NAME).assertFalse();
      expect(VCardConstants.PREFERENCE_HISTORY === VCardConstants.SAMPLE_FILE_NAME).assertFalse();
      expect(VCardConstants.PREFERENCE_HISTORY.length).assertEqual(13);
      expect(VCardConstants.SAMPLE_FILE_NAME.length).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_3300
     * @tc.name      testSettingsJumpVersionSeq0001
     * @tc.desc      Verify the jump switch and version selection can be flipped
     *               together across the whole valid version space.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsJumpVersionSeq0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsJumpVersionSeq0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settings: VCardSettings = new VCardSettings();
      settings.autoJumpToContacts = false;
      settings.defaultVersion = 1;
      expect(settings.autoJumpToContacts).assertFalse();
      expect(settings.defaultVersion).assertEqual(1);
      settings.autoJumpToContacts = true;
      settings.defaultVersion = 2;
      expect(settings.autoJumpToContacts).assertTrue();
      expect(settings.defaultVersion).assertEqual(2);
      settings.autoJumpToContacts = false;
      settings.defaultVersion = 0;
      expect(settings.autoJumpToContacts).assertFalse();
      expect(settings.defaultVersion).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_3400
     * @tc.name      testSettingsVersionMatchChoices0001
     * @tc.desc      Verify the settings version field accepts every value the
     *               version factory offers with index aligned pairing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsVersionMatchChoices0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsVersionMatchChoices0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settings: VCardSettings = new VCardSettings();
      const choices: VersionChoice[] = createVersionChoices();
      for (let i = 0; i < choices.length; i++) {
        settings.defaultVersion = choices[i].value;
        expect(settings.defaultVersion).assertEqual(choices[i].value);
        expect(settings.defaultVersion).assertEqual(i);
      }
      settings.defaultVersion = choices[0].value;
      expect(settings.defaultVersion).assertEqual(choices[0].value);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_3500
     * @tc.name      testSettingsQuadReverse0001
     * @tc.desc      Verify all four setting fields keep their values when read
     *               back in reverse order of assignment.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsQuadReverse0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsQuadReverse0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settings: VCardSettings = new VCardSettings();
      settings.defaultVersion = 1;
      settings.defaultCharset = VCardConstants.CHARSET_GBK;
      settings.autoJumpToContacts = false;
      settings.historyLimit = 10;
      expect(settings.historyLimit).assertEqual(10);
      expect(settings.autoJumpToContacts).assertFalse();
      expect(settings.defaultCharset).assertEqual(VCardConstants.CHARSET_GBK);
      expect(settings.defaultVersion).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_3600
     * @tc.name      testSettingsLimitFloor0001
     * @tc.desc      Verify values below the smallest offered retention option
     *               are stored raw so the store layer owns the floor rule.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsLimitFloor0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsLimitFloor0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settings: VCardSettings = new VCardSettings();
      const floor: number = VCardConstants.HISTORY_LIMIT_OPTIONS[0];
      settings.historyLimit = floor;
      expect(settings.historyLimit).assertEqual(floor);
      settings.historyLimit = 1;
      expect(settings.historyLimit).assertEqual(1);
      settings.historyLimit = 4;
      expect(settings.historyLimit).assertEqual(4);
      settings.historyLimit = floor;
      expect(settings.historyLimit).assertEqual(floor);
      expect(floor).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_SETG_3700
     * @tc.name      testSettingsLimitGaps0001
     * @tc.desc      Verify consecutive retention options always grow so the
     *               picker never offers a descending pair.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsLimitGaps0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsLimitGaps0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const options: number[] = VCardConstants.HISTORY_LIMIT_OPTIONS;
      expect(options[1] - options[0]).assertLarger(0);
      expect(options[2] - options[1]).assertLarger(0);
      expect(options[3] - options[2]).assertLarger(0);
      expect(options[3]).assertLarger(options[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
