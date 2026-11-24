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

// Handwritten companion of the @volume buckets ResourceMatrix01~03.
// Expected strings are frozen from entry/src/main/resources/base/element/string.json; only
// module_desc has a locale dependent value, so that key is asserted through its two legal forms.
// The ohosTest HAP owns its own resource table, so $r() ids resolve only through the entry_test
// module context; the app context cannot see those ids.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { resourceManager } from '@kit.LocalizationKit';
import { TEST_MODULE_NAME } from '../util/TestConstants';
import { labelByName } from '../util/LabelResolver';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

function manager(): resourceManager.ResourceManager {
  return abilityDelegatorRegistry.getAbilityDelegator().getAppContext()
    .createModuleContext(TEST_MODULE_NAME).resourceManager;
}

function stringOf(resourceId: number): string {
  return manager().getStringSync(resourceId);
}

function mediaSize(resourceId: number): number {
  return manager().getMediaContentSync(resourceId).length;
}

export default function resourceRealTest() {
  describe('ResourceReal', () => {

    // ==================== 歌单 / tab 文案取值（20 条） ====================
    /**
     * @tc.number: SUB_MM_RESR_0100
     * @tc.name: testResReal0001
     * @tc.desc: Verify the coffee playlist label resolves to the frozen base value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResReal0001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0001 begin');
      const value: string = stringOf($r('app.string.coffee').id);
      hilog.info(DOMAIN, TAG, 'coffee-label actual=%{public}s expected=%{public}s', value, labelByName('coffee'));
      expect(value).assertEqual(labelByName('coffee'));
      expect(value.length > 0).assertTrue();
      expect(value.indexOf('$string:')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0001 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_0200
     * @tc.name: testResReal0002
     * @tc.desc: Verify the cantonese pop label resolves to the frozen base value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResReal0002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0002 begin');
      const value: string = stringOf($r('app.string.pops').id);
      hilog.info(DOMAIN, TAG, 'pops-label actual=%{public}s expected=%{public}s', value, labelByName('pops'));
      expect(value).assertEqual(labelByName('pops'));
      expect(value.length > 0).assertTrue();
      expect(value.trim()).assertEqual(value);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0002 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_0300
     * @tc.name: testResReal0003
     * @tc.desc: Verify the 80s label keeps its digits together with the chinese text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0003 begin');
      const value: string = stringOf($r('app.string.oldYear').id);
      hilog.info(DOMAIN, TAG, 'oldyear-label actual=%{public}s expected=%{public}s', value, labelByName('oldYear'));
      expect(value).assertEqual(labelByName('oldYear'));
      expect(value.indexOf('80')).assertEqual(0);
      expect(value.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0003 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_0400
     * @tc.name: testResReal0004
     * @tc.desc: Verify the emo playlist label keeps its latin letters and chinese suffix.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0004 begin');
      const value: string = stringOf($r('app.string.emo').id);
      hilog.info(DOMAIN, TAG, 'emo-label actual=%{public}s expected=%{public}s', value, labelByName('emo'));
      expect(value).assertEqual(labelByName('emo'));
      expect(value.indexOf('EMO')).assertEqual(0);
      expect(value.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0004 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_0500
     * @tc.name: testResReal0005
     * @tc.desc: Verify the rock label resolves to the frozen base value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResReal0005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0005 begin');
      const value: string = stringOf($r('app.string.rock').id);
      hilog.info(DOMAIN, TAG, 'rock-label actual=%{public}s expected=%{public}s', value, labelByName('rock'));
      expect(value).assertEqual(labelByName('rock'));
      expect(value.length > 0).assertTrue();
      expect(value === labelByName('jazz')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0005 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_0600
     * @tc.name: testResReal0006
     * @tc.desc: Verify the warm afternoon label resolves to the frozen base value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0006 begin');
      const value: string = stringOf($r('app.string.noon').id);
      hilog.info(DOMAIN, TAG, 'noon-label actual=%{public}s expected=%{public}s', value, labelByName('noon'));
      expect(value).assertEqual(labelByName('noon'));
      expect(value.length > 0).assertTrue();
      expect(value).assertEqual(labelByName('noon'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0006 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_0700
     * @tc.name: testResReal0007
     * @tc.desc: Verify the blues label resolves to the frozen base value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0007 begin');
      const value: string = stringOf($r('app.string.bluce').id);
      hilog.info(DOMAIN, TAG, 'blues-label actual=%{public}s expected=%{public}s', value, labelByName('bluce'));
      expect(value).assertEqual(labelByName('bluce'));
      expect(value.length > 0).assertTrue();
      expect(value === stringOf($r('app.string.jazz').id)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0007 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_0800
     * @tc.name: testResReal0008
     * @tc.desc: Verify the restless label resolves to the frozen base value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0008 begin');
      const value: string = stringOf($r('app.string.noise').id);
      hilog.info(DOMAIN, TAG, 'noise-label actual=%{public}s expected=%{public}s', value, labelByName('noise'));
      expect(value).assertEqual(labelByName('noise'));
      expect(value.length > 0).assertTrue();
      expect(value).assertEqual(labelByName('noise'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0008 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_0900
     * @tc.name: testResReal0009
     * @tc.desc: Verify the jazz label resolves to the frozen base value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResReal0009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0009 begin');
      const value: string = stringOf($r('app.string.jazz').id);
      hilog.info(DOMAIN, TAG, 'jazz-label actual=%{public}s expected=%{public}s', value, labelByName('jazz'));
      expect(value).assertEqual(labelByName('jazz'));
      expect(value.length > 0).assertTrue();
      expect(value === labelByName('rock')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0009 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_1000
     * @tc.name: testResReal0010
     * @tc.desc: Verify the stay awake label resolves to the frozen base value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0010 begin');
      const value: string = stringOf($r('app.string.noSleep').id);
      hilog.info(DOMAIN, TAG, 'nosleep-label actual=%{public}s expected=%{public}s', value, labelByName('noSleep'));
      expect(value).assertEqual(labelByName('noSleep'));
      expect(value.length > 0).assertTrue();
      expect(value).assertEqual(labelByName('noSleep'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0010 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_1100
     * @tc.name: testResReal0011
     * @tc.desc: Verify the western bgm label keeps its chinese prefix and latin suffix.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0011 begin');
      const value: string = stringOf($r('app.string.bgm').id);
      hilog.info(DOMAIN, TAG, 'bgm-label actual=%{public}s expected=%{public}s', value, labelByName('bgm'));
      expect(value).assertEqual(labelByName('bgm'));
      expect(value.indexOf('BGM')).assertEqual(5);
      expect(value.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0011 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_1200
     * @tc.name: testResReal0012
     * @tc.desc: Verify the sunshine label resolves to the frozen base value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0012 begin');
      const value: string = stringOf($r('app.string.sunshine').id);
      hilog.info(DOMAIN, TAG, 'sunshine-label actual=%{public}s expected=%{public}s', value, labelByName('sunshine'));
      expect(value).assertEqual(labelByName('sunshine'));
      expect(value.length > 0).assertTrue();
      expect(value).assertEqual(labelByName('sunshine'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0012 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_1300
     * @tc.name: testResReal0013
     * @tc.desc: Verify the sleep label resolves to the frozen base value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0013 begin');
      const value: string = stringOf($r('app.string.sleep').id);
      hilog.info(DOMAIN, TAG, 'sleep-label actual=%{public}s expected=%{public}s', value, labelByName('sleep'));
      expect(value).assertEqual(labelByName('sleep'));
      expect(value.length > 0).assertTrue();
      expect(value).assertEqual(labelByName('sleep'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0013 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_1400
     * @tc.name: testResReal0014
     * @tc.desc: Verify the mine tab label resolves to the frozen base value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResReal0014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0014 begin');
      const value: string = stringOf($r('app.string.mine').id);
      hilog.info(DOMAIN, TAG, 'mine-tab actual=%{public}s expected=%{public}s', value, labelByName('mine'));
      expect(value).assertEqual(labelByName('mine'));
      expect(value.length > 0).assertTrue();
      expect(value === labelByName('discovery')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0014 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_1500
     * @tc.name: testResReal0015
     * @tc.desc: Verify the discovery tab label resolves to the frozen base value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResReal0015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0015 begin');
      const value: string = stringOf($r('app.string.discovery').id);
      hilog.info(DOMAIN, TAG, 'discovery-tab actual=%{public}s expected=%{public}s', value, labelByName('discovery'));
      expect(value).assertEqual(labelByName('discovery'));
      expect(value.length > 0).assertTrue();
      expect(value === stringOf($r('app.string.mine').id)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0015 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_1600
     * @tc.name: testResReal0016
     * @tc.desc: Verify the radio tab label resolves to the frozen base value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResReal0016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0016 begin');
      const value: string = stringOf($r('app.string.radio').id);
      hilog.info(DOMAIN, TAG, 'radio-tab actual=%{public}s expected=%{public}s', value, labelByName('radio'));
      expect(value).assertEqual(labelByName('radio'));
      expect(value.length > 0).assertTrue();
      expect(value === labelByName('index')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0016 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_1700
     * @tc.name: testResReal0017
     * @tc.desc: Verify the home tab label resolves to the frozen base value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResReal0017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0017 begin');
      const value: string = stringOf($r('app.string.index').id);
      hilog.info(DOMAIN, TAG, 'index-tab actual=%{public}s expected=%{public}s', value, labelByName('index'));
      expect(value).assertEqual(labelByName('index'));
      expect(value.length > 0).assertTrue();
      expect(value === stringOf($r('app.string.radio').id)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0017 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_1800
     * @tc.name: testResReal0018
     * @tc.desc: Verify the private fm shortcut label resolves to the frozen base value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0018 begin');
      const value: string = stringOf($r('app.string.privacy').id);
      hilog.info(DOMAIN, TAG, 'privacy-label actual=%{public}s expected=%{public}s', value, labelByName('privacy'));
      expect(value).assertEqual(labelByName('privacy'));
      expect(value.indexOf('FM')).assertEqual(2);
      expect(value.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0018 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_1900
     * @tc.name: testResReal0019
     * @tc.desc: Verify the singer shortcut label resolves to the frozen base value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0019 begin');
      const value: string = stringOf($r('app.string.singer').id);
      hilog.info(DOMAIN, TAG, 'singer-label actual=%{public}s expected=%{public}s', value, labelByName('singer'));
      expect(value).assertEqual(labelByName('singer'));
      expect(value.length > 0).assertTrue();
      expect(value === labelByName('singList')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0019 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_2000
     * @tc.name: testResReal0020
     * @tc.desc: Verify the recommend title resolves to the frozen base value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResReal0020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0020 begin');
      const value: string = stringOf($r('app.string.recommend').id);
      hilog.info(DOMAIN, TAG, 'recommend-title actual=%{public}s expected=%{public}s', value, labelByName('recommend'));
      expect(value).assertEqual(labelByName('recommend'));
      expect(value.length > 0).assertTrue();
      expect(value === stringOf($r('app.string.singRecommend').id)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0020 end');
    })

    // ==================== 文案结构约束（4 条） ====================
    /**
     * @tc.number: SUB_MM_RESR_2100
     * @tc.name: testResReal0021
     * @tc.desc: Verify the module description resolves to one of its two legal locale forms.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0021 begin');
      const value: string = stringOf($r('app.string.module_desc').id);
      const legal: boolean = value === labelByName('module_desc');
      hilog.info(DOMAIN, TAG, 'module-desc actual=%{public}s expected=%{public}s', value, labelByName('module_desc'));
      expect(legal).assertTrue();
      expect(value.length > 0).assertTrue();
      expect(value.indexOf('$string:')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0021 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_2200
     * @tc.name: testResReal0022
     * @tc.desc: Verify the ability description resolves through its id and its name to the same text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0022 begin');
      const value: string = stringOf($r('app.string.EntryAbility_desc').id);
      const byName: string = manager().getStringByNameSync('EntryAbility_desc');
      hilog.info(DOMAIN, TAG, 'ability-desc actual=%{public}s expected=%{public}s', value, byName);
      expect(value).assertEqual(byName);
      expect(value.length).assertEqual(byName.length);
      expect(value === 'EntryAbility_label').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0022 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_2300
     * @tc.name: testResReal0023
     * @tc.desc: Verify the ability label resolves through its id and its name to the same text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0023 begin');
      const value: string = stringOf($r('app.string.EntryAbility_label').id);
      const byName: string = manager().getStringByNameSync('EntryAbility_label');
      hilog.info(DOMAIN, TAG, 'ability-label actual=%{public}s expected=%{public}s', value, byName);
      expect(value).assertEqual(byName);
      expect(value.length).assertEqual(byName.length);
      expect(value === 'EntryAbility_desc').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0023 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_2400
     * @tc.name: testResReal0024
     * @tc.desc: Verify the playlist recommendation title keeps its four chinese characters.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResReal0024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0024 begin');
      const value: string = stringOf($r('app.string.singRecommend').id);
      hilog.info(DOMAIN, TAG, 'sing-recommend actual=%{public}s expected=%{public}s', value, labelByName('singRecommend'));
      expect(value).assertEqual(labelByName('singRecommend'));
      expect(value.length > 0).assertTrue();
      expect(value.indexOf(labelByName('recommend'))).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0024 end');
    })

    // ==================== 媒体资源可读性（16 条） ====================
    /**
     * @tc.number: SUB_MM_RESR_2500
     * @tc.name: testResReal0025
     * @tc.desc: Verify cover list1 is readable and returns a stable byte length.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResReal0025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0025 begin');
      const first: number = mediaSize($r('app.media.list1').id);
      const second: number = mediaSize($r('app.media.list1').id);
      hilog.info(DOMAIN, TAG, 'media-list1 bytes actual=%{public}s/%{public}s', String(first), String(second));
      expect(first > 0).assertTrue();
      expect(second).assertEqual(first);
      expect(first > 100).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0025 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_2600
     * @tc.name: testResReal0026
     * @tc.desc: Verify cover list2 is readable and returns a stable byte length.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0026 begin');
      const first: number = mediaSize($r('app.media.list2').id);
      const second: number = mediaSize($r('app.media.list2').id);
      hilog.info(DOMAIN, TAG, 'media-list2 bytes actual=%{public}s', String(first));
      expect(first > 0).assertTrue();
      expect(second).assertEqual(first);
      expect(first === mediaSize($r('app.media.list1').id)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0026 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_2700
     * @tc.name: testResReal0027
     * @tc.desc: Verify cover list3 is readable and returns a stable byte length.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0027 begin');
      const first: number = mediaSize($r('app.media.list3').id);
      hilog.info(DOMAIN, TAG, 'media-list3 bytes actual=%{public}s', String(first));
      expect(first > 0).assertTrue();
      expect(mediaSize($r('app.media.list3').id)).assertEqual(first);
      expect(first > 100).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0027 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_2800
     * @tc.name: testResReal0028
     * @tc.desc: Verify cover list4 is readable and returns a stable byte length.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0028 begin');
      const first: number = mediaSize($r('app.media.list4').id);
      hilog.info(DOMAIN, TAG, 'media-list4 bytes actual=%{public}s', String(first));
      expect(first > 0).assertTrue();
      expect(mediaSize($r('app.media.list4').id)).assertEqual(first);
      expect(first > 100).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0028 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_2900
     * @tc.name: testResReal0029
     * @tc.desc: Verify cover list5 is readable and returns a stable byte length.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0029 begin');
      const first: number = mediaSize($r('app.media.list5').id);
      hilog.info(DOMAIN, TAG, 'media-list5 bytes actual=%{public}s', String(first));
      expect(first > 0).assertTrue();
      expect(mediaSize($r('app.media.list5').id)).assertEqual(first);
      expect(first > 100).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0029 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_3000
     * @tc.name: testResReal0030
     * @tc.desc: Verify cover list6 is readable and returns a stable byte length.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0030 begin');
      const first: number = mediaSize($r('app.media.list6').id);
      hilog.info(DOMAIN, TAG, 'media-list6 bytes actual=%{public}s', String(first));
      expect(first > 0).assertTrue();
      expect(mediaSize($r('app.media.list6').id)).assertEqual(first);
      expect(first > 100).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0030 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_3100
     * @tc.name: testResReal0031
     * @tc.desc: Verify cover list7 is readable and returns a stable byte length.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0031 begin');
      const first: number = mediaSize($r('app.media.list7').id);
      hilog.info(DOMAIN, TAG, 'media-list7 bytes actual=%{public}s', String(first));
      expect(first > 0).assertTrue();
      expect(mediaSize($r('app.media.list7').id)).assertEqual(first);
      expect(first > 100).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0031 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_3200
     * @tc.name: testResReal0032
     * @tc.desc: Verify cover list8 is readable and returns a stable byte length.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0032 begin');
      const first: number = mediaSize($r('app.media.list8').id);
      hilog.info(DOMAIN, TAG, 'media-list8 bytes actual=%{public}s', String(first));
      expect(first > 0).assertTrue();
      expect(mediaSize($r('app.media.list8').id)).assertEqual(first);
      expect(first > 100).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0032 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_3300
     * @tc.name: testResReal0033
     * @tc.desc: Verify cover list9 is readable and returns a stable byte length.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0033 begin');
      const first: number = mediaSize($r('app.media.list9').id);
      hilog.info(DOMAIN, TAG, 'media-list9 bytes actual=%{public}s', String(first));
      expect(first > 0).assertTrue();
      expect(mediaSize($r('app.media.list9').id)).assertEqual(first);
      expect(first > 100).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0033 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_3400
     * @tc.name: testResReal0034
     * @tc.desc: Verify cover list10 is readable and returns a stable byte length.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0034 begin');
      const first: number = mediaSize($r('app.media.list10').id);
      hilog.info(DOMAIN, TAG, 'media-list10 bytes actual=%{public}s', String(first));
      expect(first > 0).assertTrue();
      expect(mediaSize($r('app.media.list10').id)).assertEqual(first);
      expect(first > 100).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0034 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_3500
     * @tc.name: testResReal0035
     * @tc.desc: Verify cover list11 is readable and returns a stable byte length.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0035 begin');
      const first: number = mediaSize($r('app.media.list11').id);
      hilog.info(DOMAIN, TAG, 'media-list11 bytes actual=%{public}s', String(first));
      expect(first > 0).assertTrue();
      expect(mediaSize($r('app.media.list11').id)).assertEqual(first);
      expect(first > 100).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0035 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_3600
     * @tc.name: testResReal0036
     * @tc.desc: Verify cover list12 is readable and returns a stable byte length.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0036 begin');
      const first: number = mediaSize($r('app.media.list12').id);
      hilog.info(DOMAIN, TAG, 'media-list12 bytes actual=%{public}s', String(first));
      expect(first > 0).assertTrue();
      expect(mediaSize($r('app.media.list12').id)).assertEqual(first);
      expect(first > 100).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0036 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_3700
     * @tc.name: testResReal0037
     * @tc.desc: Verify the first banner is readable and returns a stable byte length.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResReal0037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0037 begin');
      const first: number = mediaSize($r('app.media.banner1').id);
      hilog.info(DOMAIN, TAG, 'media-banner1 bytes actual=%{public}s', String(first));
      expect(first > 0).assertTrue();
      expect(mediaSize($r('app.media.banner1').id)).assertEqual(first);
      expect(first > 1000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0037 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_3800
     * @tc.name: testResReal0038
     * @tc.desc: Verify the second banner is readable and returns a stable byte length.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0038 begin');
      const first: number = mediaSize($r('app.media.banner2').id);
      hilog.info(DOMAIN, TAG, 'media-banner2 bytes actual=%{public}s', String(first));
      expect(first > 0).assertTrue();
      expect(mediaSize($r('app.media.banner2').id)).assertEqual(first);
      expect(first > 1000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0038 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_3900
     * @tc.name: testResReal0039
     * @tc.desc: Verify the third banner is readable and differs in size from the first one.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0039 begin');
      const third: number = mediaSize($r('app.media.banner3').id);
      const first: number = mediaSize($r('app.media.banner1').id);
      hilog.info(DOMAIN, TAG, 'media-banner3 bytes actual=%{public}s', String(third));
      expect(third > 0).assertTrue();
      expect(mediaSize($r('app.media.banner3').id)).assertEqual(third);
      expect(third === first).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0039 end');
    })

    /**
     * @tc.number: SUB_MM_RESR_4000
     * @tc.name: testResReal0040
     * @tc.desc: Verify a vector tab icon is readable as media content.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testResReal0040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0040 begin');
      const iconSize: number = mediaSize($r('app.media.ic_public_home').id);
      const filledSize: number = mediaSize($r('app.media.ic_public_home_filled').id);
      hilog.info(DOMAIN, TAG, 'home-icon bytes actual=%{public}s/%{public}s',
        String(iconSize), String(filledSize));
      expect(iconSize > 0).assertTrue();
      expect(filledSize > 0).assertTrue();
      expect(iconSize === filledSize).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResReal0040 end');
    })
  })
}
