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

// @volume rule=getMediaContentSync(app.media.name)-returns-non-empty-bytes basis=spec cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { resourceManager } from '@kit.LocalizationKit';
import { TEST_MODULE_NAME } from '../util/TestConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';
function getResourceManager(): resourceManager.ResourceManager {
  return abilityDelegatorRegistry.getAbilityDelegator().getAppContext().createModuleContext(TEST_MODULE_NAME).resourceManager;
}

export default function resourceMatrix02Test() {
  describe('ResourceMatrix02', () => {

    /**
     * @tc.number: SUB_MM_RESMEDIA01_0100
     * @tc.name: testResMedia010001
     * @tc.desc: Verify media resource list1 is readable (aspect 0, row 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010001 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list1').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list1').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.list1').id > 0));
      expect($r('app.media.list1').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.list1').id === $r('app.media.list4').id));
      expect($r('app.media.list1').id === $r('app.media.list4').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010001 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_0200
     * @tc.name: testResMedia010002
     * @tc.desc: Verify media resource list2 is readable (aspect 0, row 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010002 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list2').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list2').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.list2').id > 0));
      expect($r('app.media.list2').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.list2').id === $r('app.media.list5').id));
      expect($r('app.media.list2').id === $r('app.media.list5').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010002 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_0300
     * @tc.name: testResMedia010003
     * @tc.desc: Verify media resource list3 is readable (aspect 0, row 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010003 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list3').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list3').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.list3').id > 0));
      expect($r('app.media.list3').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.list3').id === $r('app.media.list6').id));
      expect($r('app.media.list3').id === $r('app.media.list6').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010003 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_0400
     * @tc.name: testResMedia010004
     * @tc.desc: Verify media resource list4 is readable (aspect 0, row 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010004 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list4').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list4').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.list4').id > 0));
      expect($r('app.media.list4').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.list4').id === $r('app.media.list7').id));
      expect($r('app.media.list4').id === $r('app.media.list7').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010004 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_0500
     * @tc.name: testResMedia010005
     * @tc.desc: Verify media resource list5 is readable (aspect 0, row 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010005 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list5').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list5').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.list5').id > 0));
      expect($r('app.media.list5').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.list5').id === $r('app.media.list8').id));
      expect($r('app.media.list5').id === $r('app.media.list8').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010005 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_0600
     * @tc.name: testResMedia010006
     * @tc.desc: Verify media resource list6 is readable (aspect 0, row 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010006 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list6').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list6').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.list6').id > 0));
      expect($r('app.media.list6').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.list6').id === $r('app.media.list9').id));
      expect($r('app.media.list6').id === $r('app.media.list9').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010006 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_0700
     * @tc.name: testResMedia010007
     * @tc.desc: Verify media resource list7 is readable (aspect 0, row 6).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010007 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list7').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list7').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.list7').id > 0));
      expect($r('app.media.list7').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.list7').id === $r('app.media.list10').id));
      expect($r('app.media.list7').id === $r('app.media.list10').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010007 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_0800
     * @tc.name: testResMedia010008
     * @tc.desc: Verify media resource list8 is readable (aspect 0, row 7).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010008 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list8').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list8').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.list8').id > 0));
      expect($r('app.media.list8').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.list8').id === $r('app.media.list11').id));
      expect($r('app.media.list8').id === $r('app.media.list11').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010008 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_0900
     * @tc.name: testResMedia010009
     * @tc.desc: Verify media resource list9 is readable (aspect 0, row 8).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010009 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list9').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list9').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.list9').id > 0));
      expect($r('app.media.list9').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.list9').id === $r('app.media.list12').id));
      expect($r('app.media.list9').id === $r('app.media.list12').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010009 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_1000
     * @tc.name: testResMedia010010
     * @tc.desc: Verify media resource list10 is readable (aspect 0, row 9).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010010 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list10').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list10').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.list10').id > 0));
      expect($r('app.media.list10').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.list10').id === $r('app.media.list13').id));
      expect($r('app.media.list10').id === $r('app.media.list13').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010010 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_1100
     * @tc.name: testResMedia010011
     * @tc.desc: Verify media resource list11 is readable (aspect 0, row 10).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010011 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list11').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list11').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.list11').id > 0));
      expect($r('app.media.list11').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.list11').id === $r('app.media.banner1').id));
      expect($r('app.media.list11').id === $r('app.media.banner1').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010011 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_1200
     * @tc.name: testResMedia010012
     * @tc.desc: Verify media resource list12 is readable (aspect 0, row 11).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010012 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list12').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list12').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.list12').id > 0));
      expect($r('app.media.list12').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.list12').id === $r('app.media.banner2').id));
      expect($r('app.media.list12').id === $r('app.media.banner2').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010012 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_1300
     * @tc.name: testResMedia010013
     * @tc.desc: Verify media resource list13 is readable (aspect 0, row 12).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010013 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list13').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list13').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.list13').id > 0));
      expect($r('app.media.list13').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.list13').id === $r('app.media.banner3').id));
      expect($r('app.media.list13').id === $r('app.media.banner3').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010013 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_1400
     * @tc.name: testResMedia010014
     * @tc.desc: Verify media resource banner1 is readable (aspect 0, row 13).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010014 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.banner1').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.banner1').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.banner1').id > 0));
      expect($r('app.media.banner1').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.banner1').id === $r('app.media.ic_find').id));
      expect($r('app.media.banner1').id === $r('app.media.ic_find').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010014 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_1500
     * @tc.name: testResMedia010015
     * @tc.desc: Verify media resource banner2 is readable (aspect 0, row 14).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010015 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.banner2').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.banner2').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.banner2').id > 0));
      expect($r('app.media.banner2').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.banner2').id === $r('app.media.ic_find_h').id));
      expect($r('app.media.banner2').id === $r('app.media.ic_find_h').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010015 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_1600
     * @tc.name: testResMedia010016
     * @tc.desc: Verify media resource banner3 is readable (aspect 0, row 15).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010016 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.banner3').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.banner3').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.banner3').id > 0));
      expect($r('app.media.banner3').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.banner3').id === $r('app.media.ic_home').id));
      expect($r('app.media.banner3').id === $r('app.media.ic_home').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010016 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_1700
     * @tc.name: testResMedia010017
     * @tc.desc: Verify media resource ic_find is readable (aspect 0, row 16).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010017 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_find').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_find').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.ic_find').id > 0));
      expect($r('app.media.ic_find').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.ic_find').id === $r('app.media.ic_listener').id));
      expect($r('app.media.ic_find').id === $r('app.media.ic_listener').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010017 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_1800
     * @tc.name: testResMedia010018
     * @tc.desc: Verify media resource ic_find_h is readable (aspect 0, row 17).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010018 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_find_h').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_find_h').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.ic_find_h').id > 0));
      expect($r('app.media.ic_find_h').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.ic_find_h').id === $r('app.media.ic_mine').id));
      expect($r('app.media.ic_find_h').id === $r('app.media.ic_mine').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010018 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_1900
     * @tc.name: testResMedia010019
     * @tc.desc: Verify media resource ic_home is readable (aspect 0, row 18).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010019 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_home').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_home').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.ic_home').id > 0));
      expect($r('app.media.ic_home').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.ic_home').id === $r('app.media.ic_mine_h').id));
      expect($r('app.media.ic_home').id === $r('app.media.ic_mine_h').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010019 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_2000
     * @tc.name: testResMedia010020
     * @tc.desc: Verify media resource ic_listener is readable (aspect 0, row 19).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010020 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_listener').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_listener').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.ic_listener').id > 0));
      expect($r('app.media.ic_listener').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.ic_listener').id === $r('app.media.ic_more').id));
      expect($r('app.media.ic_listener').id === $r('app.media.ic_more').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010020 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_2100
     * @tc.name: testResMedia010021
     * @tc.desc: Verify media resource ic_mine is readable (aspect 0, row 20).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010021 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_mine').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_mine').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.ic_mine').id > 0));
      expect($r('app.media.ic_mine').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.ic_mine').id === $r('app.media.ic_music_Album').id));
      expect($r('app.media.ic_mine').id === $r('app.media.ic_music_Album').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010021 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_2200
     * @tc.name: testResMedia010022
     * @tc.desc: Verify media resource ic_mine_h is readable (aspect 0, row 21).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010022 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_mine_h').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_mine_h').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.ic_mine_h').id > 0));
      expect($r('app.media.ic_mine_h').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.ic_mine_h').id === $r('app.media.ic_music_children').id));
      expect($r('app.media.ic_mine_h').id === $r('app.media.ic_music_children').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010022 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_2300
     * @tc.name: testResMedia010023
     * @tc.desc: Verify media resource ic_more is readable (aspect 0, row 22).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010023 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_more').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_more').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.ic_more').id > 0));
      expect($r('app.media.ic_more').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.ic_more').id === $r('app.media.ic_music_hires').id));
      expect($r('app.media.ic_more').id === $r('app.media.ic_music_hires').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010023 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_2400
     * @tc.name: testResMedia010024
     * @tc.desc: Verify media resource ic_music_Album is readable (aspect 0, row 23).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010024 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_music_Album').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_music_Album').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.ic_music_Album').id > 0));
      expect($r('app.media.ic_music_Album').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.ic_music_Album').id === $r('app.media.ic_music_localmusic').id));
      expect($r('app.media.ic_music_Album').id === $r('app.media.ic_music_localmusic').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010024 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_2500
     * @tc.name: testResMedia010025
     * @tc.desc: Verify media resource ic_music_children is readable (aspect 0, row 24).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010025 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_music_children').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_music_children').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.ic_music_children').id > 0));
      expect($r('app.media.ic_music_children').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.ic_music_children').id === $r('app.media.ic_music_musicfm').id));
      expect($r('app.media.ic_music_children').id === $r('app.media.ic_music_musicfm').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010025 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_2600
     * @tc.name: testResMedia010026
     * @tc.desc: Verify media resource ic_music_hires is readable (aspect 0, row 25).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010026 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_music_hires').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_music_hires').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.ic_music_hires').id > 0));
      expect($r('app.media.ic_music_hires').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.ic_music_hires').id === $r('app.media.ic_music_privatefm').id));
      expect($r('app.media.ic_music_hires').id === $r('app.media.ic_music_privatefm').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010026 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_2700
     * @tc.name: testResMedia010027
     * @tc.desc: Verify media resource ic_music_localmusic is readable (aspect 0, row 26).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010027 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_music_localmusic').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_music_localmusic').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.ic_music_localmusic').id > 0));
      expect($r('app.media.ic_music_localmusic').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.ic_music_localmusic').id === $r('app.media.ic_music_ranking').id));
      expect($r('app.media.ic_music_localmusic').id === $r('app.media.ic_music_ranking').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010027 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_2800
     * @tc.name: testResMedia010028
     * @tc.desc: Verify media resource ic_music_musicfm is readable (aspect 0, row 27).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010028 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_music_musicfm').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_music_musicfm').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.ic_music_musicfm').id > 0));
      expect($r('app.media.ic_music_musicfm').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.ic_music_musicfm').id === $r('app.media.ic_music_singer').id));
      expect($r('app.media.ic_music_musicfm').id === $r('app.media.ic_music_singer').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010028 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_2900
     * @tc.name: testResMedia010029
     * @tc.desc: Verify media resource ic_music_privatefm is readable (aspect 0, row 28).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010029 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_music_privatefm').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_music_privatefm').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.ic_music_privatefm').id > 0));
      expect($r('app.media.ic_music_privatefm').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.ic_music_privatefm').id === $r('app.media.ic_music_songsheet').id));
      expect($r('app.media.ic_music_privatefm').id === $r('app.media.ic_music_songsheet').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010029 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_3000
     * @tc.name: testResMedia010030
     * @tc.desc: Verify media resource ic_music_ranking is readable (aspect 0, row 29).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010030 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_music_ranking').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_music_ranking').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.ic_music_ranking').id > 0));
      expect($r('app.media.ic_music_ranking').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.ic_music_ranking').id === $r('app.media.ic_play').id));
      expect($r('app.media.ic_music_ranking').id === $r('app.media.ic_play').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010030 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_3100
     * @tc.name: testResMedia010031
     * @tc.desc: Verify media resource ic_music_singer is readable (aspect 0, row 30).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010031 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_music_singer').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_music_singer').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.ic_music_singer').id > 0));
      expect($r('app.media.ic_music_singer').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.ic_music_singer').id === $r('app.media.ic_playList').id));
      expect($r('app.media.ic_music_singer').id === $r('app.media.ic_playList').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010031 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_3200
     * @tc.name: testResMedia010032
     * @tc.desc: Verify media resource ic_music_songsheet is readable (aspect 0, row 31).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010032 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_music_songsheet').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_music_songsheet').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.ic_music_songsheet').id > 0));
      expect($r('app.media.ic_music_songsheet').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.ic_music_songsheet').id === $r('app.media.ic_public_arrow_right').id));
      expect($r('app.media.ic_music_songsheet').id === $r('app.media.ic_public_arrow_right').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010032 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_3300
     * @tc.name: testResMedia010033
     * @tc.desc: Verify media resource ic_play is readable (aspect 0, row 32).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010033 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_play').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_play').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.ic_play').id > 0));
      expect($r('app.media.ic_play').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.ic_play').id === $r('app.media.ic_public_home').id));
      expect($r('app.media.ic_play').id === $r('app.media.ic_public_home').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010033 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_3400
     * @tc.name: testResMedia010034
     * @tc.desc: Verify media resource ic_playList is readable (aspect 0, row 33).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010034 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_playList').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_playList').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.ic_playList').id > 0));
      expect($r('app.media.ic_playList').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.ic_playList').id === $r('app.media.ic_public_home_filled').id));
      expect($r('app.media.ic_playList').id === $r('app.media.ic_public_home_filled').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010034 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_3500
     * @tc.name: testResMedia010035
     * @tc.desc: Verify media resource ic_public_arrow_right is readable (aspect 0, row 34).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010035 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_public_arrow_right').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_public_arrow_right').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.ic_public_arrow_right').id > 0));
      expect($r('app.media.ic_public_arrow_right').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.ic_public_arrow_right').id === $r('app.media.ic_radio').id));
      expect($r('app.media.ic_public_arrow_right').id === $r('app.media.ic_radio').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010035 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_3600
     * @tc.name: testResMedia010036
     * @tc.desc: Verify media resource ic_public_home is readable (aspect 0, row 35).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010036 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_public_home').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_public_home').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.ic_public_home').id > 0));
      expect($r('app.media.ic_public_home').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.ic_public_home').id === $r('app.media.ic_radio_h').id));
      expect($r('app.media.ic_public_home').id === $r('app.media.ic_radio_h').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010036 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_3700
     * @tc.name: testResMedia010037
     * @tc.desc: Verify media resource ic_public_home_filled is readable (aspect 0, row 36).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010037 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_public_home_filled').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_public_home_filled').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.ic_public_home_filled').id > 0));
      expect($r('app.media.ic_public_home_filled').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.ic_public_home_filled').id === $r('app.media.ic_search').id));
      expect($r('app.media.ic_public_home_filled').id === $r('app.media.ic_search').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010037 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_3800
     * @tc.name: testResMedia010038
     * @tc.desc: Verify media resource ic_radio is readable (aspect 0, row 37).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010038 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_radio').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_radio').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.ic_radio').id > 0));
      expect($r('app.media.ic_radio').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.ic_radio').id === $r('app.media.icon').id));
      expect($r('app.media.ic_radio').id === $r('app.media.icon').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010038 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_3900
     * @tc.name: testResMedia010039
     * @tc.desc: Verify media resource ic_radio_h is readable (aspect 0, row 38).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010039 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_radio_h').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_radio_h').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.ic_radio_h').id > 0));
      expect($r('app.media.ic_radio_h').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.ic_radio_h').id === $r('app.media.icon_play').id));
      expect($r('app.media.ic_radio_h').id === $r('app.media.icon_play').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010039 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_4000
     * @tc.name: testResMedia010040
     * @tc.desc: Verify media resource ic_search is readable (aspect 0, row 39).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010040 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_search').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_search').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.ic_search').id > 0));
      expect($r('app.media.ic_search').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.ic_search').id === $r('app.media.play').id));
      expect($r('app.media.ic_search').id === $r('app.media.play').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010040 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_4100
     * @tc.name: testResMedia010041
     * @tc.desc: Verify media resource icon is readable (aspect 0, row 40).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010041 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.icon').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.icon').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.icon').id > 0));
      expect($r('app.media.icon').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.icon').id === $r('app.media.list1').id));
      expect($r('app.media.icon').id === $r('app.media.list1').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010041 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_4200
     * @tc.name: testResMedia010042
     * @tc.desc: Verify media resource icon_play is readable (aspect 0, row 41).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010042 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.icon_play').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.icon_play').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.icon_play').id > 0));
      expect($r('app.media.icon_play').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.icon_play').id === $r('app.media.list2').id));
      expect($r('app.media.icon_play').id === $r('app.media.list2').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010042 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_4300
     * @tc.name: testResMedia010043
     * @tc.desc: Verify media resource play is readable (aspect 0, row 42).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010043 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.play').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.play').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String($r('app.media.play').id > 0));
      expect($r('app.media.play').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-not-shared actual=%{public}s expected=false', String($r('app.media.play').id === $r('app.media.list3').id));
      expect($r('app.media.play').id === $r('app.media.list3').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010043 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_4400
     * @tc.name: testResMedia010044
     * @tc.desc: Verify media resource list1 is readable (aspect 1, row 43).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010044 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list1').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list1').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.list1').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.list1').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.list1').id !== $r('app.media.list1').id));
      expect($r('app.media.list1').id !== $r('app.media.list1').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010044 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_4500
     * @tc.name: testResMedia010045
     * @tc.desc: Verify media resource list2 is readable (aspect 1, row 44).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010045 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list2').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list2').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.list2').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.list2').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.list2').id !== $r('app.media.list2').id));
      expect($r('app.media.list2').id !== $r('app.media.list2').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010045 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_4600
     * @tc.name: testResMedia010046
     * @tc.desc: Verify media resource list3 is readable (aspect 1, row 45).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010046 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list3').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list3').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.list3').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.list3').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.list3').id !== $r('app.media.list3').id));
      expect($r('app.media.list3').id !== $r('app.media.list3').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010046 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_4700
     * @tc.name: testResMedia010047
     * @tc.desc: Verify media resource list4 is readable (aspect 1, row 46).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010047 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list4').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list4').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.list4').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.list4').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.list4').id !== $r('app.media.list4').id));
      expect($r('app.media.list4').id !== $r('app.media.list4').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010047 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_4800
     * @tc.name: testResMedia010048
     * @tc.desc: Verify media resource list5 is readable (aspect 1, row 47).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010048 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list5').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list5').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.list5').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.list5').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.list5').id !== $r('app.media.list5').id));
      expect($r('app.media.list5').id !== $r('app.media.list5').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010048 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_4900
     * @tc.name: testResMedia010049
     * @tc.desc: Verify media resource list6 is readable (aspect 1, row 48).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010049 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list6').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list6').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.list6').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.list6').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.list6').id !== $r('app.media.list6').id));
      expect($r('app.media.list6').id !== $r('app.media.list6').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010049 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_5000
     * @tc.name: testResMedia010050
     * @tc.desc: Verify media resource list7 is readable (aspect 1, row 49).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010050 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list7').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list7').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.list7').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.list7').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.list7').id !== $r('app.media.list7').id));
      expect($r('app.media.list7').id !== $r('app.media.list7').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010050 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_5100
     * @tc.name: testResMedia010051
     * @tc.desc: Verify media resource list8 is readable (aspect 1, row 50).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010051 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list8').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list8').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.list8').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.list8').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.list8').id !== $r('app.media.list8').id));
      expect($r('app.media.list8').id !== $r('app.media.list8').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010051 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_5200
     * @tc.name: testResMedia010052
     * @tc.desc: Verify media resource list9 is readable (aspect 1, row 51).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010052 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list9').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list9').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.list9').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.list9').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.list9').id !== $r('app.media.list9').id));
      expect($r('app.media.list9').id !== $r('app.media.list9').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010052 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_5300
     * @tc.name: testResMedia010053
     * @tc.desc: Verify media resource list10 is readable (aspect 1, row 52).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010053 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list10').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list10').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.list10').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.list10').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.list10').id !== $r('app.media.list10').id));
      expect($r('app.media.list10').id !== $r('app.media.list10').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010053 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_5400
     * @tc.name: testResMedia010054
     * @tc.desc: Verify media resource list11 is readable (aspect 1, row 53).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010054 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list11').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list11').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.list11').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.list11').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.list11').id !== $r('app.media.list11').id));
      expect($r('app.media.list11').id !== $r('app.media.list11').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010054 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_5500
     * @tc.name: testResMedia010055
     * @tc.desc: Verify media resource list12 is readable (aspect 1, row 54).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010055 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list12').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list12').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.list12').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.list12').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.list12').id !== $r('app.media.list12').id));
      expect($r('app.media.list12').id !== $r('app.media.list12').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010055 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_5600
     * @tc.name: testResMedia010056
     * @tc.desc: Verify media resource list13 is readable (aspect 1, row 55).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010056 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.list13').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.list13').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.list13').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.list13').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.list13').id !== $r('app.media.list13').id));
      expect($r('app.media.list13').id !== $r('app.media.list13').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010056 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_5700
     * @tc.name: testResMedia010057
     * @tc.desc: Verify media resource banner1 is readable (aspect 1, row 56).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010057 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.banner1').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.banner1').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.banner1').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.banner1').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.banner1').id !== $r('app.media.banner1').id));
      expect($r('app.media.banner1').id !== $r('app.media.banner1').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010057 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_5800
     * @tc.name: testResMedia010058
     * @tc.desc: Verify media resource banner2 is readable (aspect 1, row 57).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010058 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.banner2').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.banner2').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.banner2').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.banner2').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.banner2').id !== $r('app.media.banner2').id));
      expect($r('app.media.banner2').id !== $r('app.media.banner2').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010058 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_5900
     * @tc.name: testResMedia010059
     * @tc.desc: Verify media resource banner3 is readable (aspect 1, row 58).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010059 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.banner3').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.banner3').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.banner3').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.banner3').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.banner3').id !== $r('app.media.banner3').id));
      expect($r('app.media.banner3').id !== $r('app.media.banner3').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010059 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_6000
     * @tc.name: testResMedia010060
     * @tc.desc: Verify media resource ic_find is readable (aspect 1, row 59).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010060 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_find').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_find').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.ic_find').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.ic_find').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.ic_find').id !== $r('app.media.ic_find').id));
      expect($r('app.media.ic_find').id !== $r('app.media.ic_find').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010060 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_6100
     * @tc.name: testResMedia010061
     * @tc.desc: Verify media resource ic_find_h is readable (aspect 1, row 60).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010061 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_find_h').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_find_h').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.ic_find_h').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.ic_find_h').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.ic_find_h').id !== $r('app.media.ic_find_h').id));
      expect($r('app.media.ic_find_h').id !== $r('app.media.ic_find_h').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010061 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_6200
     * @tc.name: testResMedia010062
     * @tc.desc: Verify media resource ic_home is readable (aspect 1, row 61).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010062 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_home').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_home').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.ic_home').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.ic_home').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.ic_home').id !== $r('app.media.ic_home').id));
      expect($r('app.media.ic_home').id !== $r('app.media.ic_home').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010062 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_6300
     * @tc.name: testResMedia010063
     * @tc.desc: Verify media resource ic_listener is readable (aspect 1, row 62).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010063 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_listener').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_listener').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.ic_listener').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.ic_listener').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.ic_listener').id !== $r('app.media.ic_listener').id));
      expect($r('app.media.ic_listener').id !== $r('app.media.ic_listener').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010063 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_6400
     * @tc.name: testResMedia010064
     * @tc.desc: Verify media resource ic_mine is readable (aspect 1, row 63).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010064 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_mine').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_mine').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.ic_mine').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.ic_mine').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.ic_mine').id !== $r('app.media.ic_mine').id));
      expect($r('app.media.ic_mine').id !== $r('app.media.ic_mine').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010064 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_6500
     * @tc.name: testResMedia010065
     * @tc.desc: Verify media resource ic_mine_h is readable (aspect 1, row 64).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010065 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_mine_h').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_mine_h').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.ic_mine_h').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.ic_mine_h').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.ic_mine_h').id !== $r('app.media.ic_mine_h').id));
      expect($r('app.media.ic_mine_h').id !== $r('app.media.ic_mine_h').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010065 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_6600
     * @tc.name: testResMedia010066
     * @tc.desc: Verify media resource ic_more is readable (aspect 1, row 65).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010066 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_more').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_more').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.ic_more').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.ic_more').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.ic_more').id !== $r('app.media.ic_more').id));
      expect($r('app.media.ic_more').id !== $r('app.media.ic_more').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010066 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_6700
     * @tc.name: testResMedia010067
     * @tc.desc: Verify media resource ic_music_Album is readable (aspect 1, row 66).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010067 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_music_Album').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_music_Album').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.ic_music_Album').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.ic_music_Album').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.ic_music_Album').id !== $r('app.media.ic_music_Album').id));
      expect($r('app.media.ic_music_Album').id !== $r('app.media.ic_music_Album').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010067 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_6800
     * @tc.name: testResMedia010068
     * @tc.desc: Verify media resource ic_music_children is readable (aspect 1, row 67).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010068 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_music_children').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_music_children').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.ic_music_children').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.ic_music_children').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.ic_music_children').id !== $r('app.media.ic_music_children').id));
      expect($r('app.media.ic_music_children').id !== $r('app.media.ic_music_children').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010068 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_6900
     * @tc.name: testResMedia010069
     * @tc.desc: Verify media resource ic_music_hires is readable (aspect 1, row 68).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010069 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_music_hires').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_music_hires').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.ic_music_hires').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.ic_music_hires').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.ic_music_hires').id !== $r('app.media.ic_music_hires').id));
      expect($r('app.media.ic_music_hires').id !== $r('app.media.ic_music_hires').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010069 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_7000
     * @tc.name: testResMedia010070
     * @tc.desc: Verify media resource ic_music_localmusic is readable (aspect 1, row 69).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010070 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_music_localmusic').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_music_localmusic').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.ic_music_localmusic').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.ic_music_localmusic').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.ic_music_localmusic').id !== $r('app.media.ic_music_localmusic').id));
      expect($r('app.media.ic_music_localmusic').id !== $r('app.media.ic_music_localmusic').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010070 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_7100
     * @tc.name: testResMedia010071
     * @tc.desc: Verify media resource ic_music_musicfm is readable (aspect 1, row 70).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010071 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_music_musicfm').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_music_musicfm').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.ic_music_musicfm').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.ic_music_musicfm').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.ic_music_musicfm').id !== $r('app.media.ic_music_musicfm').id));
      expect($r('app.media.ic_music_musicfm').id !== $r('app.media.ic_music_musicfm').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010071 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_7200
     * @tc.name: testResMedia010072
     * @tc.desc: Verify media resource ic_music_privatefm is readable (aspect 1, row 71).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010072 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_music_privatefm').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_music_privatefm').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.ic_music_privatefm').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.ic_music_privatefm').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.ic_music_privatefm').id !== $r('app.media.ic_music_privatefm').id));
      expect($r('app.media.ic_music_privatefm').id !== $r('app.media.ic_music_privatefm').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010072 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_7300
     * @tc.name: testResMedia010073
     * @tc.desc: Verify media resource ic_music_ranking is readable (aspect 1, row 72).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010073 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_music_ranking').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_music_ranking').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.ic_music_ranking').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.ic_music_ranking').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.ic_music_ranking').id !== $r('app.media.ic_music_ranking').id));
      expect($r('app.media.ic_music_ranking').id !== $r('app.media.ic_music_ranking').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010073 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_7400
     * @tc.name: testResMedia010074
     * @tc.desc: Verify media resource ic_music_singer is readable (aspect 1, row 73).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010074 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_music_singer').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_music_singer').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.ic_music_singer').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.ic_music_singer').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.ic_music_singer').id !== $r('app.media.ic_music_singer').id));
      expect($r('app.media.ic_music_singer').id !== $r('app.media.ic_music_singer').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010074 end');
    })

    /**
     * @tc.number: SUB_MM_RESMEDIA01_7500
     * @tc.name: testResMedia010075
     * @tc.desc: Verify media resource ic_music_songsheet is readable (aspect 1, row 74).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResMedia010075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010075 begin');
      let rm: resourceManager.ResourceManager = getResourceManager();
      hilog.info(DOMAIN, TAG, 'media-bytes-present actual=%{public}s expected=true', String(rm.getMediaContentSync($r('app.media.ic_music_songsheet').id).length > 0));
      expect(rm.getMediaContentSync($r('app.media.ic_music_songsheet').id).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-module-entry actual=%{public}s expected=true', String($r('app.media.ic_music_songsheet').moduleName === TEST_MODULE_NAME));
      expect($r('app.media.ic_music_songsheet').moduleName === TEST_MODULE_NAME).assertTrue();
      hilog.info(DOMAIN, TAG, 'media-id-stable actual=%{public}s expected=false', String($r('app.media.ic_music_songsheet').id !== $r('app.media.ic_music_songsheet').id));
      expect($r('app.media.ic_music_songsheet').id !== $r('app.media.ic_music_songsheet').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResMedia010075 end');
    })

  })
}
