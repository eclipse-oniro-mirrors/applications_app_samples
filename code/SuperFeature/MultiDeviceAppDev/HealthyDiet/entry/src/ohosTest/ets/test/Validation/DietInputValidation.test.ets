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
import { DietModel } from '../Shared/DietModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[DietTests]';

export default function dietInputValidationSuite() {
  describe('DietInputValidationSuite', () => {
    let m: DietModel = new DietModel();

    beforeEach(() => {
      m = new DietModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0967
     * @tc.name    DietInputValidation967
     * @tc.desc    Diet weight validity for 3 probe 967
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation967', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 967) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0968
     * @tc.name    DietInputValidation968
     * @tc.desc    Diet category count for 3 probe 968
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation968', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 968) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0969
     * @tc.name    DietInputValidation969
     * @tc.desc    Diet weight validity for 5 probe 969
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation969', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 969) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0970
     * @tc.name    DietInputValidation970
     * @tc.desc    Diet category count for 0 probe 970
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation970', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 970) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0971
     * @tc.name    DietInputValidation971
     * @tc.desc    Diet weight validity for 7 probe 971
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation971', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 971) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0972
     * @tc.name    DietInputValidation972
     * @tc.desc    Diet category count for 2 probe 972
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation972', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 972) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0973
     * @tc.name    DietInputValidation973
     * @tc.desc    Diet weight validity for -3 probe 973
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation973', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 973) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0974
     * @tc.name    DietInputValidation974
     * @tc.desc    Diet category count for 4 probe 974
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation974', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 974) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0975
     * @tc.name    DietInputValidation975
     * @tc.desc    Diet weight validity for -1 probe 975
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation975', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 975) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0976
     * @tc.name    DietInputValidation976
     * @tc.desc    Diet category count for 1 probe 976
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation976', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 976) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0977
     * @tc.name    DietInputValidation977
     * @tc.desc    Diet weight validity for 1 probe 977
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation977', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 977) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0978
     * @tc.name    DietInputValidation978
     * @tc.desc    Diet category count for 3 probe 978
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation978', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 978) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0979
     * @tc.name    DietInputValidation979
     * @tc.desc    Diet weight validity for 3 probe 979
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation979', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 979) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0980
     * @tc.name    DietInputValidation980
     * @tc.desc    Diet category count for 0 probe 980
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation980', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 980) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0981
     * @tc.name    DietInputValidation981
     * @tc.desc    Diet weight validity for 5 probe 981
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation981', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 981) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0982
     * @tc.name    DietInputValidation982
     * @tc.desc    Diet category count for 2 probe 982
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation982', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 982) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0983
     * @tc.name    DietInputValidation983
     * @tc.desc    Diet weight validity for 7 probe 983
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation983', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 983) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0984
     * @tc.name    DietInputValidation984
     * @tc.desc    Diet category count for 4 probe 984
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation984', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 984) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0985
     * @tc.name    DietInputValidation985
     * @tc.desc    Diet weight validity for -3 probe 985
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation985', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 985) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0986
     * @tc.name    DietInputValidation986
     * @tc.desc    Diet category count for 1 probe 986
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation986', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 986) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0987
     * @tc.name    DietInputValidation987
     * @tc.desc    Diet weight validity for -1 probe 987
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation987', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 987) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0988
     * @tc.name    DietInputValidation988
     * @tc.desc    Diet category count for 3 probe 988
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation988', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 988) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0989
     * @tc.name    DietInputValidation989
     * @tc.desc    Diet weight validity for 1 probe 989
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation989', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 989) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0990
     * @tc.name    DietInputValidation990
     * @tc.desc    Diet category count for 0 probe 990
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation990', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 990) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0991
     * @tc.name    DietInputValidation991
     * @tc.desc    Diet weight validity for 3 probe 991
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation991', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 991) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0992
     * @tc.name    DietInputValidation992
     * @tc.desc    Diet category count for 2 probe 992
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation992', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 992) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0993
     * @tc.name    DietInputValidation993
     * @tc.desc    Diet weight validity for 5 probe 993
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation993', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 993) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0994
     * @tc.name    DietInputValidation994
     * @tc.desc    Diet category count for 4 probe 994
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation994', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 994) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0995
     * @tc.name    DietInputValidation995
     * @tc.desc    Diet weight validity for 7 probe 995
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation995', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 995) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0996
     * @tc.name    DietInputValidation996
     * @tc.desc    Diet category count for 1 probe 996
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation996', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 996) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0997
     * @tc.name    DietInputValidation997
     * @tc.desc    Diet weight validity for -3 probe 997
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation997', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 997) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0998
     * @tc.name    DietInputValidation998
     * @tc.desc    Diet category count for 3 probe 998
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation998', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 998) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0999
     * @tc.name    DietInputValidation999
     * @tc.desc    Diet weight validity for -1 probe 999
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation999', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 999) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1000
     * @tc.name    DietInputValidation1000
     * @tc.desc    Diet category count for 0 probe 1000
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1000', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1000) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1001
     * @tc.name    DietInputValidation1001
     * @tc.desc    Diet weight validity for 1 probe 1001
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1001) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1002
     * @tc.name    DietInputValidation1002
     * @tc.desc    Diet category count for 2 probe 1002
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1002) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1003
     * @tc.name    DietInputValidation1003
     * @tc.desc    Diet weight validity for 3 probe 1003
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1003) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1004
     * @tc.name    DietInputValidation1004
     * @tc.desc    Diet category count for 4 probe 1004
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1004) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1005
     * @tc.name    DietInputValidation1005
     * @tc.desc    Diet weight validity for 5 probe 1005
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1005) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1006
     * @tc.name    DietInputValidation1006
     * @tc.desc    Diet category count for 1 probe 1006
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1006) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1007
     * @tc.name    DietInputValidation1007
     * @tc.desc    Diet weight validity for 7 probe 1007
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1007) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1008
     * @tc.name    DietInputValidation1008
     * @tc.desc    Diet category count for 3 probe 1008
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1008) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1009
     * @tc.name    DietInputValidation1009
     * @tc.desc    Diet weight validity for -3 probe 1009
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1009) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1010
     * @tc.name    DietInputValidation1010
     * @tc.desc    Diet category count for 0 probe 1010
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1010) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1011
     * @tc.name    DietInputValidation1011
     * @tc.desc    Diet weight validity for -1 probe 1011
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1011) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1012
     * @tc.name    DietInputValidation1012
     * @tc.desc    Diet category count for 2 probe 1012
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1012) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1013
     * @tc.name    DietInputValidation1013
     * @tc.desc    Diet weight validity for 1 probe 1013
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1013) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1014
     * @tc.name    DietInputValidation1014
     * @tc.desc    Diet category count for 4 probe 1014
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1014) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1015
     * @tc.name    DietInputValidation1015
     * @tc.desc    Diet weight validity for 3 probe 1015
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1015) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1016
     * @tc.name    DietInputValidation1016
     * @tc.desc    Diet category count for 1 probe 1016
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1016) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1017
     * @tc.name    DietInputValidation1017
     * @tc.desc    Diet weight validity for 5 probe 1017
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1017) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1018
     * @tc.name    DietInputValidation1018
     * @tc.desc    Diet category count for 3 probe 1018
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1018) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1019
     * @tc.name    DietInputValidation1019
     * @tc.desc    Diet weight validity for 7 probe 1019
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1019) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1020
     * @tc.name    DietInputValidation1020
     * @tc.desc    Diet category count for 0 probe 1020
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1020) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1021
     * @tc.name    DietInputValidation1021
     * @tc.desc    Diet weight validity for -3 probe 1021
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1021) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1022
     * @tc.name    DietInputValidation1022
     * @tc.desc    Diet category count for 2 probe 1022
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1022) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1023
     * @tc.name    DietInputValidation1023
     * @tc.desc    Diet weight validity for -1 probe 1023
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1023) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1024
     * @tc.name    DietInputValidation1024
     * @tc.desc    Diet category count for 4 probe 1024
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1024) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1025
     * @tc.name    DietInputValidation1025
     * @tc.desc    Diet weight validity for 1 probe 1025
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1025) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1026
     * @tc.name    DietInputValidation1026
     * @tc.desc    Diet category count for 1 probe 1026
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1026) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1027
     * @tc.name    DietInputValidation1027
     * @tc.desc    Diet weight validity for 3 probe 1027
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1027) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1028
     * @tc.name    DietInputValidation1028
     * @tc.desc    Diet category count for 3 probe 1028
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1028) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1029
     * @tc.name    DietInputValidation1029
     * @tc.desc    Diet weight validity for 5 probe 1029
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1029) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1030
     * @tc.name    DietInputValidation1030
     * @tc.desc    Diet category count for 0 probe 1030
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1030) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1031
     * @tc.name    DietInputValidation1031
     * @tc.desc    Diet weight validity for 7 probe 1031
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1031) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1032
     * @tc.name    DietInputValidation1032
     * @tc.desc    Diet category count for 2 probe 1032
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1032) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1033
     * @tc.name    DietInputValidation1033
     * @tc.desc    Diet weight validity for -3 probe 1033
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1033) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1034
     * @tc.name    DietInputValidation1034
     * @tc.desc    Diet category count for 4 probe 1034
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1034) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1035
     * @tc.name    DietInputValidation1035
     * @tc.desc    Diet weight validity for -1 probe 1035
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1035) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1036
     * @tc.name    DietInputValidation1036
     * @tc.desc    Diet category count for 1 probe 1036
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1036) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1037
     * @tc.name    DietInputValidation1037
     * @tc.desc    Diet weight validity for 1 probe 1037
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1037) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1038
     * @tc.name    DietInputValidation1038
     * @tc.desc    Diet category count for 3 probe 1038
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1038) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1039
     * @tc.name    DietInputValidation1039
     * @tc.desc    Diet weight validity for 3 probe 1039
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1039) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1040
     * @tc.name    DietInputValidation1040
     * @tc.desc    Diet category count for 0 probe 1040
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1040) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1041
     * @tc.name    DietInputValidation1041
     * @tc.desc    Diet weight validity for 5 probe 1041
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1041) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1042
     * @tc.name    DietInputValidation1042
     * @tc.desc    Diet category count for 2 probe 1042
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1042) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1043
     * @tc.name    DietInputValidation1043
     * @tc.desc    Diet weight validity for 7 probe 1043
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1043) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1044
     * @tc.name    DietInputValidation1044
     * @tc.desc    Diet category count for 4 probe 1044
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1044) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1045
     * @tc.name    DietInputValidation1045
     * @tc.desc    Diet weight validity for -3 probe 1045
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1045) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1046
     * @tc.name    DietInputValidation1046
     * @tc.desc    Diet category count for 1 probe 1046
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1046) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1047
     * @tc.name    DietInputValidation1047
     * @tc.desc    Diet weight validity for -1 probe 1047
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1047) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1048
     * @tc.name    DietInputValidation1048
     * @tc.desc    Diet category count for 3 probe 1048
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1048) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1049
     * @tc.name    DietInputValidation1049
     * @tc.desc    Diet weight validity for 1 probe 1049
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1049) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1050
     * @tc.name    DietInputValidation1050
     * @tc.desc    Diet category count for 0 probe 1050
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1050) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1051
     * @tc.name    DietInputValidation1051
     * @tc.desc    Diet weight validity for 3 probe 1051
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1051) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1052
     * @tc.name    DietInputValidation1052
     * @tc.desc    Diet category count for 2 probe 1052
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1052) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1053
     * @tc.name    DietInputValidation1053
     * @tc.desc    Diet weight validity for 5 probe 1053
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1053) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1054
     * @tc.name    DietInputValidation1054
     * @tc.desc    Diet category count for 4 probe 1054
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1054) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1055
     * @tc.name    DietInputValidation1055
     * @tc.desc    Diet weight validity for 7 probe 1055
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1055) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1056
     * @tc.name    DietInputValidation1056
     * @tc.desc    Diet category count for 1 probe 1056
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1056) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1057
     * @tc.name    DietInputValidation1057
     * @tc.desc    Diet weight validity for -3 probe 1057
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1057) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1058
     * @tc.name    DietInputValidation1058
     * @tc.desc    Diet category count for 3 probe 1058
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1058) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1059
     * @tc.name    DietInputValidation1059
     * @tc.desc    Diet weight validity for -1 probe 1059
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1059) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1060
     * @tc.name    DietInputValidation1060
     * @tc.desc    Diet category count for 0 probe 1060
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1060) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1061
     * @tc.name    DietInputValidation1061
     * @tc.desc    Diet weight validity for 1 probe 1061
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1061) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1062
     * @tc.name    DietInputValidation1062
     * @tc.desc    Diet category count for 2 probe 1062
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1062) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1063
     * @tc.name    DietInputValidation1063
     * @tc.desc    Diet weight validity for 3 probe 1063
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1063) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1064
     * @tc.name    DietInputValidation1064
     * @tc.desc    Diet category count for 4 probe 1064
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1064) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1065
     * @tc.name    DietInputValidation1065
     * @tc.desc    Diet weight validity for 5 probe 1065
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1065) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1066
     * @tc.name    DietInputValidation1066
     * @tc.desc    Diet category count for 1 probe 1066
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1066) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1067
     * @tc.name    DietInputValidation1067
     * @tc.desc    Diet weight validity for 7 probe 1067
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1067) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1068
     * @tc.name    DietInputValidation1068
     * @tc.desc    Diet category count for 3 probe 1068
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1068) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1069
     * @tc.name    DietInputValidation1069
     * @tc.desc    Diet weight validity for -3 probe 1069
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1069) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1070
     * @tc.name    DietInputValidation1070
     * @tc.desc    Diet category count for 0 probe 1070
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1070) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1071
     * @tc.name    DietInputValidation1071
     * @tc.desc    Diet weight validity for -1 probe 1071
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1071) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1072
     * @tc.name    DietInputValidation1072
     * @tc.desc    Diet category count for 2 probe 1072
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1072) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1073
     * @tc.name    DietInputValidation1073
     * @tc.desc    Diet weight validity for 1 probe 1073
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1073) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1074
     * @tc.name    DietInputValidation1074
     * @tc.desc    Diet category count for 4 probe 1074
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1074) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1075
     * @tc.name    DietInputValidation1075
     * @tc.desc    Diet weight validity for 3 probe 1075
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1075) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1076
     * @tc.name    DietInputValidation1076
     * @tc.desc    Diet category count for 1 probe 1076
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1076) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1077
     * @tc.name    DietInputValidation1077
     * @tc.desc    Diet weight validity for 5 probe 1077
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1077) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1078
     * @tc.name    DietInputValidation1078
     * @tc.desc    Diet category count for 3 probe 1078
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1078) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1079
     * @tc.name    DietInputValidation1079
     * @tc.desc    Diet weight validity for 7 probe 1079
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1079) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1080
     * @tc.name    DietInputValidation1080
     * @tc.desc    Diet category count for 0 probe 1080
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1080) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1081
     * @tc.name    DietInputValidation1081
     * @tc.desc    Diet weight validity for -3 probe 1081
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1081) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1082
     * @tc.name    DietInputValidation1082
     * @tc.desc    Diet category count for 2 probe 1082
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1082', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1082) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1083
     * @tc.name    DietInputValidation1083
     * @tc.desc    Diet weight validity for -1 probe 1083
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1083', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1083) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1084
     * @tc.name    DietInputValidation1084
     * @tc.desc    Diet category count for 4 probe 1084
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1084', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1084) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1085
     * @tc.name    DietInputValidation1085
     * @tc.desc    Diet weight validity for 1 probe 1085
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1085', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1085) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1086
     * @tc.name    DietInputValidation1086
     * @tc.desc    Diet category count for 1 probe 1086
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1086', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1086) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1087
     * @tc.name    DietInputValidation1087
     * @tc.desc    Diet weight validity for 3 probe 1087
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1087', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1087) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1088
     * @tc.name    DietInputValidation1088
     * @tc.desc    Diet category count for 3 probe 1088
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1088', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1088) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1089
     * @tc.name    DietInputValidation1089
     * @tc.desc    Diet weight validity for 5 probe 1089
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1089', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1089) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1090
     * @tc.name    DietInputValidation1090
     * @tc.desc    Diet category count for 0 probe 1090
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1090', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1090) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1091
     * @tc.name    DietInputValidation1091
     * @tc.desc    Diet weight validity for 7 probe 1091
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1091', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1091) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1092
     * @tc.name    DietInputValidation1092
     * @tc.desc    Diet category count for 2 probe 1092
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1092', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1092) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1093
     * @tc.name    DietInputValidation1093
     * @tc.desc    Diet weight validity for -3 probe 1093
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1093', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1093) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1094
     * @tc.name    DietInputValidation1094
     * @tc.desc    Diet category count for 4 probe 1094
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1094', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1094) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1095
     * @tc.name    DietInputValidation1095
     * @tc.desc    Diet weight validity for -1 probe 1095
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1095', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1095) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1096
     * @tc.name    DietInputValidation1096
     * @tc.desc    Diet category count for 1 probe 1096
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1096', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1096) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1097
     * @tc.name    DietInputValidation1097
     * @tc.desc    Diet weight validity for 1 probe 1097
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1097', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1097) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1098
     * @tc.name    DietInputValidation1098
     * @tc.desc    Diet category count for 3 probe 1098
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1098', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1098) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1099
     * @tc.name    DietInputValidation1099
     * @tc.desc    Diet weight validity for 3 probe 1099
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1099', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1099) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1100
     * @tc.name    DietInputValidation1100
     * @tc.desc    Diet category count for 0 probe 1100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1100', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1100) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1101
     * @tc.name    DietInputValidation1101
     * @tc.desc    Diet weight validity for 5 probe 1101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1101', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1101) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1102
     * @tc.name    DietInputValidation1102
     * @tc.desc    Diet category count for 2 probe 1102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1102', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1102) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1103
     * @tc.name    DietInputValidation1103
     * @tc.desc    Diet weight validity for 7 probe 1103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1103', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1103) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1104
     * @tc.name    DietInputValidation1104
     * @tc.desc    Diet category count for 4 probe 1104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1104', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1104) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1105
     * @tc.name    DietInputValidation1105
     * @tc.desc    Diet weight validity for -3 probe 1105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1105', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1105) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1106
     * @tc.name    DietInputValidation1106
     * @tc.desc    Diet category count for 1 probe 1106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1106', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1106) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1107
     * @tc.name    DietInputValidation1107
     * @tc.desc    Diet weight validity for -1 probe 1107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1107', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1107) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1108
     * @tc.name    DietInputValidation1108
     * @tc.desc    Diet category count for 3 probe 1108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1108', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1108) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1109
     * @tc.name    DietInputValidation1109
     * @tc.desc    Diet weight validity for 1 probe 1109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1109', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1109) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1110
     * @tc.name    DietInputValidation1110
     * @tc.desc    Diet category count for 0 probe 1110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1110', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1110) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1111
     * @tc.name    DietInputValidation1111
     * @tc.desc    Diet weight validity for 3 probe 1111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1111', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1111) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1112
     * @tc.name    DietInputValidation1112
     * @tc.desc    Diet category count for 2 probe 1112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1112', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1112) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1113
     * @tc.name    DietInputValidation1113
     * @tc.desc    Diet weight validity for 5 probe 1113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1113', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1113) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1114
     * @tc.name    DietInputValidation1114
     * @tc.desc    Diet category count for 4 probe 1114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1114', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1114) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1115
     * @tc.name    DietInputValidation1115
     * @tc.desc    Diet weight validity for 7 probe 1115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1115', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1115) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1116
     * @tc.name    DietInputValidation1116
     * @tc.desc    Diet category count for 1 probe 1116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1116', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1116) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1117
     * @tc.name    DietInputValidation1117
     * @tc.desc    Diet weight validity for -3 probe 1117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1117', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1117) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1118
     * @tc.name    DietInputValidation1118
     * @tc.desc    Diet category count for 3 probe 1118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1118', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1118) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1119
     * @tc.name    DietInputValidation1119
     * @tc.desc    Diet weight validity for -1 probe 1119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1119', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1119) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1120
     * @tc.name    DietInputValidation1120
     * @tc.desc    Diet category count for 0 probe 1120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1120', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1120) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1121
     * @tc.name    DietInputValidation1121
     * @tc.desc    Diet weight validity for 1 probe 1121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1121', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1121) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1122
     * @tc.name    DietInputValidation1122
     * @tc.desc    Diet category count for 2 probe 1122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietInputValidation1122', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1122) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

