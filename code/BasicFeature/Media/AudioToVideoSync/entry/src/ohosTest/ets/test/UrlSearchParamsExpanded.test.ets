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
import { TestType, Size, Level } from '@ohos/hypium';
import { describe, it, expect } from '@ohos/hypium';
import { url } from '@kit.ArkTS';

export default function urlSearchParamsExpandedTest() {
  describe('urlSearchParamsExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0001
     * @tc.name      testExpUrlS0001
     * @tc.desc      URLSearchParams stores and returns appended value 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '0');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('0');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0002
     * @tc.name      testExpUrlS0002
     * @tc.desc      URLSearchParams stores and returns appended value 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '1');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('1');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0003
     * @tc.name      testExpUrlS0003
     * @tc.desc      URLSearchParams stores and returns appended value 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '2');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('2');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0004
     * @tc.name      testExpUrlS0004
     * @tc.desc      URLSearchParams stores and returns appended value 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '3');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('3');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0005
     * @tc.name      testExpUrlS0005
     * @tc.desc      URLSearchParams stores and returns appended value 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '4');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('4');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0006
     * @tc.name      testExpUrlS0006
     * @tc.desc      URLSearchParams stores and returns appended value 5.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '5');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('5');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0007
     * @tc.name      testExpUrlS0007
     * @tc.desc      URLSearchParams stores and returns appended value 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '6');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('6');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0008
     * @tc.name      testExpUrlS0008
     * @tc.desc      URLSearchParams stores and returns appended value 7.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '7');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('7');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0009
     * @tc.name      testExpUrlS0009
     * @tc.desc      URLSearchParams stores and returns appended value 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '8');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('8');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0010
     * @tc.name      testExpUrlS0010
     * @tc.desc      URLSearchParams stores and returns appended value 9.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '9');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('9');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0011
     * @tc.name      testExpUrlS0011
     * @tc.desc      URLSearchParams stores and returns appended value 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '10');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('10');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0012
     * @tc.name      testExpUrlS0012
     * @tc.desc      URLSearchParams stores and returns appended value 11.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '11');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('11');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0013
     * @tc.name      testExpUrlS0013
     * @tc.desc      URLSearchParams stores and returns appended value 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '12');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('12');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0014
     * @tc.name      testExpUrlS0014
     * @tc.desc      URLSearchParams stores and returns appended value 13.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '13');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('13');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0015
     * @tc.name      testExpUrlS0015
     * @tc.desc      URLSearchParams stores and returns appended value 14.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '14');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('14');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0016
     * @tc.name      testExpUrlS0016
     * @tc.desc      URLSearchParams stores and returns appended value 15.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '15');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('15');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0017
     * @tc.name      testExpUrlS0017
     * @tc.desc      URLSearchParams stores and returns appended value 16.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '16');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('16');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0018
     * @tc.name      testExpUrlS0018
     * @tc.desc      URLSearchParams stores and returns appended value 17.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '17');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('17');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0019
     * @tc.name      testExpUrlS0019
     * @tc.desc      URLSearchParams stores and returns appended value 18.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '18');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('18');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0020
     * @tc.name      testExpUrlS0020
     * @tc.desc      URLSearchParams stores and returns appended value 19.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '19');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('19');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0021
     * @tc.name      testExpUrlS0021
     * @tc.desc      URLSearchParams stores and returns appended value 20.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '20');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('20');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0022
     * @tc.name      testExpUrlS0022
     * @tc.desc      URLSearchParams stores and returns appended value 21.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '21');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('21');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0023
     * @tc.name      testExpUrlS0023
     * @tc.desc      URLSearchParams stores and returns appended value 22.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '22');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('22');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0024
     * @tc.name      testExpUrlS0024
     * @tc.desc      URLSearchParams stores and returns appended value 23.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '23');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('23');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0025
     * @tc.name      testExpUrlS0025
     * @tc.desc      URLSearchParams stores and returns appended value 24.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '24');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('24');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0026
     * @tc.name      testExpUrlS0026
     * @tc.desc      URLSearchParams stores and returns appended value 25.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '25');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('25');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0027
     * @tc.name      testExpUrlS0027
     * @tc.desc      URLSearchParams stores and returns appended value 26.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '26');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('26');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0028
     * @tc.name      testExpUrlS0028
     * @tc.desc      URLSearchParams stores and returns appended value 27.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '27');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('27');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0029
     * @tc.name      testExpUrlS0029
     * @tc.desc      URLSearchParams stores and returns appended value 28.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '28');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('28');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0030
     * @tc.name      testExpUrlS0030
     * @tc.desc      URLSearchParams stores and returns appended value 29.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '29');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('29');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0031
     * @tc.name      testExpUrlS0031
     * @tc.desc      URLSearchParams stores and returns appended value 30.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '30');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('30');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0032
     * @tc.name      testExpUrlS0032
     * @tc.desc      URLSearchParams stores and returns appended value 31.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '31');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('31');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0033
     * @tc.name      testExpUrlS0033
     * @tc.desc      URLSearchParams stores and returns appended value 32.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '32');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('32');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0034
     * @tc.name      testExpUrlS0034
     * @tc.desc      URLSearchParams stores and returns appended value 33.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '33');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('33');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0035
     * @tc.name      testExpUrlS0035
     * @tc.desc      URLSearchParams stores and returns appended value 34.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '34');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('34');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0036
     * @tc.name      testExpUrlS0036
     * @tc.desc      URLSearchParams stores and returns appended value 35.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '35');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('35');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0037
     * @tc.name      testExpUrlS0037
     * @tc.desc      URLSearchParams stores and returns appended value 36.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '36');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('36');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0038
     * @tc.name      testExpUrlS0038
     * @tc.desc      URLSearchParams stores and returns appended value 37.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '37');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('37');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0039
     * @tc.name      testExpUrlS0039
     * @tc.desc      URLSearchParams stores and returns appended value 38.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '38');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('38');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0040
     * @tc.name      testExpUrlS0040
     * @tc.desc      URLSearchParams stores and returns appended value 39.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '39');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('39');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0041
     * @tc.name      testExpUrlS0041
     * @tc.desc      URLSearchParams stores and returns appended value 40.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '40');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('40');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0042
     * @tc.name      testExpUrlS0042
     * @tc.desc      URLSearchParams stores and returns appended value 41.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '41');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('41');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0043
     * @tc.name      testExpUrlS0043
     * @tc.desc      URLSearchParams stores and returns appended value 42.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '42');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('42');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0044
     * @tc.name      testExpUrlS0044
     * @tc.desc      URLSearchParams stores and returns appended value 43.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '43');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('43');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0045
     * @tc.name      testExpUrlS0045
     * @tc.desc      URLSearchParams stores and returns appended value 44.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '44');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('44');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0046
     * @tc.name      testExpUrlS0046
     * @tc.desc      URLSearchParams stores and returns appended value 45.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '45');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('45');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0047
     * @tc.name      testExpUrlS0047
     * @tc.desc      URLSearchParams stores and returns appended value 46.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '46');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('46');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0048
     * @tc.name      testExpUrlS0048
     * @tc.desc      URLSearchParams stores and returns appended value 47.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '47');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('47');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0049
     * @tc.name      testExpUrlS0049
     * @tc.desc      URLSearchParams stores and returns appended value 48.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '48');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('48');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0050
     * @tc.name      testExpUrlS0050
     * @tc.desc      URLSearchParams stores and returns appended value 49.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '49');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('49');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0051
     * @tc.name      testExpUrlS0051
     * @tc.desc      URLSearchParams stores and returns appended value 50.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '50');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('50');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0052
     * @tc.name      testExpUrlS0052
     * @tc.desc      URLSearchParams stores and returns appended value 51.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '51');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('51');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0053
     * @tc.name      testExpUrlS0053
     * @tc.desc      URLSearchParams stores and returns appended value 52.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '52');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('52');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0054
     * @tc.name      testExpUrlS0054
     * @tc.desc      URLSearchParams stores and returns appended value 53.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '53');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('53');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0055
     * @tc.name      testExpUrlS0055
     * @tc.desc      URLSearchParams stores and returns appended value 54.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '54');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('54');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0056
     * @tc.name      testExpUrlS0056
     * @tc.desc      URLSearchParams stores and returns appended value 55.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '55');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('55');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0057
     * @tc.name      testExpUrlS0057
     * @tc.desc      URLSearchParams stores and returns appended value 56.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '56');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('56');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0058
     * @tc.name      testExpUrlS0058
     * @tc.desc      URLSearchParams stores and returns appended value 57.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '57');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('57');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0059
     * @tc.name      testExpUrlS0059
     * @tc.desc      URLSearchParams stores and returns appended value 58.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '58');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('58');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0060
     * @tc.name      testExpUrlS0060
     * @tc.desc      URLSearchParams stores and returns appended value 59.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '59');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('59');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0061
     * @tc.name      testExpUrlS0061
     * @tc.desc      URLSearchParams stores and returns appended value 60.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '60');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('60');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0062
     * @tc.name      testExpUrlS0062
     * @tc.desc      URLSearchParams stores and returns appended value 61.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '61');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('61');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0063
     * @tc.name      testExpUrlS0063
     * @tc.desc      URLSearchParams stores and returns appended value 62.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '62');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('62');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0064
     * @tc.name      testExpUrlS0064
     * @tc.desc      URLSearchParams stores and returns appended value 63.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '63');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('63');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0065
     * @tc.name      testExpUrlS0065
     * @tc.desc      URLSearchParams stores and returns appended value 64.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '64');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('64');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0066
     * @tc.name      testExpUrlS0066
     * @tc.desc      URLSearchParams stores and returns appended value 65.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '65');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('65');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0067
     * @tc.name      testExpUrlS0067
     * @tc.desc      URLSearchParams stores and returns appended value 66.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '66');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('66');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0068
     * @tc.name      testExpUrlS0068
     * @tc.desc      URLSearchParams stores and returns appended value 67.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '67');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('67');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0069
     * @tc.name      testExpUrlS0069
     * @tc.desc      URLSearchParams stores and returns appended value 68.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '68');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('68');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0070
     * @tc.name      testExpUrlS0070
     * @tc.desc      URLSearchParams stores and returns appended value 69.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '69');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('69');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0071
     * @tc.name      testExpUrlS0071
     * @tc.desc      URLSearchParams stores and returns appended value 70.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '70');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('70');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0072
     * @tc.name      testExpUrlS0072
     * @tc.desc      URLSearchParams stores and returns appended value 71.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '71');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('71');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0073
     * @tc.name      testExpUrlS0073
     * @tc.desc      URLSearchParams stores and returns appended value 72.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '72');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('72');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0074
     * @tc.name      testExpUrlS0074
     * @tc.desc      URLSearchParams stores and returns appended value 73.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '73');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('73');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0075
     * @tc.name      testExpUrlS0075
     * @tc.desc      URLSearchParams stores and returns appended value 74.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '74');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('74');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0076
     * @tc.name      testExpUrlS0076
     * @tc.desc      URLSearchParams stores and returns appended value 75.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '75');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('75');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0077
     * @tc.name      testExpUrlS0077
     * @tc.desc      URLSearchParams stores and returns appended value 76.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '76');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('76');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0078
     * @tc.name      testExpUrlS0078
     * @tc.desc      URLSearchParams stores and returns appended value 77.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '77');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('77');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0079
     * @tc.name      testExpUrlS0079
     * @tc.desc      URLSearchParams stores and returns appended value 78.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '78');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('78');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0080
     * @tc.name      testExpUrlS0080
     * @tc.desc      URLSearchParams stores and returns appended value 79.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '79');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('79');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0081
     * @tc.name      testExpUrlS0081
     * @tc.desc      URLSearchParams stores and returns appended value 80.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '80');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('80');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0082
     * @tc.name      testExpUrlS0082
     * @tc.desc      URLSearchParams stores and returns appended value 81.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '81');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('81');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0083
     * @tc.name      testExpUrlS0083
     * @tc.desc      URLSearchParams stores and returns appended value 82.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '82');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('82');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0084
     * @tc.name      testExpUrlS0084
     * @tc.desc      URLSearchParams stores and returns appended value 83.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '83');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('83');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0085
     * @tc.name      testExpUrlS0085
     * @tc.desc      URLSearchParams stores and returns appended value 84.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '84');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('84');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0086
     * @tc.name      testExpUrlS0086
     * @tc.desc      URLSearchParams stores and returns appended value 85.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '85');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('85');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0087
     * @tc.name      testExpUrlS0087
     * @tc.desc      URLSearchParams stores and returns appended value 86.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '86');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('86');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0088
     * @tc.name      testExpUrlS0088
     * @tc.desc      URLSearchParams stores and returns appended value 87.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '87');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('87');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0089
     * @tc.name      testExpUrlS0089
     * @tc.desc      URLSearchParams stores and returns appended value 88.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '88');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('88');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0090
     * @tc.name      testExpUrlS0090
     * @tc.desc      URLSearchParams stores and returns appended value 89.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '89');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('89');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0091
     * @tc.name      testExpUrlS0091
     * @tc.desc      URLSearchParams stores and returns appended value 90.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '90');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('90');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0092
     * @tc.name      testExpUrlS0092
     * @tc.desc      URLSearchParams stores and returns appended value 91.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '91');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('91');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0093
     * @tc.name      testExpUrlS0093
     * @tc.desc      URLSearchParams stores and returns appended value 92.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '92');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('92');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0094
     * @tc.name      testExpUrlS0094
     * @tc.desc      URLSearchParams stores and returns appended value 93.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '93');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('93');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0095
     * @tc.name      testExpUrlS0095
     * @tc.desc      URLSearchParams stores and returns appended value 94.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '94');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('94');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0096
     * @tc.name      testExpUrlS0096
     * @tc.desc      URLSearchParams stores and returns appended value 95.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '95');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('95');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0097
     * @tc.name      testExpUrlS0097
     * @tc.desc      URLSearchParams stores and returns appended value 96.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '96');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('96');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0098
     * @tc.name      testExpUrlS0098
     * @tc.desc      URLSearchParams stores and returns appended value 97.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '97');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('97');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0099
     * @tc.name      testExpUrlS0099
     * @tc.desc      URLSearchParams stores and returns appended value 98.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '98');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('98');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
    /**
     * @tc.number    SUB_AVS_EXP_URLS_0100
     * @tc.name      testExpUrlS0100
     * @tc.desc      URLSearchParams stores and returns appended value 99.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUrlS0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const query: url.URLSearchParams = new url.URLSearchParams();
      query.append('k', '99');
      query.append('k', 'extra');
      expect(query.get('k')).assertEqual('99');
      expect(query.getAll('k').length).assertEqual(2);
      expect(query.has('k')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })
  })
}
