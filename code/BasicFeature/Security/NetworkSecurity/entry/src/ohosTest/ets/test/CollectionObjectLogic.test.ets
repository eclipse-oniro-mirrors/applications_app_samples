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
import { CollectionUtils, ObjectUtils, JsonParseResult, JsonStringifyResult } from 'library';

// Simple data shape used as a reference-typed object in dedup, null check and copy cases.
interface DeviceProfile {
  host: string;
  port: number;
}

// Same fields as DeviceProfile but declared in the opposite order, used to observe
// the member-order sensitivity of the JSON-text comparison helper.
interface OrderedProfile {
  port: number;
  host: string;
}

// DeviceProfile plus one extra member, used to observe how an additional field
// changes the serialized comparison result.
interface ExtendedProfile {
  host: string;
  port: number;
  tls: boolean;
}

// Severity and delivery channel of one alert, used as the grouped payload.
interface AlertMessage {
  severity: string;
  channel: string;
}

// Linked chain node that can point to itself, used to build a cyclic structure.
interface ChainNode {
  label: string;
  next: ChainNode | null;
}

// Registers the pure logic test suite for the collection helpers and the object helpers.
export default function collectionObjectLogicTest() {
  // Define the logic test suite that contains all CollectionUtils and ObjectUtils cases.
  describe('CollectionObjectLogicSuite', () => {
    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_COLLOBJ_0100
     * @tc.name      testCollObj0001
     * @tc.desc      Verify isEmpty and isNotEmpty agree on undefined, empty, single-element and multi-element arrays.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCollObj0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // A missing array behaves exactly like an empty one.
      const missingList: string[] | undefined = undefined;
      expect(CollectionUtils.isEmpty<string>(missingList)).assertTrue();
      expect(CollectionUtils.isNotEmpty<string>(missingList)).assertFalse();
      // An array without elements still counts as empty.
      const blankList: number[] = [];
      expect(CollectionUtils.isEmpty(blankList)).assertTrue();
      expect(CollectionUtils.isNotEmpty(blankList)).assertFalse();
      // One element is enough to make the array non-empty.
      const singleItem: string[] = ['primary'];
      expect(CollectionUtils.isEmpty(singleItem)).assertFalse();
      expect(CollectionUtils.isNotEmpty(singleItem)).assertTrue();
      // Several elements stay non-empty as well.
      const pairItems: number[] = [7, 8];
      expect(CollectionUtils.isEmpty(pairItems)).assertFalse();
      expect(CollectionUtils.isNotEmpty(pairItems)).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_COLLOBJ_0200
     * @tc.name      testCollObj0002
     * @tc.desc      Verify unique removes repeated numbers, keeps the first-seen order and leaves the input untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCollObj0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Source values carry repeats out of order on purpose.
      const scores: number[] = [87, 64, 87, 92, 64, 87];
      // Deduplicate while keeping the order of the first appearance.
      const distinct: number[] = CollectionUtils.unique(scores);
      // Exactly three distinct values survive.
      expect(distinct.length).assertEqual(3);
      // The order follows the first occurrence of each value.
      expect(distinct[0]).assertEqual(87);
      expect(distinct[1]).assertEqual(64);
      expect(distinct[2]).assertEqual(92);
      // The source array stays untouched after the call.
      expect(scores.length).assertEqual(6);
      // The result is a new array, not the same reference.
      expect(distinct !== scores).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_COLLOBJ_0300
     * @tc.name      testCollObj0003
     * @tc.desc      Verify unique deduplicates text roles and yields an empty array for undefined or empty input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCollObj0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Roles list repeats two of the four entries.
      const roles: string[] = ['reader', 'admin', 'reader', 'auditor', 'admin'];
      // Deduplicated output keeps the first-seen order.
      const distinctRoles: string[] = CollectionUtils.unique(roles);
      expect(distinctRoles.length).assertEqual(3);
      expect(distinctRoles[0]).assertEqual('reader');
      expect(distinctRoles[1]).assertEqual('admin');
      expect(distinctRoles[2]).assertEqual('auditor');
      // A missing array collapses to an empty result.
      expect(CollectionUtils.unique<string>(undefined).length).assertEqual(0);
      // An already empty array stays empty.
      const noRoles: string[] = [];
      expect(CollectionUtils.unique(noRoles).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_COLLOBJ_0400
     * @tc.name      testCollObj0004
     * @tc.desc      Verify unique deduplicates by reference so repeated instances stay and identical instances do not merge.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCollObj0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Two separately created profiles hold identical field values but differ in identity.
      const edgeOne: DeviceProfile = { host: 'edge.local', port: 443 };
      const edgeTwo: DeviceProfile = { host: 'edge.local', port: 443 };
      // The same instance appears twice in the list.
      const endpointList: DeviceProfile[] = [edgeOne, edgeTwo, edgeOne];
      // Deduplication keeps the first occurrence of every distinct element.
      const endpointUnique: DeviceProfile[] = CollectionUtils.unique(endpointList);
      // The repeated instance merges into one entry, the twin survives.
      expect(endpointUnique.length).assertEqual(2);
      // The first kept element is the first inserted instance.
      expect(endpointUnique[0] === edgeOne).assertTrue();
      // The second kept element is the separately created twin, not the repeated instance.
      expect(endpointUnique[1] === edgeTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_COLLOBJ_0500
     * @tc.name      testCollObj0005
     * @tc.desc      Verify chunk slices five elements into consecutive pairs and keeps a one-element tail chunk.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCollObj0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Five values do not divide evenly by the chunk size two.
      const readings: number[] = [11, 22, 33, 44, 55];
      // Split into consecutive slices of at most two elements.
      const chunks: number[][] = CollectionUtils.chunk(readings, 2);
      // The leftover element lands in its own tail chunk.
      expect(chunks.length).assertEqual(3);
      expect(chunks[2].length).assertEqual(1);
      expect(chunks[2][0]).assertEqual(55);
      // The leading chunks carry the full two-element windows in order.
      expect(chunks[0].length).assertEqual(2);
      expect(chunks[0][1]).assertEqual(22);
      expect(chunks[1].length).assertEqual(2);
      expect(chunks[1][0]).assertEqual(33);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_COLLOBJ_0600
     * @tc.name      testCollObj0006
     * @tc.desc      Verify chunk treats sizes below one as single-element chunks, oversized sizes as one chunk and undefined as none.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCollObj0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Four values pass through the guarded chunk size zero.
      const values: number[] = [21, 22, 23, 24];
      // Sizes below one are raised to one, so every element gets its own chunk.
      const unitChunks: number[][] = CollectionUtils.chunk(values, 0);
      expect(unitChunks.length).assertEqual(4);
      expect(unitChunks[0].length).assertEqual(1);
      expect(unitChunks[3][0]).assertEqual(24);
      // A size larger than the array folds everything into a single chunk.
      const wideChunks: number[][] = CollectionUtils.chunk(values, 9);
      expect(wideChunks.length).assertEqual(1);
      expect(wideChunks[0].length).assertEqual(4);
      // A missing array produces no chunks at all.
      expect(CollectionUtils.chunk<number>(undefined, 4).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_COLLOBJ_0700
     * @tc.name      testCollObj0007
     * @tc.desc      Verify flatten joins inner arrays in order, skips empty inner arrays and yields nothing for undefined input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCollObj0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Lanes hold one empty group between two filled groups.
      const lanes: number[][] = [[2, 4], [], [6, 8, 10]];
      // Flatten appends every inner element in order.
      const flatLanes: number[] = CollectionUtils.flatten(lanes);
      // Empty inner arrays contribute nothing to the output.
      expect(flatLanes.length).assertEqual(5);
      expect(flatLanes[0]).assertEqual(2);
      expect(flatLanes[4]).assertEqual(10);
      // A missing array of arrays collapses to an empty result.
      expect(CollectionUtils.flatten<number>(undefined).length).assertEqual(0);
      // Inner arrays that are all empty still flatten to nothing.
      const blankLanes: number[][] = [[], []];
      expect(CollectionUtils.flatten(blankLanes).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_COLLOBJ_0800
     * @tc.name      testCollObj0008
     * @tc.desc      Verify flatten unwraps only one level so inner arrays survive as elements and keep their identity.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCollObj0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Two rows are wrapped once more so the input is three levels deep.
      const rowA: number[] = [1, 2];
      const rowB: number[] = [3, 4];
      const grid: number[][][] = [[rowA], [rowB]];
      // Flatten removes only the outermost level of nesting.
      const rows: number[][] = CollectionUtils.flatten(grid);
      // The two inner arrays become plain elements of the output.
      expect(rows.length).assertEqual(2);
      // The kept elements are the original arrays, not copies of them.
      expect(rows[0] === rowA).assertTrue();
      expect(rows[1] === rowB).assertTrue();
      // The row contents stay readable through the flattened output.
      expect(rows[0][1]).assertEqual(2);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_COLLOBJ_0900
     * @tc.name      testCollObj0009
     * @tc.desc      Verify containsAll reports false whenever the source array or the candidate array is missing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCollObj0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // A real pool of supported transports backs the missing-side checks.
      const pool: string[] = ['tls', 'dns', 'https'];
      // A missing source can never contain anything.
      expect(CollectionUtils.containsAll<string>(undefined, pool)).assertFalse();
      // Missing candidates leave nothing to verify and still fail.
      expect(CollectionUtils.containsAll(pool, undefined)).assertFalse();
      // Both sides missing also stay false.
      expect(CollectionUtils.containsAll<string>(undefined, undefined)).assertFalse();
      // A real source with real candidates confirms the positive path for contrast.
      expect(CollectionUtils.containsAll(pool, ['tls'])).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_COLLOBJ_1000
     * @tc.name      testCollObj0010
     * @tc.desc      Verify containsAll accepts duplicated candidates, treats an empty candidate list as satisfied and rejects partial coverage.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCollObj0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The source pool carries one duplicate entry on purpose.
      const pool: string[] = ['tls', 'dns', 'https', 'tls'];
      // Every single required candidate is present in the pool.
      expect(CollectionUtils.containsAll(pool, ['https'])).assertTrue();
      // Several candidates resolve together regardless of pool order.
      expect(CollectionUtils.containsAll(pool, ['tls', 'dns'])).assertTrue();
      // A candidate listed twice still resolves as long as it exists once.
      expect(CollectionUtils.containsAll(pool, ['dns', 'dns'])).assertTrue();
      // Requiring nothing is satisfied by any pool.
      expect(CollectionUtils.containsAll(pool, [])).assertTrue();
      // One absent candidate fails the whole request.
      expect(CollectionUtils.containsAll(pool, ['quic'])).assertFalse();
      // A partially covered candidate list fails as well.
      expect(CollectionUtils.containsAll(pool, ['tls', 'quic'])).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_COLLOBJ_1100
     * @tc.name      testCollObj0011
     * @tc.desc      Verify removeDuplicates keeps the first-seen order of numbers including zero and negative values and clears undefined input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCollObj0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Raw values repeat across zero, negative and positive numbers.
      const raw: number[] = [0, -3, 0, 7, -3, 12];
      // Distinct numbers keep the order of their first appearance.
      const cleaned: number[] = CollectionUtils.removeDuplicates(raw);
      expect(cleaned.length).assertEqual(4);
      expect(cleaned[0]).assertEqual(0);
      expect(cleaned[1]).assertEqual(-3);
      expect(cleaned[2]).assertEqual(7);
      expect(cleaned[3]).assertEqual(12);
      // A missing numeric array yields an empty result.
      expect(CollectionUtils.removeDuplicates(undefined).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_COLLOBJ_1200
     * @tc.name      testCollObj0012
     * @tc.desc      Verify groupBy returns an empty map for undefined input and preserves bucket order for a single group.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCollObj0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // A missing array produces an empty grouping.
      const emptyGrouping: Map<string, number[]> = CollectionUtils.groupBy<number>(undefined,
        (item: number): string => (item % 2 === 0 ? 'even' : 'odd'));
      expect(emptyGrouping.size).assertEqual(0);
      // All codes share the letter prefix, so they land in one bucket.
      const codes: string[] = ['A-1', 'A-2', 'A-3'];
      const byPrefix: Map<string, string[]> = CollectionUtils.groupBy(codes,
        (code: string): string => code.substring(0, 1));
      // Exactly one group key exists after grouping.
      expect(byPrefix.size).assertEqual(1);
      // The bucket under the shared key keeps the input order.
      const bucket: string[] | undefined = byPrefix.get('A');
      expect(bucket === undefined).assertFalse();
      if (bucket !== undefined) {
        expect(bucket.length).assertEqual(3);
        expect(bucket[0]).assertEqual('A-1');
        expect(bucket[2]).assertEqual('A-3');
      }
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_COLLOBJ_1300
     * @tc.name      testCollObj0013
     * @tc.desc      Verify groupBy fills one bucket per severity with ordered members and leaves unknown keys absent.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCollObj0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Alerts alternate between two severities and four delivery channels.
      const alerts: AlertMessage[] = [
        { severity: 'critical', channel: 'email' },
        { severity: 'warning', channel: 'sms' },
        { severity: 'critical', channel: 'dashboard' },
        { severity: 'warning', channel: 'email' }
      ];
      // Group the alerts by their severity name.
      const bySeverity: Map<string, AlertMessage[]> = CollectionUtils.groupBy(alerts,
        (alert: AlertMessage): string => alert.severity);
      // Two distinct severity keys exist after grouping.
      expect(bySeverity.size).assertEqual(2);
      // The critical bucket keeps the alerts in arrival order.
      const critical: AlertMessage[] | undefined = bySeverity.get('critical');
      expect(critical === undefined).assertFalse();
      if (critical !== undefined) {
        expect(critical.length).assertEqual(2);
        expect(critical[0].channel).assertEqual('email');
        expect(critical[1].channel).assertEqual('dashboard');
      }
      // The warning bucket holds the remaining two alerts.
      const warning: AlertMessage[] | undefined = bySeverity.get('warning');
      expect(warning === undefined).assertFalse();
      if (warning !== undefined) {
        expect(warning.length).assertEqual(2);
        expect(warning[0].channel).assertEqual('sms');
      }
      // A severity that never appeared stays absent from the map.
      expect(bySeverity.get('info') === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_COLLOBJ_1400
     * @tc.name      testCollObj0014
     * @tc.desc      Verify isNull and isNonNull treat null and undefined as missing and real objects as present.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCollObj0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // An absent reference counts as null.
      const missingProfile: DeviceProfile | undefined = undefined;
      expect(ObjectUtils.isNull(missingProfile)).assertTrue();
      expect(ObjectUtils.isNull(null)).assertTrue();
      expect(ObjectUtils.isNonNull(missingProfile)).assertFalse();
      expect(ObjectUtils.isNonNull(null)).assertFalse();
      // A created object holds a usable reference.
      const liveProfile: DeviceProfile = { host: 'relay.local', port: 443 };
      expect(ObjectUtils.isNull(liveProfile)).assertFalse();
      expect(ObjectUtils.isNonNull(liveProfile)).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_COLLOBJ_1500
     * @tc.name      testCollObj0015
     * @tc.desc      Verify getType names null explicitly, reports undefined as its own type and labels primitives and objects correctly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCollObj0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Null is named directly instead of falling back to the object label.
      expect(ObjectUtils.getType(null)).assertEqual('null');
      // Undefined keeps its dedicated name as the fallback branch.
      expect(ObjectUtils.getType(undefined)).assertEqual('undefined');
      // Text values report the string type.
      expect(ObjectUtils.getType('tls1.3')).assertEqual('string');
      // Numeric values report the number type.
      expect(ObjectUtils.getType(4096)).assertEqual('number');
      // Truth flags report the boolean type.
      expect(ObjectUtils.getType(false)).assertEqual('boolean');
      // Class-like data objects report the object type.
      const config: DeviceProfile = { host: 'gw.local', port: 8443 };
      expect(ObjectUtils.getType(config)).assertEqual('object');
      // Arrays are reference values and report the object type too.
      const hosts: string[] = ['gw.local'];
      expect(ObjectUtils.getType(hosts)).assertEqual('object');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_COLLOBJ_1600
     * @tc.name      testCollObj0016
     * @tc.desc      Verify deepEqual compares serialized text so equal member order passes while reordered members and changed values fail.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCollObj0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Two independently created profiles carry the same members in the same order.
      const leftProfile: DeviceProfile = { host: 'nas.local', port: 8443 };
      const sameProfile: DeviceProfile = { host: 'nas.local', port: 8443 };
      // Equal serialized text counts as equal even for separate instances.
      expect(ObjectUtils.deepEqual(leftProfile, sameProfile)).assertTrue();
      // The same fields in the opposite declaration order serialize differently.
      const swappedProfile: OrderedProfile = { port: 8443, host: 'nas.local' };
      expect(ObjectUtils.deepEqual(leftProfile, swappedProfile)).assertFalse();
      // One changed member value breaks the equality as well.
      const changedProfile: DeviceProfile = { host: 'nas.local', port: 9090 };
      expect(ObjectUtils.deepEqual(leftProfile, changedProfile)).assertFalse();
      // Comparing an object with itself always passes.
      expect(ObjectUtils.deepEqual(leftProfile, leftProfile)).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_COLLOBJ_1700
     * @tc.name      testCollObj0017
     * @tc.desc      Verify deepEqual matches arrays element-wise, rejects reordered or shortened arrays and rejects an extra member.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCollObj0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Two separately created arrays hold the same ports in the same order.
      const basePorts: number[] = [80, 443, 8443];
      const mirrorPorts: number[] = [80, 443, 8443];
      // Identical element sequences compare as equal.
      expect(ObjectUtils.deepEqual(basePorts, mirrorPorts)).assertTrue();
      // The same values in a different order serialize differently.
      const shuffledPorts: number[] = [443, 80, 8443];
      expect(ObjectUtils.deepEqual(basePorts, shuffledPorts)).assertFalse();
      // A missing element shortens the text and breaks the equality.
      const missingPort: number[] = [80, 443];
      expect(ObjectUtils.deepEqual(basePorts, missingPort)).assertFalse();
      // An extra member changes the text even when shared members agree.
      const extendedProfile: ExtendedProfile = { host: 'nas.local', port: 8443, tls: true };
      const plainProfile: DeviceProfile = { host: 'nas.local', port: 8443 };
      expect(ObjectUtils.deepEqual(extendedProfile, plainProfile)).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_COLLOBJ_1800
     * @tc.name      testCollObj0018
     * @tc.desc      Verify safeJsonParse reports a successful parse with the Parsed message and object-shaped data for valid JSON texts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCollObj0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // A valid object text parses into a live result object.
      const parsedPolicy: JsonParseResult = ObjectUtils.safeJsonParse('{"host":"nas.local","port":8443}');
      // Success is reported together with the dedicated message.
      expect(parsedPolicy.success).assertTrue();
      expect(parsedPolicy.message).assertEqual('Parsed');
      // The parsed payload actually carries a value.
      expect(parsedPolicy.data === null).assertFalse();
      // The payload keeps its runtime object shape.
      expect(ObjectUtils.getType(parsedPolicy.data)).assertEqual('object');
      // A valid array text also parses successfully.
      const parsedPorts: JsonParseResult = ObjectUtils.safeJsonParse('[80,443,8443]');
      expect(parsedPorts.success).assertTrue();
      expect(parsedPorts.message).assertEqual('Parsed');
      // The array payload is an object-typed runtime value.
      expect(ObjectUtils.getType(parsedPorts.data)).assertEqual('object');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_COLLOBJ_1900
     * @tc.name      testCollObj0019
     * @tc.desc      Verify safeJsonParse accepts scalar texts and still reports success when the text is the JSON null literal.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCollObj0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // A bare number text parses into a numeric payload.
      const parsedPort: JsonParseResult = ObjectUtils.safeJsonParse('8443');
      expect(parsedPort.success).assertTrue();
      expect(ObjectUtils.getType(parsedPort.data)).assertEqual('number');
      // A quoted text parses into a string payload.
      const parsedLabel: JsonParseResult = ObjectUtils.safeJsonParse('"gateway"');
      expect(parsedLabel.success).assertTrue();
      expect(parsedLabel.message).assertEqual('Parsed');
      expect(ObjectUtils.getType(parsedLabel.data)).assertEqual('string');
      // The JSON null literal parses fine even though no value is carried.
      const parsedNone: JsonParseResult = ObjectUtils.safeJsonParse('null');
      // Success stays true because the text is valid JSON.
      expect(parsedNone.success).assertTrue();
      expect(parsedNone.message).assertEqual('Parsed');
      // The payload remains null without marking the parse as failed.
      expect(parsedNone.data === null).assertTrue();
      expect(ObjectUtils.getType(parsedNone.data)).assertEqual('null');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_COLLOBJ_2000
     * @tc.name      testCollObj0020
     * @tc.desc      Verify safeJsonParse reports a failure result with null data and an invalid-text message for malformed or empty input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCollObj0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // A truncated object text cannot be parsed.
      const brokenObject: JsonParseResult = ObjectUtils.safeJsonParse('{"host":');
      // The failure is reported inside the result instead of thrown.
      expect(brokenObject.success).assertFalse();
      expect(brokenObject.data === null).assertTrue();
      expect(brokenObject.message).assertContain('Invalid JSON text');
      // A truncated array text fails the same way.
      const brokenArray: JsonParseResult = ObjectUtils.safeJsonParse('[80,443,');
      expect(brokenArray.success).assertFalse();
      expect(brokenArray.data === null).assertTrue();
      // An empty text is not valid JSON either.
      const blankText: JsonParseResult = ObjectUtils.safeJsonParse('');
      expect(blankText.success).assertFalse();
      expect(blankText.data === null).assertTrue();
      expect(blankText.message).assertContain('Invalid JSON text');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_COLLOBJ_2100
     * @tc.name      testCollObj0021
     * @tc.desc      Verify safeJsonStringify emits the exact serialized text for objects and arrays and the text null for null input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCollObj0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // A typed profile serializes in member declaration order.
      const profile: DeviceProfile = { host: 'nas.local', port: 8443 };
      const profileText: JsonStringifyResult = ObjectUtils.safeJsonStringify(profile);
      // Success is reported together with the dedicated message.
      expect(profileText.success).assertTrue();
      expect(profileText.message).assertEqual('Serialized');
      // The emitted text matches the exact JSON form of the profile.
      expect(profileText.text).assertEqual('{"host":"nas.local","port":8443}');
      // A numeric array serializes without spacing.
      const ports: number[] = [8080, 8443];
      const portsText: JsonStringifyResult = ObjectUtils.safeJsonStringify(ports);
      expect(portsText.success).assertTrue();
      expect(portsText.text).assertEqual('[8080,8443]');
      // Null input serializes into the JSON null literal.
      const noneText: JsonStringifyResult = ObjectUtils.safeJsonStringify(null);
      expect(noneText.success).assertTrue();
      expect(noneText.text).assertEqual('null');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_COLLOBJ_2200
     * @tc.name      testCollObj0022
     * @tc.desc      Verify safeJsonStringify reports a failure result with empty text for a cyclic structure instead of serializing it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCollObj0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // A chain node is created and then pointed at itself.
      const head: ChainNode = { label: 'root', next: null };
      head.next = head;
      // Serializing the cyclic structure cannot succeed.
      const cyclicText: JsonStringifyResult = ObjectUtils.safeJsonStringify(head);
      // The failure is reported inside the result instead of thrown.
      expect(cyclicText.success).assertFalse();
      // No partial text is returned for the broken structure.
      expect(cyclicText.text).assertEqual('');
      // The message explains that nothing was serialized.
      expect(cyclicText.message).assertContain('Not serialized');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_COLLOBJ_2300
     * @tc.name      testCollObj0023
     * @tc.desc      Verify deepCopy returns an independent equal copy that survives later input changes and passes null through.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCollObj0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // A profile is created and copied through one JSON round trip.
      const profile: DeviceProfile = { host: 'nas.local', port: 8443 };
      const copied: Object | null = ObjectUtils.deepCopy(profile);
      // The copy holds a real object reference.
      expect(copied === null).assertFalse();
      // The copy is not the same reference as the source.
      expect(copied !== profile).assertTrue();
      if (copied !== null) {
        // The copy carries the same field values as the source.
        expect(ObjectUtils.deepEqual(profile, copied)).assertTrue();
      }
      // Changing the source afterwards must not leak into the copy.
      profile.port = 9100;
      if (copied !== null) {
        expect(ObjectUtils.deepEqual(profile, copied)).assertFalse();
      }
      // Null input stays null so callers can chain the check.
      expect(ObjectUtils.deepCopy(null) === null).assertTrue();
    });
  });
}
