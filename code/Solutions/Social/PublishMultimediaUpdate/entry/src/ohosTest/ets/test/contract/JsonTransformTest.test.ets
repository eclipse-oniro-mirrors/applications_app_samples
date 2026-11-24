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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
import { yieldToEventLoop } from '../common/TestYield';
/**
 * Transform hooks of the JSON encoder and decoder.
 * A stored row is serialised with a whitelist so a private draft field never
 * reaches the snapshot, and a restored snapshot is upgraded through a reviver.
 * The cases pin those two hooks, plus the escaping and fidelity rules a
 * round trip depends on.
 */
interface NestedRow {
  value?: number;
}
interface SnapshotRow {
  count?: number;
  name?: string;
  flag?: boolean;
  none?: Object;
  text?: string;
  draft?: string;
  secret?: string;
  owner?: string;
  legacy?: number;
  first?: number;
  second?: number;
  key?: number;
  nested?: NestedRow;
  self?: SnapshotRow;
}
export default function jsonTransformTest() {
  describe('JsonTransformTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONX_0100
     * @tc.name ParseKeepsScalarTypes001
     * @tc.desc Verify scalar values keep their number, string, boolean and null types
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ParseKeepsScalarTypes_001', 0, (): void => {
      Logger.info(TAG, 'ParseKeepsScalarTypes_001 begin');
      const raw: string = '{"count":3,"name":"row","flag":true,"none":null}';
      const parsed: SnapshotRow = JSON.parse(raw) as SnapshotRow;
      expect(parsed.count === 3).assertTrue();
      expect(parsed.name === 'row').assertTrue();
      expect(parsed.flag === true).assertTrue();
      expect(parsed.none === null).assertTrue();
      Logger.info(TAG, 'ParseKeepsScalarTypes_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONX_0200
     * @tc.name StringifyEscapesQuotes002
     * @tc.desc Verify a quote inside a body is escaped in the snapshot text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StringifyEscapesQuotes_002', 0, (): void => {
      Logger.info(TAG, 'StringifyEscapesQuotes_002 begin');
      const body: string = 'he said "hi"';
      const encoded: string = JSON.stringify(body);
      expect(encoded.indexOf('\\"') !== -1).assertTrue();
      Logger.info(TAG, 'StringifyEscapesQuotes_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONX_0300
     * @tc.name StringifyEscapesNewline003
     * @tc.desc Verify a line break inside a body is escaped as a two character sequence
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StringifyEscapesNewline_003', 0, (): void => {
      Logger.info(TAG, 'StringifyEscapesNewline_003 begin');
      const body: string = 'first' + String.fromCharCode(10) + 'second';
      const encoded: string = JSON.stringify(body);
      expect(encoded.indexOf('\\n') !== -1).assertTrue();
      Logger.info(TAG, 'StringifyEscapesNewline_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONX_0400
     * @tc.name ReplacerArrayKeepsWhitelist004
     * @tc.desc Verify only the listed field reaches the snapshot
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReplacerArrayKeepsWhitelist_004', 0, (): void => {
      Logger.info(TAG, 'ReplacerArrayKeepsWhitelist_004 begin');
      const row: SnapshotRow = { text: 'body', draft: 'private' };
      const allow: Array<string> = ['text'];
      const encoded: string = JSON.stringify(row, allow);
      expect(encoded.indexOf('"draft"') === -1).assertTrue();
      expect(encoded.indexOf('"text"') !== -1).assertTrue();
      Logger.info(TAG, 'ReplacerArrayKeepsWhitelist_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONX_0500
     * @tc.name ReplacerFunctionDropsKey005
     * @tc.desc Verify a replacer that returns undefined removes the field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReplacerFunctionDropsKey_005', 0, (): void => {
      Logger.info(TAG, 'ReplacerFunctionDropsKey_005 begin');
      const row: SnapshotRow = { text: 'body', secret: 'hidden' };
      const encoded: string = JSON.stringify(row, (key: string, value: Object): Object | undefined => {
        if (key === 'secret') {
          return undefined;
        }
        return value;
      });
      expect(encoded.indexOf('"secret"') === -1).assertTrue();
      expect(encoded.indexOf('"text"') !== -1).assertTrue();
      Logger.info(TAG, 'ReplacerFunctionDropsKey_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONX_0600
     * @tc.name ReplacerSeesEveryKey006
     * @tc.desc Verify the replacer is called for each stored field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReplacerSeesEveryKey_006', 0, (): void => {
      Logger.info(TAG, 'ReplacerSeesEveryKey_006 begin');
      const row: SnapshotRow = { first: 1, second: 2 };
      const visited: Array<string> = [];
      JSON.stringify(row, (key: string, value: Object): Object | undefined => {
        visited.push(key);
        return value;
      });
      expect(visited.indexOf('first') !== -1).assertTrue();
      expect(visited.indexOf('second') !== -1).assertTrue();
      Logger.info(TAG, 'ReplacerSeesEveryKey_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONX_0700
     * @tc.name IndentAddsLineBreaks007
     * @tc.desc Verify a positive indent space produces a multiline snapshot
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IndentAddsLineBreaks_007', 0, (): void => {
      Logger.info(TAG, 'IndentAddsLineBreaks_007 begin');
      const row: SnapshotRow = { text: 'body' };
      const encoded: string = JSON.stringify(row, null, 2);
      expect(encoded.indexOf(String.fromCharCode(10)) !== -1).assertTrue();
      Logger.info(TAG, 'IndentAddsLineBreaks_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONX_0800
     * @tc.name ReviverTransformsValue008
     * @tc.desc Verify the reviver can rewrite a decoded value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReviverTransformsValue_008', 0, (): void => {
      Logger.info(TAG, 'ReviverTransformsValue_008 begin');
      const parsed: SnapshotRow = JSON.parse('{"owner":"zoologist"}', (key: string, value: Object): Object | undefined => {
        if (key === 'owner') {
          return 'Zoologist';
        }
        return value;
      }) as SnapshotRow;
      expect(parsed.owner === 'Zoologist').assertTrue();
      Logger.info(TAG, 'ReviverTransformsValue_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONX_0900
     * @tc.name ReviverDropsField009
     * @tc.desc Verify a reviver that returns undefined removes the decoded field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReviverDropsField_009', 0, (): void => {
      Logger.info(TAG, 'ReviverDropsField_009 begin');
      const parsed: SnapshotRow = JSON.parse('{"text":"body","legacy":1}', (key: string, value: Object): Object | undefined => {
        if (key === 'legacy') {
          return undefined;
        }
        return value;
      }) as SnapshotRow;
      expect(parsed.legacy === undefined).assertTrue();
      expect(parsed.text === 'body').assertTrue();
      Logger.info(TAG, 'ReviverDropsField_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONX_1000
     * @tc.name ReviverRunsInnerFirst010
     * @tc.desc Verify the reviver visits the nested field before its container
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReviverRunsInnerFirst_010', 0, (): void => {
      Logger.info(TAG, 'ReviverRunsInnerFirst_010 begin');
      const order: Array<string> = [];
      JSON.parse('{"outer":{"inner":1}}', (key: string, value: Object): Object | undefined => {
        order.push(key);
        return value;
      });
      const innerAt: number = order.indexOf('inner');
      const outerAt: number = order.indexOf('outer');
      expect(innerAt !== -1 && outerAt !== -1 && innerAt < outerAt).assertTrue();
      Logger.info(TAG, 'ReviverRunsInnerFirst_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONX_1100
     * @tc.name ArrayOrderPreserved011
     * @tc.desc Verify a list of bodies is encoded in its stored order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ArrayOrderPreserved_011', 0, (): void => {
      Logger.info(TAG, 'ArrayOrderPreserved_011 begin');
      const bodies: Array<string> = ['first', 'second', 'third'];
      expect(JSON.stringify(bodies)).assertEqual('["first","second","third"]');
      Logger.info(TAG, 'ArrayOrderPreserved_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONX_1200
     * @tc.name NestedRoundTripKeepsShape012
     * @tc.desc Verify a nested object survives an encode and decode cycle
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NestedRoundTripKeepsShape_012', 0, (): void => {
      Logger.info(TAG, 'NestedRoundTripKeepsShape_012 begin');
      const inner: NestedRow = { value: 7 };
      const row: SnapshotRow = { nested: inner };
      const decoded: string = JSON.stringify(row);
      expect(JSON.stringify(JSON.parse(decoded))).assertEqual(decoded);
      Logger.info(TAG, 'NestedRoundTripKeepsShape_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONX_1300
     * @tc.name DuplicateKeyTakesLast013
     * @tc.desc Verify a repeated key keeps the value that appears last
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DuplicateKeyTakesLast_013', 0, (): void => {
      Logger.info(TAG, 'DuplicateKeyTakesLast_013 begin');
      const parsed: SnapshotRow = JSON.parse('{"key":1,"key":2}') as SnapshotRow;
      expect(parsed.key === 2).assertTrue();
      Logger.info(TAG, 'DuplicateKeyTakesLast_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONX_1400
     * @tc.name CircularObjectRejected014
     * @tc.desc Verify encoding an object that contains itself is rejected
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CircularObjectRejected_014', 0, (): void => {
      Logger.info(TAG, 'CircularObjectRejected_014 begin');
      const row: SnapshotRow = { text: 'body' };
      row.self = row;
      let rejected: boolean = false;
      try {
        JSON.stringify(row);
      }
      catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      Logger.info(TAG, 'CircularObjectRejected_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONX_1500
     * @tc.name EmptyContainersDecode015
     * @tc.desc Verify empty array and object texts decode to empty containers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyContainersDecode_015', 0, (): void => {
      Logger.info(TAG, 'EmptyContainersDecode_015 begin');
      const list: Array<Object> = JSON.parse('[]') as Array<Object>;
      const map: SnapshotRow = JSON.parse('{}') as SnapshotRow;
      expect(list.length).assertEqual(0);
      expect(Object.keys(map).length).assertEqual(0);
      Logger.info(TAG, 'EmptyContainersDecode_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONX_1600
     * @tc.name LargeNumberFidelity016
     * @tc.desc Verify an integer below the safe limit survives the round trip exactly
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LargeNumberFidelity_016', 0, (): void => {
      Logger.info(TAG, 'LargeNumberFidelity_016 begin');
      const value: number = 123456789;
      expect(JSON.parse(JSON.stringify(value))).assertEqual(value);
      Logger.info(TAG, 'LargeNumberFidelity_016 end');
    });
  });
}
