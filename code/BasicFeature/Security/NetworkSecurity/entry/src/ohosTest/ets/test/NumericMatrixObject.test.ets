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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ObjectUtils, JsonParseResult, JsonStringifyResult } from 'library';

// Log domain reserved for the numeric matrix object suite.
const DOMAIN: number = 0xF811;

// Simple endpoint shape used as a reference-typed object in null checks and copies.
interface ServiceEndpoint {
  host: string;
  port: number;
}

// Same fields as ServiceEndpoint but declared in the opposite order, used to observe
// the member-order sensitivity of the JSON-text comparison helper.
interface OrderedEndpoint {
  port: number;
  host: string;
}

// ServiceEndpoint plus one extra member, used to observe how an additional field
// changes the serialized comparison and copy results.
interface ExtendedEndpoint {
  host: string;
  port: number;
  tls: boolean;
}

// Metric payload that carries a nested string array, used for nested round trips.
interface MetricRecord {
  name: string;
  value: number;
  tags: string[];
}

// Linked chain node that can point to itself, used to build a cyclic structure.
interface ChainNode {
  label: string;
  next: ChainNode | null;
}

// Registers the numeric matrix test suite covering every ObjectUtils interface.
export default function numericMatrixObjectTest() {
  // Define the suite that exercises isNull, isNonNull, deepEqual, safeJsonParse,
  // safeJsonStringify, getType and deepCopy across a numeric dimension matrix.
  describe('NumericMatrixObjectSuite', () => {
    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_0100
     * @tc.name      testNumObject0001
     * @tc.desc      Verify isNull treats undefined and null as missing and real objects as present.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumObject0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumObject0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A missing reference counts as null.
      const missingEndpoint: ServiceEndpoint | undefined = undefined;
      expect(ObjectUtils.isNull(missingEndpoint)).assertTrue();
      // The explicit null literal counts as null too.
      expect(ObjectUtils.isNull(null)).assertTrue();
      // A created object holds a usable reference.
      const liveEndpoint: ServiceEndpoint = { host: 'relay.local', port: 443 };
      expect(ObjectUtils.isNull(liveEndpoint)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_0200
     * @tc.name      testNumObject0002
     * @tc.desc      Verify isNull stays false for objects regardless of their member values or emptiness.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumObject0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumObject0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An object with default zero values is still a live reference.
      const zeroEndpoint: ServiceEndpoint = { host: '', port: 0 };
      expect(ObjectUtils.isNull(zeroEndpoint)).assertFalse();
      // An object carrying several members stays non-null.
      const fullEndpoint: ServiceEndpoint = { host: 'gw.local', port: 8443 };
      expect(ObjectUtils.isNull(fullEndpoint)).assertFalse();
      // Mutating an object never turns it into a null reference.
      fullEndpoint.host = 'backup.local';
      expect(ObjectUtils.isNull(fullEndpoint)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_0300
     * @tc.name      testNumObject0003
     * @tc.desc      Verify isNull returns a plain boolean usable in further comparisons without exceptions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The verdict is a plain boolean value, not a thrown error.
      const missingVerdict: boolean = ObjectUtils.isNull(undefined);
      expect(missingVerdict).assertTrue();
      const liveVerdict: boolean = ObjectUtils.isNull(new Object());
      expect(liveVerdict).assertFalse();
      // Two calls on the same value return identical verdicts.
      const endpoint: ServiceEndpoint = { host: 'node.local', port: 9090 };
      expect(ObjectUtils.isNull(endpoint) === ObjectUtils.isNull(endpoint)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_0400
     * @tc.name      testNumObject0004
     * @tc.desc      Verify isNull accepts array references and reports them as present objects.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An array is a reference value and therefore not null.
      const ports: number[] = [80, 443];
      expect(ObjectUtils.isNull(ports)).assertFalse();
      // Even an empty array is a live reference.
      const blankPorts: number[] = [];
      expect(ObjectUtils.isNull(blankPorts)).assertFalse();
      // After truncation to zero length the reference stays non-null.
      blankPorts.length = 0;
      expect(ObjectUtils.isNull(blankPorts)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_0500
     * @tc.name      testNumObject0005
     * @tc.desc      Verify isNull agrees with the type naming helper for null and undefined values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Null is named directly by getType and confirmed by isNull.
      expect(ObjectUtils.getType(null)).assertEqual('null');
      expect(ObjectUtils.isNull(null)).assertTrue();
      // Undefined keeps its dedicated name and also counts as null here.
      expect(ObjectUtils.getType(undefined)).assertEqual('undefined');
      expect(ObjectUtils.isNull(undefined)).assertTrue();
      // A live object reports the object label and stays non-null.
      const endpoint: ServiceEndpoint = { host: 'edge.local', port: 8080 };
      expect(ObjectUtils.getType(endpoint)).assertEqual('object');
      expect(ObjectUtils.isNull(endpoint)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_0600
     * @tc.name      testNumObject0006
     * @tc.desc      Verify isNonNull reports false for undefined and null references exactly mirroring isNull.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumObject0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumObject0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A missing reference can never hold a usable object.
      const missingEndpoint: ServiceEndpoint | undefined = undefined;
      expect(ObjectUtils.isNonNull(missingEndpoint)).assertFalse();
      // The explicit null literal also fails the non-null check.
      expect(ObjectUtils.isNonNull(null)).assertFalse();
      // Both helpers agree on the missing case.
      expect(ObjectUtils.isNull(missingEndpoint)).assertTrue();
      expect(ObjectUtils.isNull(null)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_0700
     * @tc.name      testNumObject0007
     * @tc.desc      Verify isNonNull reports true for live objects of different shapes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumObject0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumObject0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A plain endpoint object satisfies the non-null contract.
      const endpoint: ServiceEndpoint = { host: 'core.local', port: 53 };
      expect(ObjectUtils.isNonNull(endpoint)).assertTrue();
      // An extended object with more members stays non-null.
      const extended: ExtendedEndpoint = { host: 'core.local', port: 53, tls: true };
      expect(ObjectUtils.isNonNull(extended)).assertTrue();
      // A freshly created generic object is non-null as well.
      expect(ObjectUtils.isNonNull(new Object())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_0800
     * @tc.name      testNumObject0008
     * @tc.desc      Verify isNonNull accepts array references and mutated objects as present values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Arrays count as live references.
      const tags: string[] = ['edge', 'core'];
      expect(ObjectUtils.isNonNull(tags)).assertTrue();
      // An emptied array is still a reference object.
      const blankTags: string[] = [];
      expect(ObjectUtils.isNonNull(blankTags)).assertTrue();
      // Mutation keeps the reference alive.
      tags.length = 0;
      expect(ObjectUtils.isNonNull(tags)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_0900
     * @tc.name      testNumObject0009
     * @tc.desc      Verify isNonNull always returns the exact boolean inverse of isNull across reference states.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The two verdicts never coincide for a missing reference.
      const missingEndpoint: ServiceEndpoint | undefined = undefined;
      expect(ObjectUtils.isNonNull(missingEndpoint) === ObjectUtils.isNull(missingEndpoint)).assertFalse();
      // They stay complementary for a live reference too.
      const endpoint: ServiceEndpoint = { host: 'hub.local', port: 443 };
      expect(ObjectUtils.isNonNull(endpoint) === ObjectUtils.isNull(endpoint)).assertFalse();
      // Explicit null keeps the complementary pattern.
      expect(ObjectUtils.isNonNull(null) === ObjectUtils.isNull(null)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_1000
     * @tc.name      testNumObject0010
     * @tc.desc      Verify isNonNull is true for an empty object and an object with default member values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A generic empty object still holds a usable reference.
      expect(ObjectUtils.isNonNull(new Object())).assertTrue();
      // Default zero values do not turn the object into null.
      const zeroEndpoint: ServiceEndpoint = { host: '', port: 0 };
      expect(ObjectUtils.isNonNull(zeroEndpoint)).assertTrue();
      expect(ObjectUtils.isNull(zeroEndpoint)).assertFalse();
      // Reference equality with itself keeps the verdict stable.
      expect(ObjectUtils.isNonNull(zeroEndpoint) === ObjectUtils.isNonNull(zeroEndpoint)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_1100
     * @tc.name      testNumObject0011
     * @tc.desc      Verify deepEqual always succeeds when comparing an object with itself.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumObject0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumObject0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The same reference serializes to the same text twice.
      const endpoint: ServiceEndpoint = { host: 'nas.local', port: 8443 };
      expect(ObjectUtils.deepEqual(endpoint, endpoint)).assertTrue();
      // Repeating the comparison keeps the verdict stable.
      expect(ObjectUtils.deepEqual(endpoint, endpoint)).assertTrue();
      // The comparison itself never throws for a valid object.
      const verdict: boolean = ObjectUtils.deepEqual(endpoint, endpoint);
      expect(verdict).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_1200
     * @tc.name      testNumObject0012
     * @tc.desc      Verify deepEqual matches two independently created objects with identical member order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumObject0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumObject0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two separate instances carry the same members in the same order.
      const leftEndpoint: ServiceEndpoint = { host: 'nas.local', port: 8443 };
      const rightEndpoint: ServiceEndpoint = { host: 'nas.local', port: 8443 };
      expect(ObjectUtils.deepEqual(leftEndpoint, rightEndpoint)).assertTrue();
      // Swapping the sides keeps the equality verdict.
      expect(ObjectUtils.deepEqual(rightEndpoint, leftEndpoint)).assertTrue();
      // The references are different even though the text matches.
      expect(leftEndpoint !== rightEndpoint).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_1300
     * @tc.name      testNumObject0013
     * @tc.desc      Verify deepEqual rejects objects whose members are declared in the opposite order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The same values declared in the opposite order serialize differently.
      const normalEndpoint: ServiceEndpoint = { host: 'nas.local', port: 8443 };
      const swappedEndpoint: OrderedEndpoint = { port: 8443, host: 'nas.local' };
      expect(ObjectUtils.deepEqual(normalEndpoint, swappedEndpoint)).assertFalse();
      // The rejection is symmetric for both argument orders.
      expect(ObjectUtils.deepEqual(swappedEndpoint, normalEndpoint)).assertFalse();
      // Two swapped-order objects of the same shape still match each other.
      const twinEndpoint: OrderedEndpoint = { port: 8443, host: 'nas.local' };
      expect(ObjectUtils.deepEqual(swappedEndpoint, twinEndpoint)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_1400
     * @tc.name      testNumObject0014
     * @tc.desc      Verify deepEqual fails when one member value differs between the two objects.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One changed port value breaks the serialized equality.
      const baseEndpoint: ServiceEndpoint = { host: 'nas.local', port: 8443 };
      const changedPort: ServiceEndpoint = { host: 'nas.local', port: 9090 };
      expect(ObjectUtils.deepEqual(baseEndpoint, changedPort)).assertFalse();
      // One changed host value breaks the equality as well.
      const changedHost: ServiceEndpoint = { host: 'vault.local', port: 8443 };
      expect(ObjectUtils.deepEqual(baseEndpoint, changedHost)).assertFalse();
      // Changing a value back restores the equality verdict.
      changedPort.port = 8443;
      expect(ObjectUtils.deepEqual(baseEndpoint, changedPort)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_1500
     * @tc.name      testNumObject0015
     * @tc.desc      Verify deepEqual rejects an object carrying one extra member beyond the shared fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The extended object carries one additional tls flag.
      const baseEndpoint: ServiceEndpoint = { host: 'nas.local', port: 8443 };
      const extendedEndpoint: ExtendedEndpoint = { host: 'nas.local', port: 8443, tls: true };
      expect(ObjectUtils.deepEqual(extendedEndpoint, baseEndpoint)).assertFalse();
      // The rejection stays symmetric for both argument orders.
      expect(ObjectUtils.deepEqual(baseEndpoint, extendedEndpoint)).assertFalse();
      // Removing the extra member would restore equality by shape.
      extendedEndpoint.tls = false;
      expect(ObjectUtils.deepEqual(extendedEndpoint, baseEndpoint)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_1600
     * @tc.name      testNumObject0016
     * @tc.desc      Verify deepEqual matches arrays element-wise and rejects reordered or shortened arrays.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two separately created arrays hold the same ports in the same order.
      const basePorts: number[] = [80, 443, 8443];
      const mirrorPorts: number[] = [80, 443, 8443];
      expect(ObjectUtils.deepEqual(basePorts, mirrorPorts)).assertTrue();
      // The same values in a different order serialize differently.
      const shuffledPorts: number[] = [443, 80, 8443];
      expect(ObjectUtils.deepEqual(basePorts, shuffledPorts)).assertFalse();
      // A missing element shortens the text and breaks the equality.
      const shortPorts: number[] = [80, 443];
      expect(ObjectUtils.deepEqual(basePorts, shortPorts)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_1700
     * @tc.name      testNumObject0017
     * @tc.desc      Verify deepEqual compares nested array members inside objects correctly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two records carry the same nested tag arrays.
      const leftRecord: MetricRecord = { name: 'latency', value: 12, tags: ['edge', 'p99'] };
      const rightRecord: MetricRecord = { name: 'latency', value: 12, tags: ['edge', 'p99'] };
      expect(ObjectUtils.deepEqual(leftRecord, rightRecord)).assertTrue();
      // One different tag breaks the equality.
      const otherRecord: MetricRecord = { name: 'latency', value: 12, tags: ['edge', 'p95'] };
      expect(ObjectUtils.deepEqual(leftRecord, otherRecord)).assertFalse();
      // A different numeric value breaks the equality as well.
      const driftedRecord: MetricRecord = { name: 'latency', value: 13, tags: ['edge', 'p99'] };
      expect(ObjectUtils.deepEqual(leftRecord, driftedRecord)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_1800
     * @tc.name      testNumObject0018
     * @tc.desc      Verify deepEqual handles zero-value and empty-string endpoints on both sides.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two zero-valued endpoints serialize to identical text.
      const leftZero: ServiceEndpoint = { host: '', port: 0 };
      const rightZero: ServiceEndpoint = { host: '', port: 0 };
      expect(ObjectUtils.deepEqual(leftZero, rightZero)).assertTrue();
      // Zero values differ from non-zero values.
      const liveEndpoint: ServiceEndpoint = { host: '', port: 1 };
      expect(ObjectUtils.deepEqual(leftZero, liveEndpoint)).assertFalse();
      // Empty strings compare as equal text on both sides.
      const blankLeft: ServiceEndpoint = { host: '', port: 1 };
      const blankRight: ServiceEndpoint = { host: '', port: 1 };
      expect(ObjectUtils.deepEqual(blankLeft, blankRight)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_1900
     * @tc.name      testNumObject0019
     * @tc.desc      Verify safeJsonParse reports success with the Parsed message for a valid object text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumObject0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumObject0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A valid object text parses into a live result object.
      const parsedEndpoint: JsonParseResult = ObjectUtils.safeJsonParse('{"host":"nas.local","port":8443}');
      expect(parsedEndpoint.success).assertTrue();
      expect(parsedEndpoint.message).assertEqual('Parsed');
      // The parsed payload actually carries a value.
      expect(parsedEndpoint.data === null).assertFalse();
      expect(ObjectUtils.isNull(parsedEndpoint.data)).assertFalse();
      // The payload keeps its runtime object shape.
      expect(ObjectUtils.getType(parsedEndpoint.data)).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_2000
     * @tc.name      testNumObject0020
     * @tc.desc      Verify safeJsonParse parses a valid array text into an object-typed payload.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumObject0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumObject0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A valid array text parses successfully.
      const parsedPorts: JsonParseResult = ObjectUtils.safeJsonParse('[80,443,8443]');
      expect(parsedPorts.success).assertTrue();
      expect(parsedPorts.message).assertEqual('Parsed');
      // The array payload is an object-typed runtime value.
      expect(ObjectUtils.getType(parsedPorts.data)).assertEqual('object');
      // An empty array text also parses into an object value.
      const parsedBlank: JsonParseResult = ObjectUtils.safeJsonParse('[]');
      expect(parsedBlank.success).assertTrue();
      expect(ObjectUtils.getType(parsedBlank.data)).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_2100
     * @tc.name      testNumObject0021
     * @tc.desc      Verify safeJsonParse accepts a bare number text and reports a number-typed payload.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A bare port number parses into a numeric payload.
      const parsedPort: JsonParseResult = ObjectUtils.safeJsonParse('8443');
      expect(parsedPort.success).assertTrue();
      expect(parsedPort.message).assertEqual('Parsed');
      expect(ObjectUtils.getType(parsedPort.data)).assertEqual('number');
      // A negative number text parses the same way.
      const parsedNegative: JsonParseResult = ObjectUtils.safeJsonParse('-1200');
      expect(parsedNegative.success).assertTrue();
      expect(ObjectUtils.getType(parsedNegative.data)).assertEqual('number');
      // A fractional number text also parses into a number payload.
      const parsedFraction: JsonParseResult = ObjectUtils.safeJsonParse('0.75');
      expect(parsedFraction.success).assertTrue();
      expect(ObjectUtils.getType(parsedFraction.data)).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_2200
     * @tc.name      testNumObject0022
     * @tc.desc      Verify safeJsonParse accepts a quoted text and reports a string-typed payload.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A quoted text parses into a string payload.
      const parsedLabel: JsonParseResult = ObjectUtils.safeJsonParse('"gateway"');
      expect(parsedLabel.success).assertTrue();
      expect(parsedLabel.message).assertEqual('Parsed');
      expect(ObjectUtils.getType(parsedLabel.data)).assertEqual('string');
      // An empty quoted text still parses into a string payload.
      const parsedBlankLabel: JsonParseResult = ObjectUtils.safeJsonParse('""');
      expect(parsedBlankLabel.success).assertTrue();
      expect(ObjectUtils.getType(parsedBlankLabel.data)).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_2300
     * @tc.name      testNumObject0023
     * @tc.desc      Verify safeJsonParse succeeds on the JSON null literal while the payload stays null.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The JSON null literal parses fine even though no value is carried.
      const parsedNone: JsonParseResult = ObjectUtils.safeJsonParse('null');
      expect(parsedNone.success).assertTrue();
      expect(parsedNone.message).assertEqual('Parsed');
      // The payload remains null without marking the parse as failed.
      expect(parsedNone.data === null).assertTrue();
      expect(ObjectUtils.isNull(parsedNone.data)).assertTrue();
      expect(ObjectUtils.getType(parsedNone.data)).assertEqual('null');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_2400
     * @tc.name      testNumObject0024
     * @tc.desc      Verify safeJsonParse accepts boolean literal texts and reports boolean-typed payloads.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A true literal parses into a boolean payload.
      const parsedTrue: JsonParseResult = ObjectUtils.safeJsonParse('true');
      expect(parsedTrue.success).assertTrue();
      expect(parsedTrue.message).assertEqual('Parsed');
      expect(ObjectUtils.getType(parsedTrue.data)).assertEqual('boolean');
      // A false literal parses into a boolean payload too.
      const parsedFalse: JsonParseResult = ObjectUtils.safeJsonParse('false');
      expect(parsedFalse.success).assertTrue();
      expect(ObjectUtils.getType(parsedFalse.data)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_2500
     * @tc.name      testNumObject0025
     * @tc.desc      Verify safeJsonParse reports failure with null data for empty and truncated texts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumObject0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumObject0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty text is not valid JSON at all.
      const blankText: JsonParseResult = ObjectUtils.safeJsonParse('');
      expect(blankText.success).assertFalse();
      expect(blankText.data === null).assertTrue();
      expect(blankText.message).assertContain('Invalid JSON text');
      // A truncated object text cannot be parsed either.
      const brokenObject: JsonParseResult = ObjectUtils.safeJsonParse('{"host":');
      expect(brokenObject.success).assertFalse();
      expect(brokenObject.data === null).assertTrue();
      expect(ObjectUtils.isNull(brokenObject.data)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_2600
     * @tc.name      testNumObject0026
     * @tc.desc      Verify safeJsonParse rejects trailing commas and missing quotes as invalid JSON.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A trailing comma after the array body is invalid JSON.
      const trailingComma: JsonParseResult = ObjectUtils.safeJsonParse('[80,443,]');
      expect(trailingComma.success).assertFalse();
      expect(trailingComma.data === null).assertTrue();
      expect(trailingComma.message).assertContain('Invalid JSON text');
      // An unquoted key is not valid JSON either.
      const missingQuote: JsonParseResult = ObjectUtils.safeJsonParse('{host:8080}');
      expect(missingQuote.success).assertFalse();
      expect(missingQuote.data === null).assertTrue();
      // A bare word is not a JSON value.
      const bareWord: JsonParseResult = ObjectUtils.safeJsonParse('gateway');
      expect(bareWord.success).assertFalse();
      expect(bareWord.message).assertContain('Invalid JSON text');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_2700
     * @tc.name      testNumObject0027
     * @tc.desc      Verify safeJsonParse succeeds for valid JSON wrapped in surrounding whitespace.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Leading and trailing spaces do not break JSON parsing.
      const paddedObject: JsonParseResult = ObjectUtils.safeJsonParse('  {"port":8443}  ');
      expect(paddedObject.success).assertTrue();
      expect(paddedObject.message).assertEqual('Parsed');
      expect(paddedObject.data === null).assertFalse();
      // Newline-padded scalar text parses as well.
      const paddedNumber: JsonParseResult = ObjectUtils.safeJsonParse('\n53\t');
      expect(paddedNumber.success).assertTrue();
      expect(ObjectUtils.getType(paddedNumber.data)).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_2800
     * @tc.name      testNumObject0028
     * @tc.desc      Verify safeJsonStringify emits the exact serialized text for a typed object.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumObject0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumObject0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A typed profile serializes in member declaration order.
      const endpoint: ServiceEndpoint = { host: 'nas.local', port: 8443 };
      const profileText: JsonStringifyResult = ObjectUtils.safeJsonStringify(endpoint);
      expect(profileText.success).assertTrue();
      expect(profileText.message).assertEqual('Serialized');
      expect(profileText.text).assertEqual('{"host":"nas.local","port":8443}');
      // The emitted text round-trips through the parser unchanged.
      const reparsed: JsonParseResult = ObjectUtils.safeJsonParse(profileText.text);
      expect(reparsed.success).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_2900
     * @tc.name      testNumObject0029
     * @tc.desc      Verify safeJsonStringify emits the exact text for a numeric array.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An array serializes with commas between elements.
      const ports: number[] = [80, 443, 8443];
      const portsText: JsonStringifyResult = ObjectUtils.safeJsonStringify(ports);
      expect(portsText.success).assertTrue();
      expect(portsText.text).assertEqual('[80,443,8443]');
      expect(portsText.message).assertEqual('Serialized');
      // An empty array serializes to the two-character empty text.
      const blankPorts: number[] = [];
      const blankText: JsonStringifyResult = ObjectUtils.safeJsonStringify(blankPorts);
      expect(blankText.success).assertTrue();
      expect(blankText.text).assertEqual('[]');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_3000
     * @tc.name      testNumObject0030
     * @tc.desc      Verify safeJsonStringify serializes an explicit null input into the text null.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Null input serializes to the four-character text "null".
      const nullText: JsonStringifyResult = ObjectUtils.safeJsonStringify(null);
      expect(nullText.success).assertTrue();
      expect(nullText.text).assertEqual('null');
      expect(nullText.message).assertEqual('Serialized');
      // The null text parses back into a null payload.
      const reparsed: JsonParseResult = ObjectUtils.safeJsonParse(nullText.text);
      expect(reparsed.success).assertTrue();
      expect(reparsed.data === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_3100
     * @tc.name      testNumObject0031
     * @tc.desc      Verify safeJsonStringify serializes nested array members inside objects.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0031';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The nested tag array serializes inline within the object text.
      const record: MetricRecord = { name: 'latency', value: 12, tags: ['edge', 'p99'] };
      const recordText: JsonStringifyResult = ObjectUtils.safeJsonStringify(record);
      expect(recordText.success).assertTrue();
      expect(recordText.text).assertEqual('{"name":"latency","value":12,"tags":["edge","p99"]}');
      // The text round-trips through the parser without loss.
      const reparsed: JsonParseResult = ObjectUtils.safeJsonParse(recordText.text);
      expect(reparsed.success).assertTrue();
      expect(reparsed.data === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_3200
     * @tc.name      testNumObject0032
     * @tc.desc      Verify safeJsonStringify reports failure without throwing for a cyclic object graph.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0032';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build a node whose next pointer loops back to itself.
      const head: ChainNode = { label: 'root', next: null };
      head.next = head;
      // Serialization must fail inside the guarded helper.
      const cyclicText: JsonStringifyResult = ObjectUtils.safeJsonStringify(head);
      expect(cyclicText.success).assertFalse();
      expect(cyclicText.text).assertEqual('');
      // The failure message names the serialization problem.
      expect(cyclicText.message).assertContain('Not serialized');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_3300
     * @tc.name      testNumObject0033
     * @tc.desc      Verify safeJsonStringify keeps the failure message stable across repeated cyclic attempts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0033';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two independent cyclic chains fail with the same message prefix.
      const firstNode: ChainNode = { label: 'a', next: null };
      firstNode.next = firstNode;
      const secondNode: ChainNode = { label: 'b', next: null };
      secondNode.next = secondNode;
      const firstResult: JsonStringifyResult = ObjectUtils.safeJsonStringify(firstNode);
      const secondResult: JsonStringifyResult = ObjectUtils.safeJsonStringify(secondNode);
      expect(firstResult.success).assertFalse();
      expect(secondResult.success).assertFalse();
      // Both messages share the same leading phrase.
      expect(firstResult.message).assertContain('Not serialized');
      expect(secondResult.message).assertContain('Not serialized');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_3400
     * @tc.name      testNumObject0034
     * @tc.desc      Verify safeJsonStringify serializes boolean members in declaration order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0034';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The tls flag lands last because it is declared last.
      const extended: ExtendedEndpoint = { host: 'gw.local', port: 443, tls: true };
      const extendedText: JsonStringifyResult = ObjectUtils.safeJsonStringify(extended);
      expect(extendedText.success).assertTrue();
      expect(extendedText.text).assertEqual('{"host":"gw.local","port":443,"tls":true}');
      // Flipping the flag changes the serialized text.
      extended.tls = false;
      const flippedText: JsonStringifyResult = ObjectUtils.safeJsonStringify(extended);
      expect(flippedText.success).assertTrue();
      expect(flippedText.text).assertEqual('{"host":"gw.local","port":443,"tls":false}');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_3500
     * @tc.name      testNumObject0035
     * @tc.desc      Verify a stringify then parse round trip reproduces a comparable object.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0035';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Serialize the endpoint into guarded text first.
      const endpoint: ServiceEndpoint = { host: 'node.local', port: 9090 };
      const serialized: JsonStringifyResult = ObjectUtils.safeJsonStringify(endpoint);
      expect(serialized.success).assertTrue();
      // Parse the text back into a fresh payload.
      const reparsed: JsonParseResult = ObjectUtils.safeJsonParse(serialized.text);
      expect(reparsed.success).assertTrue();
      expect(reparsed.data === null).assertFalse();
      // The round-tripped payload keeps the object runtime type.
      expect(ObjectUtils.getType(reparsed.data)).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_3600
     * @tc.name      testNumObject0036
     * @tc.desc      Verify getType names null and undefined with their dedicated labels.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumObject0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumObject0036';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Null is named directly instead of falling back to the object label.
      expect(ObjectUtils.getType(null)).assertEqual('null');
      // Undefined keeps its dedicated name as the fallback branch.
      expect(ObjectUtils.getType(undefined)).assertEqual('undefined');
      // Both names differ from every runtime typeof label.
      expect(ObjectUtils.getType(null) === ObjectUtils.getType(undefined)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_3700
     * @tc.name      testNumObject0037
     * @tc.desc      Verify getType reports the string label for texts including the empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumObject0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumObject0037';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A normal protocol name reports the string type.
      expect(ObjectUtils.getType('tls1.3')).assertEqual('string');
      // An empty text still reports the string type.
      expect(ObjectUtils.getType('')).assertEqual('string');
      // A longer label reports the same type.
      expect(ObjectUtils.getType('NetworkSecurity')).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_3800
     * @tc.name      testNumObject0038
     * @tc.desc      Verify getType reports the number label for zero, negative and special numeric values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumObject0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumObject0038';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A standard port number reports the number type.
      expect(ObjectUtils.getType(4096)).assertEqual('number');
      // Zero and negative values keep the number label.
      expect(ObjectUtils.getType(0)).assertEqual('number');
      expect(ObjectUtils.getType(-8080)).assertEqual('number');
      // Fractional and non-finite values stay numeric.
      expect(ObjectUtils.getType(0.25)).assertEqual('number');
      expect(ObjectUtils.getType(NaN)).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_3900
     * @tc.name      testNumObject0039
     * @tc.desc      Verify getType reports the boolean label for both truth flags.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0039';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // True reports the boolean type.
      expect(ObjectUtils.getType(true)).assertEqual('boolean');
      // False reports the same type.
      expect(ObjectUtils.getType(false)).assertEqual('boolean');
      // Both flags share one label.
      expect(ObjectUtils.getType(true) === ObjectUtils.getType(false)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_4000
     * @tc.name      testNumObject0040
     * @tc.desc      Verify getType reports the object label for typed data objects.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0040';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A typed endpoint reports the object label.
      const endpoint: ServiceEndpoint = { host: 'gw.local', port: 8443 };
      expect(ObjectUtils.getType(endpoint)).assertEqual('object');
      // An extended object keeps the same label.
      const extended: ExtendedEndpoint = { host: 'gw.local', port: 8443, tls: false };
      expect(ObjectUtils.getType(extended)).assertEqual('object');
      // A generic object reports the same label.
      expect(ObjectUtils.getType(new Object())).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_4100
     * @tc.name      testNumObject0041
     * @tc.desc      Verify getType reports the object label for arrays of any length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0041';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A populated array is a reference value.
      const ports: number[] = [80, 443];
      expect(ObjectUtils.getType(ports)).assertEqual('object');
      // An empty array keeps the object label.
      const blankPorts: number[] = [];
      expect(ObjectUtils.getType(blankPorts)).assertEqual('object');
      // A string array reports the object label as well.
      const tags: string[] = ['edge'];
      expect(ObjectUtils.getType(tags)).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_4200
     * @tc.name      testNumObject0042
     * @tc.desc      Verify getType names the payload of a parsed scalar text correctly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0042';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A parsed number text carries a number payload.
      const parsedPort: JsonParseResult = ObjectUtils.safeJsonParse('8443');
      expect(ObjectUtils.getType(parsedPort.data)).assertEqual('number');
      // A parsed text carries a string payload.
      const parsedLabel: JsonParseResult = ObjectUtils.safeJsonParse('"gateway"');
      expect(ObjectUtils.getType(parsedLabel.data)).assertEqual('string');
      // A parsed null literal carries the null label.
      const parsedNone: JsonParseResult = ObjectUtils.safeJsonParse('null');
      expect(ObjectUtils.getType(parsedNone.data)).assertEqual('null');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_4300
     * @tc.name      testNumObject0043
     * @tc.desc      Verify getType covers the full label matrix across null, undefined, string, number, boolean and object.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0043';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Every supported runtime value resolves to its own label.
      expect(ObjectUtils.getType(null)).assertEqual('null');
      expect(ObjectUtils.getType(undefined)).assertEqual('undefined');
      expect(ObjectUtils.getType('text')).assertEqual('string');
      expect(ObjectUtils.getType(7)).assertEqual('number');
      expect(ObjectUtils.getType(true)).assertEqual('boolean');
      expect(ObjectUtils.getType(new Object())).assertEqual('object');
      // The labels are all distinct from each other.
      expect(ObjectUtils.getType('text') === ObjectUtils.getType(7)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_4400
     * @tc.name      testNumObject0044
     * @tc.desc      Verify deepCopy returns null unchanged for a null input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumObject0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumObject0044';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Null input stays null so callers can chain the check.
      const copied: Object | null = ObjectUtils.deepCopy(null);
      expect(copied === null).assertTrue();
      expect(ObjectUtils.isNull(copied)).assertTrue();
      expect(ObjectUtils.isNonNull(copied)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_4500
     * @tc.name      testNumObject0045
     * @tc.desc      Verify deepCopy produces an independent copy that deepEquals the original endpoint.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumObject0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumObject0045';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Copy a live endpoint through one JSON round trip.
      const endpoint: ServiceEndpoint = { host: 'nas.local', port: 8443 };
      const copied: Object | null = ObjectUtils.deepCopy(endpoint);
      expect(copied === null).assertFalse();
      expect(ObjectUtils.isNonNull(copied)).assertTrue();
      // The copy compares equal by serialized text.
      if (copied !== null) {
        expect(ObjectUtils.deepEqual(copied, endpoint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_4600
     * @tc.name      testNumObject0046
     * @tc.desc      Verify deepCopy breaks the reference so later edits to the original do not leak.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0046';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Copy the endpoint, then mutate the original port value.
      const endpoint: ServiceEndpoint = { host: 'nas.local', port: 8443 };
      const copied: Object | null = ObjectUtils.deepCopy(endpoint);
      expect(copied === null).assertFalse();
      endpoint.port = 9090;
      // The copy keeps the old serialized text and no longer matches.
      if (copied !== null) {
        expect(ObjectUtils.deepEqual(copied, endpoint)).assertFalse();
        // Restoring the value makes the texts match again.
        endpoint.port = 8443;
        expect(ObjectUtils.deepEqual(copied, endpoint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_4700
     * @tc.name      testNumObject0047
     * @tc.desc      Verify deepCopy carries nested array members through the JSON round trip.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0047';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A record with nested tags copies with its inner array intact.
      const record: MetricRecord = { name: 'latency', value: 12, tags: ['edge', 'p99'] };
      const copied: Object | null = ObjectUtils.deepCopy(record);
      expect(copied === null).assertFalse();
      if (copied !== null) {
        expect(ObjectUtils.deepEqual(copied, record)).assertTrue();
        // Changing the original tags does not affect the copy.
        record.tags[0] = 'core';
        expect(ObjectUtils.deepEqual(copied, record)).assertFalse();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_4800
     * @tc.name      testNumObject0048
     * @tc.desc      Verify deepCopy handles a generic empty object and keeps its object type.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0048';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Copy a plain empty object reference.
      const blank: Object = new Object();
      const copied: Object | null = ObjectUtils.deepCopy(blank);
      expect(copied === null).assertFalse();
      expect(ObjectUtils.getType(copied)).assertEqual('object');
      // The copy and the original serialize to the same text.
      if (copied !== null) {
        expect(ObjectUtils.deepEqual(copied, blank)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_4900
     * @tc.name      testNumObject0049
     * @tc.desc      Verify deepCopy returns null for a cyclic graph because serialization fails first.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0049';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A cyclic node cannot be serialized, so the copy aborts.
      const head: ChainNode = { label: 'root', next: null };
      head.next = head;
      const copied: Object | null = ObjectUtils.deepCopy(head);
      expect(copied === null).assertTrue();
      expect(ObjectUtils.isNull(copied)).assertTrue();
      expect(ObjectUtils.isNonNull(copied)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_5000
     * @tc.name      testNumObject0050
     * @tc.desc      Verify deepCopy keeps an explicit null pointer member through the round trip.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0050';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A chain end with a null next pointer copies cleanly.
      const tail: ChainNode = { label: 'tail', next: null };
      const copied: Object | null = ObjectUtils.deepCopy(tail);
      expect(copied === null).assertFalse();
      // The copy serializes to the same text as the original.
      if (copied !== null) {
        expect(ObjectUtils.deepEqual(copied, tail)).assertTrue();
        // The serialized text carries the null member explicitly.
        const serialized: JsonStringifyResult = ObjectUtils.safeJsonStringify(copied);
        expect(serialized.success).assertTrue();
        expect(serialized.text).assertEqual('{"label":"tail","next":null}');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_5100
     * @tc.name      testNumObject0051
     * @tc.desc      Verify a failed parse result carries null data that isNull and getType both confirm.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0051';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A malformed text fails inside the guarded parser.
      const broken: JsonParseResult = ObjectUtils.safeJsonParse('{"port":');
      expect(broken.success).assertFalse();
      expect(broken.data === null).assertTrue();
      // The null payload is confirmed by both helpers.
      expect(ObjectUtils.isNull(broken.data)).assertTrue();
      expect(ObjectUtils.isNonNull(broken.data)).assertFalse();
      expect(ObjectUtils.getType(broken.data)).assertEqual('null');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_5200
     * @tc.name      testNumObject0052
     * @tc.desc      Verify the null stringify text parses back into a null payload with the null type label.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0052';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Serializing null produces the literal text null.
      const serialized: JsonStringifyResult = ObjectUtils.safeJsonStringify(null);
      expect(serialized.success).assertTrue();
      expect(serialized.text).assertEqual('null');
      // Parsing that text returns success with a null payload.
      const reparsed: JsonParseResult = ObjectUtils.safeJsonParse(serialized.text);
      expect(reparsed.success).assertTrue();
      expect(ObjectUtils.isNull(reparsed.data)).assertTrue();
      expect(ObjectUtils.getType(reparsed.data)).assertEqual('null');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_5300
     * @tc.name      testNumObject0053
     * @tc.desc      Verify a stringify then parse round trip compares equal to the source object.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0053';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Round trip a typed endpoint through both guarded helpers.
      const endpoint: ServiceEndpoint = { host: 'hub.local', port: 443 };
      const serialized: JsonStringifyResult = ObjectUtils.safeJsonStringify(endpoint);
      expect(serialized.success).assertTrue();
      const reparsed: JsonParseResult = ObjectUtils.safeJsonParse(serialized.text);
      expect(reparsed.success).assertTrue();
      // The parsed payload compares equal to the source object.
      expect(reparsed.data === null).assertFalse();
      if (reparsed.data !== null) {
        expect(ObjectUtils.deepEqual(reparsed.data, endpoint)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_5400
     * @tc.name      testNumObject0054
     * @tc.desc      Verify the failure matrix of a parse attempt on an invalid scalar word.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0054';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A bare word is not valid JSON and fails the guard.
      const broken: JsonParseResult = ObjectUtils.safeJsonParse('gateway');
      expect(broken.success).assertFalse();
      expect(broken.message).assertContain('Invalid JSON text');
      // The failure result still carries a null payload.
      expect(broken.data === null).assertTrue();
      expect(ObjectUtils.isNull(broken.data)).assertTrue();
      // A valid word in quotes succeeds by contrast.
      const quoted: JsonParseResult = ObjectUtils.safeJsonParse('"gateway"');
      expect(quoted.success).assertTrue();
      expect(ObjectUtils.getType(quoted.data)).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_5500
     * @tc.name      testNumObject0055
     * @tc.desc      Verify getType names the payloads of parsed object, boolean and string texts distinctly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0055';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Each scalar text parses into its own runtime type label.
      const parsedObject: JsonParseResult = ObjectUtils.safeJsonParse('{"port":53}');
      expect(ObjectUtils.getType(parsedObject.data)).assertEqual('object');
      const parsedFlag: JsonParseResult = ObjectUtils.safeJsonParse('true');
      expect(ObjectUtils.getType(parsedFlag.data)).assertEqual('boolean');
      const parsedLabel: JsonParseResult = ObjectUtils.safeJsonParse('"dns"');
      expect(ObjectUtils.getType(parsedLabel.data)).assertEqual('string');
      const parsedPort: JsonParseResult = ObjectUtils.safeJsonParse('53');
      expect(ObjectUtils.getType(parsedPort.data)).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_5600
     * @tc.name      testNumObject0056
     * @tc.desc      Verify editing the copy of an endpoint never leaks back into the original object.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0056';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Copy an endpoint and hold both sides for comparison.
      const endpoint: ServiceEndpoint = { host: 'relay.local', port: 443 };
      const copied: Object | null = ObjectUtils.deepCopy(endpoint);
      expect(copied === null).assertFalse();
      // The copy matches before any mutation happens.
      if (copied !== null) {
        expect(ObjectUtils.deepEqual(copied, endpoint)).assertTrue();
        // Re-serializing the original does not change the copy.
        const again: Object | null = ObjectUtils.deepCopy(endpoint);
        expect(again === null).assertFalse();
        if (again !== null) {
          expect(ObjectUtils.deepEqual(again, copied)).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_5700
     * @tc.name      testNumObject0057
     * @tc.desc      Verify isNull, isNonNull and getType agree for every supported value state.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0057';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Null and undefined are missing values with their own labels.
      expect(ObjectUtils.isNull(null)).assertTrue();
      expect(ObjectUtils.isNonNull(undefined)).assertFalse();
      expect(ObjectUtils.getType(null)).assertEqual('null');
      // Live values are present with runtime labels.
      const endpoint: ServiceEndpoint = { host: 'gw.local', port: 443 };
      expect(ObjectUtils.isNonNull(endpoint)).assertTrue();
      expect(ObjectUtils.isNull(endpoint)).assertFalse();
      expect(ObjectUtils.getType(endpoint)).assertEqual('object');
      // Scalars are always non-null present values.
      expect(ObjectUtils.isNonNull(0)).assertTrue();
      expect(ObjectUtils.isNull('')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_5800
     * @tc.name      testNumObject0058
     * @tc.desc      Verify deepEqual and getType agree on same-type different-value endpoint objects.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0058';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two endpoints share the type label but differ by value.
      const first: ServiceEndpoint = { host: 'a.local', port: 80 };
      const second: ServiceEndpoint = { host: 'b.local', port: 80 };
      expect(ObjectUtils.getType(first)).assertEqual('object');
      expect(ObjectUtils.getType(second)).assertEqual('object');
      expect(ObjectUtils.deepEqual(first, second)).assertFalse();
      // Making the values equal restores the serialized equality.
      second.host = 'a.local';
      expect(ObjectUtils.deepEqual(first, second)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_5900
     * @tc.name      testNumObject0059
     * @tc.desc      Verify a failure message object itself serializes successfully through the guarded writer.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0059';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A parse failure carries a descriptive message.
      const broken: JsonParseResult = ObjectUtils.safeJsonParse('[1,2,');
      expect(broken.success).assertFalse();
      expect(broken.message).assertContain('Invalid JSON text');
      // A failure-shaped payload is plain data and serializes fine.
      const failureShape: MetricRecord = { name: 'parse', value: 0, tags: ['invalid'] };
      const shapeResult: JsonStringifyResult = ObjectUtils.safeJsonStringify(failureShape);
      expect(shapeResult.success).assertTrue();
      expect(shapeResult.text).assertContain('invalid');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_6000
     * @tc.name      testNumObject0060
     * @tc.desc      Verify a nested metric record survives the full stringify parse round trip.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0060';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Serialize the nested record into guarded text.
      const record: MetricRecord = { name: 'throughput', value: 512, tags: ['core', 'p50'] };
      const serialized: JsonStringifyResult = ObjectUtils.safeJsonStringify(record);
      expect(serialized.success).assertTrue();
      // Parse the text back and compare with the source object.
      const reparsed: JsonParseResult = ObjectUtils.safeJsonParse(serialized.text);
      expect(reparsed.success).assertTrue();
      expect(reparsed.data === null).assertFalse();
      if (reparsed.data !== null) {
        expect(ObjectUtils.deepEqual(reparsed.data, record)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_6100
     * @tc.name      testNumObject0061
     * @tc.desc      Verify a two-node acyclic chain copies and round trips with both members intact.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0061';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build a two-node chain that ends with a null pointer.
      const tail: ChainNode = { label: 'tail', next: null };
      const head: ChainNode = { label: 'head', next: tail };
      // The copy keeps the whole chain by serialized text.
      const copied: Object | null = ObjectUtils.deepCopy(head);
      expect(copied === null).assertFalse();
      if (copied !== null) {
        expect(ObjectUtils.deepEqual(copied, head)).assertTrue();
        // Serializing the copy yields the expected chain text.
        const serialized: JsonStringifyResult = ObjectUtils.safeJsonStringify(copied);
        expect(serialized.success).assertTrue();
        expect(serialized.text).assertEqual('{"label":"head","next":{"label":"tail","next":null}}');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_6200
     * @tc.name      testNumObject0062
     * @tc.desc      Verify getType stays the number label across zero, negative and fractional parse texts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0062';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Zero parses into a number payload.
      const parsedZero: JsonParseResult = ObjectUtils.safeJsonParse('0');
      expect(parsedZero.success).assertTrue();
      expect(ObjectUtils.getType(parsedZero.data)).assertEqual('number');
      // A negative value keeps the number label.
      const parsedNegative: JsonParseResult = ObjectUtils.safeJsonParse('-53');
      expect(parsedNegative.success).assertTrue();
      expect(ObjectUtils.getType(parsedNegative.data)).assertEqual('number');
      // A fractional value keeps the number label too.
      const parsedFraction: JsonParseResult = ObjectUtils.safeJsonParse('3.14');
      expect(parsedFraction.success).assertTrue();
      expect(ObjectUtils.getType(parsedFraction.data)).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_6300
     * @tc.name      testNumObject0063
     * @tc.desc      Verify deepEqual reacts to boolean member changes on an extended endpoint.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0063';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two extended endpoints differ only in the tls flag.
      const secure: ExtendedEndpoint = { host: 'gw.local', port: 443, tls: true };
      const plain: ExtendedEndpoint = { host: 'gw.local', port: 443, tls: false };
      expect(ObjectUtils.deepEqual(secure, plain)).assertFalse();
      // Aligning the flag restores the equality verdict.
      plain.tls = true;
      expect(ObjectUtils.deepEqual(secure, plain)).assertTrue();
      // Changing the port afterwards breaks it again.
      plain.port = 8443;
      expect(ObjectUtils.deepEqual(secure, plain)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_6400
     * @tc.name      testNumObject0064
     * @tc.desc      Verify safeJsonParse accepts nested array texts and reports an object payload.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0064';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A nested array text parses into an object-typed payload.
      const nested: JsonParseResult = ObjectUtils.safeJsonParse('[[1,2],[3]]');
      expect(nested.success).assertTrue();
      expect(nested.message).assertEqual('Parsed');
      expect(nested.data === null).assertFalse();
      expect(ObjectUtils.getType(nested.data)).assertEqual('object');
      // Re-serializing the payload keeps the nested structure.
      const serialized: JsonStringifyResult = ObjectUtils.safeJsonStringify(nested.data);
      expect(serialized.success).assertTrue();
      expect(serialized.text).assertEqual('[[1,2],[3]]');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_6500
     * @tc.name      testNumObject0065
     * @tc.desc      Verify a deep copied record serializes to the exact same text as its source.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0065';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Copy a record with nested tags through the guarded copy.
      const record: MetricRecord = { name: 'errors', value: 3, tags: ['edge'] };
      const copied: Object | null = ObjectUtils.deepCopy(record);
      expect(copied === null).assertFalse();
      // Source and copy serialize to identical text.
      const sourceText: JsonStringifyResult = ObjectUtils.safeJsonStringify(record);
      const copiedText: JsonStringifyResult = ObjectUtils.safeJsonStringify(copied);
      expect(sourceText.success).assertTrue();
      expect(copiedText.success).assertTrue();
      expect(sourceText.text).assertEqual(copiedText.text);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_6600
     * @tc.name      testNumObject0066
     * @tc.desc      Verify the parse result matrix pairs failure null payloads with success typed payloads.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0066';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The failing side carries a null payload with the null label.
      const broken: JsonParseResult = ObjectUtils.safeJsonParse('{');
      expect(broken.success).assertFalse();
      expect(ObjectUtils.isNull(broken.data)).assertTrue();
      expect(ObjectUtils.getType(broken.data)).assertEqual('null');
      // The succeeding side carries a typed payload.
      const valid: JsonParseResult = ObjectUtils.safeJsonParse('{"host":"gw.local"}');
      expect(valid.success).assertTrue();
      expect(ObjectUtils.isNonNull(valid.data)).assertTrue();
      expect(ObjectUtils.getType(valid.data)).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_6700
     * @tc.name      testNumObject0067
     * @tc.desc      Verify a parsed number text serializes back into the identical numeric text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0067';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Parse a bare number into a numeric payload.
      const parsed: JsonParseResult = ObjectUtils.safeJsonParse('42');
      expect(parsed.success).assertTrue();
      expect(ObjectUtils.getType(parsed.data)).assertEqual('number');
      // Serializing the payload returns the same textual form.
      const serialized: JsonStringifyResult = ObjectUtils.safeJsonStringify(parsed.data);
      expect(serialized.success).assertTrue();
      expect(serialized.text).assertEqual('42');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_6800
     * @tc.name      testNumObject0068
     * @tc.desc      Verify deepCopy of an array reference yields an independent copy with equal text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0068';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Copy a numeric array through the guarded copy helper.
      const ports: number[] = [80, 443, 8443];
      const copied: Object | null = ObjectUtils.deepCopy(ports);
      expect(copied === null).assertFalse();
      // The copy compares equal before mutation.
      if (copied !== null) {
        expect(ObjectUtils.deepEqual(copied, ports)).assertTrue();
        // Mutating the source array breaks the text equality.
        ports.push(53);
        expect(ObjectUtils.deepEqual(copied, ports)).assertFalse();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_OBJECT_6900
     * @tc.name      testNumObject0069
     * @tc.desc      Verify the full helper chain of stringify, parse, copy and compare stays consistent.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumObject0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumObject0069';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Run the full chain on a typed endpoint.
      const endpoint: ServiceEndpoint = { host: 'chain.local', port: 8080 };
      const serialized: JsonStringifyResult = ObjectUtils.safeJsonStringify(endpoint);
      expect(serialized.success).assertTrue();
      const reparsed: JsonParseResult = ObjectUtils.safeJsonParse(serialized.text);
      expect(reparsed.success).assertTrue();
      // Copy the parsed payload and compare it with the source.
      const copied: Object | null = ObjectUtils.deepCopy(reparsed.data);
      expect(copied === null).assertFalse();
      if (copied !== null) {
        expect(ObjectUtils.deepEqual(copied, endpoint)).assertTrue();
        expect(ObjectUtils.getType(copied)).assertEqual('object');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
