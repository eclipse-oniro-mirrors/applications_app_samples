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

// @volume rule=getStringSync(app.string.key)-equals-frozen-resource-table basis=spec cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { resourceManager } from '@kit.LocalizationKit';
import { TEST_MODULE_NAME } from '../util/TestConstants';
import { labelByName } from '../util/LabelResolver';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';
function getResourceManager(): resourceManager.ResourceManager {
  return abilityDelegatorRegistry.getAbilityDelegator().getAppContext().createModuleContext(TEST_MODULE_NAME).resourceManager;
}

export default function resourceMatrix01Test() {
  describe('ResourceMatrix01', () => {

    /**
     * @tc.number: SUB_MM_RESSTR01_0100
     * @tc.name: testResStr010001
     * @tc.desc: Verify string resource module_desc (aspect 0, row 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010001 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.module_desc').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(rm.getStringByNameSync("module_desc")));
      expect(v0).assertEqual(rm.getStringByNameSync("module_desc"));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.module_desc').id).length > 0));
      expect(rm.getStringSync($r('app.string.module_desc').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.module_desc').id) === "module_desc"));
      expect(rm.getStringSync($r('app.string.module_desc').id) === "module_desc").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010001 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_0200
     * @tc.name: testResStr010002
     * @tc.desc: Verify string resource module_desc (aspect 1, row 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010002 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.module_desc').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(rm.getStringByNameSync("module_desc").length));
      expect(v0).assertEqual(rm.getStringByNameSync("module_desc").length);
      const v1: string = rm.getStringSync($r('app.string.module_desc').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(rm.getStringByNameSync("module_desc").trim()));
      expect(v1).assertEqual(rm.getStringByNameSync("module_desc").trim());
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.module_desc').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.module_desc').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010002 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_0300
     * @tc.name: testResStr010003
     * @tc.desc: Verify string resource mine (aspect 0, row 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010003 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.mine').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('mine')));
      expect(v0).assertEqual(labelByName('mine'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.mine').id).length > 0));
      expect(rm.getStringSync($r('app.string.mine').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.mine').id) === "mine"));
      expect(rm.getStringSync($r('app.string.mine').id) === "mine").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010003 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_0400
     * @tc.name: testResStr010004
     * @tc.desc: Verify string resource mine (aspect 1, row 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010004 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.mine').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: string = rm.getStringSync($r('app.string.mine').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('mine')));
      expect(v1).assertEqual(labelByName('mine'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.mine').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.mine').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010004 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_0500
     * @tc.name: testResStr010005
     * @tc.desc: Verify string resource discovery (aspect 0, row 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010005 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.discovery').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('discovery')));
      expect(v0).assertEqual(labelByName('discovery'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.discovery').id).length > 0));
      expect(rm.getStringSync($r('app.string.discovery').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.discovery').id) === "discovery"));
      expect(rm.getStringSync($r('app.string.discovery').id) === "discovery").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010005 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_0600
     * @tc.name: testResStr010006
     * @tc.desc: Verify string resource discovery (aspect 1, row 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010006 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.discovery').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: string = rm.getStringSync($r('app.string.discovery').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('discovery')));
      expect(v1).assertEqual(labelByName('discovery'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.discovery').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.discovery').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010006 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_0700
     * @tc.name: testResStr010007
     * @tc.desc: Verify string resource radio (aspect 0, row 6).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010007 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.radio').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('radio')));
      expect(v0).assertEqual(labelByName('radio'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.radio').id).length > 0));
      expect(rm.getStringSync($r('app.string.radio').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.radio').id) === "radio"));
      expect(rm.getStringSync($r('app.string.radio').id) === "radio").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010007 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_0800
     * @tc.name: testResStr010008
     * @tc.desc: Verify string resource radio (aspect 1, row 7).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010008 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.radio').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: string = rm.getStringSync($r('app.string.radio').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('radio')));
      expect(v1).assertEqual(labelByName('radio'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.radio').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.radio').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010008 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_0900
     * @tc.name: testResStr010009
     * @tc.desc: Verify string resource privacy (aspect 0, row 8).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010009 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.privacy').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('privacy')));
      expect(v0).assertEqual(labelByName('privacy'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.privacy').id).length > 0));
      expect(rm.getStringSync($r('app.string.privacy').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.privacy').id) === "privacy"));
      expect(rm.getStringSync($r('app.string.privacy').id) === "privacy").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010009 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_1000
     * @tc.name: testResStr010010
     * @tc.desc: Verify string resource privacy (aspect 1, row 9).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010010 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.privacy').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(4));
      expect(v0).assertEqual(4);
      const v1: string = rm.getStringSync($r('app.string.privacy').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('privacy')));
      expect(v1).assertEqual(labelByName('privacy'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.privacy').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.privacy').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010010 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_1100
     * @tc.name: testResStr010011
     * @tc.desc: Verify string resource index (aspect 0, row 10).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010011 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.index').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('index')));
      expect(v0).assertEqual(labelByName('index'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.index').id).length > 0));
      expect(rm.getStringSync($r('app.string.index').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.index').id) === "index"));
      expect(rm.getStringSync($r('app.string.index').id) === "index").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010011 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_1200
     * @tc.name: testResStr010012
     * @tc.desc: Verify string resource index (aspect 1, row 11).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010012 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.index').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: string = rm.getStringSync($r('app.string.index').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('index')));
      expect(v1).assertEqual(labelByName('index'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.index').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.index').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010012 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_1300
     * @tc.name: testResStr010013
     * @tc.desc: Verify string resource singer (aspect 0, row 12).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010013 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.singer').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('singer')));
      expect(v0).assertEqual(labelByName('singer'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.singer').id).length > 0));
      expect(rm.getStringSync($r('app.string.singer').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.singer').id) === "singer"));
      expect(rm.getStringSync($r('app.string.singer').id) === "singer").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010013 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_1400
     * @tc.name: testResStr010014
     * @tc.desc: Verify string resource singer (aspect 1, row 13).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010014 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.singer').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: string = rm.getStringSync($r('app.string.singer').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('singer')));
      expect(v1).assertEqual(labelByName('singer'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.singer').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.singer').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010014 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_1500
     * @tc.name: testResStr010015
     * @tc.desc: Verify string resource recommend (aspect 0, row 14).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010015 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.recommend').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('recommend')));
      expect(v0).assertEqual(labelByName('recommend'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.recommend').id).length > 0));
      expect(rm.getStringSync($r('app.string.recommend').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.recommend').id) === "recommend"));
      expect(rm.getStringSync($r('app.string.recommend').id) === "recommend").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010015 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_1600
     * @tc.name: testResStr010016
     * @tc.desc: Verify string resource recommend (aspect 1, row 15).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010016 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.recommend').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: string = rm.getStringSync($r('app.string.recommend').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('recommend')));
      expect(v1).assertEqual(labelByName('recommend'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.recommend').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.recommend').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010016 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_1700
     * @tc.name: testResStr010017
     * @tc.desc: Verify string resource rank (aspect 0, row 16).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010017 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.rank').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('rank')));
      expect(v0).assertEqual(labelByName('rank'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.rank').id).length > 0));
      expect(rm.getStringSync($r('app.string.rank').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.rank').id) === "rank"));
      expect(rm.getStringSync($r('app.string.rank').id) === "rank").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010017 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_1800
     * @tc.name: testResStr010018
     * @tc.desc: Verify string resource rank (aspect 1, row 17).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010018 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.rank').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(labelByName('rank').length));
      expect(v0).assertEqual(labelByName('rank').length);
      const v1: string = rm.getStringSync($r('app.string.rank').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('rank')));
      expect(v1).assertEqual(labelByName('rank'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.rank').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.rank').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010018 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_1900
     * @tc.name: testResStr010019
     * @tc.desc: Verify string resource singList (aspect 0, row 18).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010019 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.singList').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('singList')));
      expect(v0).assertEqual(labelByName('singList'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.singList').id).length > 0));
      expect(rm.getStringSync($r('app.string.singList').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.singList').id) === "singList"));
      expect(rm.getStringSync($r('app.string.singList').id) === "singList").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010019 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_2000
     * @tc.name: testResStr010020
     * @tc.desc: Verify string resource singList (aspect 1, row 19).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010020 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.singList').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: string = rm.getStringSync($r('app.string.singList').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('singList')));
      expect(v1).assertEqual(labelByName('singList'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.singList').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.singList').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010020 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_2100
     * @tc.name: testResStr010021
     * @tc.desc: Verify string resource hiRes (aspect 0, row 20).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010021 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.hiRes').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String("Hi-Res"));
      expect(v0).assertEqual("Hi-Res");
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.hiRes').id).length > 0));
      expect(rm.getStringSync($r('app.string.hiRes').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.hiRes').id) === "hiRes"));
      expect(rm.getStringSync($r('app.string.hiRes').id) === "hiRes").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010021 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_2200
     * @tc.name: testResStr010022
     * @tc.desc: Verify string resource hiRes (aspect 1, row 21).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010022 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.hiRes').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(6));
      expect(v0).assertEqual(6);
      const v1: string = rm.getStringSync($r('app.string.hiRes').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String("Hi-Res"));
      expect(v1).assertEqual("Hi-Res");
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.hiRes').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.hiRes').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010022 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_2300
     * @tc.name: testResStr010023
     * @tc.desc: Verify string resource musicFM (aspect 0, row 22).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010023 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.musicFM').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('musicFM')));
      expect(v0).assertEqual(labelByName('musicFM'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.musicFM').id).length > 0));
      expect(rm.getStringSync($r('app.string.musicFM').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.musicFM').id) === "musicFM"));
      expect(rm.getStringSync($r('app.string.musicFM').id) === "musicFM").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010023 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_2400
     * @tc.name: testResStr010024
     * @tc.desc: Verify string resource musicFM (aspect 1, row 23).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010024 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.musicFM').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(4));
      expect(v0).assertEqual(4);
      const v1: string = rm.getStringSync($r('app.string.musicFM').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('musicFM')));
      expect(v1).assertEqual(labelByName('musicFM'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.musicFM').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.musicFM').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010024 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_2500
     * @tc.name: testResStr010025
     * @tc.desc: Verify string resource digital (aspect 0, row 24).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010025 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.digital').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('digital')));
      expect(v0).assertEqual(labelByName('digital'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.digital').id).length > 0));
      expect(rm.getStringSync($r('app.string.digital').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.digital').id) === "digital"));
      expect(rm.getStringSync($r('app.string.digital').id) === "digital").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010025 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_2600
     * @tc.name: testResStr010026
     * @tc.desc: Verify string resource digital (aspect 1, row 25).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010026 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.digital').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(4));
      expect(v0).assertEqual(4);
      const v1: string = rm.getStringSync($r('app.string.digital').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('digital')));
      expect(v1).assertEqual(labelByName('digital'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.digital').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.digital').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010026 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_2700
     * @tc.name: testResStr010027
     * @tc.desc: Verify string resource child (aspect 0, row 26).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010027 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.child').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('child')));
      expect(v0).assertEqual(labelByName('child'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.child').id).length > 0));
      expect(rm.getStringSync($r('app.string.child').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.child').id) === "child"));
      expect(rm.getStringSync($r('app.string.child').id) === "child").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010027 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_2800
     * @tc.name: testResStr010028
     * @tc.desc: Verify string resource child (aspect 1, row 27).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010028 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.child').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(4));
      expect(v0).assertEqual(4);
      const v1: string = rm.getStringSync($r('app.string.child').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('child')));
      expect(v1).assertEqual(labelByName('child'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.child').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.child').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010028 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_2900
     * @tc.name: testResStr010029
     * @tc.desc: Verify string resource buildBySelf (aspect 0, row 28).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010029 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.buildBySelf').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('buildBySelf')));
      expect(v0).assertEqual(labelByName('buildBySelf'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.buildBySelf').id).length > 0));
      expect(rm.getStringSync($r('app.string.buildBySelf').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.buildBySelf').id) === "buildBySelf"));
      expect(rm.getStringSync($r('app.string.buildBySelf').id) === "buildBySelf").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010029 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_3000
     * @tc.name: testResStr010030
     * @tc.desc: Verify string resource buildBySelf (aspect 1, row 29).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010030 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.buildBySelf').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(4));
      expect(v0).assertEqual(4);
      const v1: string = rm.getStringSync($r('app.string.buildBySelf').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('buildBySelf')));
      expect(v1).assertEqual(labelByName('buildBySelf'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.buildBySelf').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.buildBySelf').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010030 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_3100
     * @tc.name: testResStr010031
     * @tc.desc: Verify string resource mySongs (aspect 0, row 30).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010031 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.mySongs').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('mySongs')));
      expect(v0).assertEqual(labelByName('mySongs'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.mySongs').id).length > 0));
      expect(rm.getStringSync($r('app.string.mySongs').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.mySongs').id) === "mySongs"));
      expect(rm.getStringSync($r('app.string.mySongs').id) === "mySongs").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010031 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_3200
     * @tc.name: testResStr010032
     * @tc.desc: Verify string resource mySongs (aspect 1, row 31).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010032 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.mySongs').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(4));
      expect(v0).assertEqual(4);
      const v1: string = rm.getStringSync($r('app.string.mySongs').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('mySongs')));
      expect(v1).assertEqual(labelByName('mySongs'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.mySongs').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.mySongs').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010032 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_3300
     * @tc.name: testResStr010033
     * @tc.desc: Verify string resource singRecommend (aspect 0, row 32).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010033 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.singRecommend').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('singRecommend')));
      expect(v0).assertEqual(labelByName('singRecommend'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.singRecommend').id).length > 0));
      expect(rm.getStringSync($r('app.string.singRecommend').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.singRecommend').id) === "singRecommend"));
      expect(rm.getStringSync($r('app.string.singRecommend').id) === "singRecommend").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010033 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_3400
     * @tc.name: testResStr010034
     * @tc.desc: Verify string resource singRecommend (aspect 1, row 33).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010034 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.singRecommend').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(4));
      expect(v0).assertEqual(4);
      const v1: string = rm.getStringSync($r('app.string.singRecommend').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('singRecommend')));
      expect(v1).assertEqual(labelByName('singRecommend'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.singRecommend').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.singRecommend').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010034 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_3500
     * @tc.name: testResStr010035
     * @tc.desc: Verify string resource coffee (aspect 0, row 34).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010035 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.coffee').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('coffee')));
      expect(v0).assertEqual(labelByName('coffee'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.coffee').id).length > 0));
      expect(rm.getStringSync($r('app.string.coffee').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.coffee').id) === "coffee"));
      expect(rm.getStringSync($r('app.string.coffee').id) === "coffee").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010035 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_3600
     * @tc.name: testResStr010036
     * @tc.desc: Verify string resource coffee (aspect 1, row 35).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010036 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.coffee').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: string = rm.getStringSync($r('app.string.coffee').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('coffee')));
      expect(v1).assertEqual(labelByName('coffee'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.coffee').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.coffee').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010036 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_3700
     * @tc.name: testResStr010037
     * @tc.desc: Verify string resource pops (aspect 0, row 36).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010037 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.pops').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('pops')));
      expect(v0).assertEqual(labelByName('pops'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.pops').id).length > 0));
      expect(rm.getStringSync($r('app.string.pops').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.pops').id) === "pops"));
      expect(rm.getStringSync($r('app.string.pops').id) === "pops").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010037 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_3800
     * @tc.name: testResStr010038
     * @tc.desc: Verify string resource pops (aspect 1, row 37).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010038 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.pops').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(4));
      expect(v0).assertEqual(4);
      const v1: string = rm.getStringSync($r('app.string.pops').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('pops')));
      expect(v1).assertEqual(labelByName('pops'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.pops').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.pops').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010038 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_3900
     * @tc.name: testResStr010039
     * @tc.desc: Verify string resource oldYear (aspect 0, row 38).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010039 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.oldYear').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('oldYear')));
      expect(v0).assertEqual(labelByName('oldYear'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.oldYear').id).length > 0));
      expect(rm.getStringSync($r('app.string.oldYear').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.oldYear').id) === "oldYear"));
      expect(rm.getStringSync($r('app.string.oldYear').id) === "oldYear").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010039 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_4000
     * @tc.name: testResStr010040
     * @tc.desc: Verify string resource oldYear (aspect 1, row 39).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010040 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.oldYear').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(4));
      expect(v0).assertEqual(4);
      const v1: string = rm.getStringSync($r('app.string.oldYear').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('oldYear')));
      expect(v1).assertEqual(labelByName('oldYear'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.oldYear').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.oldYear').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010040 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_4100
     * @tc.name: testResStr010041
     * @tc.desc: Verify string resource emo (aspect 0, row 40).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010041 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.emo').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('emo')));
      expect(v0).assertEqual(labelByName('emo'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.emo').id).length > 0));
      expect(rm.getStringSync($r('app.string.emo').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.emo').id) === "emo"));
      expect(rm.getStringSync($r('app.string.emo').id) === "emo").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010041 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_4200
     * @tc.name: testResStr010042
     * @tc.desc: Verify string resource emo (aspect 1, row 41).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010042 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.emo').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(4));
      expect(v0).assertEqual(4);
      const v1: string = rm.getStringSync($r('app.string.emo').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('emo')));
      expect(v1).assertEqual(labelByName('emo'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.emo').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.emo').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010042 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_4300
     * @tc.name: testResStr010043
     * @tc.desc: Verify string resource rock (aspect 0, row 42).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010043 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.rock').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('rock')));
      expect(v0).assertEqual(labelByName('rock'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.rock').id).length > 0));
      expect(rm.getStringSync($r('app.string.rock').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.rock').id) === "rock"));
      expect(rm.getStringSync($r('app.string.rock').id) === "rock").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010043 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_4400
     * @tc.name: testResStr010044
     * @tc.desc: Verify string resource rock (aspect 1, row 43).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010044 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.rock').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: string = rm.getStringSync($r('app.string.rock').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('rock')));
      expect(v1).assertEqual(labelByName('rock'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.rock').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.rock').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010044 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_4500
     * @tc.name: testResStr010045
     * @tc.desc: Verify string resource noon (aspect 0, row 44).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010045 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.noon').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('noon')));
      expect(v0).assertEqual(labelByName('noon'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.noon').id).length > 0));
      expect(rm.getStringSync($r('app.string.noon').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.noon').id) === "noon"));
      expect(rm.getStringSync($r('app.string.noon').id) === "noon").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010045 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_4600
     * @tc.name: testResStr010046
     * @tc.desc: Verify string resource noon (aspect 1, row 45).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010046 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.noon').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(4));
      expect(v0).assertEqual(4);
      const v1: string = rm.getStringSync($r('app.string.noon').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('noon')));
      expect(v1).assertEqual(labelByName('noon'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.noon').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.noon').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010046 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_4700
     * @tc.name: testResStr010047
     * @tc.desc: Verify string resource bluce (aspect 0, row 46).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010047 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.bluce').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('bluce')));
      expect(v0).assertEqual(labelByName('bluce'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.bluce').id).length > 0));
      expect(rm.getStringSync($r('app.string.bluce').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.bluce').id) === "bluce"));
      expect(rm.getStringSync($r('app.string.bluce').id) === "bluce").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010047 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_4800
     * @tc.name: testResStr010048
     * @tc.desc: Verify string resource bluce (aspect 1, row 47).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010048 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.bluce').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: string = rm.getStringSync($r('app.string.bluce').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('bluce')));
      expect(v1).assertEqual(labelByName('bluce'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.bluce').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.bluce').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010048 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_4900
     * @tc.name: testResStr010049
     * @tc.desc: Verify string resource noise (aspect 0, row 48).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010049 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.noise').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('noise')));
      expect(v0).assertEqual(labelByName('noise'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.noise').id).length > 0));
      expect(rm.getStringSync($r('app.string.noise').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.noise').id) === "noise"));
      expect(rm.getStringSync($r('app.string.noise').id) === "noise").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010049 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_5000
     * @tc.name: testResStr010050
     * @tc.desc: Verify string resource noise (aspect 1, row 49).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010050 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.noise').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(4));
      expect(v0).assertEqual(4);
      const v1: string = rm.getStringSync($r('app.string.noise').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('noise')));
      expect(v1).assertEqual(labelByName('noise'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.noise').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.noise').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010050 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_5100
     * @tc.name: testResStr010051
     * @tc.desc: Verify string resource jazz (aspect 0, row 50).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010051 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.jazz').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('jazz')));
      expect(v0).assertEqual(labelByName('jazz'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.jazz').id).length > 0));
      expect(rm.getStringSync($r('app.string.jazz').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.jazz').id) === "jazz"));
      expect(rm.getStringSync($r('app.string.jazz').id) === "jazz").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010051 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_5200
     * @tc.name: testResStr010052
     * @tc.desc: Verify string resource jazz (aspect 1, row 51).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010052 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.jazz').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: string = rm.getStringSync($r('app.string.jazz').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('jazz')));
      expect(v1).assertEqual(labelByName('jazz'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.jazz').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.jazz').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010052 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_5300
     * @tc.name: testResStr010053
     * @tc.desc: Verify string resource noSleep (aspect 0, row 52).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010053 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.noSleep').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('noSleep')));
      expect(v0).assertEqual(labelByName('noSleep'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.noSleep').id).length > 0));
      expect(rm.getStringSync($r('app.string.noSleep').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.noSleep').id) === "noSleep"));
      expect(rm.getStringSync($r('app.string.noSleep').id) === "noSleep").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010053 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_5400
     * @tc.name: testResStr010054
     * @tc.desc: Verify string resource noSleep (aspect 1, row 53).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010054 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.noSleep').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: string = rm.getStringSync($r('app.string.noSleep').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('noSleep')));
      expect(v1).assertEqual(labelByName('noSleep'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.noSleep').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.noSleep').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010054 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_5500
     * @tc.name: testResStr010055
     * @tc.desc: Verify string resource bgm (aspect 0, row 54).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010055 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.bgm').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('bgm')));
      expect(v0).assertEqual(labelByName('bgm'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.bgm').id).length > 0));
      expect(rm.getStringSync($r('app.string.bgm').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.bgm').id) === "bgm"));
      expect(rm.getStringSync($r('app.string.bgm').id) === "bgm").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010055 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_5600
     * @tc.name: testResStr010056
     * @tc.desc: Verify string resource bgm (aspect 1, row 55).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010056 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.bgm').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(8));
      expect(v0).assertEqual(8);
      const v1: string = rm.getStringSync($r('app.string.bgm').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('bgm')));
      expect(v1).assertEqual(labelByName('bgm'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.bgm').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.bgm').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010056 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_5700
     * @tc.name: testResStr010057
     * @tc.desc: Verify string resource EntryAbility_desc (aspect 0, row 56).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010057 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const expected: string = rm.getStringByNameSync('EntryAbility_desc');
      const v0: string = rm.getStringSync($r('app.string.EntryAbility_desc').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(expected));
      expect(v0).assertEqual(expected);
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(v0.length > 0));
      expect(v0.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(v0 === "EntryAbility_desc"));
      expect(v0 === "EntryAbility_desc").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010057 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_5800
     * @tc.name: testResStr010058
     * @tc.desc: Verify string resource EntryAbility_desc (aspect 1, row 57).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010058 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const expected: string = rm.getStringByNameSync('EntryAbility_desc');
      const v0: number = rm.getStringSync($r('app.string.EntryAbility_desc').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(expected.length));
      expect(v0).assertEqual(expected.length);
      const v1: string = rm.getStringSync($r('app.string.EntryAbility_desc').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(expected.trim()));
      expect(v1).assertEqual(expected.trim());
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.EntryAbility_desc').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.EntryAbility_desc').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010058 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_5900
     * @tc.name: testResStr010059
     * @tc.desc: Verify string resource sunshine (aspect 0, row 58).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010059 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.sunshine').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('sunshine')));
      expect(v0).assertEqual(labelByName('sunshine'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.sunshine').id).length > 0));
      expect(rm.getStringSync($r('app.string.sunshine').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.sunshine').id) === "sunshine"));
      expect(rm.getStringSync($r('app.string.sunshine').id) === "sunshine").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010059 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_6000
     * @tc.name: testResStr010060
     * @tc.desc: Verify string resource sunshine (aspect 1, row 59).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010060 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.sunshine').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(4));
      expect(v0).assertEqual(4);
      const v1: string = rm.getStringSync($r('app.string.sunshine').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('sunshine')));
      expect(v1).assertEqual(labelByName('sunshine'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.sunshine').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.sunshine').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010060 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_6100
     * @tc.name: testResStr010061
     * @tc.desc: Verify string resource sleep (aspect 0, row 60).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010061 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.sleep').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('sleep')));
      expect(v0).assertEqual(labelByName('sleep'));
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(rm.getStringSync($r('app.string.sleep').id).length > 0));
      expect(rm.getStringSync($r('app.string.sleep').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.sleep').id) === "sleep"));
      expect(rm.getStringSync($r('app.string.sleep').id) === "sleep").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010061 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_6200
     * @tc.name: testResStr010062
     * @tc.desc: Verify string resource sleep (aspect 1, row 61).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010062 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: number = rm.getStringSync($r('app.string.sleep').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: string = rm.getStringSync($r('app.string.sleep').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(labelByName('sleep')));
      expect(v1).assertEqual(labelByName('sleep'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.sleep').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.sleep').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010062 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_6300
     * @tc.name: testResStr010063
     * @tc.desc: Verify string resource EntryAbility_label (aspect 0, row 62).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010063 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const expected: string = rm.getStringByNameSync('EntryAbility_label');
      const v0: string = rm.getStringSync($r('app.string.EntryAbility_label').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(expected));
      expect(v0).assertEqual(expected);
      hilog.info(DOMAIN, TAG, 'value-not-empty actual=%{public}s expected=true', String(v0.length > 0));
      expect(v0.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'value-not-key-name actual=%{public}s expected=false', String(v0 === "EntryAbility_label"));
      expect(v0 === "EntryAbility_label").assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010063 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_6400
     * @tc.name: testResStr010064
     * @tc.desc: Verify string resource EntryAbility_label (aspect 1, row 63).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010064 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const expected: string = rm.getStringByNameSync('EntryAbility_label');
      const v0: number = rm.getStringSync($r('app.string.EntryAbility_label').id).length;
      hilog.info(DOMAIN, TAG, 'value-length actual=%{public}s expected=%{public}s', String(v0), String(expected.length));
      expect(v0).assertEqual(expected.length);
      const v1: string = rm.getStringSync($r('app.string.EntryAbility_label').id).trim();
      hilog.info(DOMAIN, TAG, 'value-trimmed actual=%{public}s expected=%{public}s', String(v1), String(expected.trim()));
      expect(v1).assertEqual(expected.trim());
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.EntryAbility_label').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.EntryAbility_label').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010064 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_6500
     * @tc.name: testResStr010065
     * @tc.desc: Verify string resource module_desc (aspect 2, row 64).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010065 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.module_desc').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(rm.getStringByNameSync("module_desc")));
      expect(v0).assertEqual(rm.getStringByNameSync("module_desc"));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.module_desc').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.module_desc').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.module_desc').id > 0));
      expect($r('app.string.module_desc').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010065 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_6600
     * @tc.name: testResStr010066
     * @tc.desc: Verify string resource mine (aspect 2, row 65).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010066 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.mine').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('mine')));
      expect(v0).assertEqual(labelByName('mine'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.mine').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.mine').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.mine').id > 0));
      expect($r('app.string.mine').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010066 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_6700
     * @tc.name: testResStr010067
     * @tc.desc: Verify string resource discovery (aspect 2, row 66).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010067 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.discovery').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('discovery')));
      expect(v0).assertEqual(labelByName('discovery'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.discovery').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.discovery').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.discovery').id > 0));
      expect($r('app.string.discovery').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010067 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_6800
     * @tc.name: testResStr010068
     * @tc.desc: Verify string resource radio (aspect 2, row 67).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010068 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.radio').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('radio')));
      expect(v0).assertEqual(labelByName('radio'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.radio').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.radio').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.radio').id > 0));
      expect($r('app.string.radio').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010068 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_6900
     * @tc.name: testResStr010069
     * @tc.desc: Verify string resource privacy (aspect 2, row 68).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010069 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.privacy').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('privacy')));
      expect(v0).assertEqual(labelByName('privacy'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.privacy').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.privacy').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.privacy').id > 0));
      expect($r('app.string.privacy').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010069 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_7000
     * @tc.name: testResStr010070
     * @tc.desc: Verify string resource index (aspect 2, row 69).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010070 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.index').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('index')));
      expect(v0).assertEqual(labelByName('index'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.index').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.index').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.index').id > 0));
      expect($r('app.string.index').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010070 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_7100
     * @tc.name: testResStr010071
     * @tc.desc: Verify string resource singer (aspect 2, row 70).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010071 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.singer').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('singer')));
      expect(v0).assertEqual(labelByName('singer'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.singer').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.singer').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.singer').id > 0));
      expect($r('app.string.singer').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010071 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_7200
     * @tc.name: testResStr010072
     * @tc.desc: Verify string resource recommend (aspect 2, row 71).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010072 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.recommend').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('recommend')));
      expect(v0).assertEqual(labelByName('recommend'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.recommend').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.recommend').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.recommend').id > 0));
      expect($r('app.string.recommend').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010072 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_7300
     * @tc.name: testResStr010073
     * @tc.desc: Verify string resource rank (aspect 2, row 72).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010073 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.rank').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('rank')));
      expect(v0).assertEqual(labelByName('rank'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.rank').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.rank').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.rank').id > 0));
      expect($r('app.string.rank').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010073 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_7400
     * @tc.name: testResStr010074
     * @tc.desc: Verify string resource singList (aspect 2, row 73).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010074 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.singList').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('singList')));
      expect(v0).assertEqual(labelByName('singList'));
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.singList').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.singList').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.singList').id > 0));
      expect($r('app.string.singList').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010074 end');
    })

    /**
     * @tc.number: SUB_MM_RESSTR01_7500
     * @tc.name: testResStr010075
     * @tc.desc: Verify string resource hiRes (aspect 2, row 74).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResStr010075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010075 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      const v0: string = rm.getStringSync($r('app.string.hiRes').id);
      hilog.info(DOMAIN, TAG, 'string-value actual=%{public}s expected=%{public}s', String(v0), String("Hi-Res"));
      expect(v0).assertEqual("Hi-Res");
      hilog.info(DOMAIN, TAG, 'no-raw-key-marker actual=%{public}s expected=false', String(rm.getStringSync($r('app.string.hiRes').id).indexOf('$string:') >= 0));
      expect(rm.getStringSync($r('app.string.hiRes').id).indexOf('$string:') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.hiRes').id > 0));
      expect($r('app.string.hiRes').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResStr010075 end');
    })

  })
}
