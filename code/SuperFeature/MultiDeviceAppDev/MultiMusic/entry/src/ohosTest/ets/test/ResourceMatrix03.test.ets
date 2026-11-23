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

// @volume rule=every-app-resource-carries-bundle-module-and-positive-id basis=spec cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { resourceManager } from '@kit.LocalizationKit';
import { BUNDLE_NAME, TEST_MODULE_NAME } from '../util/TestConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

export default function resourceMatrix03Test() {
  describe('ResourceMatrix03', () => {

    /**
     * @tc.number: SUB_MM_RESID01_0100
     * @tc.name: testResId010001
     * @tc.desc: Verify string resource module_desc identity metadata (row 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010001 begin');
      const v0: string = $r('app.string.module_desc').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.module_desc').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.module_desc').id > 0));
      expect($r('app.string.module_desc').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010001 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_0200
     * @tc.name: testResId010002
     * @tc.desc: Verify string resource mine identity metadata (row 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010002 begin');
      const v0: string = $r('app.string.mine').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.mine').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.mine').id > 0));
      expect($r('app.string.mine').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010002 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_0300
     * @tc.name: testResId010003
     * @tc.desc: Verify string resource discovery identity metadata (row 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010003 begin');
      const v0: string = $r('app.string.discovery').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.discovery').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.discovery').id > 0));
      expect($r('app.string.discovery').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010003 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_0400
     * @tc.name: testResId010004
     * @tc.desc: Verify string resource radio identity metadata (row 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010004 begin');
      const v0: string = $r('app.string.radio').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.radio').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.radio').id > 0));
      expect($r('app.string.radio').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010004 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_0500
     * @tc.name: testResId010005
     * @tc.desc: Verify string resource privacy identity metadata (row 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010005 begin');
      const v0: string = $r('app.string.privacy').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.privacy').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.privacy').id > 0));
      expect($r('app.string.privacy').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010005 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_0600
     * @tc.name: testResId010006
     * @tc.desc: Verify string resource index identity metadata (row 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010006 begin');
      const v0: string = $r('app.string.index').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.index').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.index').id > 0));
      expect($r('app.string.index').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010006 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_0700
     * @tc.name: testResId010007
     * @tc.desc: Verify string resource singer identity metadata (row 6).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010007 begin');
      const v0: string = $r('app.string.singer').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.singer').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.singer').id > 0));
      expect($r('app.string.singer').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010007 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_0800
     * @tc.name: testResId010008
     * @tc.desc: Verify string resource recommend identity metadata (row 7).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010008 begin');
      const v0: string = $r('app.string.recommend').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.recommend').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.recommend').id > 0));
      expect($r('app.string.recommend').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010008 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_0900
     * @tc.name: testResId010009
     * @tc.desc: Verify string resource rank identity metadata (row 8).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010009 begin');
      const v0: string = $r('app.string.rank').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.rank').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.rank').id > 0));
      expect($r('app.string.rank').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010009 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_1000
     * @tc.name: testResId010010
     * @tc.desc: Verify string resource singList identity metadata (row 9).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010010 begin');
      const v0: string = $r('app.string.singList').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.singList').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.singList').id > 0));
      expect($r('app.string.singList').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010010 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_1100
     * @tc.name: testResId010011
     * @tc.desc: Verify string resource hiRes identity metadata (row 10).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010011 begin');
      const v0: string = $r('app.string.hiRes').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.hiRes').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.hiRes').id > 0));
      expect($r('app.string.hiRes').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010011 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_1200
     * @tc.name: testResId010012
     * @tc.desc: Verify string resource musicFM identity metadata (row 11).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010012 begin');
      const v0: string = $r('app.string.musicFM').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.musicFM').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.musicFM').id > 0));
      expect($r('app.string.musicFM').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010012 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_1300
     * @tc.name: testResId010013
     * @tc.desc: Verify string resource digital identity metadata (row 12).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010013 begin');
      const v0: string = $r('app.string.digital').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.digital').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.digital').id > 0));
      expect($r('app.string.digital').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010013 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_1400
     * @tc.name: testResId010014
     * @tc.desc: Verify string resource child identity metadata (row 13).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010014 begin');
      const v0: string = $r('app.string.child').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.child').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.child').id > 0));
      expect($r('app.string.child').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010014 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_1500
     * @tc.name: testResId010015
     * @tc.desc: Verify string resource buildBySelf identity metadata (row 14).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010015 begin');
      const v0: string = $r('app.string.buildBySelf').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.buildBySelf').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.buildBySelf').id > 0));
      expect($r('app.string.buildBySelf').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010015 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_1600
     * @tc.name: testResId010016
     * @tc.desc: Verify string resource mySongs identity metadata (row 15).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010016 begin');
      const v0: string = $r('app.string.mySongs').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.mySongs').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.mySongs').id > 0));
      expect($r('app.string.mySongs').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010016 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_1700
     * @tc.name: testResId010017
     * @tc.desc: Verify string resource singRecommend identity metadata (row 16).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010017 begin');
      const v0: string = $r('app.string.singRecommend').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.singRecommend').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.singRecommend').id > 0));
      expect($r('app.string.singRecommend').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010017 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_1800
     * @tc.name: testResId010018
     * @tc.desc: Verify string resource coffee identity metadata (row 17).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010018 begin');
      const v0: string = $r('app.string.coffee').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.coffee').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.coffee').id > 0));
      expect($r('app.string.coffee').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010018 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_1900
     * @tc.name: testResId010019
     * @tc.desc: Verify string resource pops identity metadata (row 18).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010019 begin');
      const v0: string = $r('app.string.pops').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.pops').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.pops').id > 0));
      expect($r('app.string.pops').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010019 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_2000
     * @tc.name: testResId010020
     * @tc.desc: Verify string resource oldYear identity metadata (row 19).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010020 begin');
      const v0: string = $r('app.string.oldYear').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.oldYear').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.oldYear').id > 0));
      expect($r('app.string.oldYear').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010020 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_2100
     * @tc.name: testResId010021
     * @tc.desc: Verify string resource emo identity metadata (row 20).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010021 begin');
      const v0: string = $r('app.string.emo').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.emo').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.emo').id > 0));
      expect($r('app.string.emo').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010021 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_2200
     * @tc.name: testResId010022
     * @tc.desc: Verify string resource rock identity metadata (row 21).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010022 begin');
      const v0: string = $r('app.string.rock').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.rock').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.rock').id > 0));
      expect($r('app.string.rock').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010022 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_2300
     * @tc.name: testResId010023
     * @tc.desc: Verify string resource noon identity metadata (row 22).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010023 begin');
      const v0: string = $r('app.string.noon').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.noon').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.noon').id > 0));
      expect($r('app.string.noon').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010023 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_2400
     * @tc.name: testResId010024
     * @tc.desc: Verify string resource bluce identity metadata (row 23).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010024 begin');
      const v0: string = $r('app.string.bluce').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.bluce').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.bluce').id > 0));
      expect($r('app.string.bluce').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010024 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_2500
     * @tc.name: testResId010025
     * @tc.desc: Verify string resource noise identity metadata (row 24).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010025 begin');
      const v0: string = $r('app.string.noise').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.noise').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.noise').id > 0));
      expect($r('app.string.noise').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010025 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_2600
     * @tc.name: testResId010026
     * @tc.desc: Verify string resource jazz identity metadata (row 25).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010026 begin');
      const v0: string = $r('app.string.jazz').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.jazz').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.jazz').id > 0));
      expect($r('app.string.jazz').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010026 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_2700
     * @tc.name: testResId010027
     * @tc.desc: Verify string resource noSleep identity metadata (row 26).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010027 begin');
      const v0: string = $r('app.string.noSleep').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.noSleep').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.noSleep').id > 0));
      expect($r('app.string.noSleep').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010027 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_2800
     * @tc.name: testResId010028
     * @tc.desc: Verify string resource bgm identity metadata (row 27).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010028 begin');
      const v0: string = $r('app.string.bgm').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.bgm').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.bgm').id > 0));
      expect($r('app.string.bgm').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010028 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_2900
     * @tc.name: testResId010029
     * @tc.desc: Verify string resource EntryAbility_desc identity metadata (row 28).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010029 begin');
      const v0: string = $r('app.string.EntryAbility_desc').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.EntryAbility_desc').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.EntryAbility_desc').id > 0));
      expect($r('app.string.EntryAbility_desc').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010029 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_3000
     * @tc.name: testResId010030
     * @tc.desc: Verify string resource sunshine identity metadata (row 29).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010030 begin');
      const v0: string = $r('app.string.sunshine').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.sunshine').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.sunshine').id > 0));
      expect($r('app.string.sunshine').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010030 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_3100
     * @tc.name: testResId010031
     * @tc.desc: Verify string resource sleep identity metadata (row 30).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010031 begin');
      const v0: string = $r('app.string.sleep').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.sleep').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.sleep').id > 0));
      expect($r('app.string.sleep').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010031 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_3200
     * @tc.name: testResId010032
     * @tc.desc: Verify string resource EntryAbility_label identity metadata (row 31).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010032 begin');
      const v0: string = $r('app.string.EntryAbility_label').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.string.EntryAbility_label').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.string.EntryAbility_label').id > 0));
      expect($r('app.string.EntryAbility_label').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010032 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_3300
     * @tc.name: testResId010033
     * @tc.desc: Verify media resource list1 identity metadata (row 32).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010033 begin');
      const v0: string = $r('app.media.list1').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.list1').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.list1').id > 0));
      expect($r('app.media.list1').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010033 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_3400
     * @tc.name: testResId010034
     * @tc.desc: Verify media resource list2 identity metadata (row 33).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010034 begin');
      const v0: string = $r('app.media.list2').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.list2').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.list2').id > 0));
      expect($r('app.media.list2').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010034 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_3500
     * @tc.name: testResId010035
     * @tc.desc: Verify media resource list3 identity metadata (row 34).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010035 begin');
      const v0: string = $r('app.media.list3').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.list3').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.list3').id > 0));
      expect($r('app.media.list3').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010035 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_3600
     * @tc.name: testResId010036
     * @tc.desc: Verify media resource list4 identity metadata (row 35).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010036 begin');
      const v0: string = $r('app.media.list4').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.list4').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.list4').id > 0));
      expect($r('app.media.list4').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010036 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_3700
     * @tc.name: testResId010037
     * @tc.desc: Verify media resource list5 identity metadata (row 36).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010037 begin');
      const v0: string = $r('app.media.list5').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.list5').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.list5').id > 0));
      expect($r('app.media.list5').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010037 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_3800
     * @tc.name: testResId010038
     * @tc.desc: Verify media resource list6 identity metadata (row 37).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010038 begin');
      const v0: string = $r('app.media.list6').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.list6').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.list6').id > 0));
      expect($r('app.media.list6').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010038 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_3900
     * @tc.name: testResId010039
     * @tc.desc: Verify media resource list7 identity metadata (row 38).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010039 begin');
      const v0: string = $r('app.media.list7').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.list7').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.list7').id > 0));
      expect($r('app.media.list7').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010039 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_4000
     * @tc.name: testResId010040
     * @tc.desc: Verify media resource list8 identity metadata (row 39).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010040 begin');
      const v0: string = $r('app.media.list8').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.list8').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.list8').id > 0));
      expect($r('app.media.list8').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010040 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_4100
     * @tc.name: testResId010041
     * @tc.desc: Verify media resource list9 identity metadata (row 40).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010041 begin');
      const v0: string = $r('app.media.list9').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.list9').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.list9').id > 0));
      expect($r('app.media.list9').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010041 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_4200
     * @tc.name: testResId010042
     * @tc.desc: Verify media resource list10 identity metadata (row 41).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010042 begin');
      const v0: string = $r('app.media.list10').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.list10').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.list10').id > 0));
      expect($r('app.media.list10').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010042 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_4300
     * @tc.name: testResId010043
     * @tc.desc: Verify media resource list11 identity metadata (row 42).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010043 begin');
      const v0: string = $r('app.media.list11').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.list11').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.list11').id > 0));
      expect($r('app.media.list11').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010043 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_4400
     * @tc.name: testResId010044
     * @tc.desc: Verify media resource list12 identity metadata (row 43).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010044 begin');
      const v0: string = $r('app.media.list12').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.list12').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.list12').id > 0));
      expect($r('app.media.list12').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010044 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_4500
     * @tc.name: testResId010045
     * @tc.desc: Verify media resource list13 identity metadata (row 44).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010045 begin');
      const v0: string = $r('app.media.list13').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.list13').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.list13').id > 0));
      expect($r('app.media.list13').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010045 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_4600
     * @tc.name: testResId010046
     * @tc.desc: Verify media resource banner1 identity metadata (row 45).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010046 begin');
      const v0: string = $r('app.media.banner1').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.banner1').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.banner1').id > 0));
      expect($r('app.media.banner1').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010046 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_4700
     * @tc.name: testResId010047
     * @tc.desc: Verify media resource banner2 identity metadata (row 46).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010047 begin');
      const v0: string = $r('app.media.banner2').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.banner2').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.banner2').id > 0));
      expect($r('app.media.banner2').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010047 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_4800
     * @tc.name: testResId010048
     * @tc.desc: Verify media resource banner3 identity metadata (row 47).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010048 begin');
      const v0: string = $r('app.media.banner3').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.banner3').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.banner3').id > 0));
      expect($r('app.media.banner3').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010048 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_4900
     * @tc.name: testResId010049
     * @tc.desc: Verify media resource ic_find identity metadata (row 48).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010049 begin');
      const v0: string = $r('app.media.ic_find').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.ic_find').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.ic_find').id > 0));
      expect($r('app.media.ic_find').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010049 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_5000
     * @tc.name: testResId010050
     * @tc.desc: Verify media resource ic_find_h identity metadata (row 49).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010050 begin');
      const v0: string = $r('app.media.ic_find_h').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.ic_find_h').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.ic_find_h').id > 0));
      expect($r('app.media.ic_find_h').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010050 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_5100
     * @tc.name: testResId010051
     * @tc.desc: Verify media resource ic_home identity metadata (row 50).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010051 begin');
      const v0: string = $r('app.media.ic_home').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.ic_home').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.ic_home').id > 0));
      expect($r('app.media.ic_home').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010051 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_5200
     * @tc.name: testResId010052
     * @tc.desc: Verify media resource ic_listener identity metadata (row 51).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010052 begin');
      const v0: string = $r('app.media.ic_listener').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.ic_listener').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.ic_listener').id > 0));
      expect($r('app.media.ic_listener').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010052 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_5300
     * @tc.name: testResId010053
     * @tc.desc: Verify media resource ic_mine identity metadata (row 52).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010053 begin');
      const v0: string = $r('app.media.ic_mine').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.ic_mine').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.ic_mine').id > 0));
      expect($r('app.media.ic_mine').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010053 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_5400
     * @tc.name: testResId010054
     * @tc.desc: Verify media resource ic_mine_h identity metadata (row 53).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010054 begin');
      const v0: string = $r('app.media.ic_mine_h').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.ic_mine_h').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.ic_mine_h').id > 0));
      expect($r('app.media.ic_mine_h').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010054 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_5500
     * @tc.name: testResId010055
     * @tc.desc: Verify media resource ic_more identity metadata (row 54).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010055 begin');
      const v0: string = $r('app.media.ic_more').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.ic_more').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.ic_more').id > 0));
      expect($r('app.media.ic_more').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010055 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_5600
     * @tc.name: testResId010056
     * @tc.desc: Verify media resource ic_music_Album identity metadata (row 55).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010056 begin');
      const v0: string = $r('app.media.ic_music_Album').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.ic_music_Album').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.ic_music_Album').id > 0));
      expect($r('app.media.ic_music_Album').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010056 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_5700
     * @tc.name: testResId010057
     * @tc.desc: Verify media resource ic_music_children identity metadata (row 56).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010057 begin');
      const v0: string = $r('app.media.ic_music_children').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.ic_music_children').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.ic_music_children').id > 0));
      expect($r('app.media.ic_music_children').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010057 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_5800
     * @tc.name: testResId010058
     * @tc.desc: Verify media resource ic_music_hires identity metadata (row 57).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010058 begin');
      const v0: string = $r('app.media.ic_music_hires').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.ic_music_hires').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.ic_music_hires').id > 0));
      expect($r('app.media.ic_music_hires').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010058 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_5900
     * @tc.name: testResId010059
     * @tc.desc: Verify media resource ic_music_localmusic identity metadata (row 58).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010059 begin');
      const v0: string = $r('app.media.ic_music_localmusic').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.ic_music_localmusic').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.ic_music_localmusic').id > 0));
      expect($r('app.media.ic_music_localmusic').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010059 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_6000
     * @tc.name: testResId010060
     * @tc.desc: Verify media resource ic_music_musicfm identity metadata (row 59).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010060 begin');
      const v0: string = $r('app.media.ic_music_musicfm').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.ic_music_musicfm').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.ic_music_musicfm').id > 0));
      expect($r('app.media.ic_music_musicfm').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010060 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_6100
     * @tc.name: testResId010061
     * @tc.desc: Verify media resource ic_music_privatefm identity metadata (row 60).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010061 begin');
      const v0: string = $r('app.media.ic_music_privatefm').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.ic_music_privatefm').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.ic_music_privatefm').id > 0));
      expect($r('app.media.ic_music_privatefm').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010061 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_6200
     * @tc.name: testResId010062
     * @tc.desc: Verify media resource ic_music_ranking identity metadata (row 61).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010062 begin');
      const v0: string = $r('app.media.ic_music_ranking').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.ic_music_ranking').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.ic_music_ranking').id > 0));
      expect($r('app.media.ic_music_ranking').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010062 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_6300
     * @tc.name: testResId010063
     * @tc.desc: Verify media resource ic_music_singer identity metadata (row 62).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010063 begin');
      const v0: string = $r('app.media.ic_music_singer').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.ic_music_singer').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.ic_music_singer').id > 0));
      expect($r('app.media.ic_music_singer').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010063 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_6400
     * @tc.name: testResId010064
     * @tc.desc: Verify media resource ic_music_songsheet identity metadata (row 63).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010064 begin');
      const v0: string = $r('app.media.ic_music_songsheet').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.ic_music_songsheet').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.ic_music_songsheet').id > 0));
      expect($r('app.media.ic_music_songsheet').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010064 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_6500
     * @tc.name: testResId010065
     * @tc.desc: Verify media resource ic_play identity metadata (row 64).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010065 begin');
      const v0: string = $r('app.media.ic_play').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.ic_play').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.ic_play').id > 0));
      expect($r('app.media.ic_play').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010065 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_6600
     * @tc.name: testResId010066
     * @tc.desc: Verify media resource ic_playList identity metadata (row 65).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010066 begin');
      const v0: string = $r('app.media.ic_playList').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.ic_playList').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.ic_playList').id > 0));
      expect($r('app.media.ic_playList').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010066 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_6700
     * @tc.name: testResId010067
     * @tc.desc: Verify media resource ic_public_arrow_right identity metadata (row 66).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010067 begin');
      const v0: string = $r('app.media.ic_public_arrow_right').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.ic_public_arrow_right').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.ic_public_arrow_right').id > 0));
      expect($r('app.media.ic_public_arrow_right').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010067 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_6800
     * @tc.name: testResId010068
     * @tc.desc: Verify media resource ic_public_home identity metadata (row 67).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010068 begin');
      const v0: string = $r('app.media.ic_public_home').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.ic_public_home').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.ic_public_home').id > 0));
      expect($r('app.media.ic_public_home').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010068 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_6900
     * @tc.name: testResId010069
     * @tc.desc: Verify media resource ic_public_home_filled identity metadata (row 68).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010069 begin');
      const v0: string = $r('app.media.ic_public_home_filled').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.ic_public_home_filled').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.ic_public_home_filled').id > 0));
      expect($r('app.media.ic_public_home_filled').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010069 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_7000
     * @tc.name: testResId010070
     * @tc.desc: Verify media resource ic_radio identity metadata (row 69).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010070 begin');
      const v0: string = $r('app.media.ic_radio').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.ic_radio').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.ic_radio').id > 0));
      expect($r('app.media.ic_radio').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010070 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_7100
     * @tc.name: testResId010071
     * @tc.desc: Verify media resource ic_radio_h identity metadata (row 70).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010071 begin');
      const v0: string = $r('app.media.ic_radio_h').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.ic_radio_h').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.ic_radio_h').id > 0));
      expect($r('app.media.ic_radio_h').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010071 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_7200
     * @tc.name: testResId010072
     * @tc.desc: Verify media resource ic_search identity metadata (row 71).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010072 begin');
      const v0: string = $r('app.media.ic_search').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.ic_search').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.ic_search').id > 0));
      expect($r('app.media.ic_search').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010072 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_7300
     * @tc.name: testResId010073
     * @tc.desc: Verify media resource icon identity metadata (row 72).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010073 begin');
      const v0: string = $r('app.media.icon').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.icon').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.icon').id > 0));
      expect($r('app.media.icon').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010073 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_7400
     * @tc.name: testResId010074
     * @tc.desc: Verify media resource icon_play identity metadata (row 73).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010074 begin');
      const v0: string = $r('app.media.icon_play').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.icon_play').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.icon_play').id > 0));
      expect($r('app.media.icon_play').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010074 end');
    })

    /**
     * @tc.number: SUB_MM_RESID01_7500
     * @tc.name: testResId010075
     * @tc.desc: Verify media resource play identity metadata (row 74).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testResId010075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010075 begin');
      const v0: string = $r('app.media.play').bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: string = $r('app.media.play').moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'resource-id-positive actual=%{public}s expected=true', String($r('app.media.play').id > 0));
      expect($r('app.media.play').id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResId010075 end');
    })

  })
}
