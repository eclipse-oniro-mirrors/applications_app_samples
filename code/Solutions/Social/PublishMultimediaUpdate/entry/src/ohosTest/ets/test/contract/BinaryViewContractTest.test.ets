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
 * Numeric views over a shared buffer.
 * Media payloads arrive as bytes while their headers carry little and big
 * endian integers and floating point sizes. The cases pin the view algebra:
 * which writes are shared, which are copied and how byte order changes the
 * same four bytes.
 */
export default function binaryViewContractTest() {
  describe('BinaryViewContractTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BINVIEW_0100
     * @tc.name BufferByteLength001
     * @tc.desc Verify a buffer reports the requested byte capacity
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'BufferByteLength_001', 0, (): void => {
      Logger.info(TAG, 'BufferByteLength_001 begin');
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      expect(buffer.byteLength).assertEqual(8);
      Logger.info(TAG, 'BufferByteLength_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BINVIEW_0200
     * @tc.name Uint8RoundTrip002
     * @tc.desc Verify a single byte survives a view write and read
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Uint8RoundTrip_002', 0, (): void => {
      Logger.info(TAG, 'Uint8RoundTrip_002 begin');
      const view: DataView = new DataView(new ArrayBuffer(4));
      view.setUint8(1, 200);
      expect(view.getUint8(1)).assertEqual(200);
      Logger.info(TAG, 'Uint8RoundTrip_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BINVIEW_0300
     * @tc.name Int8KeepsNegative003
     * @tc.desc Verify a negative signed byte is read back unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Int8KeepsNegative_003', 0, (): void => {
      Logger.info(TAG, 'Int8KeepsNegative_003 begin');
      const view: DataView = new DataView(new ArrayBuffer(2));
      view.setInt8(0, -5);
      expect(view.getInt8(0)).assertEqual(-5);
      Logger.info(TAG, 'Int8KeepsNegative_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BINVIEW_0400
     * @tc.name Uint16BigEndian004
     * @tc.desc Verify big endian storage reads back the stored value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Uint16BigEndian_004', 0, (): void => {
      Logger.info(TAG, 'Uint16BigEndian_004 begin');
      const view: DataView = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 0x1234, false);
      expect(view.getUint16(0, false)).assertEqual(0x1234);
      Logger.info(TAG, 'Uint16BigEndian_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BINVIEW_0500
     * @tc.name Uint16LittleEndian005
     * @tc.desc Verify little endian storage reads back the stored value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Uint16LittleEndian_005', 0, (): void => {
      Logger.info(TAG, 'Uint16LittleEndian_005 begin');
      const view: DataView = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 0x1234, true);
      expect(view.getUint16(0, true)).assertEqual(0x1234);
      Logger.info(TAG, 'Uint16LittleEndian_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BINVIEW_0600
     * @tc.name Int32KeepsNegative006
     * @tc.desc Verify a negative signed word keeps its sign through the view
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Int32KeepsNegative_006', 0, (): void => {
      Logger.info(TAG, 'Int32KeepsNegative_006 begin');
      const view: DataView = new DataView(new ArrayBuffer(8));
      view.setInt32(0, -100000, false);
      expect(view.getInt32(0, false)).assertEqual(-100000);
      Logger.info(TAG, 'Int32KeepsNegative_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BINVIEW_0700
     * @tc.name Float32ExactValue007
     * @tc.desc Verify a binary exact decimal survives a single precision slot
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Float32ExactValue_007', 0, (): void => {
      Logger.info(TAG, 'Float32ExactValue_007 begin');
      const view: DataView = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 1.5, false);
      expect(view.getFloat32(0, false)).assertEqual(1.5);
      Logger.info(TAG, 'Float32ExactValue_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BINVIEW_0800
     * @tc.name Float64RoundTrip008
     * @tc.desc Verify a double precision decimal is stored without loss
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Float64RoundTrip_008', 0, (): void => {
      Logger.info(TAG, 'Float64RoundTrip_008 begin');
      const view: DataView = new DataView(new ArrayBuffer(8));
      view.setFloat64(0, 3.141592653589793, false);
      expect(view.getFloat64(0, false)).assertEqual(3.141592653589793);
      Logger.info(TAG, 'Float64RoundTrip_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BINVIEW_0900
     * @tc.name OffsetWriteStaysLocal009
     * @tc.desc Verify writing at one offset leaves the neighbouring byte untouched
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'OffsetWriteStaysLocal_009', 0, (): void => {
      Logger.info(TAG, 'OffsetWriteStaysLocal_009 begin');
      const view: DataView = new DataView(new ArrayBuffer(4));
      view.setUint8(0, 0x11);
      view.setUint8(3, 0x99);
      expect(view.getUint8(1)).assertEqual(0);
      expect(view.getUint8(3)).assertEqual(0x99);
      Logger.info(TAG, 'OffsetWriteStaysLocal_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BINVIEW_1000
     * @tc.name SliceCopiesBytes010
     * @tc.desc Verify a sliced buffer is a copy independent of its source
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SliceCopiesBytes_010', 0, (): void => {
      Logger.info(TAG, 'SliceCopiesBytes_010 begin');
      const source: ArrayBuffer = new ArrayBuffer(4);
      const sourceView: DataView = new DataView(source);
      sourceView.setUint8(0, 7);
      const copy: ArrayBuffer = source.slice(0, 4);
      new DataView(copy).setUint8(0, 9);
      expect(sourceView.getUint8(0)).assertEqual(7);
      Logger.info(TAG, 'SliceCopiesBytes_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BINVIEW_1100
     * @tc.name TypedArraySharesBuffer011
     * @tc.desc Verify a typed array view writes through to the shared buffer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TypedArraySharesBuffer_011', 0, (): void => {
      Logger.info(TAG, 'TypedArraySharesBuffer_011 begin');
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const view: DataView = new DataView(buffer);
      const bytes: Uint8Array = new Uint8Array(buffer);
      bytes[2] = 0x5A;
      expect(view.getUint8(2)).assertEqual(0x5A);
      Logger.info(TAG, 'TypedArraySharesBuffer_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BINVIEW_1200
     * @tc.name TypedArraySetFromArray012
     * @tc.desc Verify a typed array copies an input array in order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TypedArraySetFromArray_012', 0, (): void => {
      Logger.info(TAG, 'TypedArraySetFromArray_012 begin');
      const bytes: Uint8Array = new Uint8Array(4);
      bytes.set([4, 5, 6], 1);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[3]).assertEqual(6);
      Logger.info(TAG, 'TypedArraySetFromArray_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BINVIEW_1300
     * @tc.name SubarraySharesWindow013
     * @tc.desc Verify a subarray window writes through to its parent array
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SubarraySharesWindow_013', 0, (): void => {
      Logger.info(TAG, 'SubarraySharesWindow_013 begin');
      const source: Uint8Array = new Uint8Array([1, 2, 3, 4]);
      const window: Uint8Array = source.subarray(1, 3);
      window[0] = 20;
      expect(source[1]).assertEqual(20);
      Logger.info(TAG, 'SubarraySharesWindow_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BINVIEW_1400
     * @tc.name Int16MinimumStored014
     * @tc.desc Verify the smallest signed short survives a view round trip
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Int16MinimumStored_014', 0, (): void => {
      Logger.info(TAG, 'Int16MinimumStored_014 begin');
      const view: DataView = new DataView(new ArrayBuffer(4));
      view.setInt16(0, -32768, true);
      expect(view.getInt16(0, true)).assertEqual(-32768);
      Logger.info(TAG, 'Int16MinimumStored_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BINVIEW_1500
     * @tc.name Uint32MaximumStored015
     * @tc.desc Verify the largest unsigned word survives a view round trip
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Uint32MaximumStored_015', 0, (): void => {
      Logger.info(TAG, 'Uint32MaximumStored_015 begin');
      const view: DataView = new DataView(new ArrayBuffer(8));
      view.setUint32(0, 4294967295, true);
      expect(view.getUint32(0, true)).assertEqual(4294967295);
      Logger.info(TAG, 'Uint32MaximumStored_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BINVIEW_1600
     * @tc.name EndiannessChangesReading016
     * @tc.desc Verify the same two bytes read differently per byte order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EndiannessChangesReading_016', 0, (): void => {
      Logger.info(TAG, 'EndiannessChangesReading_016 begin');
      const view: DataView = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 0x0102, false);
      expect(view.getUint16(0, true)).assertEqual(0x0201);
      Logger.info(TAG, 'EndiannessChangesReading_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BINVIEW_1700
     * @tc.name Float64KeepsNegative017
     * @tc.desc Verify a negative double keeps its sign through the view
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Float64KeepsNegative_017', 0, (): void => {
      Logger.info(TAG, 'Float64KeepsNegative_017 begin');
      const view: DataView = new DataView(new ArrayBuffer(8));
      view.setFloat64(0, -2.5, false);
      expect(view.getFloat64(0, false)).assertEqual(-2.5);
      Logger.info(TAG, 'Float64KeepsNegative_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BINVIEW_1800
     * @tc.name ConstructedArrayCopies018
     * @tc.desc Verify constructing a typed array from another one copies its bytes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ConstructedArrayCopies_018', 0, (): void => {
      Logger.info(TAG, 'ConstructedArrayCopies_018 begin');
      const source: Uint8Array = new Uint8Array([1, 2, 3]);
      const copy: Uint8Array = new Uint8Array(source);
      copy[0] = 99;
      expect(source[0]).assertEqual(1);
      Logger.info(TAG, 'ConstructedArrayCopies_018 end');
    });
  });
}
