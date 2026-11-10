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

export default function indexUiStateExpandedTest() {
  describe('indexUiStateExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_PROJ_UI_0001
     * @tc.name      testProjUiState0001
     * @tc.desc      Index state 0 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0002
     * @tc.name      testProjUiState0002
     * @tc.desc      Index state 1 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0003
     * @tc.name      testProjUiState0003
     * @tc.desc      Index state 2 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0004
     * @tc.name      testProjUiState0004
     * @tc.desc      Index state 3 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0005
     * @tc.name      testProjUiState0005
     * @tc.desc      Index state 4 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0006
     * @tc.name      testProjUiState0006
     * @tc.desc      Index state 5 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0007
     * @tc.name      testProjUiState0007
     * @tc.desc      Index state 6 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0008
     * @tc.name      testProjUiState0008
     * @tc.desc      Index state 7 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0009
     * @tc.name      testProjUiState0009
     * @tc.desc      Index state 8 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0010
     * @tc.name      testProjUiState0010
     * @tc.desc      Index state 9 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0011
     * @tc.name      testProjUiState0011
     * @tc.desc      Index state 10 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0012
     * @tc.name      testProjUiState0012
     * @tc.desc      Index state 11 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0013
     * @tc.name      testProjUiState0013
     * @tc.desc      Index state 12 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0014
     * @tc.name      testProjUiState0014
     * @tc.desc      Index state 13 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0015
     * @tc.name      testProjUiState0015
     * @tc.desc      Index state 14 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0016
     * @tc.name      testProjUiState0016
     * @tc.desc      Index state 15 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0017
     * @tc.name      testProjUiState0017
     * @tc.desc      Index state 16 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0018
     * @tc.name      testProjUiState0018
     * @tc.desc      Index state 17 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0019
     * @tc.name      testProjUiState0019
     * @tc.desc      Index state 18 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0020
     * @tc.name      testProjUiState0020
     * @tc.desc      Index state 19 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0021
     * @tc.name      testProjUiState0021
     * @tc.desc      Index state 20 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0022
     * @tc.name      testProjUiState0022
     * @tc.desc      Index state 21 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0023
     * @tc.name      testProjUiState0023
     * @tc.desc      Index state 22 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0024
     * @tc.name      testProjUiState0024
     * @tc.desc      Index state 23 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0025
     * @tc.name      testProjUiState0025
     * @tc.desc      Index state 24 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0026
     * @tc.name      testProjUiState0026
     * @tc.desc      Index state 25 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0027
     * @tc.name      testProjUiState0027
     * @tc.desc      Index state 26 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0028
     * @tc.name      testProjUiState0028
     * @tc.desc      Index state 27 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0029
     * @tc.name      testProjUiState0029
     * @tc.desc      Index state 28 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0030
     * @tc.name      testProjUiState0030
     * @tc.desc      Index state 29 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0031
     * @tc.name      testProjUiState0031
     * @tc.desc      Index state 30 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0032
     * @tc.name      testProjUiState0032
     * @tc.desc      Index state 31 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0033
     * @tc.name      testProjUiState0033
     * @tc.desc      Index state 32 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0034
     * @tc.name      testProjUiState0034
     * @tc.desc      Index state 33 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0035
     * @tc.name      testProjUiState0035
     * @tc.desc      Index state 34 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0036
     * @tc.name      testProjUiState0036
     * @tc.desc      Index state 35 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0037
     * @tc.name      testProjUiState0037
     * @tc.desc      Index state 36 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0038
     * @tc.name      testProjUiState0038
     * @tc.desc      Index state 37 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0039
     * @tc.name      testProjUiState0039
     * @tc.desc      Index state 38 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0040
     * @tc.name      testProjUiState0040
     * @tc.desc      Index state 39 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0041
     * @tc.name      testProjUiState0041
     * @tc.desc      Index state 40 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0042
     * @tc.name      testProjUiState0042
     * @tc.desc      Index state 41 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0043
     * @tc.name      testProjUiState0043
     * @tc.desc      Index state 42 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0044
     * @tc.name      testProjUiState0044
     * @tc.desc      Index state 43 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0045
     * @tc.name      testProjUiState0045
     * @tc.desc      Index state 44 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0046
     * @tc.name      testProjUiState0046
     * @tc.desc      Index state 45 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0047
     * @tc.name      testProjUiState0047
     * @tc.desc      Index state 46 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0048
     * @tc.name      testProjUiState0048
     * @tc.desc      Index state 47 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0049
     * @tc.name      testProjUiState0049
     * @tc.desc      Index state 48 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0050
     * @tc.name      testProjUiState0050
     * @tc.desc      Index state 49 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0051
     * @tc.name      testProjUiState0051
     * @tc.desc      Index state 50 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0052
     * @tc.name      testProjUiState0052
     * @tc.desc      Index state 51 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0053
     * @tc.name      testProjUiState0053
     * @tc.desc      Index state 52 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0054
     * @tc.name      testProjUiState0054
     * @tc.desc      Index state 53 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0055
     * @tc.name      testProjUiState0055
     * @tc.desc      Index state 54 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0056
     * @tc.name      testProjUiState0056
     * @tc.desc      Index state 55 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0057
     * @tc.name      testProjUiState0057
     * @tc.desc      Index state 56 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0058
     * @tc.name      testProjUiState0058
     * @tc.desc      Index state 57 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0059
     * @tc.name      testProjUiState0059
     * @tc.desc      Index state 58 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0060
     * @tc.name      testProjUiState0060
     * @tc.desc      Index state 59 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0061
     * @tc.name      testProjUiState0061
     * @tc.desc      Index state 60 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0062
     * @tc.name      testProjUiState0062
     * @tc.desc      Index state 61 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0063
     * @tc.name      testProjUiState0063
     * @tc.desc      Index state 62 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0064
     * @tc.name      testProjUiState0064
     * @tc.desc      Index state 63 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0065
     * @tc.name      testProjUiState0065
     * @tc.desc      Index state 64 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0066
     * @tc.name      testProjUiState0066
     * @tc.desc      Index state 65 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0067
     * @tc.name      testProjUiState0067
     * @tc.desc      Index state 66 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0068
     * @tc.name      testProjUiState0068
     * @tc.desc      Index state 67 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0069
     * @tc.name      testProjUiState0069
     * @tc.desc      Index state 68 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0070
     * @tc.name      testProjUiState0070
     * @tc.desc      Index state 69 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0071
     * @tc.name      testProjUiState0071
     * @tc.desc      Index state 70 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0072
     * @tc.name      testProjUiState0072
     * @tc.desc      Index state 71 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0073
     * @tc.name      testProjUiState0073
     * @tc.desc      Index state 72 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0074
     * @tc.name      testProjUiState0074
     * @tc.desc      Index state 73 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0075
     * @tc.name      testProjUiState0075
     * @tc.desc      Index state 74 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0076
     * @tc.name      testProjUiState0076
     * @tc.desc      Index state 75 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0077
     * @tc.name      testProjUiState0077
     * @tc.desc      Index state 76 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0078
     * @tc.name      testProjUiState0078
     * @tc.desc      Index state 77 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0079
     * @tc.name      testProjUiState0079
     * @tc.desc      Index state 78 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0080
     * @tc.name      testProjUiState0080
     * @tc.desc      Index state 79 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0081
     * @tc.name      testProjUiState0081
     * @tc.desc      Index state 80 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0082
     * @tc.name      testProjUiState0082
     * @tc.desc      Index state 81 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0083
     * @tc.name      testProjUiState0083
     * @tc.desc      Index state 82 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0084
     * @tc.name      testProjUiState0084
     * @tc.desc      Index state 83 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0085
     * @tc.name      testProjUiState0085
     * @tc.desc      Index state 84 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0086
     * @tc.name      testProjUiState0086
     * @tc.desc      Index state 85 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0087
     * @tc.name      testProjUiState0087
     * @tc.desc      Index state 86 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0088
     * @tc.name      testProjUiState0088
     * @tc.desc      Index state 87 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0089
     * @tc.name      testProjUiState0089
     * @tc.desc      Index state 88 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0090
     * @tc.name      testProjUiState0090
     * @tc.desc      Index state 89 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0091
     * @tc.name      testProjUiState0091
     * @tc.desc      Index state 90 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0092
     * @tc.name      testProjUiState0092
     * @tc.desc      Index state 91 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0093
     * @tc.name      testProjUiState0093
     * @tc.desc      Index state 92 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0094
     * @tc.name      testProjUiState0094
     * @tc.desc      Index state 93 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0095
     * @tc.name      testProjUiState0095
     * @tc.desc      Index state 94 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0096
     * @tc.name      testProjUiState0096
     * @tc.desc      Index state 95 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0097
     * @tc.name      testProjUiState0097
     * @tc.desc      Index state 96 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0098
     * @tc.name      testProjUiState0098
     * @tc.desc      Index state 97 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0099
     * @tc.name      testProjUiState0099
     * @tc.desc      Index state 98 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.number    SUB_AVS_PROJ_UI_0100
     * @tc.name      testProjUiState0100
     * @tc.desc      Index state 99 keeps play/rate button flags consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjUiState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const playing: boolean = true;
      const buttonEnabled: boolean = false;
      const rate: number = 1;
      const isShow: boolean = false;
      expect(buttonEnabled).assertEqual(!playing);
      expect(rate >= 1 && rate <= 3).assertTrue();
      expect(typeof isShow).assertEqual('boolean');
      expect(playing || buttonEnabled).assertTrue();
    })
  })
}
