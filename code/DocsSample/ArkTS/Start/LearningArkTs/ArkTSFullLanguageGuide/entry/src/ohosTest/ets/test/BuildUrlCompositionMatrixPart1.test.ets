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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { buildUrl } from '../../../main/ets/pages/ModuleSystem';

const DOMAIN: number = 0xF815;
const TAG: string = '[Sample_ARKTS_GUIDE_EXT]';

export default function BuildUrlCompositionMatrixPart1Test(): void {
  describe('BuildUrlCompositionMatrixPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_0100
     * @tc.name      testBuildUrl0001
     * @tc.desc      Verify buildUrl concatenates base 'https://api.example.com' and path '/users'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0001 begin');
      expect(buildUrl('https://api.example.com', '/users')).assertEqual('https://api.example.com/users');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0001 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_0200
     * @tc.name      testBuildUrl0002
     * @tc.desc      Verify buildUrl concatenates base 'https://host' and path '/users'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0002 begin');
      expect(buildUrl('https://host', '/users')).assertEqual('https://host/users');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0002 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_0300
     * @tc.name      testBuildUrl0003
     * @tc.desc      Verify buildUrl concatenates base '' and path '/users'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0003 begin');
      expect(buildUrl('', '/users')).assertEqual('/users');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0003 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_0400
     * @tc.name      testBuildUrl0004
     * @tc.desc      Verify buildUrl concatenates base '/api' and path '/users'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0004 begin');
      expect(buildUrl('/api', '/users')).assertEqual('/api/users');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0004 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_0500
     * @tc.name      testBuildUrl0005
     * @tc.desc      Verify buildUrl concatenates base 'http://localhost:8080' and path '/users'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0005 begin');
      expect(buildUrl('http://localhost:8080', '/users')).assertEqual('http://localhost:8080/users');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0005 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_0600
     * @tc.name      testBuildUrl0006
     * @tc.desc      Verify buildUrl concatenates base 'https://a.b.c' and path '/users'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0006 begin');
      expect(buildUrl('https://a.b.c', '/users')).assertEqual('https://a.b.c/users');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0006 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_0700
     * @tc.name      testBuildUrl0007
     * @tc.desc      Verify buildUrl concatenates base 'api' and path '/users'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0007 begin');
      expect(buildUrl('api', '/users')).assertEqual('api/users');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0007 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_0800
     * @tc.name      testBuildUrl0008
     * @tc.desc      Verify buildUrl concatenates base '//cdn.host' and path '/users'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0008 begin');
      expect(buildUrl('//cdn.host', '/users')).assertEqual('//cdn.host/users');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0008 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_0900
     * @tc.name      testBuildUrl0009
     * @tc.desc      Verify buildUrl concatenates base 'https://host/v1' and path '/users'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0009 begin');
      expect(buildUrl('https://host/v1', '/users')).assertEqual('https://host/v1/users');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0009 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_1000
     * @tc.name      testBuildUrl0010
     * @tc.desc      Verify buildUrl concatenates base 'https://host/base/' and path '/users'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0010 begin');
      expect(buildUrl('https://host/base/', '/users')).assertEqual('https://host/base//users');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0010 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_1100
     * @tc.name      testBuildUrl0011
     * @tc.desc      Verify buildUrl concatenates base 'https://api.example.com' and path '/users/1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0011 begin');
      expect(buildUrl('https://api.example.com', '/users/1')).assertEqual('https://api.example.com/users/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0011 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_1200
     * @tc.name      testBuildUrl0012
     * @tc.desc      Verify buildUrl concatenates base 'https://host' and path '/users/1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0012 begin');
      expect(buildUrl('https://host', '/users/1')).assertEqual('https://host/users/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0012 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_1300
     * @tc.name      testBuildUrl0013
     * @tc.desc      Verify buildUrl concatenates base '' and path '/users/1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0013 begin');
      expect(buildUrl('', '/users/1')).assertEqual('/users/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0013 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_1400
     * @tc.name      testBuildUrl0014
     * @tc.desc      Verify buildUrl concatenates base '/api' and path '/users/1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0014 begin');
      expect(buildUrl('/api', '/users/1')).assertEqual('/api/users/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0014 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_1500
     * @tc.name      testBuildUrl0015
     * @tc.desc      Verify buildUrl concatenates base 'http://localhost:8080' and path '/users/1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0015 begin');
      expect(buildUrl('http://localhost:8080', '/users/1')).assertEqual('http://localhost:8080/users/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0015 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_1600
     * @tc.name      testBuildUrl0016
     * @tc.desc      Verify buildUrl concatenates base 'https://a.b.c' and path '/users/1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0016 begin');
      expect(buildUrl('https://a.b.c', '/users/1')).assertEqual('https://a.b.c/users/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0016 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_1700
     * @tc.name      testBuildUrl0017
     * @tc.desc      Verify buildUrl concatenates base 'api' and path '/users/1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0017 begin');
      expect(buildUrl('api', '/users/1')).assertEqual('api/users/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0017 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_1800
     * @tc.name      testBuildUrl0018
     * @tc.desc      Verify buildUrl concatenates base '//cdn.host' and path '/users/1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0018 begin');
      expect(buildUrl('//cdn.host', '/users/1')).assertEqual('//cdn.host/users/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0018 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_1900
     * @tc.name      testBuildUrl0019
     * @tc.desc      Verify buildUrl concatenates base 'https://host/v1' and path '/users/1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0019 begin');
      expect(buildUrl('https://host/v1', '/users/1')).assertEqual('https://host/v1/users/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0019 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_2000
     * @tc.name      testBuildUrl0020
     * @tc.desc      Verify buildUrl concatenates base 'https://host/base/' and path '/users/1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0020 begin');
      expect(buildUrl('https://host/base/', '/users/1')).assertEqual('https://host/base//users/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0020 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_2100
     * @tc.name      testBuildUrl0021
     * @tc.desc      Verify buildUrl concatenates base 'https://api.example.com' and path '/items?x=1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0021 begin');
      expect(buildUrl('https://api.example.com', '/items?x=1')).assertEqual('https://api.example.com/items?x=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0021 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_2200
     * @tc.name      testBuildUrl0022
     * @tc.desc      Verify buildUrl concatenates base 'https://host' and path '/items?x=1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0022 begin');
      expect(buildUrl('https://host', '/items?x=1')).assertEqual('https://host/items?x=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0022 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_2300
     * @tc.name      testBuildUrl0023
     * @tc.desc      Verify buildUrl concatenates base '' and path '/items?x=1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0023 begin');
      expect(buildUrl('', '/items?x=1')).assertEqual('/items?x=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0023 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_2400
     * @tc.name      testBuildUrl0024
     * @tc.desc      Verify buildUrl concatenates base '/api' and path '/items?x=1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0024 begin');
      expect(buildUrl('/api', '/items?x=1')).assertEqual('/api/items?x=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0024 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_2500
     * @tc.name      testBuildUrl0025
     * @tc.desc      Verify buildUrl concatenates base 'http://localhost:8080' and path '/items?x=1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0025 begin');
      expect(buildUrl('http://localhost:8080', '/items?x=1')).assertEqual('http://localhost:8080/items?x=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0025 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_2600
     * @tc.name      testBuildUrl0026
     * @tc.desc      Verify buildUrl concatenates base 'https://a.b.c' and path '/items?x=1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0026 begin');
      expect(buildUrl('https://a.b.c', '/items?x=1')).assertEqual('https://a.b.c/items?x=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0026 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_2700
     * @tc.name      testBuildUrl0027
     * @tc.desc      Verify buildUrl concatenates base 'api' and path '/items?x=1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0027 begin');
      expect(buildUrl('api', '/items?x=1')).assertEqual('api/items?x=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0027 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_2800
     * @tc.name      testBuildUrl0028
     * @tc.desc      Verify buildUrl concatenates base '//cdn.host' and path '/items?x=1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0028 begin');
      expect(buildUrl('//cdn.host', '/items?x=1')).assertEqual('//cdn.host/items?x=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0028 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_2900
     * @tc.name      testBuildUrl0029
     * @tc.desc      Verify buildUrl concatenates base 'https://host/v1' and path '/items?x=1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0029 begin');
      expect(buildUrl('https://host/v1', '/items?x=1')).assertEqual('https://host/v1/items?x=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0029 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_3000
     * @tc.name      testBuildUrl0030
     * @tc.desc      Verify buildUrl concatenates base 'https://host/base/' and path '/items?x=1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0030 begin');
      expect(buildUrl('https://host/base/', '/items?x=1')).assertEqual('https://host/base//items?x=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0030 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_3100
     * @tc.name      testBuildUrl0031
     * @tc.desc      Verify buildUrl concatenates base 'https://api.example.com' and path ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0031 begin');
      expect(buildUrl('https://api.example.com', '')).assertEqual('https://api.example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0031 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_3200
     * @tc.name      testBuildUrl0032
     * @tc.desc      Verify buildUrl concatenates base 'https://host' and path ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0032 begin');
      expect(buildUrl('https://host', '')).assertEqual('https://host');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0032 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_3300
     * @tc.name      testBuildUrl0033
     * @tc.desc      Verify buildUrl concatenates base '' and path ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0033 begin');
      expect(buildUrl('', '')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0033 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_3400
     * @tc.name      testBuildUrl0034
     * @tc.desc      Verify buildUrl concatenates base '/api' and path ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0034 begin');
      expect(buildUrl('/api', '')).assertEqual('/api');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0034 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_3500
     * @tc.name      testBuildUrl0035
     * @tc.desc      Verify buildUrl concatenates base 'http://localhost:8080' and path ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0035 begin');
      expect(buildUrl('http://localhost:8080', '')).assertEqual('http://localhost:8080');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0035 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_3600
     * @tc.name      testBuildUrl0036
     * @tc.desc      Verify buildUrl concatenates base 'https://a.b.c' and path ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0036 begin');
      expect(buildUrl('https://a.b.c', '')).assertEqual('https://a.b.c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0036 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_3700
     * @tc.name      testBuildUrl0037
     * @tc.desc      Verify buildUrl concatenates base 'api' and path ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0037 begin');
      expect(buildUrl('api', '')).assertEqual('api');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0037 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_3800
     * @tc.name      testBuildUrl0038
     * @tc.desc      Verify buildUrl concatenates base '//cdn.host' and path ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0038 begin');
      expect(buildUrl('//cdn.host', '')).assertEqual('//cdn.host');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0038 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_3900
     * @tc.name      testBuildUrl0039
     * @tc.desc      Verify buildUrl concatenates base 'https://host/v1' and path ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0039 begin');
      expect(buildUrl('https://host/v1', '')).assertEqual('https://host/v1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0039 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_4000
     * @tc.name      testBuildUrl0040
     * @tc.desc      Verify buildUrl concatenates base 'https://host/base/' and path ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0040 begin');
      expect(buildUrl('https://host/base/', '')).assertEqual('https://host/base/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0040 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_4100
     * @tc.name      testBuildUrl0041
     * @tc.desc      Verify buildUrl concatenates base 'https://api.example.com' and path '/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0041 begin');
      expect(buildUrl('https://api.example.com', '/')).assertEqual('https://api.example.com/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0041 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_4200
     * @tc.name      testBuildUrl0042
     * @tc.desc      Verify buildUrl concatenates base 'https://host' and path '/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0042 begin');
      expect(buildUrl('https://host', '/')).assertEqual('https://host/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0042 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_4300
     * @tc.name      testBuildUrl0043
     * @tc.desc      Verify buildUrl concatenates base '' and path '/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0043 begin');
      expect(buildUrl('', '/')).assertEqual('/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0043 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_4400
     * @tc.name      testBuildUrl0044
     * @tc.desc      Verify buildUrl concatenates base '/api' and path '/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0044 begin');
      expect(buildUrl('/api', '/')).assertEqual('/api/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0044 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_4500
     * @tc.name      testBuildUrl0045
     * @tc.desc      Verify buildUrl concatenates base 'http://localhost:8080' and path '/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0045 begin');
      expect(buildUrl('http://localhost:8080', '/')).assertEqual('http://localhost:8080/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0045 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_4600
     * @tc.name      testBuildUrl0046
     * @tc.desc      Verify buildUrl concatenates base 'https://a.b.c' and path '/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0046 begin');
      expect(buildUrl('https://a.b.c', '/')).assertEqual('https://a.b.c/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0046 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_4700
     * @tc.name      testBuildUrl0047
     * @tc.desc      Verify buildUrl concatenates base 'api' and path '/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0047 begin');
      expect(buildUrl('api', '/')).assertEqual('api/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0047 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_4800
     * @tc.name      testBuildUrl0048
     * @tc.desc      Verify buildUrl concatenates base '//cdn.host' and path '/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0048 begin');
      expect(buildUrl('//cdn.host', '/')).assertEqual('//cdn.host/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0048 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_4900
     * @tc.name      testBuildUrl0049
     * @tc.desc      Verify buildUrl concatenates base 'https://host/v1' and path '/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0049 begin');
      expect(buildUrl('https://host/v1', '/')).assertEqual('https://host/v1/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0049 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_5000
     * @tc.name      testBuildUrl0050
     * @tc.desc      Verify buildUrl concatenates base 'https://host/base/' and path '/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0050 begin');
      expect(buildUrl('https://host/base/', '/')).assertEqual('https://host/base//');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0050 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_5100
     * @tc.name      testBuildUrl0051
     * @tc.desc      Verify buildUrl concatenates base 'https://api.example.com' and path '?q=1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0051 begin');
      expect(buildUrl('https://api.example.com', '?q=1')).assertEqual('https://api.example.com?q=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0051 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_5200
     * @tc.name      testBuildUrl0052
     * @tc.desc      Verify buildUrl concatenates base 'https://host' and path '?q=1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0052 begin');
      expect(buildUrl('https://host', '?q=1')).assertEqual('https://host?q=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0052 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_5300
     * @tc.name      testBuildUrl0053
     * @tc.desc      Verify buildUrl concatenates base '' and path '?q=1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0053 begin');
      expect(buildUrl('', '?q=1')).assertEqual('?q=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0053 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_5400
     * @tc.name      testBuildUrl0054
     * @tc.desc      Verify buildUrl concatenates base '/api' and path '?q=1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0054 begin');
      expect(buildUrl('/api', '?q=1')).assertEqual('/api?q=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0054 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_5500
     * @tc.name      testBuildUrl0055
     * @tc.desc      Verify buildUrl concatenates base 'http://localhost:8080' and path '?q=1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0055 begin');
      expect(buildUrl('http://localhost:8080', '?q=1')).assertEqual('http://localhost:8080?q=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0055 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_5600
     * @tc.name      testBuildUrl0056
     * @tc.desc      Verify buildUrl concatenates base 'https://a.b.c' and path '?q=1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0056 begin');
      expect(buildUrl('https://a.b.c', '?q=1')).assertEqual('https://a.b.c?q=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0056 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_5700
     * @tc.name      testBuildUrl0057
     * @tc.desc      Verify buildUrl concatenates base 'api' and path '?q=1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0057 begin');
      expect(buildUrl('api', '?q=1')).assertEqual('api?q=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0057 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_5800
     * @tc.name      testBuildUrl0058
     * @tc.desc      Verify buildUrl concatenates base '//cdn.host' and path '?q=1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0058 begin');
      expect(buildUrl('//cdn.host', '?q=1')).assertEqual('//cdn.host?q=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0058 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_5900
     * @tc.name      testBuildUrl0059
     * @tc.desc      Verify buildUrl concatenates base 'https://host/v1' and path '?q=1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0059 begin');
      expect(buildUrl('https://host/v1', '?q=1')).assertEqual('https://host/v1?q=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0059 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_6000
     * @tc.name      testBuildUrl0060
     * @tc.desc      Verify buildUrl concatenates base 'https://host/base/' and path '?q=1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0060 begin');
      expect(buildUrl('https://host/base/', '?q=1')).assertEqual('https://host/base/?q=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0060 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_6100
     * @tc.name      testBuildUrl0061
     * @tc.desc      Verify buildUrl concatenates base 'https://api.example.com' and path '/v1/items'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0061 begin');
      expect(buildUrl('https://api.example.com', '/v1/items')).assertEqual('https://api.example.com/v1/items');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0061 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_6200
     * @tc.name      testBuildUrl0062
     * @tc.desc      Verify buildUrl concatenates base 'https://host' and path '/v1/items'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0062 begin');
      expect(buildUrl('https://host', '/v1/items')).assertEqual('https://host/v1/items');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0062 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_6300
     * @tc.name      testBuildUrl0063
     * @tc.desc      Verify buildUrl concatenates base '' and path '/v1/items'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0063 begin');
      expect(buildUrl('', '/v1/items')).assertEqual('/v1/items');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0063 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_6400
     * @tc.name      testBuildUrl0064
     * @tc.desc      Verify buildUrl concatenates base '/api' and path '/v1/items'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0064 begin');
      expect(buildUrl('/api', '/v1/items')).assertEqual('/api/v1/items');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0064 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_6500
     * @tc.name      testBuildUrl0065
     * @tc.desc      Verify buildUrl concatenates base 'http://localhost:8080' and path '/v1/items'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0065 begin');
      expect(buildUrl('http://localhost:8080', '/v1/items')).assertEqual('http://localhost:8080/v1/items');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0065 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_6600
     * @tc.name      testBuildUrl0066
     * @tc.desc      Verify buildUrl concatenates base 'https://a.b.c' and path '/v1/items'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0066 begin');
      expect(buildUrl('https://a.b.c', '/v1/items')).assertEqual('https://a.b.c/v1/items');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0066 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_6700
     * @tc.name      testBuildUrl0067
     * @tc.desc      Verify buildUrl concatenates base 'api' and path '/v1/items'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0067 begin');
      expect(buildUrl('api', '/v1/items')).assertEqual('api/v1/items');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0067 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_6800
     * @tc.name      testBuildUrl0068
     * @tc.desc      Verify buildUrl concatenates base '//cdn.host' and path '/v1/items'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0068 begin');
      expect(buildUrl('//cdn.host', '/v1/items')).assertEqual('//cdn.host/v1/items');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0068 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_6900
     * @tc.name      testBuildUrl0069
     * @tc.desc      Verify buildUrl concatenates base 'https://host/v1' and path '/v1/items'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0069 begin');
      expect(buildUrl('https://host/v1', '/v1/items')).assertEqual('https://host/v1/v1/items');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0069 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_7000
     * @tc.name      testBuildUrl0070
     * @tc.desc      Verify buildUrl concatenates base 'https://host/base/' and path '/v1/items'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0070 begin');
      expect(buildUrl('https://host/base/', '/v1/items')).assertEqual('https://host/base//v1/items');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0070 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_7100
     * @tc.name      testBuildUrl0071
     * @tc.desc      Verify buildUrl concatenates base 'https://api.example.com' and path '/中文'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0071 begin');
      expect(buildUrl('https://api.example.com', '/中文')).assertEqual('https://api.example.com/中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0071 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_7200
     * @tc.name      testBuildUrl0072
     * @tc.desc      Verify buildUrl concatenates base 'https://host' and path '/中文'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0072 begin');
      expect(buildUrl('https://host', '/中文')).assertEqual('https://host/中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0072 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_7300
     * @tc.name      testBuildUrl0073
     * @tc.desc      Verify buildUrl concatenates base '' and path '/中文'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0073 begin');
      expect(buildUrl('', '/中文')).assertEqual('/中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0073 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_7400
     * @tc.name      testBuildUrl0074
     * @tc.desc      Verify buildUrl concatenates base '/api' and path '/中文'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0074 begin');
      expect(buildUrl('/api', '/中文')).assertEqual('/api/中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0074 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP1_7500
     * @tc.name      testBuildUrl0075
     * @tc.desc      Verify buildUrl concatenates base 'http://localhost:8080' and path '/中文'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0075 begin');
      expect(buildUrl('http://localhost:8080', '/中文')).assertEqual('http://localhost:8080/中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0075 end');
    })

  })
}
