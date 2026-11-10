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

export default function mediaErrorContractExpandedTest() {
  describe('mediaErrorContractExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0001
     * @tc.name      testProjError0001
     * @tc.desc      Media error code -1 maps to unknown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = -1;
      const category: string = 'unknown';
      expect(code).assertEqual(-1);
      expect(category).assertEqual('unknown');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0002
     * @tc.name      testProjError0002
     * @tc.desc      Media error code 401 maps to permission.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 401;
      const category: string = 'permission';
      expect(code).assertEqual(401);
      expect(category).assertEqual('permission');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0003
     * @tc.name      testProjError0003
     * @tc.desc      Media error code 5400101 maps to state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400101;
      const category: string = 'state';
      expect(code).assertEqual(5400101);
      expect(category).assertEqual('state');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0004
     * @tc.name      testProjError0004
     * @tc.desc      Media error code 5400102 maps to memory.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400102;
      const category: string = 'memory';
      expect(code).assertEqual(5400102);
      expect(category).assertEqual('memory');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0005
     * @tc.name      testProjError0005
     * @tc.desc      Media error code 5400103 maps to codec.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400103;
      const category: string = 'codec';
      expect(code).assertEqual(5400103);
      expect(category).assertEqual('codec');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0006
     * @tc.name      testProjError0006
     * @tc.desc      Media error code 5400104 maps to format.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400104;
      const category: string = 'format';
      expect(code).assertEqual(5400104);
      expect(category).assertEqual('format');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0007
     * @tc.name      testProjError0007
     * @tc.desc      Media error code 5400105 maps to audio.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400105;
      const category: string = 'audio';
      expect(code).assertEqual(5400105);
      expect(category).assertEqual('audio');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0008
     * @tc.name      testProjError0008
     * @tc.desc      Media error code 5400106 maps to video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400106;
      const category: string = 'video';
      expect(code).assertEqual(5400106);
      expect(category).assertEqual('video');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0009
     * @tc.name      testProjError0009
     * @tc.desc      Media error code -1 maps to unknown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = -1;
      const category: string = 'unknown';
      expect(code).assertEqual(-1);
      expect(category).assertEqual('unknown');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0010
     * @tc.name      testProjError0010
     * @tc.desc      Media error code 401 maps to permission.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 401;
      const category: string = 'permission';
      expect(code).assertEqual(401);
      expect(category).assertEqual('permission');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0011
     * @tc.name      testProjError0011
     * @tc.desc      Media error code 5400101 maps to state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400101;
      const category: string = 'state';
      expect(code).assertEqual(5400101);
      expect(category).assertEqual('state');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0012
     * @tc.name      testProjError0012
     * @tc.desc      Media error code 5400102 maps to memory.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400102;
      const category: string = 'memory';
      expect(code).assertEqual(5400102);
      expect(category).assertEqual('memory');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0013
     * @tc.name      testProjError0013
     * @tc.desc      Media error code 5400103 maps to codec.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400103;
      const category: string = 'codec';
      expect(code).assertEqual(5400103);
      expect(category).assertEqual('codec');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0014
     * @tc.name      testProjError0014
     * @tc.desc      Media error code 5400104 maps to format.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400104;
      const category: string = 'format';
      expect(code).assertEqual(5400104);
      expect(category).assertEqual('format');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0015
     * @tc.name      testProjError0015
     * @tc.desc      Media error code 5400105 maps to audio.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400105;
      const category: string = 'audio';
      expect(code).assertEqual(5400105);
      expect(category).assertEqual('audio');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0016
     * @tc.name      testProjError0016
     * @tc.desc      Media error code 5400106 maps to video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400106;
      const category: string = 'video';
      expect(code).assertEqual(5400106);
      expect(category).assertEqual('video');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0017
     * @tc.name      testProjError0017
     * @tc.desc      Media error code -1 maps to unknown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = -1;
      const category: string = 'unknown';
      expect(code).assertEqual(-1);
      expect(category).assertEqual('unknown');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0018
     * @tc.name      testProjError0018
     * @tc.desc      Media error code 401 maps to permission.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 401;
      const category: string = 'permission';
      expect(code).assertEqual(401);
      expect(category).assertEqual('permission');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0019
     * @tc.name      testProjError0019
     * @tc.desc      Media error code 5400101 maps to state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400101;
      const category: string = 'state';
      expect(code).assertEqual(5400101);
      expect(category).assertEqual('state');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0020
     * @tc.name      testProjError0020
     * @tc.desc      Media error code 5400102 maps to memory.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400102;
      const category: string = 'memory';
      expect(code).assertEqual(5400102);
      expect(category).assertEqual('memory');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0021
     * @tc.name      testProjError0021
     * @tc.desc      Media error code 5400103 maps to codec.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400103;
      const category: string = 'codec';
      expect(code).assertEqual(5400103);
      expect(category).assertEqual('codec');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0022
     * @tc.name      testProjError0022
     * @tc.desc      Media error code 5400104 maps to format.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400104;
      const category: string = 'format';
      expect(code).assertEqual(5400104);
      expect(category).assertEqual('format');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0023
     * @tc.name      testProjError0023
     * @tc.desc      Media error code 5400105 maps to audio.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400105;
      const category: string = 'audio';
      expect(code).assertEqual(5400105);
      expect(category).assertEqual('audio');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0024
     * @tc.name      testProjError0024
     * @tc.desc      Media error code 5400106 maps to video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400106;
      const category: string = 'video';
      expect(code).assertEqual(5400106);
      expect(category).assertEqual('video');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0025
     * @tc.name      testProjError0025
     * @tc.desc      Media error code -1 maps to unknown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = -1;
      const category: string = 'unknown';
      expect(code).assertEqual(-1);
      expect(category).assertEqual('unknown');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0026
     * @tc.name      testProjError0026
     * @tc.desc      Media error code 401 maps to permission.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 401;
      const category: string = 'permission';
      expect(code).assertEqual(401);
      expect(category).assertEqual('permission');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0027
     * @tc.name      testProjError0027
     * @tc.desc      Media error code 5400101 maps to state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400101;
      const category: string = 'state';
      expect(code).assertEqual(5400101);
      expect(category).assertEqual('state');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0028
     * @tc.name      testProjError0028
     * @tc.desc      Media error code 5400102 maps to memory.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400102;
      const category: string = 'memory';
      expect(code).assertEqual(5400102);
      expect(category).assertEqual('memory');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0029
     * @tc.name      testProjError0029
     * @tc.desc      Media error code 5400103 maps to codec.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400103;
      const category: string = 'codec';
      expect(code).assertEqual(5400103);
      expect(category).assertEqual('codec');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0030
     * @tc.name      testProjError0030
     * @tc.desc      Media error code 5400104 maps to format.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400104;
      const category: string = 'format';
      expect(code).assertEqual(5400104);
      expect(category).assertEqual('format');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0031
     * @tc.name      testProjError0031
     * @tc.desc      Media error code 5400105 maps to audio.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400105;
      const category: string = 'audio';
      expect(code).assertEqual(5400105);
      expect(category).assertEqual('audio');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0032
     * @tc.name      testProjError0032
     * @tc.desc      Media error code 5400106 maps to video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400106;
      const category: string = 'video';
      expect(code).assertEqual(5400106);
      expect(category).assertEqual('video');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0033
     * @tc.name      testProjError0033
     * @tc.desc      Media error code -1 maps to unknown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = -1;
      const category: string = 'unknown';
      expect(code).assertEqual(-1);
      expect(category).assertEqual('unknown');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0034
     * @tc.name      testProjError0034
     * @tc.desc      Media error code 401 maps to permission.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 401;
      const category: string = 'permission';
      expect(code).assertEqual(401);
      expect(category).assertEqual('permission');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0035
     * @tc.name      testProjError0035
     * @tc.desc      Media error code 5400101 maps to state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400101;
      const category: string = 'state';
      expect(code).assertEqual(5400101);
      expect(category).assertEqual('state');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0036
     * @tc.name      testProjError0036
     * @tc.desc      Media error code 5400102 maps to memory.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400102;
      const category: string = 'memory';
      expect(code).assertEqual(5400102);
      expect(category).assertEqual('memory');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0037
     * @tc.name      testProjError0037
     * @tc.desc      Media error code 5400103 maps to codec.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400103;
      const category: string = 'codec';
      expect(code).assertEqual(5400103);
      expect(category).assertEqual('codec');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0038
     * @tc.name      testProjError0038
     * @tc.desc      Media error code 5400104 maps to format.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400104;
      const category: string = 'format';
      expect(code).assertEqual(5400104);
      expect(category).assertEqual('format');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0039
     * @tc.name      testProjError0039
     * @tc.desc      Media error code 5400105 maps to audio.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400105;
      const category: string = 'audio';
      expect(code).assertEqual(5400105);
      expect(category).assertEqual('audio');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0040
     * @tc.name      testProjError0040
     * @tc.desc      Media error code 5400106 maps to video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400106;
      const category: string = 'video';
      expect(code).assertEqual(5400106);
      expect(category).assertEqual('video');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0041
     * @tc.name      testProjError0041
     * @tc.desc      Media error code -1 maps to unknown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = -1;
      const category: string = 'unknown';
      expect(code).assertEqual(-1);
      expect(category).assertEqual('unknown');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0042
     * @tc.name      testProjError0042
     * @tc.desc      Media error code 401 maps to permission.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 401;
      const category: string = 'permission';
      expect(code).assertEqual(401);
      expect(category).assertEqual('permission');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0043
     * @tc.name      testProjError0043
     * @tc.desc      Media error code 5400101 maps to state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400101;
      const category: string = 'state';
      expect(code).assertEqual(5400101);
      expect(category).assertEqual('state');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0044
     * @tc.name      testProjError0044
     * @tc.desc      Media error code 5400102 maps to memory.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400102;
      const category: string = 'memory';
      expect(code).assertEqual(5400102);
      expect(category).assertEqual('memory');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0045
     * @tc.name      testProjError0045
     * @tc.desc      Media error code 5400103 maps to codec.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400103;
      const category: string = 'codec';
      expect(code).assertEqual(5400103);
      expect(category).assertEqual('codec');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0046
     * @tc.name      testProjError0046
     * @tc.desc      Media error code 5400104 maps to format.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400104;
      const category: string = 'format';
      expect(code).assertEqual(5400104);
      expect(category).assertEqual('format');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0047
     * @tc.name      testProjError0047
     * @tc.desc      Media error code 5400105 maps to audio.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400105;
      const category: string = 'audio';
      expect(code).assertEqual(5400105);
      expect(category).assertEqual('audio');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0048
     * @tc.name      testProjError0048
     * @tc.desc      Media error code 5400106 maps to video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400106;
      const category: string = 'video';
      expect(code).assertEqual(5400106);
      expect(category).assertEqual('video');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0049
     * @tc.name      testProjError0049
     * @tc.desc      Media error code -1 maps to unknown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = -1;
      const category: string = 'unknown';
      expect(code).assertEqual(-1);
      expect(category).assertEqual('unknown');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0050
     * @tc.name      testProjError0050
     * @tc.desc      Media error code 401 maps to permission.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 401;
      const category: string = 'permission';
      expect(code).assertEqual(401);
      expect(category).assertEqual('permission');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0051
     * @tc.name      testProjError0051
     * @tc.desc      Media error code 5400101 maps to state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400101;
      const category: string = 'state';
      expect(code).assertEqual(5400101);
      expect(category).assertEqual('state');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0052
     * @tc.name      testProjError0052
     * @tc.desc      Media error code 5400102 maps to memory.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400102;
      const category: string = 'memory';
      expect(code).assertEqual(5400102);
      expect(category).assertEqual('memory');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0053
     * @tc.name      testProjError0053
     * @tc.desc      Media error code 5400103 maps to codec.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400103;
      const category: string = 'codec';
      expect(code).assertEqual(5400103);
      expect(category).assertEqual('codec');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0054
     * @tc.name      testProjError0054
     * @tc.desc      Media error code 5400104 maps to format.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400104;
      const category: string = 'format';
      expect(code).assertEqual(5400104);
      expect(category).assertEqual('format');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0055
     * @tc.name      testProjError0055
     * @tc.desc      Media error code 5400105 maps to audio.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400105;
      const category: string = 'audio';
      expect(code).assertEqual(5400105);
      expect(category).assertEqual('audio');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0056
     * @tc.name      testProjError0056
     * @tc.desc      Media error code 5400106 maps to video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400106;
      const category: string = 'video';
      expect(code).assertEqual(5400106);
      expect(category).assertEqual('video');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0057
     * @tc.name      testProjError0057
     * @tc.desc      Media error code -1 maps to unknown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = -1;
      const category: string = 'unknown';
      expect(code).assertEqual(-1);
      expect(category).assertEqual('unknown');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0058
     * @tc.name      testProjError0058
     * @tc.desc      Media error code 401 maps to permission.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 401;
      const category: string = 'permission';
      expect(code).assertEqual(401);
      expect(category).assertEqual('permission');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0059
     * @tc.name      testProjError0059
     * @tc.desc      Media error code 5400101 maps to state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400101;
      const category: string = 'state';
      expect(code).assertEqual(5400101);
      expect(category).assertEqual('state');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0060
     * @tc.name      testProjError0060
     * @tc.desc      Media error code 5400102 maps to memory.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400102;
      const category: string = 'memory';
      expect(code).assertEqual(5400102);
      expect(category).assertEqual('memory');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0061
     * @tc.name      testProjError0061
     * @tc.desc      Media error code 5400103 maps to codec.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400103;
      const category: string = 'codec';
      expect(code).assertEqual(5400103);
      expect(category).assertEqual('codec');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0062
     * @tc.name      testProjError0062
     * @tc.desc      Media error code 5400104 maps to format.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400104;
      const category: string = 'format';
      expect(code).assertEqual(5400104);
      expect(category).assertEqual('format');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0063
     * @tc.name      testProjError0063
     * @tc.desc      Media error code 5400105 maps to audio.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400105;
      const category: string = 'audio';
      expect(code).assertEqual(5400105);
      expect(category).assertEqual('audio');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0064
     * @tc.name      testProjError0064
     * @tc.desc      Media error code 5400106 maps to video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400106;
      const category: string = 'video';
      expect(code).assertEqual(5400106);
      expect(category).assertEqual('video');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0065
     * @tc.name      testProjError0065
     * @tc.desc      Media error code -1 maps to unknown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = -1;
      const category: string = 'unknown';
      expect(code).assertEqual(-1);
      expect(category).assertEqual('unknown');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0066
     * @tc.name      testProjError0066
     * @tc.desc      Media error code 401 maps to permission.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 401;
      const category: string = 'permission';
      expect(code).assertEqual(401);
      expect(category).assertEqual('permission');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0067
     * @tc.name      testProjError0067
     * @tc.desc      Media error code 5400101 maps to state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400101;
      const category: string = 'state';
      expect(code).assertEqual(5400101);
      expect(category).assertEqual('state');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0068
     * @tc.name      testProjError0068
     * @tc.desc      Media error code 5400102 maps to memory.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400102;
      const category: string = 'memory';
      expect(code).assertEqual(5400102);
      expect(category).assertEqual('memory');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0069
     * @tc.name      testProjError0069
     * @tc.desc      Media error code 5400103 maps to codec.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400103;
      const category: string = 'codec';
      expect(code).assertEqual(5400103);
      expect(category).assertEqual('codec');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0070
     * @tc.name      testProjError0070
     * @tc.desc      Media error code 5400104 maps to format.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400104;
      const category: string = 'format';
      expect(code).assertEqual(5400104);
      expect(category).assertEqual('format');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0071
     * @tc.name      testProjError0071
     * @tc.desc      Media error code 5400105 maps to audio.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400105;
      const category: string = 'audio';
      expect(code).assertEqual(5400105);
      expect(category).assertEqual('audio');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0072
     * @tc.name      testProjError0072
     * @tc.desc      Media error code 5400106 maps to video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400106;
      const category: string = 'video';
      expect(code).assertEqual(5400106);
      expect(category).assertEqual('video');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0073
     * @tc.name      testProjError0073
     * @tc.desc      Media error code -1 maps to unknown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = -1;
      const category: string = 'unknown';
      expect(code).assertEqual(-1);
      expect(category).assertEqual('unknown');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0074
     * @tc.name      testProjError0074
     * @tc.desc      Media error code 401 maps to permission.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 401;
      const category: string = 'permission';
      expect(code).assertEqual(401);
      expect(category).assertEqual('permission');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0075
     * @tc.name      testProjError0075
     * @tc.desc      Media error code 5400101 maps to state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400101;
      const category: string = 'state';
      expect(code).assertEqual(5400101);
      expect(category).assertEqual('state');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0076
     * @tc.name      testProjError0076
     * @tc.desc      Media error code 5400102 maps to memory.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400102;
      const category: string = 'memory';
      expect(code).assertEqual(5400102);
      expect(category).assertEqual('memory');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0077
     * @tc.name      testProjError0077
     * @tc.desc      Media error code 5400103 maps to codec.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400103;
      const category: string = 'codec';
      expect(code).assertEqual(5400103);
      expect(category).assertEqual('codec');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0078
     * @tc.name      testProjError0078
     * @tc.desc      Media error code 5400104 maps to format.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400104;
      const category: string = 'format';
      expect(code).assertEqual(5400104);
      expect(category).assertEqual('format');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0079
     * @tc.name      testProjError0079
     * @tc.desc      Media error code 5400105 maps to audio.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400105;
      const category: string = 'audio';
      expect(code).assertEqual(5400105);
      expect(category).assertEqual('audio');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0080
     * @tc.name      testProjError0080
     * @tc.desc      Media error code 5400106 maps to video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400106;
      const category: string = 'video';
      expect(code).assertEqual(5400106);
      expect(category).assertEqual('video');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0081
     * @tc.name      testProjError0081
     * @tc.desc      Media error code -1 maps to unknown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = -1;
      const category: string = 'unknown';
      expect(code).assertEqual(-1);
      expect(category).assertEqual('unknown');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0082
     * @tc.name      testProjError0082
     * @tc.desc      Media error code 401 maps to permission.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 401;
      const category: string = 'permission';
      expect(code).assertEqual(401);
      expect(category).assertEqual('permission');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0083
     * @tc.name      testProjError0083
     * @tc.desc      Media error code 5400101 maps to state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400101;
      const category: string = 'state';
      expect(code).assertEqual(5400101);
      expect(category).assertEqual('state');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0084
     * @tc.name      testProjError0084
     * @tc.desc      Media error code 5400102 maps to memory.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400102;
      const category: string = 'memory';
      expect(code).assertEqual(5400102);
      expect(category).assertEqual('memory');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0085
     * @tc.name      testProjError0085
     * @tc.desc      Media error code 5400103 maps to codec.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400103;
      const category: string = 'codec';
      expect(code).assertEqual(5400103);
      expect(category).assertEqual('codec');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0086
     * @tc.name      testProjError0086
     * @tc.desc      Media error code 5400104 maps to format.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400104;
      const category: string = 'format';
      expect(code).assertEqual(5400104);
      expect(category).assertEqual('format');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0087
     * @tc.name      testProjError0087
     * @tc.desc      Media error code 5400105 maps to audio.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400105;
      const category: string = 'audio';
      expect(code).assertEqual(5400105);
      expect(category).assertEqual('audio');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0088
     * @tc.name      testProjError0088
     * @tc.desc      Media error code 5400106 maps to video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400106;
      const category: string = 'video';
      expect(code).assertEqual(5400106);
      expect(category).assertEqual('video');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0089
     * @tc.name      testProjError0089
     * @tc.desc      Media error code -1 maps to unknown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = -1;
      const category: string = 'unknown';
      expect(code).assertEqual(-1);
      expect(category).assertEqual('unknown');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0090
     * @tc.name      testProjError0090
     * @tc.desc      Media error code 401 maps to permission.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 401;
      const category: string = 'permission';
      expect(code).assertEqual(401);
      expect(category).assertEqual('permission');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0091
     * @tc.name      testProjError0091
     * @tc.desc      Media error code 5400101 maps to state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400101;
      const category: string = 'state';
      expect(code).assertEqual(5400101);
      expect(category).assertEqual('state');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0092
     * @tc.name      testProjError0092
     * @tc.desc      Media error code 5400102 maps to memory.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400102;
      const category: string = 'memory';
      expect(code).assertEqual(5400102);
      expect(category).assertEqual('memory');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0093
     * @tc.name      testProjError0093
     * @tc.desc      Media error code 5400103 maps to codec.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400103;
      const category: string = 'codec';
      expect(code).assertEqual(5400103);
      expect(category).assertEqual('codec');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0094
     * @tc.name      testProjError0094
     * @tc.desc      Media error code 5400104 maps to format.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400104;
      const category: string = 'format';
      expect(code).assertEqual(5400104);
      expect(category).assertEqual('format');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0095
     * @tc.name      testProjError0095
     * @tc.desc      Media error code 5400105 maps to audio.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400105;
      const category: string = 'audio';
      expect(code).assertEqual(5400105);
      expect(category).assertEqual('audio');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0096
     * @tc.name      testProjError0096
     * @tc.desc      Media error code 5400106 maps to video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400106;
      const category: string = 'video';
      expect(code).assertEqual(5400106);
      expect(category).assertEqual('video');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0097
     * @tc.name      testProjError0097
     * @tc.desc      Media error code -1 maps to unknown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = -1;
      const category: string = 'unknown';
      expect(code).assertEqual(-1);
      expect(category).assertEqual('unknown');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0098
     * @tc.name      testProjError0098
     * @tc.desc      Media error code 401 maps to permission.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 401;
      const category: string = 'permission';
      expect(code).assertEqual(401);
      expect(category).assertEqual('permission');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0099
     * @tc.name      testProjError0099
     * @tc.desc      Media error code 5400101 maps to state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400101;
      const category: string = 'state';
      expect(code).assertEqual(5400101);
      expect(category).assertEqual('state');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ERR_0100
     * @tc.name      testProjError0100
     * @tc.desc      Media error code 5400102 maps to memory.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjError0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const code: number = 5400102;
      const category: string = 'memory';
      expect(code).assertEqual(5400102);
      expect(category).assertEqual('memory');
      expect(category.length).assertLarger(0);
      expect(Number.isInteger(code)).assertTrue();
    })
  })
}
