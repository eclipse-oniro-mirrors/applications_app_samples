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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { buildUrl } from '../../../main/ets/pages/ModuleSystem';

const DOMAIN: number = 0xF815;
const TAG: string = '[Sample_ARKTS_GUIDE_BUILD_URL]';

export default function BuildUrlMatrixTest(): void {
  describe('BuildUrlMatrixTest', () => {
    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0001
     * @tc.name      testBuildUrlMatrix0001
     * @tc.desc      buildUrl concatenates base/path pair #1 (base empty: True).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0001 begin');
      const base: string = "";
      const path: string = "";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0001 end');
    })

    

    

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0010
     * @tc.name      testBuildUrlMatrix0010
     * @tc.desc      buildUrl concatenates base/path pair #10 (base empty: True).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0010 begin');
      const base: string = "";
      const path: string = "/p q";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0010 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0011
     * @tc.name      testBuildUrlMatrix0011
     * @tc.desc      buildUrl concatenates base/path pair #11 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0011 begin');
      const base: string = "http://a";
      const path: string = "";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0011 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0012
     * @tc.name      testBuildUrlMatrix0012
     * @tc.desc      buildUrl concatenates base/path pair #12 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0012 begin');
      const base: string = "http://a";
      const path: string = "/p";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0012 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0013
     * @tc.name      testBuildUrlMatrix0013
     * @tc.desc      buildUrl concatenates base/path pair #13 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0013 begin');
      const base: string = "http://a";
      const path: string = "p";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0013 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0014
     * @tc.name      testBuildUrlMatrix0014
     * @tc.desc      buildUrl concatenates base/path pair #14 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0014 begin');
      const base: string = "http://a";
      const path: string = "/api/v1/users";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0014 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0015
     * @tc.name      testBuildUrlMatrix0015
     * @tc.desc      buildUrl concatenates base/path pair #15 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0015 begin');
      const base: string = "http://a";
      const path: string = "?q=1";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0015 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0016
     * @tc.name      testBuildUrlMatrix0016
     * @tc.desc      buildUrl concatenates base/path pair #16 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0016 begin');
      const base: string = "http://a";
      const path: string = "#frag";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0016 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0017
     * @tc.name      testBuildUrlMatrix0017
     * @tc.desc      buildUrl concatenates base/path pair #17 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0017 begin');
      const base: string = "http://a";
      const path: string = "/";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0017 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0018
     * @tc.name      testBuildUrlMatrix0018
     * @tc.desc      buildUrl concatenates base/path pair #18 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0018 begin');
      const base: string = "http://a";
      const path: string = "//d";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0018 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0019
     * @tc.name      testBuildUrlMatrix0019
     * @tc.desc      buildUrl concatenates base/path pair #19 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0019 begin');
      const base: string = "http://a";
      const path: string = "中";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0019 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0020
     * @tc.name      testBuildUrlMatrix0020
     * @tc.desc      buildUrl concatenates base/path pair #20 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0020 begin');
      const base: string = "http://a";
      const path: string = "/p q";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0020 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0021
     * @tc.name      testBuildUrlMatrix0021
     * @tc.desc      buildUrl concatenates base/path pair #21 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0021 begin');
      const base: string = "http://a/";
      const path: string = "";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0021 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0022
     * @tc.name      testBuildUrlMatrix0022
     * @tc.desc      buildUrl concatenates base/path pair #22 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0022 begin');
      const base: string = "http://a/";
      const path: string = "/p";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0022 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0023
     * @tc.name      testBuildUrlMatrix0023
     * @tc.desc      buildUrl concatenates base/path pair #23 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0023 begin');
      const base: string = "http://a/";
      const path: string = "p";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0023 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0024
     * @tc.name      testBuildUrlMatrix0024
     * @tc.desc      buildUrl concatenates base/path pair #24 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0024 begin');
      const base: string = "http://a/";
      const path: string = "/api/v1/users";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0024 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0025
     * @tc.name      testBuildUrlMatrix0025
     * @tc.desc      buildUrl concatenates base/path pair #25 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0025 begin');
      const base: string = "http://a/";
      const path: string = "?q=1";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0025 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0026
     * @tc.name      testBuildUrlMatrix0026
     * @tc.desc      buildUrl concatenates base/path pair #26 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0026 begin');
      const base: string = "http://a/";
      const path: string = "#frag";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0026 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0027
     * @tc.name      testBuildUrlMatrix0027
     * @tc.desc      buildUrl concatenates base/path pair #27 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0027 begin');
      const base: string = "http://a/";
      const path: string = "/";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0027 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0028
     * @tc.name      testBuildUrlMatrix0028
     * @tc.desc      buildUrl concatenates base/path pair #28 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0028 begin');
      const base: string = "http://a/";
      const path: string = "//d";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0028 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0029
     * @tc.name      testBuildUrlMatrix0029
     * @tc.desc      buildUrl concatenates base/path pair #29 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0029 begin');
      const base: string = "http://a/";
      const path: string = "中";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0029 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0030
     * @tc.name      testBuildUrlMatrix0030
     * @tc.desc      buildUrl concatenates base/path pair #30 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0030 begin');
      const base: string = "http://a/";
      const path: string = "/p q";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0030 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0031
     * @tc.name      testBuildUrlMatrix0031
     * @tc.desc      buildUrl concatenates base/path pair #31 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0031 begin');
      const base: string = "https://x.y";
      const path: string = "";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0031 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0032
     * @tc.name      testBuildUrlMatrix0032
     * @tc.desc      buildUrl concatenates base/path pair #32 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0032 begin');
      const base: string = "https://x.y";
      const path: string = "/p";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0032 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0033
     * @tc.name      testBuildUrlMatrix0033
     * @tc.desc      buildUrl concatenates base/path pair #33 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0033 begin');
      const base: string = "https://x.y";
      const path: string = "p";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0033 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0034
     * @tc.name      testBuildUrlMatrix0034
     * @tc.desc      buildUrl concatenates base/path pair #34 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0034 begin');
      const base: string = "https://x.y";
      const path: string = "/api/v1/users";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0034 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0035
     * @tc.name      testBuildUrlMatrix0035
     * @tc.desc      buildUrl concatenates base/path pair #35 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0035 begin');
      const base: string = "https://x.y";
      const path: string = "?q=1";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0035 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0036
     * @tc.name      testBuildUrlMatrix0036
     * @tc.desc      buildUrl concatenates base/path pair #36 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0036 begin');
      const base: string = "https://x.y";
      const path: string = "#frag";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0036 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0037
     * @tc.name      testBuildUrlMatrix0037
     * @tc.desc      buildUrl concatenates base/path pair #37 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0037 begin');
      const base: string = "https://x.y";
      const path: string = "/";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0037 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0038
     * @tc.name      testBuildUrlMatrix0038
     * @tc.desc      buildUrl concatenates base/path pair #38 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0038 begin');
      const base: string = "https://x.y";
      const path: string = "//d";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0038 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0039
     * @tc.name      testBuildUrlMatrix0039
     * @tc.desc      buildUrl concatenates base/path pair #39 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0039 begin');
      const base: string = "https://x.y";
      const path: string = "中";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0039 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0040
     * @tc.name      testBuildUrlMatrix0040
     * @tc.desc      buildUrl concatenates base/path pair #40 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0040 begin');
      const base: string = "https://x.y";
      const path: string = "/p q";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0040 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0041
     * @tc.name      testBuildUrlMatrix0041
     * @tc.desc      buildUrl concatenates base/path pair #41 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0041 begin');
      const base: string = "api";
      const path: string = "";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0041 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0042
     * @tc.name      testBuildUrlMatrix0042
     * @tc.desc      buildUrl concatenates base/path pair #42 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0042 begin');
      const base: string = "api";
      const path: string = "/p";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0042 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0043
     * @tc.name      testBuildUrlMatrix0043
     * @tc.desc      buildUrl concatenates base/path pair #43 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0043 begin');
      const base: string = "api";
      const path: string = "p";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0043 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0044
     * @tc.name      testBuildUrlMatrix0044
     * @tc.desc      buildUrl concatenates base/path pair #44 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0044 begin');
      const base: string = "api";
      const path: string = "/api/v1/users";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0044 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0045
     * @tc.name      testBuildUrlMatrix0045
     * @tc.desc      buildUrl concatenates base/path pair #45 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0045 begin');
      const base: string = "api";
      const path: string = "?q=1";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0045 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0046
     * @tc.name      testBuildUrlMatrix0046
     * @tc.desc      buildUrl concatenates base/path pair #46 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0046 begin');
      const base: string = "api";
      const path: string = "#frag";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0046 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0047
     * @tc.name      testBuildUrlMatrix0047
     * @tc.desc      buildUrl concatenates base/path pair #47 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0047 begin');
      const base: string = "api";
      const path: string = "/";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0047 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0048
     * @tc.name      testBuildUrlMatrix0048
     * @tc.desc      buildUrl concatenates base/path pair #48 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0048 begin');
      const base: string = "api";
      const path: string = "//d";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0048 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0049
     * @tc.name      testBuildUrlMatrix0049
     * @tc.desc      buildUrl concatenates base/path pair #49 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0049 begin');
      const base: string = "api";
      const path: string = "中";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0049 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0050
     * @tc.name      testBuildUrlMatrix0050
     * @tc.desc      buildUrl concatenates base/path pair #50 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0050 begin');
      const base: string = "api";
      const path: string = "/p q";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0050 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0051
     * @tc.name      testBuildUrlMatrix0051
     * @tc.desc      buildUrl concatenates base/path pair #51 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0051 begin');
      const base: string = "localhost:8080";
      const path: string = "";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0051 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0052
     * @tc.name      testBuildUrlMatrix0052
     * @tc.desc      buildUrl concatenates base/path pair #52 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0052 begin');
      const base: string = "localhost:8080";
      const path: string = "/p";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0052 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0053
     * @tc.name      testBuildUrlMatrix0053
     * @tc.desc      buildUrl concatenates base/path pair #53 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0053 begin');
      const base: string = "localhost:8080";
      const path: string = "p";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0053 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0054
     * @tc.name      testBuildUrlMatrix0054
     * @tc.desc      buildUrl concatenates base/path pair #54 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0054 begin');
      const base: string = "localhost:8080";
      const path: string = "/api/v1/users";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0054 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0055
     * @tc.name      testBuildUrlMatrix0055
     * @tc.desc      buildUrl concatenates base/path pair #55 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0055 begin');
      const base: string = "localhost:8080";
      const path: string = "?q=1";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0055 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0056
     * @tc.name      testBuildUrlMatrix0056
     * @tc.desc      buildUrl concatenates base/path pair #56 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0056 begin');
      const base: string = "localhost:8080";
      const path: string = "#frag";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0056 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0057
     * @tc.name      testBuildUrlMatrix0057
     * @tc.desc      buildUrl concatenates base/path pair #57 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0057 begin');
      const base: string = "localhost:8080";
      const path: string = "/";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0057 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0058
     * @tc.name      testBuildUrlMatrix0058
     * @tc.desc      buildUrl concatenates base/path pair #58 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0058 begin');
      const base: string = "localhost:8080";
      const path: string = "//d";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0058 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0059
     * @tc.name      testBuildUrlMatrix0059
     * @tc.desc      buildUrl concatenates base/path pair #59 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0059 begin');
      const base: string = "localhost:8080";
      const path: string = "中";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0059 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0060
     * @tc.name      testBuildUrlMatrix0060
     * @tc.desc      buildUrl concatenates base/path pair #60 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0060 begin');
      const base: string = "localhost:8080";
      const path: string = "/p q";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0060 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0061
     * @tc.name      testBuildUrlMatrix0061
     * @tc.desc      buildUrl concatenates base/path pair #61 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0061 begin');
      const base: string = "/root";
      const path: string = "";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0061 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0062
     * @tc.name      testBuildUrlMatrix0062
     * @tc.desc      buildUrl concatenates base/path pair #62 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0062 begin');
      const base: string = "/root";
      const path: string = "/p";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0062 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0063
     * @tc.name      testBuildUrlMatrix0063
     * @tc.desc      buildUrl concatenates base/path pair #63 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0063 begin');
      const base: string = "/root";
      const path: string = "p";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0063 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0064
     * @tc.name      testBuildUrlMatrix0064
     * @tc.desc      buildUrl concatenates base/path pair #64 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0064 begin');
      const base: string = "/root";
      const path: string = "/api/v1/users";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0064 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0065
     * @tc.name      testBuildUrlMatrix0065
     * @tc.desc      buildUrl concatenates base/path pair #65 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0065 begin');
      const base: string = "/root";
      const path: string = "?q=1";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0065 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0066
     * @tc.name      testBuildUrlMatrix0066
     * @tc.desc      buildUrl concatenates base/path pair #66 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0066 begin');
      const base: string = "/root";
      const path: string = "#frag";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0066 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0067
     * @tc.name      testBuildUrlMatrix0067
     * @tc.desc      buildUrl concatenates base/path pair #67 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0067 begin');
      const base: string = "/root";
      const path: string = "/";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0067 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0068
     * @tc.name      testBuildUrlMatrix0068
     * @tc.desc      buildUrl concatenates base/path pair #68 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0068 begin');
      const base: string = "/root";
      const path: string = "//d";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0068 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0069
     * @tc.name      testBuildUrlMatrix0069
     * @tc.desc      buildUrl concatenates base/path pair #69 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0069 begin');
      const base: string = "/root";
      const path: string = "中";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0069 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0070
     * @tc.name      testBuildUrlMatrix0070
     * @tc.desc      buildUrl concatenates base/path pair #70 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0070 begin');
      const base: string = "/root";
      const path: string = "/p q";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0070 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0071
     * @tc.name      testBuildUrlMatrix0071
     * @tc.desc      buildUrl concatenates base/path pair #71 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0071 begin');
      const base: string = "a b";
      const path: string = "";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0071 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0072
     * @tc.name      testBuildUrlMatrix0072
     * @tc.desc      buildUrl concatenates base/path pair #72 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0072 begin');
      const base: string = "a b";
      const path: string = "/p";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0072 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0073
     * @tc.name      testBuildUrlMatrix0073
     * @tc.desc      buildUrl concatenates base/path pair #73 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0073 begin');
      const base: string = "a b";
      const path: string = "p";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0073 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0074
     * @tc.name      testBuildUrlMatrix0074
     * @tc.desc      buildUrl concatenates base/path pair #74 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0074 begin');
      const base: string = "a b";
      const path: string = "/api/v1/users";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0074 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0075
     * @tc.name      testBuildUrlMatrix0075
     * @tc.desc      buildUrl concatenates base/path pair #75 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0075 begin');
      const base: string = "a b";
      const path: string = "?q=1";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0075 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0076
     * @tc.name      testBuildUrlMatrix0076
     * @tc.desc      buildUrl concatenates base/path pair #76 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0076 begin');
      const base: string = "a b";
      const path: string = "#frag";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0076 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0077
     * @tc.name      testBuildUrlMatrix0077
     * @tc.desc      buildUrl concatenates base/path pair #77 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0077 begin');
      const base: string = "a b";
      const path: string = "/";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0077 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0078
     * @tc.name      testBuildUrlMatrix0078
     * @tc.desc      buildUrl concatenates base/path pair #78 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0078 begin');
      const base: string = "a b";
      const path: string = "//d";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0078 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0079
     * @tc.name      testBuildUrlMatrix0079
     * @tc.desc      buildUrl concatenates base/path pair #79 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0079 begin');
      const base: string = "a b";
      const path: string = "中";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0079 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0080
     * @tc.name      testBuildUrlMatrix0080
     * @tc.desc      buildUrl concatenates base/path pair #80 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0080 begin');
      const base: string = "a b";
      const path: string = "/p q";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0080 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0081
     * @tc.name      testBuildUrlMatrix0081
     * @tc.desc      buildUrl concatenates base/path pair #81 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0081 begin');
      const base: string = "中文";
      const path: string = "";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0081 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0082
     * @tc.name      testBuildUrlMatrix0082
     * @tc.desc      buildUrl concatenates base/path pair #82 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0082 begin');
      const base: string = "中文";
      const path: string = "/p";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0082 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0083
     * @tc.name      testBuildUrlMatrix0083
     * @tc.desc      buildUrl concatenates base/path pair #83 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0083 begin');
      const base: string = "中文";
      const path: string = "p";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0083 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0084
     * @tc.name      testBuildUrlMatrix0084
     * @tc.desc      buildUrl concatenates base/path pair #84 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0084 begin');
      const base: string = "中文";
      const path: string = "/api/v1/users";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0084 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0085
     * @tc.name      testBuildUrlMatrix0085
     * @tc.desc      buildUrl concatenates base/path pair #85 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0085 begin');
      const base: string = "中文";
      const path: string = "?q=1";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0085 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0086
     * @tc.name      testBuildUrlMatrix0086
     * @tc.desc      buildUrl concatenates base/path pair #86 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0086 begin');
      const base: string = "中文";
      const path: string = "#frag";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0086 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0087
     * @tc.name      testBuildUrlMatrix0087
     * @tc.desc      buildUrl concatenates base/path pair #87 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0087 begin');
      const base: string = "中文";
      const path: string = "/";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0087 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0088
     * @tc.name      testBuildUrlMatrix0088
     * @tc.desc      buildUrl concatenates base/path pair #88 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0088 begin');
      const base: string = "中文";
      const path: string = "//d";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0088 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0089
     * @tc.name      testBuildUrlMatrix0089
     * @tc.desc      buildUrl concatenates base/path pair #89 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0089 begin');
      const base: string = "中文";
      const path: string = "中";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0089 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0090
     * @tc.name      testBuildUrlMatrix0090
     * @tc.desc      buildUrl concatenates base/path pair #90 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0090 begin');
      const base: string = "中文";
      const path: string = "/p q";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0090 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0091
     * @tc.name      testBuildUrlMatrix0091
     * @tc.desc      buildUrl concatenates base/path pair #91 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0091 begin');
      const base: string = "http://a//";
      const path: string = "";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0091 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0092
     * @tc.name      testBuildUrlMatrix0092
     * @tc.desc      buildUrl concatenates base/path pair #92 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0092 begin');
      const base: string = "http://a//";
      const path: string = "/p";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0092 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0093
     * @tc.name      testBuildUrlMatrix0093
     * @tc.desc      buildUrl concatenates base/path pair #93 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0093 begin');
      const base: string = "http://a//";
      const path: string = "p";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0093 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0094
     * @tc.name      testBuildUrlMatrix0094
     * @tc.desc      buildUrl concatenates base/path pair #94 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0094 begin');
      const base: string = "http://a//";
      const path: string = "/api/v1/users";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0094 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0095
     * @tc.name      testBuildUrlMatrix0095
     * @tc.desc      buildUrl concatenates base/path pair #95 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0095 begin');
      const base: string = "http://a//";
      const path: string = "?q=1";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0095 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0096
     * @tc.name      testBuildUrlMatrix0096
     * @tc.desc      buildUrl concatenates base/path pair #96 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0096 begin');
      const base: string = "http://a//";
      const path: string = "#frag";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0096 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0097
     * @tc.name      testBuildUrlMatrix0097
     * @tc.desc      buildUrl concatenates base/path pair #97 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0097 begin');
      const base: string = "http://a//";
      const path: string = "/";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0097 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0098
     * @tc.name      testBuildUrlMatrix0098
     * @tc.desc      buildUrl concatenates base/path pair #98 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0098 begin');
      const base: string = "http://a//";
      const path: string = "//d";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0098 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0099
     * @tc.name      testBuildUrlMatrix0099
     * @tc.desc      buildUrl concatenates base/path pair #99 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0099 begin');
      const base: string = "http://a//";
      const path: string = "中";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0099 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0100
     * @tc.name      testBuildUrlMatrix0100
     * @tc.desc      buildUrl concatenates base/path pair #100 (base empty: False).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0100 begin');
      const base: string = "http://a//";
      const path: string = "/p q";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0100 end');
    })

  });
}
