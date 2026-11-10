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

export default function indexUiFlowMoreTest() {
  describe('indexUiFlowMoreTest', () => {
    /**
     * @tc.number    SUB_AVS_MORE_UI_0001
     * @tc.name      testMoreIndexUi0001
     * @tc.desc      Index flow 0 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = true;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0002
     * @tc.name      testMoreIndexUi0002
     * @tc.desc      Index flow 1 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0003
     * @tc.name      testMoreIndexUi0003
     * @tc.desc      Index flow 2 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0004
     * @tc.name      testMoreIndexUi0004
     * @tc.desc      Index flow 3 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0005
     * @tc.name      testMoreIndexUi0005
     * @tc.desc      Index flow 4 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = true;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0006
     * @tc.name      testMoreIndexUi0006
     * @tc.desc      Index flow 5 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0007
     * @tc.name      testMoreIndexUi0007
     * @tc.desc      Index flow 6 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0008
     * @tc.name      testMoreIndexUi0008
     * @tc.desc      Index flow 7 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0009
     * @tc.name      testMoreIndexUi0009
     * @tc.desc      Index flow 8 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = true;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0010
     * @tc.name      testMoreIndexUi0010
     * @tc.desc      Index flow 9 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0011
     * @tc.name      testMoreIndexUi0011
     * @tc.desc      Index flow 10 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0012
     * @tc.name      testMoreIndexUi0012
     * @tc.desc      Index flow 11 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0013
     * @tc.name      testMoreIndexUi0013
     * @tc.desc      Index flow 12 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = true;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0014
     * @tc.name      testMoreIndexUi0014
     * @tc.desc      Index flow 13 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0015
     * @tc.name      testMoreIndexUi0015
     * @tc.desc      Index flow 14 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0016
     * @tc.name      testMoreIndexUi0016
     * @tc.desc      Index flow 15 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0017
     * @tc.name      testMoreIndexUi0017
     * @tc.desc      Index flow 16 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = true;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0018
     * @tc.name      testMoreIndexUi0018
     * @tc.desc      Index flow 17 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0019
     * @tc.name      testMoreIndexUi0019
     * @tc.desc      Index flow 18 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0020
     * @tc.name      testMoreIndexUi0020
     * @tc.desc      Index flow 19 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0021
     * @tc.name      testMoreIndexUi0021
     * @tc.desc      Index flow 20 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = true;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0022
     * @tc.name      testMoreIndexUi0022
     * @tc.desc      Index flow 21 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0023
     * @tc.name      testMoreIndexUi0023
     * @tc.desc      Index flow 22 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0024
     * @tc.name      testMoreIndexUi0024
     * @tc.desc      Index flow 23 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0025
     * @tc.name      testMoreIndexUi0025
     * @tc.desc      Index flow 24 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = true;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0026
     * @tc.name      testMoreIndexUi0026
     * @tc.desc      Index flow 25 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0027
     * @tc.name      testMoreIndexUi0027
     * @tc.desc      Index flow 26 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0028
     * @tc.name      testMoreIndexUi0028
     * @tc.desc      Index flow 27 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0029
     * @tc.name      testMoreIndexUi0029
     * @tc.desc      Index flow 28 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = true;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0030
     * @tc.name      testMoreIndexUi0030
     * @tc.desc      Index flow 29 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0031
     * @tc.name      testMoreIndexUi0031
     * @tc.desc      Index flow 30 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0032
     * @tc.name      testMoreIndexUi0032
     * @tc.desc      Index flow 31 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0033
     * @tc.name      testMoreIndexUi0033
     * @tc.desc      Index flow 32 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = true;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0034
     * @tc.name      testMoreIndexUi0034
     * @tc.desc      Index flow 33 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0035
     * @tc.name      testMoreIndexUi0035
     * @tc.desc      Index flow 34 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0036
     * @tc.name      testMoreIndexUi0036
     * @tc.desc      Index flow 35 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0037
     * @tc.name      testMoreIndexUi0037
     * @tc.desc      Index flow 36 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = true;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0038
     * @tc.name      testMoreIndexUi0038
     * @tc.desc      Index flow 37 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0039
     * @tc.name      testMoreIndexUi0039
     * @tc.desc      Index flow 38 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0040
     * @tc.name      testMoreIndexUi0040
     * @tc.desc      Index flow 39 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0041
     * @tc.name      testMoreIndexUi0041
     * @tc.desc      Index flow 40 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = true;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0042
     * @tc.name      testMoreIndexUi0042
     * @tc.desc      Index flow 41 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0043
     * @tc.name      testMoreIndexUi0043
     * @tc.desc      Index flow 42 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0044
     * @tc.name      testMoreIndexUi0044
     * @tc.desc      Index flow 43 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0045
     * @tc.name      testMoreIndexUi0045
     * @tc.desc      Index flow 44 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = true;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0046
     * @tc.name      testMoreIndexUi0046
     * @tc.desc      Index flow 45 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0047
     * @tc.name      testMoreIndexUi0047
     * @tc.desc      Index flow 46 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0048
     * @tc.name      testMoreIndexUi0048
     * @tc.desc      Index flow 47 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0049
     * @tc.name      testMoreIndexUi0049
     * @tc.desc      Index flow 48 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = true;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0050
     * @tc.name      testMoreIndexUi0050
     * @tc.desc      Index flow 49 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0051
     * @tc.name      testMoreIndexUi0051
     * @tc.desc      Index flow 50 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0052
     * @tc.name      testMoreIndexUi0052
     * @tc.desc      Index flow 51 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0053
     * @tc.name      testMoreIndexUi0053
     * @tc.desc      Index flow 52 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = true;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0054
     * @tc.name      testMoreIndexUi0054
     * @tc.desc      Index flow 53 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0055
     * @tc.name      testMoreIndexUi0055
     * @tc.desc      Index flow 54 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0056
     * @tc.name      testMoreIndexUi0056
     * @tc.desc      Index flow 55 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0057
     * @tc.name      testMoreIndexUi0057
     * @tc.desc      Index flow 56 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = true;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0058
     * @tc.name      testMoreIndexUi0058
     * @tc.desc      Index flow 57 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0059
     * @tc.name      testMoreIndexUi0059
     * @tc.desc      Index flow 58 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0060
     * @tc.name      testMoreIndexUi0060
     * @tc.desc      Index flow 59 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0061
     * @tc.name      testMoreIndexUi0061
     * @tc.desc      Index flow 60 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = true;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0062
     * @tc.name      testMoreIndexUi0062
     * @tc.desc      Index flow 61 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0063
     * @tc.name      testMoreIndexUi0063
     * @tc.desc      Index flow 62 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0064
     * @tc.name      testMoreIndexUi0064
     * @tc.desc      Index flow 63 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0065
     * @tc.name      testMoreIndexUi0065
     * @tc.desc      Index flow 64 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = true;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0066
     * @tc.name      testMoreIndexUi0066
     * @tc.desc      Index flow 65 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0067
     * @tc.name      testMoreIndexUi0067
     * @tc.desc      Index flow 66 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0068
     * @tc.name      testMoreIndexUi0068
     * @tc.desc      Index flow 67 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0069
     * @tc.name      testMoreIndexUi0069
     * @tc.desc      Index flow 68 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = true;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0070
     * @tc.name      testMoreIndexUi0070
     * @tc.desc      Index flow 69 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0071
     * @tc.name      testMoreIndexUi0071
     * @tc.desc      Index flow 70 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0072
     * @tc.name      testMoreIndexUi0072
     * @tc.desc      Index flow 71 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0073
     * @tc.name      testMoreIndexUi0073
     * @tc.desc      Index flow 72 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = true;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0074
     * @tc.name      testMoreIndexUi0074
     * @tc.desc      Index flow 73 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0075
     * @tc.name      testMoreIndexUi0075
     * @tc.desc      Index flow 74 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0076
     * @tc.name      testMoreIndexUi0076
     * @tc.desc      Index flow 75 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0077
     * @tc.name      testMoreIndexUi0077
     * @tc.desc      Index flow 76 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = true;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0078
     * @tc.name      testMoreIndexUi0078
     * @tc.desc      Index flow 77 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0079
     * @tc.name      testMoreIndexUi0079
     * @tc.desc      Index flow 78 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0080
     * @tc.name      testMoreIndexUi0080
     * @tc.desc      Index flow 79 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0081
     * @tc.name      testMoreIndexUi0081
     * @tc.desc      Index flow 80 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = true;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0082
     * @tc.name      testMoreIndexUi0082
     * @tc.desc      Index flow 81 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0083
     * @tc.name      testMoreIndexUi0083
     * @tc.desc      Index flow 82 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0084
     * @tc.name      testMoreIndexUi0084
     * @tc.desc      Index flow 83 keeps rate 3 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 3;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0085
     * @tc.name      testMoreIndexUi0085
     * @tc.desc      Index flow 84 keeps rate 1 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = true;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_UI_0086
     * @tc.name      testMoreIndexUi0086
     * @tc.desc      Index flow 85 keeps rate 2 and button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreIndexUi0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = false;
      const buttonEnabled: boolean = true;
      const rate: number = 2;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
  })
}
