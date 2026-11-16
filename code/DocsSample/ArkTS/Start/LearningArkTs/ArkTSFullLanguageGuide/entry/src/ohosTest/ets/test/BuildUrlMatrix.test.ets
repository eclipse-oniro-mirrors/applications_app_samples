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
import { describe, beforeEach, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { buildUrl } from '../../../main/ets/pages/ModuleSystem';

const DOMAIN: number = 0xF815;
const TAG: string = '[Sample_ARKTS_GUIDE_BUILD_URL]';

export default function BuildUrlMatrixTest(): void {
  describe('BuildUrlMatrixTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })

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
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0002
     * @tc.name      testBuildUrlMatrix0002
     * @tc.desc      buildUrl concatenates base/path pair #2 (base empty: True).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0002 begin');
      const base: string = "";
      const path: string = "/p";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0002 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0003
     * @tc.name      testBuildUrlMatrix0003
     * @tc.desc      buildUrl concatenates base/path pair #3 (base empty: True).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0003 begin');
      const base: string = "";
      const path: string = "p";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0003 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0004
     * @tc.name      testBuildUrlMatrix0004
     * @tc.desc      buildUrl concatenates base/path pair #4 (base empty: True).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0004 begin');
      const base: string = "";
      const path: string = "/api/v1/users";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0004 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0005
     * @tc.name      testBuildUrlMatrix0005
     * @tc.desc      buildUrl concatenates base/path pair #5 (base empty: True).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0005 begin');
      const base: string = "";
      const path: string = "?q=1";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0005 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0006
     * @tc.name      testBuildUrlMatrix0006
     * @tc.desc      buildUrl concatenates base/path pair #6 (base empty: True).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0006 begin');
      const base: string = "";
      const path: string = "#frag";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0006 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0007
     * @tc.name      testBuildUrlMatrix0007
     * @tc.desc      buildUrl concatenates base/path pair #7 (base empty: True).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0007 begin');
      const base: string = "";
      const path: string = "/";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0007 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0008
     * @tc.name      testBuildUrlMatrix0008
     * @tc.desc      buildUrl concatenates base/path pair #8 (base empty: True).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0008 begin');
      const base: string = "";
      const path: string = "//d";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0008 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BUILDURL_testBuildUrlMatrix0009
     * @tc.name      testBuildUrlMatrix0009
     * @tc.desc      buildUrl concatenates base/path pair #9 (base empty: True).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildUrlMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0009 begin');
      const base: string = "";
      const path: string = "中";
      const expected: string = base + path;
      const actual: string = buildUrl(base, path);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(base.length + path.length);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlMatrix0009 end');
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
