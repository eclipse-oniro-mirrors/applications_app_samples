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
import { logInfo, BUNDLE } from '../common/PerfTestSupport';
import {
  bundleValid,
} from '../model/PerfTestLogic';

/** BundleValidTest logic checks (32 cases). */
export default function bundleValidTest(): void {
  describe('BundleValidTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0001
     * @tc.name      Perf_BundleValid_0001
     * @tc.desc      bundleValid("") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_BundleValid_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BundleValid_0001 begin`);
      logInfo("bundleValid(\"\")");
      const actual: boolean = bundleValid("");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}BundleValid_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0002
     * @tc.name      Perf_BundleValid_0002
     * @tc.desc      bundleValid("a") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0002 begin`);
      logInfo("bundleValid(\"a\")");
      const actual: boolean = bundleValid("a");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}BundleValid_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0003
     * @tc.name      Perf_BundleValid_0003
     * @tc.desc      bundleValid("com.samples.test.perftest") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0003 begin`);
      logInfo("bundleValid(\"com.samples.test.perftest\")");
      const actual: boolean = bundleValid("com.samples.test.perftest");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}BundleValid_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0004
     * @tc.name      Perf_BundleValid_0004
     * @tc.desc      bundleValid("x.y.z") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0004 begin`);
      logInfo("bundleValid(\"x.y.z\")");
      const actual: boolean = bundleValid("x.y.z");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}BundleValid_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0005
     * @tc.name      Perf_BundleValid_0005
     * @tc.desc      bundleValid(" ") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0005 begin`);
      logInfo("bundleValid(\" \")");
      const actual: boolean = bundleValid(" ");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}BundleValid_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0006
     * @tc.name      Perf_BundleValid_0006
     * @tc.desc      bundleValid("com") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0006 begin`);
      logInfo("bundleValid(\"com\")");
      const actual: boolean = bundleValid("com");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}BundleValid_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0007
     * @tc.name      Perf_BundleValid_0007
     * @tc.desc      bundleValid("a.b") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0007 begin`);
      logInfo("bundleValid(\"a.b\")");
      const actual: boolean = bundleValid("a.b");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}BundleValid_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0008
     * @tc.name      Perf_BundleValid_0008
     * @tc.desc      bundleValid("ABC") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0008 begin`);
      logInfo("bundleValid(\"ABC\")");
      const actual: boolean = bundleValid("ABC");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}BundleValid_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0009
     * @tc.name      Perf_BundleValid_0009
     * @tc.desc      bundleValid("com.samples") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0009 begin`);
      logInfo("bundleValid(\"com.samples\")");
      const actual: boolean = bundleValid("com.samples");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}BundleValid_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0010
     * @tc.name      Perf_BundleValid_0010
     * @tc.desc      bundleValid("com.samples.test.perftest.x") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0010 begin`);
      logInfo("bundleValid(\"com.samples.test.perftest.x\")");
      const actual: boolean = bundleValid("com.samples.test.perftest.x");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}BundleValid_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0011
     * @tc.name      Perf_BundleValid_0011
     * @tc.desc      bundleValid("0") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0011 begin`);
      logInfo("bundleValid(\"0\")");
      const actual: boolean = bundleValid("0");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}BundleValid_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0012
     * @tc.name      Perf_BundleValid_0012
     * @tc.desc      bundleValid("1") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_BundleValid_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BundleValid_0012 begin`);
      logInfo("bundleValid(\"1\")");
      const actual: boolean = bundleValid("1");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}BundleValid_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0013
     * @tc.name      Perf_BundleValid_0013
     * @tc.desc      bundleValid("a b") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0013 begin`);
      logInfo("bundleValid(\"a b\")");
      const actual: boolean = bundleValid("a b");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}BundleValid_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0014
     * @tc.name      Perf_BundleValid_0014
     * @tc.desc      bundleValid("a/b") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0014 begin`);
      logInfo("bundleValid(\"a/b\")");
      const actual: boolean = bundleValid("a/b");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}BundleValid_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0015
     * @tc.name      Perf_BundleValid_0015
     * @tc.desc      bundleValid("a:b") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0015 begin`);
      logInfo("bundleValid(\"a:b\")");
      const actual: boolean = bundleValid("a:b");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}BundleValid_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0016
     * @tc.name      Perf_BundleValid_0016
     * @tc.desc      bundleValid(".") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0016 begin`);
      logInfo("bundleValid(\".\")");
      const actual: boolean = bundleValid(".");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}BundleValid_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0017
     * @tc.name      Perf_BundleValid_0017
     * @tc.desc      bundleValid("..") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0017 begin`);
      logInfo("bundleValid(\"..\")");
      const actual: boolean = bundleValid("..");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}BundleValid_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0018
     * @tc.name      Perf_BundleValid_0018
     * @tc.desc      bundleValid("a.") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_BundleValid_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BundleValid_0018 begin`);
      logInfo("bundleValid(\"a.\")");
      const actual: boolean = bundleValid("a.");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}BundleValid_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0019
     * @tc.name      Perf_BundleValid_0019
     * @tc.desc      bundleValid(".a") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0019 begin`);
      logInfo("bundleValid(\".a\")");
      const actual: boolean = bundleValid(".a");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}BundleValid_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0020
     * @tc.name      Perf_BundleValid_0020
     * @tc.desc      bundleValid("com.") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0020 begin`);
      logInfo("bundleValid(\"com.\")");
      const actual: boolean = bundleValid("com.");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}BundleValid_0020 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0021
     * @tc.name      Perf_BundleValid_0021
     * @tc.desc      bundleValid(".com") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0021 begin`);
      logInfo("bundleValid(\".com\")");
      const actual: boolean = bundleValid(".com");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}BundleValid_0021 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0022
     * @tc.name      Perf_BundleValid_0022
     * @tc.desc      bundleValid("test") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0022 begin`);
      logInfo("bundleValid(\"test\")");
      const actual: boolean = bundleValid("test");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}BundleValid_0022 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0023
     * @tc.name      Perf_BundleValid_0023
     * @tc.desc      bundleValid("perftest") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_BundleValid_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BundleValid_0023 begin`);
      logInfo("bundleValid(\"perftest\")");
      const actual: boolean = bundleValid("perftest");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}BundleValid_0023 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0024
     * @tc.name      Perf_BundleValid_0024
     * @tc.desc      bundleValid("entries") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0024 begin`);
      logInfo("bundleValid(\"entries\")");
      const actual: boolean = bundleValid("entries");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}BundleValid_0024 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0025
     * @tc.name      Perf_BundleValid_0025
     * @tc.desc      bundleValid("MainAbility") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0025 begin`);
      logInfo("bundleValid(\"MainAbility\")");
      const actual: boolean = bundleValid("MainAbility");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}BundleValid_0025 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0026
     * @tc.name      Perf_BundleValid_0026
     * @tc.desc      bundleValid("bundle") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0026 begin`);
      logInfo("bundleValid(\"bundle\")");
      const actual: boolean = bundleValid("bundle");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}BundleValid_0026 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0027
     * @tc.name      Perf_BundleValid_0027
     * @tc.desc      bundleValid("com.samples.test") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0027 begin`);
      logInfo("bundleValid(\"com.samples.test\")");
      const actual: boolean = bundleValid("com.samples.test");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}BundleValid_0027 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0028
     * @tc.name      Perf_BundleValid_0028
     * @tc.desc      bundleValid("com.samples.test.perftest2") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0028 begin`);
      logInfo("bundleValid(\"com.samples.test.perftest2\")");
      const actual: boolean = bundleValid("com.samples.test.perftest2");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}BundleValid_0028 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0029
     * @tc.name      Perf_BundleValid_0029
     * @tc.desc      bundleValid("x") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0029 begin`);
      logInfo("bundleValid(\"x\")");
      const actual: boolean = bundleValid("x");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}BundleValid_0029 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0030
     * @tc.name      Perf_BundleValid_0030
     * @tc.desc      bundleValid("y") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0030 begin`);
      logInfo("bundleValid(\"y\")");
      const actual: boolean = bundleValid("y");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}BundleValid_0030 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0031
     * @tc.name      Perf_BundleValid_0031
     * @tc.desc      bundleValid("z") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0031 begin`);
      logInfo("bundleValid(\"z\")");
      const actual: boolean = bundleValid("z");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}BundleValid_0031 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_BUNDLE_VALID_0032
     * @tc.name      Perf_BundleValid_0032
     * @tc.desc      bundleValid("long.bundle.name.with.many.parts") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_BundleValid_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BundleValid_0032 begin`);
      logInfo("bundleValid(\"long.bundle.name.with.many.parts\")");
      const actual: boolean = bundleValid("long.bundle.name.with.many.parts");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}BundleValid_0032 end`);
    });
  });
}
