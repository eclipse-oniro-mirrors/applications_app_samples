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

import { describe, expect, it, beforeAll, afterAll, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { IsolationModel } from '../Shared/IsolationFixtures';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_dynamicisolationprocess]';
const BUNDLE: string = 'DynamicIsolationProcess_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for describeIsolation (50 cases). */
export default function describeIsolationCoreTest(): void {
  describe('DescribeIsolationCoreTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}DescribeIsolationCoreTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}DescribeIsolationCoreTest end`);
    });
    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0001
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0001
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key0) returns process=com.sample.iso:key0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key0
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key0');
      expect(actual).assertEqual('process=com.sample.iso:key0');
      expect(actual.length).assertEqual(27);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0002
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0002
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key1) returns process=com.sample.iso:key1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key1
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key1');
      expect(actual).assertEqual('process=com.sample.iso:key1');
      expect(actual.length).assertEqual(27);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0003
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0003
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key2) returns process=com.sample.iso:key2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key2
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key2');
      expect(actual).assertEqual('process=com.sample.iso:key2');
      expect(actual.length).assertEqual(27);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0004
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0004
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key3) returns process=com.sample.iso:key3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key3
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key3');
      expect(actual).assertEqual('process=com.sample.iso:key3');
      expect(actual.length).assertEqual(27);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0005
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0005
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key4) returns process=com.sample.iso:key4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key4
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key4');
      expect(actual).assertEqual('process=com.sample.iso:key4');
      expect(actual.length).assertEqual(27);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0006
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0006
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key5) returns process=com.sample.iso:key5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key5
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key5');
      expect(actual).assertEqual('process=com.sample.iso:key5');
      expect(actual.length).assertEqual(27);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0007
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0007
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key6) returns process=com.sample.iso:key6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key6
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key6');
      expect(actual).assertEqual('process=com.sample.iso:key6');
      expect(actual.length).assertEqual(27);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0008
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0008
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key7) returns process=com.sample.iso:key7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key7
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key7');
      expect(actual).assertEqual('process=com.sample.iso:key7');
      expect(actual.length).assertEqual(27);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0009
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0009
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key8) returns process=com.sample.iso:key8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key8
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key8');
      expect(actual).assertEqual('process=com.sample.iso:key8');
      expect(actual.length).assertEqual(27);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0010
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0010
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key9) returns process=com.sample.iso:key9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key9
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key9');
      expect(actual).assertEqual('process=com.sample.iso:key9');
      expect(actual.length).assertEqual(27);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0011
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0011
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key10) returns process=com.sample.iso:key10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key10
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key10');
      expect(actual).assertEqual('process=com.sample.iso:key10');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0012
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0012
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key11) returns process=com.sample.iso:key11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key11
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key11');
      expect(actual).assertEqual('process=com.sample.iso:key11');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0013
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0013
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key12) returns process=com.sample.iso:key12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key12
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key12');
      expect(actual).assertEqual('process=com.sample.iso:key12');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0014
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0014
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key13) returns process=com.sample.iso:key13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key13
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key13');
      expect(actual).assertEqual('process=com.sample.iso:key13');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0015
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0015
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key14) returns process=com.sample.iso:key14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key14
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key14');
      expect(actual).assertEqual('process=com.sample.iso:key14');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0016
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0016
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key15) returns process=com.sample.iso:key15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key15
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key15');
      expect(actual).assertEqual('process=com.sample.iso:key15');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0017
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0017
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key16) returns process=com.sample.iso:key16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key16
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key16');
      expect(actual).assertEqual('process=com.sample.iso:key16');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0018
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0018
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key17) returns process=com.sample.iso:key17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key17
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key17');
      expect(actual).assertEqual('process=com.sample.iso:key17');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0019
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0019
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key18) returns process=com.sample.iso:key18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key18
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key18');
      expect(actual).assertEqual('process=com.sample.iso:key18');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0020
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0020
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key19) returns process=com.sample.iso:key19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key19
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key19');
      expect(actual).assertEqual('process=com.sample.iso:key19');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0021
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0021
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key20) returns process=com.sample.iso:key20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key20
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key20');
      expect(actual).assertEqual('process=com.sample.iso:key20');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0022
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0022
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key21) returns process=com.sample.iso:key21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key21
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key21');
      expect(actual).assertEqual('process=com.sample.iso:key21');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0023
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0023
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key22) returns process=com.sample.iso:key22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key22
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key22');
      expect(actual).assertEqual('process=com.sample.iso:key22');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0024
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0024
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key23) returns process=com.sample.iso:key23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key23
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key23');
      expect(actual).assertEqual('process=com.sample.iso:key23');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0025
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0025
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key24) returns process=com.sample.iso:key24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key24
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key24');
      expect(actual).assertEqual('process=com.sample.iso:key24');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0026
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0026
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key25) returns process=com.sample.iso:key25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key25
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key25');
      expect(actual).assertEqual('process=com.sample.iso:key25');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0027
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0027
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key26) returns process=com.sample.iso:key26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key26
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key26');
      expect(actual).assertEqual('process=com.sample.iso:key26');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0028
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0028
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key27) returns process=com.sample.iso:key27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key27
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key27');
      expect(actual).assertEqual('process=com.sample.iso:key27');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0029
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0029
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key28) returns process=com.sample.iso:key28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key28
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key28');
      expect(actual).assertEqual('process=com.sample.iso:key28');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0030
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0030
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key29) returns process=com.sample.iso:key29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key29
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key29');
      expect(actual).assertEqual('process=com.sample.iso:key29');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0031
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0031
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key30) returns process=com.sample.iso:key30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key30
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key30');
      expect(actual).assertEqual('process=com.sample.iso:key30');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0032
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0032
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key31) returns process=com.sample.iso:key31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key31
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key31');
      expect(actual).assertEqual('process=com.sample.iso:key31');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0033
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0033
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key32) returns process=com.sample.iso:key32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key32
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key32');
      expect(actual).assertEqual('process=com.sample.iso:key32');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0034
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0034
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key33) returns process=com.sample.iso:key33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key33
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key33');
      expect(actual).assertEqual('process=com.sample.iso:key33');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0035
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0035
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key34) returns process=com.sample.iso:key34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key34
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key34');
      expect(actual).assertEqual('process=com.sample.iso:key34');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0036
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0036
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key35) returns process=com.sample.iso:key35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key35
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key35');
      expect(actual).assertEqual('process=com.sample.iso:key35');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0037
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0037
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key36) returns process=com.sample.iso:key36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key36
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key36');
      expect(actual).assertEqual('process=com.sample.iso:key36');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0038
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0038
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key37) returns process=com.sample.iso:key37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key37
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key37');
      expect(actual).assertEqual('process=com.sample.iso:key37');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0039
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0039
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key38) returns process=com.sample.iso:key38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key38
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key38');
      expect(actual).assertEqual('process=com.sample.iso:key38');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0040
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0040
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key39) returns process=com.sample.iso:key39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key39
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key39');
      expect(actual).assertEqual('process=com.sample.iso:key39');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0041
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0041
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key40) returns process=com.sample.iso:key40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key40
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key40');
      expect(actual).assertEqual('process=com.sample.iso:key40');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0042
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0042
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key41) returns process=com.sample.iso:key41.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key41
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key41');
      expect(actual).assertEqual('process=com.sample.iso:key41');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0043
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0043
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key42) returns process=com.sample.iso:key42.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key42
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key42');
      expect(actual).assertEqual('process=com.sample.iso:key42');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0044
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0044
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key43) returns process=com.sample.iso:key43.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key43
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key43');
      expect(actual).assertEqual('process=com.sample.iso:key43');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0045
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0045
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key44) returns process=com.sample.iso:key44.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key44
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key44');
      expect(actual).assertEqual('process=com.sample.iso:key44');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0046
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0046
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key45) returns process=com.sample.iso:key45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key45
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key45');
      expect(actual).assertEqual('process=com.sample.iso:key45');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0047
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0047
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key46) returns process=com.sample.iso:key46.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key46
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key46');
      expect(actual).assertEqual('process=com.sample.iso:key46');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0048
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0048
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key47) returns process=com.sample.iso:key47.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key47
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key47');
      expect(actual).assertEqual('process=com.sample.iso:key47');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0049
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0049
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key48) returns process=com.sample.iso:key48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key48
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key48');
      expect(actual).assertEqual('process=com.sample.iso:key48');
      expect(actual.length).assertEqual(28);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_CORE_0050
     * @tc.name      DynamicIsolationProcess_describeIsolation_Core_0050
     * @tc.desc      [DelimitedString+PlainString] Verify describeIsolation(com.sample.iso, key49) returns process=com.sample.iso:key49.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Core_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString+PlainString; expected: process=com.sample.iso:key49
      const actual: string = IsolationModel.describeIsolation('com.sample.iso', 'key49');
      expect(actual).assertEqual('process=com.sample.iso:key49');
      expect(actual.length).assertEqual(28);
    });

  });
}
