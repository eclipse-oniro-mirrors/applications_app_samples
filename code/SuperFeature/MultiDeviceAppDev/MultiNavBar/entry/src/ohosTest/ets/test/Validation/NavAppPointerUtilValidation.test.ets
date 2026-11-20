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

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import { NavBarModel } from '../Shared/NavBarModel';
import { NAV_SUB_COUNTS } from '../Shared/NavBarModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[NavAppTests]';

export default function navAppPointerUtilValidationSuite() {
  describe('NavAppPointerUtilValidationSuite', () => {
    let m: NavBarModel = new NavBarModel();

    beforeEach(() => {
      m = new NavBarModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1025
     * @tc.name    NavAppPointerUtilValidation1025
     * @tc.desc    NavBar index validity for 1 probe 1025
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1025) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1026
     * @tc.name    NavAppPointerUtilValidation1026
     * @tc.desc    NavBar index validity for 2 probe 1026
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1026) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1027
     * @tc.name    NavAppPointerUtilValidation1027
     * @tc.desc    NavBar index validity for 3 probe 1027
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1027) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1028
     * @tc.name    NavAppPointerUtilValidation1028
     * @tc.desc    NavBar index validity for 4 probe 1028
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1028) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1029
     * @tc.name    NavAppPointerUtilValidation1029
     * @tc.desc    NavBar index validity for 5 probe 1029
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1029) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1030
     * @tc.name    NavAppPointerUtilValidation1030
     * @tc.desc    NavBar index validity for 6 probe 1030
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1030) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1031
     * @tc.name    NavAppPointerUtilValidation1031
     * @tc.desc    NavBar index validity for 7 probe 1031
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1031) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1032
     * @tc.name    NavAppPointerUtilValidation1032
     * @tc.desc    NavBar index validity for 0 probe 1032
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1032) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1033
     * @tc.name    NavAppPointerUtilValidation1033
     * @tc.desc    NavBar index validity for 1 probe 1033
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1033) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1034
     * @tc.name    NavAppPointerUtilValidation1034
     * @tc.desc    NavBar index validity for 2 probe 1034
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1034) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1035
     * @tc.name    NavAppPointerUtilValidation1035
     * @tc.desc    NavBar index validity for 3 probe 1035
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1035) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1036
     * @tc.name    NavAppPointerUtilValidation1036
     * @tc.desc    NavBar index validity for 4 probe 1036
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1036) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1037
     * @tc.name    NavAppPointerUtilValidation1037
     * @tc.desc    NavBar index validity for 5 probe 1037
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1037) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1038
     * @tc.name    NavAppPointerUtilValidation1038
     * @tc.desc    NavBar index validity for 6 probe 1038
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1038) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1039
     * @tc.name    NavAppPointerUtilValidation1039
     * @tc.desc    NavBar index validity for 7 probe 1039
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1039) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1040
     * @tc.name    NavAppPointerUtilValidation1040
     * @tc.desc    NavBar index validity for 0 probe 1040
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1040) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1041
     * @tc.name    NavAppPointerUtilValidation1041
     * @tc.desc    NavBar index validity for 1 probe 1041
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1041) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1042
     * @tc.name    NavAppPointerUtilValidation1042
     * @tc.desc    NavBar index validity for 2 probe 1042
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1042) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1043
     * @tc.name    NavAppPointerUtilValidation1043
     * @tc.desc    NavBar index validity for 3 probe 1043
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1043) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1044
     * @tc.name    NavAppPointerUtilValidation1044
     * @tc.desc    NavBar index validity for 4 probe 1044
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1044) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1045
     * @tc.name    NavAppPointerUtilValidation1045
     * @tc.desc    NavBar index validity for 5 probe 1045
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1045) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1046
     * @tc.name    NavAppPointerUtilValidation1046
     * @tc.desc    NavBar index validity for 6 probe 1046
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1046) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1047
     * @tc.name    NavAppPointerUtilValidation1047
     * @tc.desc    NavBar index validity for 7 probe 1047
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1047) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1048
     * @tc.name    NavAppPointerUtilValidation1048
     * @tc.desc    NavBar index validity for 0 probe 1048
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1048) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1049
     * @tc.name    NavAppPointerUtilValidation1049
     * @tc.desc    NavBar index validity for 1 probe 1049
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1049) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1050
     * @tc.name    NavAppPointerUtilValidation1050
     * @tc.desc    NavBar index validity for 2 probe 1050
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1050) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1051
     * @tc.name    NavAppPointerUtilValidation1051
     * @tc.desc    NavBar index validity for 3 probe 1051
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1051) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1052
     * @tc.name    NavAppPointerUtilValidation1052
     * @tc.desc    NavBar index validity for 4 probe 1052
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1052) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1053
     * @tc.name    NavAppPointerUtilValidation1053
     * @tc.desc    NavBar index validity for 5 probe 1053
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1053) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1054
     * @tc.name    NavAppPointerUtilValidation1054
     * @tc.desc    NavBar index validity for 6 probe 1054
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1054) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1055
     * @tc.name    NavAppPointerUtilValidation1055
     * @tc.desc    NavBar index validity for 7 probe 1055
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1055) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1056
     * @tc.name    NavAppPointerUtilValidation1056
     * @tc.desc    NavBar index validity for 0 probe 1056
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1056) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1057
     * @tc.name    NavAppPointerUtilValidation1057
     * @tc.desc    NavBar index validity for 1 probe 1057
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1057) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1058
     * @tc.name    NavAppPointerUtilValidation1058
     * @tc.desc    NavBar index validity for 2 probe 1058
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1058) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1059
     * @tc.name    NavAppPointerUtilValidation1059
     * @tc.desc    NavBar index validity for 3 probe 1059
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1059) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1060
     * @tc.name    NavAppPointerUtilValidation1060
     * @tc.desc    NavBar index validity for 4 probe 1060
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1060) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1061
     * @tc.name    NavAppPointerUtilValidation1061
     * @tc.desc    NavBar index validity for 5 probe 1061
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1061) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1062
     * @tc.name    NavAppPointerUtilValidation1062
     * @tc.desc    NavBar index validity for 6 probe 1062
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1062) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1063
     * @tc.name    NavAppPointerUtilValidation1063
     * @tc.desc    NavBar index validity for 7 probe 1063
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1063) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1064
     * @tc.name    NavAppPointerUtilValidation1064
     * @tc.desc    NavBar index validity for 0 probe 1064
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1064) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1065
     * @tc.name    NavAppPointerUtilValidation1065
     * @tc.desc    NavBar index validity for 1 probe 1065
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1065) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1066
     * @tc.name    NavAppPointerUtilValidation1066
     * @tc.desc    NavBar index validity for 2 probe 1066
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1066) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1067
     * @tc.name    NavAppPointerUtilValidation1067
     * @tc.desc    NavBar index validity for 3 probe 1067
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1067) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1068
     * @tc.name    NavAppPointerUtilValidation1068
     * @tc.desc    NavBar index validity for 4 probe 1068
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1068) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1069
     * @tc.name    NavAppPointerUtilValidation1069
     * @tc.desc    NavBar index validity for 5 probe 1069
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1069) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1070
     * @tc.name    NavAppPointerUtilValidation1070
     * @tc.desc    NavBar index validity for 6 probe 1070
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1070) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1071
     * @tc.name    NavAppPointerUtilValidation1071
     * @tc.desc    NavBar index validity for 7 probe 1071
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1071) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1072
     * @tc.name    NavAppPointerUtilValidation1072
     * @tc.desc    NavBar index validity for 0 probe 1072
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1072) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1073
     * @tc.name    NavAppPointerUtilValidation1073
     * @tc.desc    NavBar index validity for 1 probe 1073
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1073) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1074
     * @tc.name    NavAppPointerUtilValidation1074
     * @tc.desc    NavBar index validity for 2 probe 1074
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1074) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1075
     * @tc.name    NavAppPointerUtilValidation1075
     * @tc.desc    NavBar index validity for 3 probe 1075
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1075) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1076
     * @tc.name    NavAppPointerUtilValidation1076
     * @tc.desc    NavBar index validity for 4 probe 1076
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1076) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1077
     * @tc.name    NavAppPointerUtilValidation1077
     * @tc.desc    NavBar index validity for 5 probe 1077
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1077) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1078
     * @tc.name    NavAppPointerUtilValidation1078
     * @tc.desc    NavBar index validity for 6 probe 1078
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1078) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1079
     * @tc.name    NavAppPointerUtilValidation1079
     * @tc.desc    NavBar index validity for 7 probe 1079
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1079) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1080
     * @tc.name    NavAppPointerUtilValidation1080
     * @tc.desc    NavBar index validity for 0 probe 1080
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1080) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1081
     * @tc.name    NavAppPointerUtilValidation1081
     * @tc.desc    NavBar index validity for 1 probe 1081
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1081) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1082
     * @tc.name    NavAppPointerUtilValidation1082
     * @tc.desc    NavBar index validity for 2 probe 1082
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1082', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1082) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1083
     * @tc.name    NavAppPointerUtilValidation1083
     * @tc.desc    NavBar index validity for 3 probe 1083
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1083', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1083) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1084
     * @tc.name    NavAppPointerUtilValidation1084
     * @tc.desc    NavBar index validity for 4 probe 1084
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1084', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1084) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1085
     * @tc.name    NavAppPointerUtilValidation1085
     * @tc.desc    NavBar index validity for 5 probe 1085
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1085', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1085) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1086
     * @tc.name    NavAppPointerUtilValidation1086
     * @tc.desc    NavBar index validity for 6 probe 1086
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1086', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1086) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1087
     * @tc.name    NavAppPointerUtilValidation1087
     * @tc.desc    NavBar index validity for 7 probe 1087
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1087', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1087) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1088
     * @tc.name    NavAppPointerUtilValidation1088
     * @tc.desc    NavBar index validity for 0 probe 1088
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1088', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1088) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1089
     * @tc.name    NavAppPointerUtilValidation1089
     * @tc.desc    NavBar index validity for 1 probe 1089
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1089', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1089) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1090
     * @tc.name    NavAppPointerUtilValidation1090
     * @tc.desc    NavBar index validity for 2 probe 1090
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1090', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1090) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1091
     * @tc.name    NavAppPointerUtilValidation1091
     * @tc.desc    NavBar index validity for 3 probe 1091
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1091', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1091) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1092
     * @tc.name    NavAppPointerUtilValidation1092
     * @tc.desc    NavBar index validity for 4 probe 1092
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1092', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1092) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1093
     * @tc.name    NavAppPointerUtilValidation1093
     * @tc.desc    NavBar index validity for 5 probe 1093
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1093', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1093) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1094
     * @tc.name    NavAppPointerUtilValidation1094
     * @tc.desc    NavBar index validity for 6 probe 1094
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1094', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1094) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1095
     * @tc.name    NavAppPointerUtilValidation1095
     * @tc.desc    NavBar index validity for 7 probe 1095
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1095', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1095) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1096
     * @tc.name    NavAppPointerUtilValidation1096
     * @tc.desc    NavBar index validity for 0 probe 1096
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1096', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1096) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1097
     * @tc.name    NavAppPointerUtilValidation1097
     * @tc.desc    NavBar index validity for 1 probe 1097
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1097', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1097) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1098
     * @tc.name    NavAppPointerUtilValidation1098
     * @tc.desc    NavBar index validity for 2 probe 1098
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1098', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1098) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1099
     * @tc.name    NavAppPointerUtilValidation1099
     * @tc.desc    NavBar index validity for 3 probe 1099
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1099', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1099) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1100
     * @tc.name    NavAppPointerUtilValidation1100
     * @tc.desc    NavBar index validity for 4 probe 1100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1100', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1100) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1101
     * @tc.name    NavAppPointerUtilValidation1101
     * @tc.desc    NavBar index validity for 5 probe 1101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1101', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1101) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1102
     * @tc.name    NavAppPointerUtilValidation1102
     * @tc.desc    NavBar index validity for 6 probe 1102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1102', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1102) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1103
     * @tc.name    NavAppPointerUtilValidation1103
     * @tc.desc    NavBar index validity for 7 probe 1103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1103', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1103) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1104
     * @tc.name    NavAppPointerUtilValidation1104
     * @tc.desc    NavBar index validity for 0 probe 1104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1104', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1104) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1105
     * @tc.name    NavAppPointerUtilValidation1105
     * @tc.desc    NavBar index validity for 1 probe 1105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1105', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1105) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1106
     * @tc.name    NavAppPointerUtilValidation1106
     * @tc.desc    NavBar index validity for 2 probe 1106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1106', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1106) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1107
     * @tc.name    NavAppPointerUtilValidation1107
     * @tc.desc    NavBar index validity for 3 probe 1107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1107', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1107) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1108
     * @tc.name    NavAppPointerUtilValidation1108
     * @tc.desc    NavBar index validity for 4 probe 1108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1108', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1108) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1109
     * @tc.name    NavAppPointerUtilValidation1109
     * @tc.desc    NavBar index validity for 5 probe 1109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1109', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1109) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1110
     * @tc.name    NavAppPointerUtilValidation1110
     * @tc.desc    NavBar index validity for 6 probe 1110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1110', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1110) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1111
     * @tc.name    NavAppPointerUtilValidation1111
     * @tc.desc    NavBar index validity for 7 probe 1111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1111', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1111) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1112
     * @tc.name    NavAppPointerUtilValidation1112
     * @tc.desc    NavBar index validity for 0 probe 1112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1112', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1112) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1113
     * @tc.name    NavAppPointerUtilValidation1113
     * @tc.desc    NavBar index validity for 1 probe 1113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1113', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1113) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1114
     * @tc.name    NavAppPointerUtilValidation1114
     * @tc.desc    NavBar index validity for 2 probe 1114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1114', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1114) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1115
     * @tc.name    NavAppPointerUtilValidation1115
     * @tc.desc    NavBar index validity for 3 probe 1115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1115', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1115) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1116
     * @tc.name    NavAppPointerUtilValidation1116
     * @tc.desc    NavBar index validity for 4 probe 1116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1116', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1116) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1117
     * @tc.name    NavAppPointerUtilValidation1117
     * @tc.desc    NavBar index validity for 5 probe 1117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1117', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1117) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1118
     * @tc.name    NavAppPointerUtilValidation1118
     * @tc.desc    NavBar index validity for 6 probe 1118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1118', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1118) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1119
     * @tc.name    NavAppPointerUtilValidation1119
     * @tc.desc    NavBar index validity for 7 probe 1119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1119', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1119) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1120
     * @tc.name    NavAppPointerUtilValidation1120
     * @tc.desc    NavBar index validity for 0 probe 1120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1120', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1120) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1121
     * @tc.name    NavAppPointerUtilValidation1121
     * @tc.desc    NavBar index validity for 1 probe 1121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1121', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1121) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1122
     * @tc.name    NavAppPointerUtilValidation1122
     * @tc.desc    NavBar index validity for 2 probe 1122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1122', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1122) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1123
     * @tc.name    NavAppPointerUtilValidation1123
     * @tc.desc    NavBar index validity for 3 probe 1123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1123', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1123) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1124
     * @tc.name    NavAppPointerUtilValidation1124
     * @tc.desc    NavBar index validity for 4 probe 1124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1124', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1124) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1125
     * @tc.name    NavAppPointerUtilValidation1125
     * @tc.desc    NavBar index validity for 5 probe 1125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1125', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1125) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1126
     * @tc.name    NavAppPointerUtilValidation1126
     * @tc.desc    NavBar index validity for 6 probe 1126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1126', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1126) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1127
     * @tc.name    NavAppPointerUtilValidation1127
     * @tc.desc    NavBar index validity for 7 probe 1127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1127', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1127) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1128
     * @tc.name    NavAppPointerUtilValidation1128
     * @tc.desc    NavBar index validity for 0 probe 1128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1128', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1128) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1129
     * @tc.name    NavAppPointerUtilValidation1129
     * @tc.desc    NavBar index validity for 1 probe 1129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1129', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1129) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1130
     * @tc.name    NavAppPointerUtilValidation1130
     * @tc.desc    NavBar index validity for 2 probe 1130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1130', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1130) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1131
     * @tc.name    NavAppPointerUtilValidation1131
     * @tc.desc    NavBar index validity for 3 probe 1131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1131', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1131) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1132
     * @tc.name    NavAppPointerUtilValidation1132
     * @tc.desc    NavBar index validity for 4 probe 1132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1132', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1132) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1133
     * @tc.name    NavAppPointerUtilValidation1133
     * @tc.desc    NavBar index validity for 5 probe 1133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1133', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1133) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1134
     * @tc.name    NavAppPointerUtilValidation1134
     * @tc.desc    NavBar index validity for 6 probe 1134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1134', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1134) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1135
     * @tc.name    NavAppPointerUtilValidation1135
     * @tc.desc    NavBar index validity for 7 probe 1135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1135', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1135) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1136
     * @tc.name    NavAppPointerUtilValidation1136
     * @tc.desc    NavBar index validity for 0 probe 1136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1136', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1136) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1137
     * @tc.name    NavAppPointerUtilValidation1137
     * @tc.desc    NavBar index validity for 1 probe 1137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1137', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1137) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1138
     * @tc.name    NavAppPointerUtilValidation1138
     * @tc.desc    NavBar index validity for 2 probe 1138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1138', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1138) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1139
     * @tc.name    NavAppPointerUtilValidation1139
     * @tc.desc    NavBar index validity for 3 probe 1139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1139', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1139) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1140
     * @tc.name    NavAppPointerUtilValidation1140
     * @tc.desc    NavBar index validity for 4 probe 1140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1140', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1140) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1141
     * @tc.name    NavAppPointerUtilValidation1141
     * @tc.desc    NavBar index validity for 5 probe 1141
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1141', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1141) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1142
     * @tc.name    NavAppPointerUtilValidation1142
     * @tc.desc    NavBar index validity for 6 probe 1142
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1142', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1142) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1143
     * @tc.name    NavAppPointerUtilValidation1143
     * @tc.desc    NavBar index validity for 7 probe 1143
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1143', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1143) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1144
     * @tc.name    NavAppPointerUtilValidation1144
     * @tc.desc    NavBar index validity for 0 probe 1144
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1144', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1144) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1145
     * @tc.name    NavAppPointerUtilValidation1145
     * @tc.desc    NavBar index validity for 1 probe 1145
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1145', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1145) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1146
     * @tc.name    NavAppPointerUtilValidation1146
     * @tc.desc    NavBar index validity for 2 probe 1146
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1146', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1146) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1147
     * @tc.name    NavAppPointerUtilValidation1147
     * @tc.desc    NavBar index validity for 3 probe 1147
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1147', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1147) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1148
     * @tc.name    NavAppPointerUtilValidation1148
     * @tc.desc    NavBar index validity for 4 probe 1148
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1148', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1148) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1149
     * @tc.name    NavAppPointerUtilValidation1149
     * @tc.desc    NavBar index validity for 5 probe 1149
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1149', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1149) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1150
     * @tc.name    NavAppPointerUtilValidation1150
     * @tc.desc    NavBar index validity for 6 probe 1150
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1150', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1150) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1151
     * @tc.name    NavAppPointerUtilValidation1151
     * @tc.desc    NavBar index validity for 7 probe 1151
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1151', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1151) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1152
     * @tc.name    NavAppPointerUtilValidation1152
     * @tc.desc    NavBar index validity for 0 probe 1152
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1152', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1152) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1153
     * @tc.name    NavAppPointerUtilValidation1153
     * @tc.desc    NavBar index validity for 1 probe 1153
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1153', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1153) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1154
     * @tc.name    NavAppPointerUtilValidation1154
     * @tc.desc    NavBar index validity for 2 probe 1154
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1154', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1154) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1155
     * @tc.name    NavAppPointerUtilValidation1155
     * @tc.desc    NavBar index validity for 3 probe 1155
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1155', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1155) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1156
     * @tc.name    NavAppPointerUtilValidation1156
     * @tc.desc    NavBar index validity for 4 probe 1156
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1156', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1156) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1157
     * @tc.name    NavAppPointerUtilValidation1157
     * @tc.desc    NavBar index validity for 5 probe 1157
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1157', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1157) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1158
     * @tc.name    NavAppPointerUtilValidation1158
     * @tc.desc    NavBar index validity for 6 probe 1158
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1158', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1158) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1159
     * @tc.name    NavAppPointerUtilValidation1159
     * @tc.desc    NavBar index validity for 7 probe 1159
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1159', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1159) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1160
     * @tc.name    NavAppPointerUtilValidation1160
     * @tc.desc    NavBar index validity for 0 probe 1160
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1160', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1160) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1161
     * @tc.name    NavAppPointerUtilValidation1161
     * @tc.desc    NavBar index validity for 1 probe 1161
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1161', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1161) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1162
     * @tc.name    NavAppPointerUtilValidation1162
     * @tc.desc    NavBar index validity for 2 probe 1162
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1162', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1162) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1163
     * @tc.name    NavAppPointerUtilValidation1163
     * @tc.desc    NavBar index validity for 3 probe 1163
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1163', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1163) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1164
     * @tc.name    NavAppPointerUtilValidation1164
     * @tc.desc    NavBar index validity for 4 probe 1164
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1164', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1164) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1165
     * @tc.name    NavAppPointerUtilValidation1165
     * @tc.desc    NavBar index validity for 5 probe 1165
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1165', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1165) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1166
     * @tc.name    NavAppPointerUtilValidation1166
     * @tc.desc    NavBar index validity for 6 probe 1166
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1166', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1166) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1167
     * @tc.name    NavAppPointerUtilValidation1167
     * @tc.desc    NavBar index validity for 7 probe 1167
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1167', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1167) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1168
     * @tc.name    NavAppPointerUtilValidation1168
     * @tc.desc    NavBar index validity for 0 probe 1168
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1168', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1168) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1169
     * @tc.name    NavAppPointerUtilValidation1169
     * @tc.desc    NavBar index validity for 1 probe 1169
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1169', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1169) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1170
     * @tc.name    NavAppPointerUtilValidation1170
     * @tc.desc    NavBar index validity for 2 probe 1170
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1170', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1170) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1171
     * @tc.name    NavAppPointerUtilValidation1171
     * @tc.desc    NavBar index validity for 3 probe 1171
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1171', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1171) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1172
     * @tc.name    NavAppPointerUtilValidation1172
     * @tc.desc    NavBar index validity for 4 probe 1172
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1172', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1172) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1173
     * @tc.name    NavAppPointerUtilValidation1173
     * @tc.desc    NavBar index validity for 5 probe 1173
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1173', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1173) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1174
     * @tc.name    NavAppPointerUtilValidation1174
     * @tc.desc    NavBar index validity for 6 probe 1174
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1174', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1174) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1175
     * @tc.name    NavAppPointerUtilValidation1175
     * @tc.desc    NavBar index validity for 7 probe 1175
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1175', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1175) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1176
     * @tc.name    NavAppPointerUtilValidation1176
     * @tc.desc    NavBar index validity for 0 probe 1176
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1176', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1176) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1177
     * @tc.name    NavAppPointerUtilValidation1177
     * @tc.desc    NavBar index validity for 1 probe 1177
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1177', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1177) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1178
     * @tc.name    NavAppPointerUtilValidation1178
     * @tc.desc    NavBar index validity for 2 probe 1178
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1178', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1178) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1179
     * @tc.name    NavAppPointerUtilValidation1179
     * @tc.desc    NavBar index validity for 3 probe 1179
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1179', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1179) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1180
     * @tc.name    NavAppPointerUtilValidation1180
     * @tc.desc    NavBar index validity for 4 probe 1180
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1180', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1180) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1181
     * @tc.name    NavAppPointerUtilValidation1181
     * @tc.desc    NavBar index validity for 5 probe 1181
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1181', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1181) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1182
     * @tc.name    NavAppPointerUtilValidation1182
     * @tc.desc    NavBar index validity for 6 probe 1182
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1182', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1182) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1183
     * @tc.name    NavAppPointerUtilValidation1183
     * @tc.desc    NavBar index validity for 7 probe 1183
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1183', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1183) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1184
     * @tc.name    NavAppPointerUtilValidation1184
     * @tc.desc    NavBar index validity for 0 probe 1184
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1184', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1184) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1185
     * @tc.name    NavAppPointerUtilValidation1185
     * @tc.desc    NavBar index validity for 1 probe 1185
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1185', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1185) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1186
     * @tc.name    NavAppPointerUtilValidation1186
     * @tc.desc    NavBar index validity for 2 probe 1186
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1186', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1186) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1187
     * @tc.name    NavAppPointerUtilValidation1187
     * @tc.desc    NavBar index validity for 3 probe 1187
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1187', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1187) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1188
     * @tc.name    NavAppPointerUtilValidation1188
     * @tc.desc    NavBar index validity for 4 probe 1188
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1188', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1188) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1189
     * @tc.name    NavAppPointerUtilValidation1189
     * @tc.desc    NavBar index validity for 5 probe 1189
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1189', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1189) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1190
     * @tc.name    NavAppPointerUtilValidation1190
     * @tc.desc    NavBar index validity for 6 probe 1190
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1190', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1190) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1191
     * @tc.name    NavAppPointerUtilValidation1191
     * @tc.desc    NavBar index validity for 7 probe 1191
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1191', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1191) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1192
     * @tc.name    NavAppPointerUtilValidation1192
     * @tc.desc    NavBar index validity for 0 probe 1192
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1192', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1192) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1193
     * @tc.name    NavAppPointerUtilValidation1193
     * @tc.desc    NavBar index validity for 1 probe 1193
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1193', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1193) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1194
     * @tc.name    NavAppPointerUtilValidation1194
     * @tc.desc    NavBar index validity for 2 probe 1194
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1194', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1194) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1195
     * @tc.name    NavAppPointerUtilValidation1195
     * @tc.desc    NavBar index validity for 3 probe 1195
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1195', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1195) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1196
     * @tc.name    NavAppPointerUtilValidation1196
     * @tc.desc    NavBar index validity for 4 probe 1196
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1196', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1196) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1197
     * @tc.name    NavAppPointerUtilValidation1197
     * @tc.desc    NavBar index validity for 5 probe 1197
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1197', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1197) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1198
     * @tc.name    NavAppPointerUtilValidation1198
     * @tc.desc    NavBar index validity for 6 probe 1198
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1198', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1198) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1199
     * @tc.name    NavAppPointerUtilValidation1199
     * @tc.desc    NavBar index validity for 7 probe 1199
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1199', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1199) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1200
     * @tc.name    NavAppPointerUtilValidation1200
     * @tc.desc    NavBar index validity for 0 probe 1200
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1200', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1200) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1201
     * @tc.name    NavAppPointerUtilValidation1201
     * @tc.desc    NavBar index validity for 1 probe 1201
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1201', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1201) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1202
     * @tc.name    NavAppPointerUtilValidation1202
     * @tc.desc    NavBar index validity for 2 probe 1202
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1202', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1202) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1203
     * @tc.name    NavAppPointerUtilValidation1203
     * @tc.desc    NavBar index validity for 3 probe 1203
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1203', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1203) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1204
     * @tc.name    NavAppPointerUtilValidation1204
     * @tc.desc    NavBar index validity for 4 probe 1204
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1204', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1204) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1205
     * @tc.name    NavAppPointerUtilValidation1205
     * @tc.desc    NavBar index validity for 5 probe 1205
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1205', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1205) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1206
     * @tc.name    NavAppPointerUtilValidation1206
     * @tc.desc    NavBar index validity for 6 probe 1206
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1206', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1206) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1207
     * @tc.name    NavAppPointerUtilValidation1207
     * @tc.desc    NavBar index validity for 7 probe 1207
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1207', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1207) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1208
     * @tc.name    NavAppPointerUtilValidation1208
     * @tc.desc    NavBar index validity for 0 probe 1208
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1208', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1208) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1209
     * @tc.name    NavAppPointerUtilValidation1209
     * @tc.desc    NavBar index validity for 1 probe 1209
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1209', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1209) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1210
     * @tc.name    NavAppPointerUtilValidation1210
     * @tc.desc    NavBar index validity for 2 probe 1210
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1210', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1210) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1211
     * @tc.name    NavAppPointerUtilValidation1211
     * @tc.desc    NavBar index validity for 3 probe 1211
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1211', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1211) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1212
     * @tc.name    NavAppPointerUtilValidation1212
     * @tc.desc    NavBar index validity for 4 probe 1212
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1212', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1212) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1213
     * @tc.name    NavAppPointerUtilValidation1213
     * @tc.desc    NavBar index validity for 5 probe 1213
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1213', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1213) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1214
     * @tc.name    NavAppPointerUtilValidation1214
     * @tc.desc    NavBar index validity for 6 probe 1214
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1214', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1214) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1215
     * @tc.name    NavAppPointerUtilValidation1215
     * @tc.desc    NavBar index validity for 7 probe 1215
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1215', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1215) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1216
     * @tc.name    NavAppPointerUtilValidation1216
     * @tc.desc    NavBar index validity for 0 probe 1216
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1216', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1216) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1217
     * @tc.name    NavAppPointerUtilValidation1217
     * @tc.desc    NavBar index validity for 1 probe 1217
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1217', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1217) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1218
     * @tc.name    NavAppPointerUtilValidation1218
     * @tc.desc    NavBar index validity for 2 probe 1218
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1218', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1218) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1219
     * @tc.name    NavAppPointerUtilValidation1219
     * @tc.desc    NavBar index validity for 3 probe 1219
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1219', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1219) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1220
     * @tc.name    NavAppPointerUtilValidation1220
     * @tc.desc    NavBar index validity for 4 probe 1220
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1220', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1220) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1221
     * @tc.name    NavAppPointerUtilValidation1221
     * @tc.desc    NavBar index validity for 5 probe 1221
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1221', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1221) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1222
     * @tc.name    NavAppPointerUtilValidation1222
     * @tc.desc    NavBar index validity for 6 probe 1222
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1222', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1222) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1223
     * @tc.name    NavAppPointerUtilValidation1223
     * @tc.desc    NavBar index validity for 7 probe 1223
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1223', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1223) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1224
     * @tc.name    NavAppPointerUtilValidation1224
     * @tc.desc    NavBar index validity for 0 probe 1224
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1224', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1224) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1225
     * @tc.name    NavAppPointerUtilValidation1225
     * @tc.desc    NavBar index validity for 1 probe 1225
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1225', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1225) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1226
     * @tc.name    NavAppPointerUtilValidation1226
     * @tc.desc    NavBar index validity for 2 probe 1226
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1226', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1226) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1227
     * @tc.name    NavAppPointerUtilValidation1227
     * @tc.desc    NavBar index validity for 3 probe 1227
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1227', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1227) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1228
     * @tc.name    NavAppPointerUtilValidation1228
     * @tc.desc    NavBar index validity for 4 probe 1228
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1228', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1228) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1229
     * @tc.name    NavAppPointerUtilValidation1229
     * @tc.desc    NavBar index validity for 5 probe 1229
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1229', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1229) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1230
     * @tc.name    NavAppPointerUtilValidation1230
     * @tc.desc    NavBar index validity for 6 probe 1230
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1230', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1230) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1231
     * @tc.name    NavAppPointerUtilValidation1231
     * @tc.desc    NavBar index validity for 7 probe 1231
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1231', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1231) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1232
     * @tc.name    NavAppPointerUtilValidation1232
     * @tc.desc    NavBar index validity for 0 probe 1232
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1232', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1232) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1233
     * @tc.name    NavAppPointerUtilValidation1233
     * @tc.desc    NavBar index validity for 1 probe 1233
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1233', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1233) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1234
     * @tc.name    NavAppPointerUtilValidation1234
     * @tc.desc    NavBar index validity for 2 probe 1234
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1234', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1234) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1235
     * @tc.name    NavAppPointerUtilValidation1235
     * @tc.desc    NavBar index validity for 3 probe 1235
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1235', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1235) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1236
     * @tc.name    NavAppPointerUtilValidation1236
     * @tc.desc    NavBar index validity for 4 probe 1236
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1236', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1236) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1237
     * @tc.name    NavAppPointerUtilValidation1237
     * @tc.desc    NavBar index validity for 5 probe 1237
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1237', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1237) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1238
     * @tc.name    NavAppPointerUtilValidation1238
     * @tc.desc    NavBar index validity for 6 probe 1238
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1238', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1238) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1239
     * @tc.name    NavAppPointerUtilValidation1239
     * @tc.desc    NavBar index validity for 7 probe 1239
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1239', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1239) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1240
     * @tc.name    NavAppPointerUtilValidation1240
     * @tc.desc    NavBar index validity for 0 probe 1240
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1240', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1240) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1241
     * @tc.name    NavAppPointerUtilValidation1241
     * @tc.desc    NavBar index validity for 1 probe 1241
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1241', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1241) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1242
     * @tc.name    NavAppPointerUtilValidation1242
     * @tc.desc    NavBar index validity for 2 probe 1242
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1242', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1242) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1243
     * @tc.name    NavAppPointerUtilValidation1243
     * @tc.desc    NavBar index validity for 3 probe 1243
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1243', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1243) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1244
     * @tc.name    NavAppPointerUtilValidation1244
     * @tc.desc    NavBar index validity for 4 probe 1244
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1244', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1244) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1245
     * @tc.name    NavAppPointerUtilValidation1245
     * @tc.desc    NavBar index validity for 5 probe 1245
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1245', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1245) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1246
     * @tc.name    NavAppPointerUtilValidation1246
     * @tc.desc    NavBar index validity for 6 probe 1246
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1246', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1246) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1247
     * @tc.name    NavAppPointerUtilValidation1247
     * @tc.desc    NavBar index validity for 7 probe 1247
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1247', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1247) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1248
     * @tc.name    NavAppPointerUtilValidation1248
     * @tc.desc    NavBar index validity for 0 probe 1248
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1248', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1248) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1249
     * @tc.name    NavAppPointerUtilValidation1249
     * @tc.desc    NavBar index validity for 1 probe 1249
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1249', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1249) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1250
     * @tc.name    NavAppPointerUtilValidation1250
     * @tc.desc    NavBar index validity for 2 probe 1250
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1250', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1250) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1251
     * @tc.name    NavAppPointerUtilValidation1251
     * @tc.desc    NavBar index validity for 3 probe 1251
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1251', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1251) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1252
     * @tc.name    NavAppPointerUtilValidation1252
     * @tc.desc    NavBar index validity for 4 probe 1252
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1252', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1252) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1253
     * @tc.name    NavAppPointerUtilValidation1253
     * @tc.desc    NavBar index validity for 5 probe 1253
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1253', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1253) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1254
     * @tc.name    NavAppPointerUtilValidation1254
     * @tc.desc    NavBar index validity for 6 probe 1254
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1254', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1254) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1255
     * @tc.name    NavAppPointerUtilValidation1255
     * @tc.desc    NavBar index validity for 7 probe 1255
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1255', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1255) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1256
     * @tc.name    NavAppPointerUtilValidation1256
     * @tc.desc    NavBar index validity for 0 probe 1256
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppPointerUtilValidation1256', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1256) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
