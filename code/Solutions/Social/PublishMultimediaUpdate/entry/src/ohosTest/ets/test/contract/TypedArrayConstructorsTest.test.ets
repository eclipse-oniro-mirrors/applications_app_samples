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
 * Construction rules of the typed array views.
 * A decoded payload may be handed to a view with a fixed element width, so the
 * element size, the byte geometry and the copy versus share rules decide what
 * the reader actually sees. The cases pin those constructor behaviours.
 */
export default function typedArrayConstructorsTest() {
  describe('TypedArrayConstructorsTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_TACON_0100
     * @tc.name LengthConstructorZerosElements001
     * @tc.desc Verify a length constructor creates the requested number of zero elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LengthConstructorZerosElements_001', 0, (): void => {
      Logger.info(TAG, 'LengthConstructorZerosElements_001 begin');
      const view: Int16Array = new Int16Array(3);
      expect(view.length).assertEqual(3);
      expect(view[0]).assertEqual(0);
      Logger.info(TAG, 'LengthConstructorZerosElements_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_TACON_0200
     * @tc.name ArrayConstructorKeepsValues002
     * @tc.desc Verify constructor values are stored per element
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ArrayConstructorKeepsValues_002', 0, (): void => {
      Logger.info(TAG, 'ArrayConstructorKeepsValues_002 begin');
      const view: Int16Array = new Int16Array([1, -2, 300]);
      expect(view[1]).assertEqual(-2);
      expect(view[2]).assertEqual(300);
      Logger.info(TAG, 'ArrayConstructorKeepsValues_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_TACON_0300
     * @tc.name Uint32KeepsMaximum003
     * @tc.desc Verify the largest unsigned word is stored without loss
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Uint32KeepsMaximum_003', 0, (): void => {
      Logger.info(TAG, 'Uint32KeepsMaximum_003 begin');
      const view: Uint32Array = new Uint32Array([4294967295]);
      expect(view[0]).assertEqual(4294967295);
      Logger.info(TAG, 'Uint32KeepsMaximum_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_TACON_0400
     * @tc.name Float64KeepsFraction004
     * @tc.desc Verify the double view stores a fractional value exactly
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Float64KeepsFraction_004', 0, (): void => {
      Logger.info(TAG, 'Float64KeepsFraction_004 begin');
      const view: Float64Array = new Float64Array([2.5]);
      expect(view[0]).assertEqual(2.5);
      Logger.info(TAG, 'Float64KeepsFraction_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_TACON_0500
     * @tc.name Int16ByteLengthDoubles005
     * @tc.desc Verify two bytes are reserved per sixteen bit element
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Int16ByteLengthDoubles_005', 0, (): void => {
      Logger.info(TAG, 'Int16ByteLengthDoubles_005 begin');
      const view: Int16Array = new Int16Array(3);
      expect(view.byteLength).assertEqual(6);
      expect(view.BYTES_PER_ELEMENT).assertEqual(2);
      Logger.info(TAG, 'Int16ByteLengthDoubles_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_TACON_0600
     * @tc.name FreshViewStartsAtZeroOffset006
     * @tc.desc Verify a length constructor starts at the beginning of its buffer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FreshViewStartsAtZeroOffset_006', 0, (): void => {
      Logger.info(TAG, 'FreshViewStartsAtZeroOffset_006 begin');
      const view: Int16Array = new Int16Array(2);
      expect(view.byteOffset).assertEqual(0);
      expect(view.buffer.byteLength).assertEqual(view.byteLength);
      Logger.info(TAG, 'FreshViewStartsAtZeroOffset_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_TACON_0700
     * @tc.name ViewsShareOneBuffer007
     * @tc.desc Verify a byte view sees the write made through the word view
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ViewsShareOneBuffer_007', 0, (): void => {
      Logger.info(TAG, 'ViewsShareOneBuffer_007 begin');
      const words: Int16Array = new Int16Array(1);
      const bytes: Uint8Array = new Uint8Array(words.buffer);
      words[0] = 258;
      expect(bytes[0]).assertEqual(2);
      expect(bytes[1]).assertEqual(1);
      Logger.info(TAG, 'ViewsShareOneBuffer_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_TACON_0800
     * @tc.name SliceCopiesElements008
     * @tc.desc Verify a slice is independent of the source view
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SliceCopiesElements_008', 0, (): void => {
      Logger.info(TAG, 'SliceCopiesElements_008 begin');
      const source: Int16Array = new Int16Array([1, 2, 3]);
      const copy: Int16Array = source.slice(0, 2);
      copy[0] = 9;
      expect(source[0]).assertEqual(1);
      Logger.info(TAG, 'SliceCopiesElements_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_TACON_0900
     * @tc.name SetFromViewAtOffset009
     * @tc.desc Verify setting from another view writes its elements at the offset
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SetFromViewAtOffset_009', 0, (): void => {
      Logger.info(TAG, 'SetFromViewAtOffset_009 begin');
      const target: Int16Array = new Int16Array(4);
      const source: Int16Array = new Int16Array([7, 8]);
      target.set(source, 1);
      expect(target[1]).assertEqual(7);
      expect(target[2]).assertEqual(8);
      Logger.info(TAG, 'SetFromViewAtOffset_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_TACON_1000
     * @tc.name SubarraySharesElements010
     * @tc.desc Verify a subarray window writes through to its parent view
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SubarraySharesElements_010', 0, (): void => {
      Logger.info(TAG, 'SubarraySharesElements_010 begin');
      const parent: Int16Array = new Int16Array([1, 2, 3]);
      const window: Int16Array = parent.subarray(1, 3);
      window[0] = 20;
      expect(parent[1]).assertEqual(20);
      Logger.info(TAG, 'SubarraySharesElements_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_TACON_1100
     * @tc.name Float32KeepsExactDecimal011
     * @tc.desc Verify a binary exact decimal survives the single precision view
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Float32KeepsExactDecimal_011', 0, (): void => {
      Logger.info(TAG, 'Float32KeepsExactDecimal_011 begin');
      const view: Float32Array = new Float32Array([1.5]);
      expect(view[0]).assertEqual(1.5);
      Logger.info(TAG, 'Float32KeepsExactDecimal_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_TACON_1200
     * @tc.name BufferGeometryMatchesView012
     * @tc.desc Verify the backing buffer length equals the view byte length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'BufferGeometryMatchesView_012', 0, (): void => {
      Logger.info(TAG, 'BufferGeometryMatchesView_012 begin');
      const view: Float64Array = new Float64Array(3);
      expect(view.buffer.byteLength).assertEqual(24);
      expect(view.byteLength).assertEqual(24);
      Logger.info(TAG, 'BufferGeometryMatchesView_012 end');
    });
  });
}
