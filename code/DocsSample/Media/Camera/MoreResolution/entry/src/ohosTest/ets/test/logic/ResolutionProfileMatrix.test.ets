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
  selectExactProfileIndex,
  profileFormat,
  Profile,
} from '../model/ResolutionLogic';

/** ResolutionProfileMatrixTest logic checks (24 cases). */
export default function resolutionProfileMatrixTest(): void {
  describe('ResolutionProfileMatrixTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_MATRIX_0001
     * @tc.name      Resolution_ProfileMatrix_0001
     * @tc.desc      profile matrix ratio=1.777778 size=1280x720 keeps preview/exact/format decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ProfileMatrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProfileMatrix_0001 begin`);
      const profiles: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
      ];
      logInfo("profile matrix ratio=1.777778 size=1280x720 kind=0");
      const actual: string = selectPreviewProfileIndex(profiles, 1.777778, 1003, 720) + '|' + selectExactProfileIndex(profiles, 1280, 720) + '|' + profileFormat(0);
      logInfo('actual=' + String(actual) + ', expected=' + "0|0|1003");
      expect(actual).assertEqual("0|0|1003");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileMatrix_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_MATRIX_0002
     * @tc.name      Resolution_ProfileMatrix_0002
     * @tc.desc      profile matrix ratio=1.333333 size=1920x1080 keeps preview/exact/format decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileMatrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatrix_0002 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 1003, 30, 60),
        new Profile(1920, 1080, 2000, 30, 60),
      ];
      logInfo("profile matrix ratio=1.333333 size=1920x1080 kind=1");
      const actual: string = selectPreviewProfileIndex(profiles, 1.333333, 1003, 720) + '|' + selectExactProfileIndex(profiles, 1920, 1080) + '|' + profileFormat(1);
      logInfo('actual=' + String(actual) + ', expected=' + "0|0|2000");
      expect(actual).assertEqual("0|0|2000");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileMatrix_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_MATRIX_0003
     * @tc.name      Resolution_ProfileMatrix_0003
     * @tc.desc      profile matrix ratio=1 size=1920x1080 keeps preview/exact/format decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileMatrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatrix_0003 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 2000, 30, 60),
        new Profile(1088, 1088, 1003, 30, 60),
        new Profile(640, 480, 1003, 30, 60),
      ];
      logInfo("profile matrix ratio=1 size=1920x1080 kind=2");
      const actual: string = selectPreviewProfileIndex(profiles, 1, 1003, 720) + '|' + selectExactProfileIndex(profiles, 1920, 1080) + '|' + profileFormat(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1|0|1003");
      expect(actual).assertEqual("1|0|1003");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileMatrix_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_MATRIX_0004
     * @tc.name      Resolution_ProfileMatrix_0004
     * @tc.desc      profile matrix ratio=1.777778 size=1088x1088 keeps preview/exact/format decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileMatrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatrix_0004 begin`);
      const profiles: Array<Profile> = [
        new Profile(1088, 1088, 1003, 30, 60),
        new Profile(640, 480, 1003, 30, 60),
        new Profile(1920, 1440, 1003, 30, 60),
        new Profile(2560, 1440, 1003, 30, 60),
      ];
      logInfo("profile matrix ratio=1.777778 size=1088x1088 kind=0");
      const actual: string = selectPreviewProfileIndex(profiles, 1.777778, 1003, 720) + '|' + selectExactProfileIndex(profiles, 1088, 1088) + '|' + profileFormat(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3|0|1003");
      expect(actual).assertEqual("3|0|1003");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileMatrix_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_MATRIX_0005
     * @tc.name      Resolution_ProfileMatrix_0005
     * @tc.desc      profile matrix ratio=1.333333 size=640x480 keeps preview/exact/format decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileMatrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatrix_0005 begin`);
      const profiles: Array<Profile> = [
        new Profile(640, 480, 1003, 30, 60),
      ];
      logInfo("profile matrix ratio=1.333333 size=640x480 kind=1");
      const actual: string = selectPreviewProfileIndex(profiles, 1.333333, 1003, 720) + '|' + selectExactProfileIndex(profiles, 640, 480) + '|' + profileFormat(1);
      logInfo('actual=' + String(actual) + ', expected=' + "0|0|2000");
      expect(actual).assertEqual("0|0|2000");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileMatrix_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_MATRIX_0006
     * @tc.name      Resolution_ProfileMatrix_0006
     * @tc.desc      profile matrix ratio=1 size=1920x1440 keeps preview/exact/format decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileMatrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatrix_0006 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1440, 1003, 30, 60),
        new Profile(2560, 1440, 1003, 30, 60),
      ];
      logInfo("profile matrix ratio=1 size=1920x1440 kind=2");
      const actual: string = selectPreviewProfileIndex(profiles, 1, 1003, 720) + '|' + selectExactProfileIndex(profiles, 1920, 1440) + '|' + profileFormat(2);
      logInfo('actual=' + String(actual) + ', expected=' + "0|0|1003");
      expect(actual).assertEqual("0|0|1003");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileMatrix_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_MATRIX_0007
     * @tc.name      Resolution_ProfileMatrix_0007
     * @tc.desc      profile matrix ratio=1.777778 size=2560x1440 keeps preview/exact/format decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileMatrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatrix_0007 begin`);
      const profiles: Array<Profile> = [
        new Profile(2560, 1440, 1003, 30, 60),
        new Profile(3840, 2160, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
      ];
      logInfo("profile matrix ratio=1.777778 size=2560x1440 kind=0");
      const actual: string = selectPreviewProfileIndex(profiles, 1.777778, 1003, 720) + '|' + selectExactProfileIndex(profiles, 2560, 1440) + '|' + profileFormat(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1|0|1003");
      expect(actual).assertEqual("1|0|1003");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileMatrix_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_MATRIX_0008
     * @tc.name      Resolution_ProfileMatrix_0008
     * @tc.desc      profile matrix ratio=1.333333 size=3840x2160 keeps preview/exact/format decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileMatrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatrix_0008 begin`);
      const profiles: Array<Profile> = [
        new Profile(3840, 2160, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1920, 1080, 1003, 30, 60),
        new Profile(1920, 1080, 2000, 30, 60),
      ];
      logInfo("profile matrix ratio=1.333333 size=3840x2160 kind=1");
      const actual: string = selectPreviewProfileIndex(profiles, 1.333333, 1003, 720) + '|' + selectExactProfileIndex(profiles, 3840, 2160) + '|' + profileFormat(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1|0|2000");
      expect(actual).assertEqual("1|0|2000");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileMatrix_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_MATRIX_0009
     * @tc.name      Resolution_ProfileMatrix_0009
     * @tc.desc      profile matrix ratio=1 size=1280x720 keeps preview/exact/format decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileMatrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatrix_0009 begin`);
      const profiles: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
      ];
      logInfo("profile matrix ratio=1 size=1280x720 kind=2");
      const actual: string = selectPreviewProfileIndex(profiles, 1, 1003, 720) + '|' + selectExactProfileIndex(profiles, 1280, 720) + '|' + profileFormat(2);
      logInfo('actual=' + String(actual) + ', expected=' + "0|0|1003");
      expect(actual).assertEqual("0|0|1003");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileMatrix_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_MATRIX_0010
     * @tc.name      Resolution_ProfileMatrix_0010
     * @tc.desc      profile matrix ratio=1.777778 size=1920x1080 keeps preview/exact/format decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileMatrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatrix_0010 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 1003, 30, 60),
        new Profile(1920, 1080, 2000, 30, 60),
      ];
      logInfo("profile matrix ratio=1.777778 size=1920x1080 kind=0");
      const actual: string = selectPreviewProfileIndex(profiles, 1.777778, 1003, 720) + '|' + selectExactProfileIndex(profiles, 1920, 1080) + '|' + profileFormat(0);
      logInfo('actual=' + String(actual) + ', expected=' + "0|0|1003");
      expect(actual).assertEqual("0|0|1003");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileMatrix_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_MATRIX_0011
     * @tc.name      Resolution_ProfileMatrix_0011
     * @tc.desc      profile matrix ratio=1.333333 size=1920x1080 keeps preview/exact/format decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileMatrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatrix_0011 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 2000, 30, 60),
        new Profile(1088, 1088, 1003, 30, 60),
        new Profile(640, 480, 1003, 30, 60),
      ];
      logInfo("profile matrix ratio=1.333333 size=1920x1080 kind=1");
      const actual: string = selectPreviewProfileIndex(profiles, 1.333333, 1003, 720) + '|' + selectExactProfileIndex(profiles, 1920, 1080) + '|' + profileFormat(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2|0|2000");
      expect(actual).assertEqual("2|0|2000");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileMatrix_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_MATRIX_0012
     * @tc.name      Resolution_ProfileMatrix_0012
     * @tc.desc      profile matrix ratio=1 size=1088x1088 keeps preview/exact/format decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ProfileMatrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProfileMatrix_0012 begin`);
      const profiles: Array<Profile> = [
        new Profile(1088, 1088, 1003, 30, 60),
        new Profile(640, 480, 1003, 30, 60),
        new Profile(1920, 1440, 1003, 30, 60),
        new Profile(2560, 1440, 1003, 30, 60),
      ];
      logInfo("profile matrix ratio=1 size=1088x1088 kind=2");
      const actual: string = selectPreviewProfileIndex(profiles, 1, 1003, 720) + '|' + selectExactProfileIndex(profiles, 1088, 1088) + '|' + profileFormat(2);
      logInfo('actual=' + String(actual) + ', expected=' + "0|0|1003");
      expect(actual).assertEqual("0|0|1003");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileMatrix_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_MATRIX_0013
     * @tc.name      Resolution_ProfileMatrix_0013
     * @tc.desc      profile matrix ratio=1.777778 size=640x480 keeps preview/exact/format decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileMatrix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatrix_0013 begin`);
      const profiles: Array<Profile> = [
        new Profile(640, 480, 1003, 30, 60),
      ];
      logInfo("profile matrix ratio=1.777778 size=640x480 kind=0");
      const actual: string = selectPreviewProfileIndex(profiles, 1.777778, 1003, 720) + '|' + selectExactProfileIndex(profiles, 640, 480) + '|' + profileFormat(0);
      logInfo('actual=' + String(actual) + ', expected=' + "0|0|1003");
      expect(actual).assertEqual("0|0|1003");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileMatrix_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_MATRIX_0014
     * @tc.name      Resolution_ProfileMatrix_0014
     * @tc.desc      profile matrix ratio=1.333333 size=1920x1440 keeps preview/exact/format decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileMatrix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatrix_0014 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1440, 1003, 30, 60),
        new Profile(2560, 1440, 1003, 30, 60),
      ];
      logInfo("profile matrix ratio=1.333333 size=1920x1440 kind=1");
      const actual: string = selectPreviewProfileIndex(profiles, 1.333333, 1003, 720) + '|' + selectExactProfileIndex(profiles, 1920, 1440) + '|' + profileFormat(1);
      logInfo('actual=' + String(actual) + ', expected=' + "0|0|2000");
      expect(actual).assertEqual("0|0|2000");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileMatrix_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_MATRIX_0015
     * @tc.name      Resolution_ProfileMatrix_0015
     * @tc.desc      profile matrix ratio=1 size=2560x1440 keeps preview/exact/format decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileMatrix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatrix_0015 begin`);
      const profiles: Array<Profile> = [
        new Profile(2560, 1440, 1003, 30, 60),
        new Profile(3840, 2160, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
      ];
      logInfo("profile matrix ratio=1 size=2560x1440 kind=2");
      const actual: string = selectPreviewProfileIndex(profiles, 1, 1003, 720) + '|' + selectExactProfileIndex(profiles, 2560, 1440) + '|' + profileFormat(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2|0|1003");
      expect(actual).assertEqual("2|0|1003");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileMatrix_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_MATRIX_0016
     * @tc.name      Resolution_ProfileMatrix_0016
     * @tc.desc      profile matrix ratio=1.777778 size=3840x2160 keeps preview/exact/format decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileMatrix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatrix_0016 begin`);
      const profiles: Array<Profile> = [
        new Profile(3840, 2160, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1920, 1080, 1003, 30, 60),
        new Profile(1920, 1080, 2000, 30, 60),
      ];
      logInfo("profile matrix ratio=1.777778 size=3840x2160 kind=0");
      const actual: string = selectPreviewProfileIndex(profiles, 1.777778, 1003, 720) + '|' + selectExactProfileIndex(profiles, 3840, 2160) + '|' + profileFormat(0);
      logInfo('actual=' + String(actual) + ', expected=' + "0|0|1003");
      expect(actual).assertEqual("0|0|1003");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileMatrix_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_MATRIX_0017
     * @tc.name      Resolution_ProfileMatrix_0017
     * @tc.desc      profile matrix ratio=1.333333 size=1280x720 keeps preview/exact/format decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileMatrix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatrix_0017 begin`);
      const profiles: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
      ];
      logInfo("profile matrix ratio=1.333333 size=1280x720 kind=1");
      const actual: string = selectPreviewProfileIndex(profiles, 1.333333, 1003, 720) + '|' + selectExactProfileIndex(profiles, 1280, 720) + '|' + profileFormat(1);
      logInfo('actual=' + String(actual) + ', expected=' + "0|0|2000");
      expect(actual).assertEqual("0|0|2000");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileMatrix_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_MATRIX_0018
     * @tc.name      Resolution_ProfileMatrix_0018
     * @tc.desc      profile matrix ratio=1 size=1920x1080 keeps preview/exact/format decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_ProfileMatrix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProfileMatrix_0018 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 1003, 30, 60),
        new Profile(1920, 1080, 2000, 30, 60),
      ];
      logInfo("profile matrix ratio=1 size=1920x1080 kind=2");
      const actual: string = selectPreviewProfileIndex(profiles, 1, 1003, 720) + '|' + selectExactProfileIndex(profiles, 1920, 1080) + '|' + profileFormat(2);
      logInfo('actual=' + String(actual) + ', expected=' + "0|0|1003");
      expect(actual).assertEqual("0|0|1003");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileMatrix_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_MATRIX_0019
     * @tc.name      Resolution_ProfileMatrix_0019
     * @tc.desc      profile matrix ratio=1.777778 size=1920x1080 keeps preview/exact/format decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileMatrix_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatrix_0019 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 2000, 30, 60),
        new Profile(1088, 1088, 1003, 30, 60),
        new Profile(640, 480, 1003, 30, 60),
      ];
      logInfo("profile matrix ratio=1.777778 size=1920x1080 kind=0");
      const actual: string = selectPreviewProfileIndex(profiles, 1.777778, 1003, 720) + '|' + selectExactProfileIndex(profiles, 1920, 1080) + '|' + profileFormat(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2|0|1003");
      expect(actual).assertEqual("2|0|1003");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileMatrix_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_MATRIX_0020
     * @tc.name      Resolution_ProfileMatrix_0020
     * @tc.desc      profile matrix ratio=1.333333 size=1088x1088 keeps preview/exact/format decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileMatrix_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatrix_0020 begin`);
      const profiles: Array<Profile> = [
        new Profile(1088, 1088, 1003, 30, 60),
        new Profile(640, 480, 1003, 30, 60),
        new Profile(1920, 1440, 1003, 30, 60),
        new Profile(2560, 1440, 1003, 30, 60),
      ];
      logInfo("profile matrix ratio=1.333333 size=1088x1088 kind=1");
      const actual: string = selectPreviewProfileIndex(profiles, 1.333333, 1003, 720) + '|' + selectExactProfileIndex(profiles, 1088, 1088) + '|' + profileFormat(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2|0|2000");
      expect(actual).assertEqual("2|0|2000");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileMatrix_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_MATRIX_0021
     * @tc.name      Resolution_ProfileMatrix_0021
     * @tc.desc      profile matrix ratio=1 size=640x480 keeps preview/exact/format decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileMatrix_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatrix_0021 begin`);
      const profiles: Array<Profile> = [
        new Profile(640, 480, 1003, 30, 60),
      ];
      logInfo("profile matrix ratio=1 size=640x480 kind=2");
      const actual: string = selectPreviewProfileIndex(profiles, 1, 1003, 720) + '|' + selectExactProfileIndex(profiles, 640, 480) + '|' + profileFormat(2);
      logInfo('actual=' + String(actual) + ', expected=' + "0|0|1003");
      expect(actual).assertEqual("0|0|1003");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileMatrix_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_MATRIX_0022
     * @tc.name      Resolution_ProfileMatrix_0022
     * @tc.desc      profile matrix ratio=1.777778 size=1920x1440 keeps preview/exact/format decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileMatrix_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatrix_0022 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1440, 1003, 30, 60),
        new Profile(2560, 1440, 1003, 30, 60),
      ];
      logInfo("profile matrix ratio=1.777778 size=1920x1440 kind=0");
      const actual: string = selectPreviewProfileIndex(profiles, 1.777778, 1003, 720) + '|' + selectExactProfileIndex(profiles, 1920, 1440) + '|' + profileFormat(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1|0|1003");
      expect(actual).assertEqual("1|0|1003");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileMatrix_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_MATRIX_0023
     * @tc.name      Resolution_ProfileMatrix_0023
     * @tc.desc      profile matrix ratio=1.333333 size=2560x1440 keeps preview/exact/format decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ProfileMatrix_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProfileMatrix_0023 begin`);
      const profiles: Array<Profile> = [
        new Profile(2560, 1440, 1003, 30, 60),
        new Profile(3840, 2160, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
      ];
      logInfo("profile matrix ratio=1.333333 size=2560x1440 kind=1");
      const actual: string = selectPreviewProfileIndex(profiles, 1.333333, 1003, 720) + '|' + selectExactProfileIndex(profiles, 2560, 1440) + '|' + profileFormat(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2|0|2000");
      expect(actual).assertEqual("2|0|2000");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileMatrix_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_MATRIX_0024
     * @tc.name      Resolution_ProfileMatrix_0024
     * @tc.desc      profile matrix ratio=1 size=3840x2160 keeps preview/exact/format decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileMatrix_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatrix_0024 begin`);
      const profiles: Array<Profile> = [
        new Profile(3840, 2160, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1920, 1080, 1003, 30, 60),
        new Profile(1920, 1080, 2000, 30, 60),
      ];
      logInfo("profile matrix ratio=1 size=3840x2160 kind=2");
      const actual: string = selectPreviewProfileIndex(profiles, 1, 1003, 720) + '|' + selectExactProfileIndex(profiles, 3840, 2160) + '|' + profileFormat(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1|0|1003");
      expect(actual).assertEqual("1|0|1003");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileMatrix_0024 end`);
    });
  });
}
