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

export default function BuildUrlCompositionMatrixPart2Test(): void {
  describe('BuildUrlCompositionMatrixPart2', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_7600
     * @tc.name      testBuildUrl0076
     * @tc.desc      Verify buildUrl concatenates base 'https://a.b.c' and path '/中文'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0076 begin');
      expect(buildUrl('https://a.b.c', '/中文')).assertEqual('https://a.b.c/中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0076 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_7700
     * @tc.name      testBuildUrl0077
     * @tc.desc      Verify buildUrl concatenates base 'api' and path '/中文'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0077 begin');
      expect(buildUrl('api', '/中文')).assertEqual('api/中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0077 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_7800
     * @tc.name      testBuildUrl0078
     * @tc.desc      Verify buildUrl concatenates base '//cdn.host' and path '/中文'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0078 begin');
      expect(buildUrl('//cdn.host', '/中文')).assertEqual('//cdn.host/中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0078 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_7900
     * @tc.name      testBuildUrl0079
     * @tc.desc      Verify buildUrl concatenates base 'https://host/v1' and path '/中文'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0079 begin');
      expect(buildUrl('https://host/v1', '/中文')).assertEqual('https://host/v1/中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0079 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_8000
     * @tc.name      testBuildUrl0080
     * @tc.desc      Verify buildUrl concatenates base 'https://host/base/' and path '/中文'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0080 begin');
      expect(buildUrl('https://host/base/', '/中文')).assertEqual('https://host/base//中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0080 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_8100
     * @tc.name      testBuildUrl0081
     * @tc.desc      Verify buildUrl concatenates base 'https://api.example.com' and path '/a/b/c'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0081 begin');
      expect(buildUrl('https://api.example.com', '/a/b/c')).assertEqual('https://api.example.com/a/b/c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0081 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_8200
     * @tc.name      testBuildUrl0082
     * @tc.desc      Verify buildUrl concatenates base 'https://host' and path '/a/b/c'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0082 begin');
      expect(buildUrl('https://host', '/a/b/c')).assertEqual('https://host/a/b/c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0082 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_8300
     * @tc.name      testBuildUrl0083
     * @tc.desc      Verify buildUrl concatenates base '' and path '/a/b/c'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0083 begin');
      expect(buildUrl('', '/a/b/c')).assertEqual('/a/b/c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0083 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_8400
     * @tc.name      testBuildUrl0084
     * @tc.desc      Verify buildUrl concatenates base '/api' and path '/a/b/c'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0084 begin');
      expect(buildUrl('/api', '/a/b/c')).assertEqual('/api/a/b/c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0084 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_8500
     * @tc.name      testBuildUrl0085
     * @tc.desc      Verify buildUrl concatenates base 'http://localhost:8080' and path '/a/b/c'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0085 begin');
      expect(buildUrl('http://localhost:8080', '/a/b/c')).assertEqual('http://localhost:8080/a/b/c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0085 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_8600
     * @tc.name      testBuildUrl0086
     * @tc.desc      Verify buildUrl concatenates base 'https://a.b.c' and path '/a/b/c'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0086 begin');
      expect(buildUrl('https://a.b.c', '/a/b/c')).assertEqual('https://a.b.c/a/b/c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0086 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_8700
     * @tc.name      testBuildUrl0087
     * @tc.desc      Verify buildUrl concatenates base 'api' and path '/a/b/c'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0087 begin');
      expect(buildUrl('api', '/a/b/c')).assertEqual('api/a/b/c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0087 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_8800
     * @tc.name      testBuildUrl0088
     * @tc.desc      Verify buildUrl concatenates base '//cdn.host' and path '/a/b/c'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0088 begin');
      expect(buildUrl('//cdn.host', '/a/b/c')).assertEqual('//cdn.host/a/b/c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0088 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_8900
     * @tc.name      testBuildUrl0089
     * @tc.desc      Verify buildUrl concatenates base 'https://host/v1' and path '/a/b/c'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0089 begin');
      expect(buildUrl('https://host/v1', '/a/b/c')).assertEqual('https://host/v1/a/b/c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0089 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_9000
     * @tc.name      testBuildUrl0090
     * @tc.desc      Verify buildUrl concatenates base 'https://host/base/' and path '/a/b/c'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0090 begin');
      expect(buildUrl('https://host/base/', '/a/b/c')).assertEqual('https://host/base//a/b/c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0090 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_9100
     * @tc.name      testBuildUrl0091
     * @tc.desc      Verify buildUrl concatenates base 'https://api.example.com' and path '/space path'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0091 begin');
      expect(buildUrl('https://api.example.com', '/space path')).assertEqual('https://api.example.com/space path');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0091 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_9200
     * @tc.name      testBuildUrl0092
     * @tc.desc      Verify buildUrl concatenates base 'https://host' and path '/space path'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0092 begin');
      expect(buildUrl('https://host', '/space path')).assertEqual('https://host/space path');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0092 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_9300
     * @tc.name      testBuildUrl0093
     * @tc.desc      Verify buildUrl concatenates base '' and path '/space path'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0093 begin');
      expect(buildUrl('', '/space path')).assertEqual('/space path');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0093 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_9400
     * @tc.name      testBuildUrl0094
     * @tc.desc      Verify buildUrl concatenates base '/api' and path '/space path'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0094 begin');
      expect(buildUrl('/api', '/space path')).assertEqual('/api/space path');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0094 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_9500
     * @tc.name      testBuildUrl0095
     * @tc.desc      Verify buildUrl concatenates base 'http://localhost:8080' and path '/space path'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0095 begin');
      expect(buildUrl('http://localhost:8080', '/space path')).assertEqual('http://localhost:8080/space path');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0095 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_9600
     * @tc.name      testBuildUrl0096
     * @tc.desc      Verify buildUrl concatenates base 'https://a.b.c' and path '/space path'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0096 begin');
      expect(buildUrl('https://a.b.c', '/space path')).assertEqual('https://a.b.c/space path');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0096 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_9700
     * @tc.name      testBuildUrl0097
     * @tc.desc      Verify buildUrl concatenates base 'api' and path '/space path'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0097 begin');
      expect(buildUrl('api', '/space path')).assertEqual('api/space path');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0097 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_9800
     * @tc.name      testBuildUrl0098
     * @tc.desc      Verify buildUrl concatenates base '//cdn.host' and path '/space path'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0098 begin');
      expect(buildUrl('//cdn.host', '/space path')).assertEqual('//cdn.host/space path');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0098 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_9900
     * @tc.name      testBuildUrl0099
     * @tc.desc      Verify buildUrl concatenates base 'https://host/v1' and path '/space path'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0099 begin');
      expect(buildUrl('https://host/v1', '/space path')).assertEqual('https://host/v1/space path');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0099 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_10000
     * @tc.name      testBuildUrl0100
     * @tc.desc      Verify buildUrl concatenates base 'https://host/base/' and path '/space path'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0100 begin');
      expect(buildUrl('https://host/base/', '/space path')).assertEqual('https://host/base//space path');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0100 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_10100
     * @tc.name      testBuildUrl0101
     * @tc.desc      Verify buildUrl concatenates base 'https://api.example.com' and path '/items/2?page=3'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0101 begin');
      expect(buildUrl('https://api.example.com', '/items/2?page=3')).assertEqual('https://api.example.com/items/2?page=3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0101 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_10200
     * @tc.name      testBuildUrl0102
     * @tc.desc      Verify buildUrl concatenates base 'https://host' and path '/items/2?page=3'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0102 begin');
      expect(buildUrl('https://host', '/items/2?page=3')).assertEqual('https://host/items/2?page=3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0102 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_10300
     * @tc.name      testBuildUrl0103
     * @tc.desc      Verify buildUrl concatenates base '' and path '/items/2?page=3'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0103 begin');
      expect(buildUrl('', '/items/2?page=3')).assertEqual('/items/2?page=3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0103 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_10400
     * @tc.name      testBuildUrl0104
     * @tc.desc      Verify buildUrl concatenates base '/api' and path '/items/2?page=3'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0104 begin');
      expect(buildUrl('/api', '/items/2?page=3')).assertEqual('/api/items/2?page=3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0104 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_10500
     * @tc.name      testBuildUrl0105
     * @tc.desc      Verify buildUrl concatenates base 'http://localhost:8080' and path '/items/2?page=3'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0105 begin');
      expect(buildUrl('http://localhost:8080', '/items/2?page=3')).assertEqual('http://localhost:8080/items/2?page=3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0105 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_10600
     * @tc.name      testBuildUrl0106
     * @tc.desc      Verify buildUrl concatenates base 'https://a.b.c' and path '/items/2?page=3'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0106 begin');
      expect(buildUrl('https://a.b.c', '/items/2?page=3')).assertEqual('https://a.b.c/items/2?page=3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0106 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_10700
     * @tc.name      testBuildUrl0107
     * @tc.desc      Verify buildUrl concatenates base 'api' and path '/items/2?page=3'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0107 begin');
      expect(buildUrl('api', '/items/2?page=3')).assertEqual('api/items/2?page=3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0107 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_10800
     * @tc.name      testBuildUrl0108
     * @tc.desc      Verify buildUrl concatenates base '//cdn.host' and path '/items/2?page=3'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0108 begin');
      expect(buildUrl('//cdn.host', '/items/2?page=3')).assertEqual('//cdn.host/items/2?page=3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0108 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_10900
     * @tc.name      testBuildUrl0109
     * @tc.desc      Verify buildUrl concatenates base 'https://host/v1' and path '/items/2?page=3'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0109 begin');
      expect(buildUrl('https://host/v1', '/items/2?page=3')).assertEqual('https://host/v1/items/2?page=3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0109 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_11000
     * @tc.name      testBuildUrl0110
     * @tc.desc      Verify buildUrl concatenates base 'https://host/base/' and path '/items/2?page=3'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0110 begin');
      expect(buildUrl('https://host/base/', '/items/2?page=3')).assertEqual('https://host/base//items/2?page=3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0110 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_11100
     * @tc.name      testBuildUrl0111
     * @tc.desc      Verify buildUrl concatenates base 'https://api.example.com' and path '/health'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0111 begin');
      expect(buildUrl('https://api.example.com', '/health')).assertEqual('https://api.example.com/health');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0111 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_11200
     * @tc.name      testBuildUrl0112
     * @tc.desc      Verify buildUrl concatenates base 'https://host' and path '/health'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0112 begin');
      expect(buildUrl('https://host', '/health')).assertEqual('https://host/health');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0112 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_11300
     * @tc.name      testBuildUrl0113
     * @tc.desc      Verify buildUrl concatenates base '' and path '/health'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0113 begin');
      expect(buildUrl('', '/health')).assertEqual('/health');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0113 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_11400
     * @tc.name      testBuildUrl0114
     * @tc.desc      Verify buildUrl concatenates base '/api' and path '/health'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0114 begin');
      expect(buildUrl('/api', '/health')).assertEqual('/api/health');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0114 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_11500
     * @tc.name      testBuildUrl0115
     * @tc.desc      Verify buildUrl concatenates base 'http://localhost:8080' and path '/health'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0115 begin');
      expect(buildUrl('http://localhost:8080', '/health')).assertEqual('http://localhost:8080/health');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0115 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_11600
     * @tc.name      testBuildUrl0116
     * @tc.desc      Verify buildUrl concatenates base 'https://a.b.c' and path '/health'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0116 begin');
      expect(buildUrl('https://a.b.c', '/health')).assertEqual('https://a.b.c/health');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0116 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_11700
     * @tc.name      testBuildUrl0117
     * @tc.desc      Verify buildUrl concatenates base 'api' and path '/health'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0117 begin');
      expect(buildUrl('api', '/health')).assertEqual('api/health');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0117 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_11800
     * @tc.name      testBuildUrl0118
     * @tc.desc      Verify buildUrl concatenates base '//cdn.host' and path '/health'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0118 begin');
      expect(buildUrl('//cdn.host', '/health')).assertEqual('//cdn.host/health');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0118 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_11900
     * @tc.name      testBuildUrl0119
     * @tc.desc      Verify buildUrl concatenates base 'https://host/v1' and path '/health'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0119 begin');
      expect(buildUrl('https://host/v1', '/health')).assertEqual('https://host/v1/health');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0119 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_12000
     * @tc.name      testBuildUrl0120
     * @tc.desc      Verify buildUrl concatenates base 'https://host/base/' and path '/health'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0120 begin');
      expect(buildUrl('https://host/base/', '/health')).assertEqual('https://host/base//health');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0120 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_12100
     * @tc.name      testBuildUrl0121
     * @tc.desc      Verify buildUrl concatenates base 'https://api.example.com' and path '/deep/a/b/c'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0121 begin');
      expect(buildUrl('https://api.example.com', '/deep/a/b/c')).assertEqual('https://api.example.com/deep/a/b/c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0121 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_12200
     * @tc.name      testBuildUrl0122
     * @tc.desc      Verify buildUrl concatenates base 'https://host' and path '/deep/a/b/c'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0122 begin');
      expect(buildUrl('https://host', '/deep/a/b/c')).assertEqual('https://host/deep/a/b/c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0122 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_12300
     * @tc.name      testBuildUrl0123
     * @tc.desc      Verify buildUrl concatenates base '' and path '/deep/a/b/c'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0123 begin');
      expect(buildUrl('', '/deep/a/b/c')).assertEqual('/deep/a/b/c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0123 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_12400
     * @tc.name      testBuildUrl0124
     * @tc.desc      Verify buildUrl concatenates base '/api' and path '/deep/a/b/c'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0124 begin');
      expect(buildUrl('/api', '/deep/a/b/c')).assertEqual('/api/deep/a/b/c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0124 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_12500
     * @tc.name      testBuildUrl0125
     * @tc.desc      Verify buildUrl concatenates base 'http://localhost:8080' and path '/deep/a/b/c'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0125 begin');
      expect(buildUrl('http://localhost:8080', '/deep/a/b/c')).assertEqual('http://localhost:8080/deep/a/b/c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0125 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_12600
     * @tc.name      testBuildUrl0126
     * @tc.desc      Verify buildUrl concatenates base 'https://a.b.c' and path '/deep/a/b/c'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0126 begin');
      expect(buildUrl('https://a.b.c', '/deep/a/b/c')).assertEqual('https://a.b.c/deep/a/b/c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0126 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_12700
     * @tc.name      testBuildUrl0127
     * @tc.desc      Verify buildUrl concatenates base 'api' and path '/deep/a/b/c'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0127 begin');
      expect(buildUrl('api', '/deep/a/b/c')).assertEqual('api/deep/a/b/c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0127 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_12800
     * @tc.name      testBuildUrl0128
     * @tc.desc      Verify buildUrl concatenates base '//cdn.host' and path '/deep/a/b/c'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0128 begin');
      expect(buildUrl('//cdn.host', '/deep/a/b/c')).assertEqual('//cdn.host/deep/a/b/c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0128 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_12900
     * @tc.name      testBuildUrl0129
     * @tc.desc      Verify buildUrl concatenates base 'https://host/v1' and path '/deep/a/b/c'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0129 begin');
      expect(buildUrl('https://host/v1', '/deep/a/b/c')).assertEqual('https://host/v1/deep/a/b/c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0129 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_13000
     * @tc.name      testBuildUrl0130
     * @tc.desc      Verify buildUrl concatenates base 'https://host/base/' and path '/deep/a/b/c'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0130 begin');
      expect(buildUrl('https://host/base/', '/deep/a/b/c')).assertEqual('https://host/base//deep/a/b/c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0130 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_13100
     * @tc.name      testBuildUrl0131
     * @tc.desc      Verify buildUrl concatenates base 'https://api.example.com' and path '/%20'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0131 begin');
      expect(buildUrl('https://api.example.com', '/%20')).assertEqual('https://api.example.com/%20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0131 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_13200
     * @tc.name      testBuildUrl0132
     * @tc.desc      Verify buildUrl concatenates base 'https://host' and path '/%20'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0132 begin');
      expect(buildUrl('https://host', '/%20')).assertEqual('https://host/%20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0132 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_13300
     * @tc.name      testBuildUrl0133
     * @tc.desc      Verify buildUrl concatenates base '' and path '/%20'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0133 begin');
      expect(buildUrl('', '/%20')).assertEqual('/%20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0133 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_13400
     * @tc.name      testBuildUrl0134
     * @tc.desc      Verify buildUrl concatenates base '/api' and path '/%20'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0134 begin');
      expect(buildUrl('/api', '/%20')).assertEqual('/api/%20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0134 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_13500
     * @tc.name      testBuildUrl0135
     * @tc.desc      Verify buildUrl concatenates base 'http://localhost:8080' and path '/%20'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0135 begin');
      expect(buildUrl('http://localhost:8080', '/%20')).assertEqual('http://localhost:8080/%20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0135 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_13600
     * @tc.name      testBuildUrl0136
     * @tc.desc      Verify buildUrl concatenates base 'https://a.b.c' and path '/%20'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0136 begin');
      expect(buildUrl('https://a.b.c', '/%20')).assertEqual('https://a.b.c/%20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0136 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_13700
     * @tc.name      testBuildUrl0137
     * @tc.desc      Verify buildUrl concatenates base 'api' and path '/%20'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0137 begin');
      expect(buildUrl('api', '/%20')).assertEqual('api/%20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0137 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_13800
     * @tc.name      testBuildUrl0138
     * @tc.desc      Verify buildUrl concatenates base '//cdn.host' and path '/%20'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0138 begin');
      expect(buildUrl('//cdn.host', '/%20')).assertEqual('//cdn.host/%20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0138 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_13900
     * @tc.name      testBuildUrl0139
     * @tc.desc      Verify buildUrl concatenates base 'https://host/v1' and path '/%20'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0139 begin');
      expect(buildUrl('https://host/v1', '/%20')).assertEqual('https://host/v1/%20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0139 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_14000
     * @tc.name      testBuildUrl0140
     * @tc.desc      Verify buildUrl concatenates base 'https://host/base/' and path '/%20'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0140 begin');
      expect(buildUrl('https://host/base/', '/%20')).assertEqual('https://host/base//%20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0140 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_14100
     * @tc.name      testBuildUrl0141
     * @tc.desc      Verify buildUrl concatenates base 'https://api.example.com' and path '/end/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0141 begin');
      expect(buildUrl('https://api.example.com', '/end/')).assertEqual('https://api.example.com/end/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0141 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_14200
     * @tc.name      testBuildUrl0142
     * @tc.desc      Verify buildUrl concatenates base 'https://host' and path '/end/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0142 begin');
      expect(buildUrl('https://host', '/end/')).assertEqual('https://host/end/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0142 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_14300
     * @tc.name      testBuildUrl0143
     * @tc.desc      Verify buildUrl concatenates base '' and path '/end/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0143 begin');
      expect(buildUrl('', '/end/')).assertEqual('/end/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0143 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_14400
     * @tc.name      testBuildUrl0144
     * @tc.desc      Verify buildUrl concatenates base '/api' and path '/end/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0144 begin');
      expect(buildUrl('/api', '/end/')).assertEqual('/api/end/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0144 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_14500
     * @tc.name      testBuildUrl0145
     * @tc.desc      Verify buildUrl concatenates base 'http://localhost:8080' and path '/end/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0145 begin');
      expect(buildUrl('http://localhost:8080', '/end/')).assertEqual('http://localhost:8080/end/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0145 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_14600
     * @tc.name      testBuildUrl0146
     * @tc.desc      Verify buildUrl concatenates base 'https://a.b.c' and path '/end/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0146 begin');
      expect(buildUrl('https://a.b.c', '/end/')).assertEqual('https://a.b.c/end/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0146 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_14700
     * @tc.name      testBuildUrl0147
     * @tc.desc      Verify buildUrl concatenates base 'api' and path '/end/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0147 begin');
      expect(buildUrl('api', '/end/')).assertEqual('api/end/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0147 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_14800
     * @tc.name      testBuildUrl0148
     * @tc.desc      Verify buildUrl concatenates base '//cdn.host' and path '/end/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0148 begin');
      expect(buildUrl('//cdn.host', '/end/')).assertEqual('//cdn.host/end/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0148 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_14900
     * @tc.name      testBuildUrl0149
     * @tc.desc      Verify buildUrl concatenates base 'https://host/v1' and path '/end/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0149 begin');
      expect(buildUrl('https://host/v1', '/end/')).assertEqual('https://host/v1/end/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0149 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURLP2_15000
     * @tc.name      testBuildUrl0150
     * @tc.desc      Verify buildUrl concatenates base 'https://host/base/' and path '/end/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBuildUrl0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0150 begin');
      expect(buildUrl('https://host/base/', '/end/')).assertEqual('https://host/base//end/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrl0150 end');
    })

  })
}
