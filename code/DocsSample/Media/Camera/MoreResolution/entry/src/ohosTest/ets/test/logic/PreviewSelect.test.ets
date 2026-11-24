/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { logInfo, BUNDLE } from '../common/ResolutionTestSupport';
import {
  selectPreviewProfileIndex,
  Profile,
} from '../model/ResolutionLogic';

/** PreviewSelectTest logic checks (40 cases). */
export default function previewSelectTest(): void {
  describe('PreviewSelectTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0001
     * @tc.name      Resolution_PreviewSelect_0001
     * @tc.desc      preview selection for ratio 1.777778 over 1 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_PreviewSelect_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PreviewSelect_0001 begin`);
      const profiles: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.777778, profiles=1)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.777778, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0002
     * @tc.name      Resolution_PreviewSelect_0002
     * @tc.desc      preview selection for ratio 1.787778 over 2 profiles returns index 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0002 begin`);
      const profiles: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1920, 1080, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.787778, profiles=2)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.787778, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0003
     * @tc.name      Resolution_PreviewSelect_0003
     * @tc.desc      preview selection for ratio 1.797778 over 2 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0003 begin`);
      const profiles: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1920, 1080, 2000, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.797778, profiles=2)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.797778, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0004
     * @tc.name      Resolution_PreviewSelect_0004
     * @tc.desc      preview selection for ratio 1.363333 over 2 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0004 begin`);
      const profiles: Array<Profile> = [
        new Profile(640, 480, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.363333, profiles=2)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.363333, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0005
     * @tc.name      Resolution_PreviewSelect_0005
     * @tc.desc      preview selection for ratio 1.04 over 1 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0005 begin`);
      const profiles: Array<Profile> = [
        new Profile(1088, 1088, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.04, profiles=1)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.04, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0006
     * @tc.name      Resolution_PreviewSelect_0006
     * @tc.desc      preview selection for ratio 1 over 1 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0006 begin`);
      const profiles: Array<Profile> = [
        new Profile(1080, 1080, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1, profiles=1)");
      const actual: number = selectPreviewProfileIndex(profiles, 1, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0007
     * @tc.name      Resolution_PreviewSelect_0007
     * @tc.desc      preview selection for ratio 1.343333 over 2 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0007 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1440, 1003, 30, 60),
        new Profile(1280, 960, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.343333, profiles=2)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.343333, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0008
     * @tc.name      Resolution_PreviewSelect_0008
     * @tc.desc      preview selection for ratio 1.797778 over 0 profiles returns index -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0008 begin`);
      const profiles: Array<Profile> = [
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.797778, profiles=0)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.797778, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0009
     * @tc.name      Resolution_PreviewSelect_0009
     * @tc.desc      preview selection for ratio 1.807778 over 1 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0009 begin`);
      const profiles: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.807778, profiles=1)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.807778, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0010
     * @tc.name      Resolution_PreviewSelect_0010
     * @tc.desc      preview selection for ratio 1.817778 over 2 profiles returns index 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0010 begin`);
      const profiles: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1920, 1080, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.817778, profiles=2)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.817778, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0011
     * @tc.name      Resolution_PreviewSelect_0011
     * @tc.desc      preview selection for ratio 1.777778 over 2 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0011 begin`);
      const profiles: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1920, 1080, 2000, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.777778, profiles=2)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.777778, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0012
     * @tc.name      Resolution_PreviewSelect_0012
     * @tc.desc      preview selection for ratio 1.343333 over 2 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_PreviewSelect_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PreviewSelect_0012 begin`);
      const profiles: Array<Profile> = [
        new Profile(640, 480, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.343333, profiles=2)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.343333, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0013
     * @tc.name      Resolution_PreviewSelect_0013
     * @tc.desc      preview selection for ratio 1.02 over 1 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0013 begin`);
      const profiles: Array<Profile> = [
        new Profile(1088, 1088, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.02, profiles=1)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.02, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0014
     * @tc.name      Resolution_PreviewSelect_0014
     * @tc.desc      preview selection for ratio 1.03 over 1 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0014 begin`);
      const profiles: Array<Profile> = [
        new Profile(1080, 1080, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.03, profiles=1)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.03, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0015
     * @tc.name      Resolution_PreviewSelect_0015
     * @tc.desc      preview selection for ratio 1.373333 over 2 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0015 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1440, 1003, 30, 60),
        new Profile(1280, 960, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.373333, profiles=2)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.373333, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0016
     * @tc.name      Resolution_PreviewSelect_0016
     * @tc.desc      preview selection for ratio 1.777778 over 0 profiles returns index -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0016 begin`);
      const profiles: Array<Profile> = [
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.777778, profiles=0)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.777778, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0017
     * @tc.name      Resolution_PreviewSelect_0017
     * @tc.desc      preview selection for ratio 1.787778 over 1 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0017 begin`);
      const profiles: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.787778, profiles=1)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.787778, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0018
     * @tc.name      Resolution_PreviewSelect_0018
     * @tc.desc      preview selection for ratio 1.797778 over 2 profiles returns index 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_PreviewSelect_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PreviewSelect_0018 begin`);
      const profiles: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1920, 1080, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.797778, profiles=2)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.797778, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0019
     * @tc.name      Resolution_PreviewSelect_0019
     * @tc.desc      preview selection for ratio 1.807778 over 2 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0019 begin`);
      const profiles: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1920, 1080, 2000, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.807778, profiles=2)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.807778, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0020
     * @tc.name      Resolution_PreviewSelect_0020
     * @tc.desc      preview selection for ratio 1.373333 over 2 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0020 begin`);
      const profiles: Array<Profile> = [
        new Profile(640, 480, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.373333, profiles=2)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.373333, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0021
     * @tc.name      Resolution_PreviewSelect_0021
     * @tc.desc      preview selection for ratio 1 over 1 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0021 begin`);
      const profiles: Array<Profile> = [
        new Profile(1088, 1088, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1, profiles=1)");
      const actual: number = selectPreviewProfileIndex(profiles, 1, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0022
     * @tc.name      Resolution_PreviewSelect_0022
     * @tc.desc      preview selection for ratio 1.01 over 1 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0022 begin`);
      const profiles: Array<Profile> = [
        new Profile(1080, 1080, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.01, profiles=1)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.01, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0023
     * @tc.name      Resolution_PreviewSelect_0023
     * @tc.desc      preview selection for ratio 1.353333 over 2 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_PreviewSelect_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PreviewSelect_0023 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1440, 1003, 30, 60),
        new Profile(1280, 960, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.353333, profiles=2)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.353333, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0024
     * @tc.name      Resolution_PreviewSelect_0024
     * @tc.desc      preview selection for ratio 1.807778 over 0 profiles returns index -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0024 begin`);
      const profiles: Array<Profile> = [
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.807778, profiles=0)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.807778, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0025
     * @tc.name      Resolution_PreviewSelect_0025
     * @tc.desc      preview selection for ratio 1.817778 over 1 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0025 begin`);
      const profiles: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.817778, profiles=1)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.817778, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0026
     * @tc.name      Resolution_PreviewSelect_0026
     * @tc.desc      preview selection for ratio 1.777778 over 2 profiles returns index 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0026 begin`);
      const profiles: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1920, 1080, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.777778, profiles=2)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.777778, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0027
     * @tc.name      Resolution_PreviewSelect_0027
     * @tc.desc      preview selection for ratio 1.787778 over 2 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0027 begin`);
      const profiles: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1920, 1080, 2000, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.787778, profiles=2)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.787778, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0028
     * @tc.name      Resolution_PreviewSelect_0028
     * @tc.desc      preview selection for ratio 1.353333 over 2 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0028 begin`);
      const profiles: Array<Profile> = [
        new Profile(640, 480, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.353333, profiles=2)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.353333, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0029
     * @tc.name      Resolution_PreviewSelect_0029
     * @tc.desc      preview selection for ratio 1.03 over 1 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0029 begin`);
      const profiles: Array<Profile> = [
        new Profile(1088, 1088, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.03, profiles=1)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.03, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0030
     * @tc.name      Resolution_PreviewSelect_0030
     * @tc.desc      preview selection for ratio 1.04 over 1 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0030 begin`);
      const profiles: Array<Profile> = [
        new Profile(1080, 1080, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.04, profiles=1)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.04, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0031
     * @tc.name      Resolution_PreviewSelect_0031
     * @tc.desc      preview selection for ratio 1.333333 over 2 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0031 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1440, 1003, 30, 60),
        new Profile(1280, 960, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.333333, profiles=2)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.333333, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0032
     * @tc.name      Resolution_PreviewSelect_0032
     * @tc.desc      preview selection for ratio 1.787778 over 0 profiles returns index -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0032 begin`);
      const profiles: Array<Profile> = [
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.787778, profiles=0)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.787778, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0033
     * @tc.name      Resolution_PreviewSelect_0033
     * @tc.desc      preview selection for ratio 1.797778 over 1 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0033 begin`);
      const profiles: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.797778, profiles=1)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.797778, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0034
     * @tc.name      Resolution_PreviewSelect_0034
     * @tc.desc      preview selection for ratio 1.807778 over 2 profiles returns index 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_PreviewSelect_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PreviewSelect_0034 begin`);
      const profiles: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1920, 1080, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.807778, profiles=2)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.807778, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0035
     * @tc.name      Resolution_PreviewSelect_0035
     * @tc.desc      preview selection for ratio 1.817778 over 2 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_PreviewSelect_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PreviewSelect_0035 begin`);
      const profiles: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1920, 1080, 2000, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.817778, profiles=2)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.817778, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0036
     * @tc.name      Resolution_PreviewSelect_0036
     * @tc.desc      preview selection for ratio 1.333333 over 2 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0036 begin`);
      const profiles: Array<Profile> = [
        new Profile(640, 480, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.333333, profiles=2)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.333333, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0036 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0037
     * @tc.name      Resolution_PreviewSelect_0037
     * @tc.desc      preview selection for ratio 1.01 over 1 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0037 begin`);
      const profiles: Array<Profile> = [
        new Profile(1088, 1088, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.01, profiles=1)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.01, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0037 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0038
     * @tc.name      Resolution_PreviewSelect_0038
     * @tc.desc      preview selection for ratio 1.02 over 1 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0038 begin`);
      const profiles: Array<Profile> = [
        new Profile(1080, 1080, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.02, profiles=1)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.02, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0038 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0039
     * @tc.name      Resolution_PreviewSelect_0039
     * @tc.desc      preview selection for ratio 1.363333 over 2 profiles returns index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0039 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1440, 1003, 30, 60),
        new Profile(1280, 960, 1003, 30, 60),
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.363333, profiles=2)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.363333, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0039 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PREVIEW_SELECT_0040
     * @tc.name      Resolution_PreviewSelect_0040
     * @tc.desc      preview selection for ratio 1.817778 over 0 profiles returns index -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PreviewSelect_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PreviewSelect_0040 begin`);
      const profiles: Array<Profile> = [
      ];
      logInfo("selectPreviewProfileIndex(ratio=1.817778, profiles=0)");
      const actual: number = selectPreviewProfileIndex(profiles, 1.817778, 1003, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PreviewSelect_0040 end`);
    });
  });
}
