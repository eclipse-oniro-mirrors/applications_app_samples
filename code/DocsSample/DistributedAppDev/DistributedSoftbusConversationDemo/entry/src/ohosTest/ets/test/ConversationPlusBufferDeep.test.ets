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
import { conversation } from '@kit.DistributedServiceKit';

export default function conversationPlusBufferDeepTest() {
  describe('ConversationPlusBufferDeepTest', () => {

    /**
     * @tc.name   testSoftbusPlusBufferDeep0001
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0001
     * @tc.desc   Fill and publish conversation buffer 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(2);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-1', buffer);
      expect(observed).assertEqual(2);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(2);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0002
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0002
     * @tc.desc   Fill and publish conversation buffer 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-2', buffer);
      expect(observed).assertEqual(4);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(4);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0003
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0003
     * @tc.desc   Fill and publish conversation buffer 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(6);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-3', buffer);
      expect(observed).assertEqual(6);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(6);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0004
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0004
     * @tc.desc   Fill and publish conversation buffer 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-4', buffer);
      expect(observed).assertEqual(8);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(8);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0005
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0005
     * @tc.desc   Fill and publish conversation buffer 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(10);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-5', buffer);
      expect(observed).assertEqual(10);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(10);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0006
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0006
     * @tc.desc   Fill and publish conversation buffer 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(12);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-6', buffer);
      expect(observed).assertEqual(12);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(12);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0007
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0007
     * @tc.desc   Fill and publish conversation buffer 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(14);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-7', buffer);
      expect(observed).assertEqual(14);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(14);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0008
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0008
     * @tc.desc   Fill and publish conversation buffer 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-8', buffer);
      expect(observed).assertEqual(16);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(16);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0009
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0009
     * @tc.desc   Fill and publish conversation buffer 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(18);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-9', buffer);
      expect(observed).assertEqual(18);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(18);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0010
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0010
     * @tc.desc   Fill and publish conversation buffer 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(20);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-10', buffer);
      expect(observed).assertEqual(20);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(20);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0011
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0011
     * @tc.desc   Fill and publish conversation buffer 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(22);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-11', buffer);
      expect(observed).assertEqual(22);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(22);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0012
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0012
     * @tc.desc   Fill and publish conversation buffer 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(24);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-12', buffer);
      expect(observed).assertEqual(24);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(24);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0013
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0013
     * @tc.desc   Fill and publish conversation buffer 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(26);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-13', buffer);
      expect(observed).assertEqual(26);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(26);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0014
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0014
     * @tc.desc   Fill and publish conversation buffer 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(28);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-14', buffer);
      expect(observed).assertEqual(28);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(28);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0015
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0015
     * @tc.desc   Fill and publish conversation buffer 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(30);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-15', buffer);
      expect(observed).assertEqual(30);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(30);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0016
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0016
     * @tc.desc   Fill and publish conversation buffer 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(32);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-16', buffer);
      expect(observed).assertEqual(32);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(32);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0017
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0017
     * @tc.desc   Fill and publish conversation buffer 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(34);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-17', buffer);
      expect(observed).assertEqual(34);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(34);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0018
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0018
     * @tc.desc   Fill and publish conversation buffer 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(36);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-18', buffer);
      expect(observed).assertEqual(36);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(36);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0019
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0019
     * @tc.desc   Fill and publish conversation buffer 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(38);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-19', buffer);
      expect(observed).assertEqual(38);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(38);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0020
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0020
     * @tc.desc   Fill and publish conversation buffer 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(40);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-20', buffer);
      expect(observed).assertEqual(40);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(40);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0021
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0021
     * @tc.desc   Fill and publish conversation buffer 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(42);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-21', buffer);
      expect(observed).assertEqual(42);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(42);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0022
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0022
     * @tc.desc   Fill and publish conversation buffer 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(44);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-22', buffer);
      expect(observed).assertEqual(44);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(44);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0023
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0023
     * @tc.desc   Fill and publish conversation buffer 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(46);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-23', buffer);
      expect(observed).assertEqual(46);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(46);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0024
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0024
     * @tc.desc   Fill and publish conversation buffer 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(48);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-24', buffer);
      expect(observed).assertEqual(48);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(48);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0025
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0025
     * @tc.desc   Fill and publish conversation buffer 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(50);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-25', buffer);
      expect(observed).assertEqual(50);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(50);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0026
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0026
     * @tc.desc   Fill and publish conversation buffer 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(52);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-26', buffer);
      expect(observed).assertEqual(52);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(52);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0027
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0027
     * @tc.desc   Fill and publish conversation buffer 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(54);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-27', buffer);
      expect(observed).assertEqual(54);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(54);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0028
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0028
     * @tc.desc   Fill and publish conversation buffer 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(56);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-28', buffer);
      expect(observed).assertEqual(56);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(56);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0029
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0029
     * @tc.desc   Fill and publish conversation buffer 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(58);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-29', buffer);
      expect(observed).assertEqual(58);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(58);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0030
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0030
     * @tc.desc   Fill and publish conversation buffer 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(60);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-30', buffer);
      expect(observed).assertEqual(60);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(60);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0031
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0031
     * @tc.desc   Fill and publish conversation buffer 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(62);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-31', buffer);
      expect(observed).assertEqual(62);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(62);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0032
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0032
     * @tc.desc   Fill and publish conversation buffer 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(64);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-32', buffer);
      expect(observed).assertEqual(64);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(64);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0033
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0033
     * @tc.desc   Fill and publish conversation buffer 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(66);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-33', buffer);
      expect(observed).assertEqual(66);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(66);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0034
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0034
     * @tc.desc   Fill and publish conversation buffer 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(68);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-34', buffer);
      expect(observed).assertEqual(68);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(68);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0035
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0035
     * @tc.desc   Fill and publish conversation buffer 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(70);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-35', buffer);
      expect(observed).assertEqual(70);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(70);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0036
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0036
     * @tc.desc   Fill and publish conversation buffer 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(72);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-36', buffer);
      expect(observed).assertEqual(72);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(72);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0037
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0037
     * @tc.desc   Fill and publish conversation buffer 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(74);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-37', buffer);
      expect(observed).assertEqual(74);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(74);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0038
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0038
     * @tc.desc   Fill and publish conversation buffer 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(76);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-38', buffer);
      expect(observed).assertEqual(76);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(76);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0039
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0039
     * @tc.desc   Fill and publish conversation buffer 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(78);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-39', buffer);
      expect(observed).assertEqual(78);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(78);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0040
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0040
     * @tc.desc   Fill and publish conversation buffer 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(80);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-40', buffer);
      expect(observed).assertEqual(80);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(80);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0041
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0041
     * @tc.desc   Fill and publish conversation buffer 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(82);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-41', buffer);
      expect(observed).assertEqual(82);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(82);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0042
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0042
     * @tc.desc   Fill and publish conversation buffer 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(84);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-42', buffer);
      expect(observed).assertEqual(84);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(84);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0043
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0043
     * @tc.desc   Fill and publish conversation buffer 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(86);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-43', buffer);
      expect(observed).assertEqual(86);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(86);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0044
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0044
     * @tc.desc   Fill and publish conversation buffer 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(88);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-44', buffer);
      expect(observed).assertEqual(88);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(88);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0045
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0045
     * @tc.desc   Fill and publish conversation buffer 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(90);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-45', buffer);
      expect(observed).assertEqual(90);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(90);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0046
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0046
     * @tc.desc   Fill and publish conversation buffer 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(92);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-46', buffer);
      expect(observed).assertEqual(92);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(92);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0047
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0047
     * @tc.desc   Fill and publish conversation buffer 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(94);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-47', buffer);
      expect(observed).assertEqual(94);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(94);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0048
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0048
     * @tc.desc   Fill and publish conversation buffer 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(96);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-48', buffer);
      expect(observed).assertEqual(96);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(96);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0049
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0049
     * @tc.desc   Fill and publish conversation buffer 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(98);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-49', buffer);
      expect(observed).assertEqual(98);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(98);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0050
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0050
     * @tc.desc   Fill and publish conversation buffer 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(100);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-50', buffer);
      expect(observed).assertEqual(100);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(100);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0051
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0051
     * @tc.desc   Fill and publish conversation buffer 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(102);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-51', buffer);
      expect(observed).assertEqual(102);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(102);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0052
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0052
     * @tc.desc   Fill and publish conversation buffer 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(104);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-52', buffer);
      expect(observed).assertEqual(104);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(104);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0053
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0053
     * @tc.desc   Fill and publish conversation buffer 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(106);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-53', buffer);
      expect(observed).assertEqual(106);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(106);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0054
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0054
     * @tc.desc   Fill and publish conversation buffer 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(108);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-54', buffer);
      expect(observed).assertEqual(108);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(108);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0055
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0055
     * @tc.desc   Fill and publish conversation buffer 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(110);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-55', buffer);
      expect(observed).assertEqual(110);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(110);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0056
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0056
     * @tc.desc   Fill and publish conversation buffer 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(112);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-56', buffer);
      expect(observed).assertEqual(112);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(112);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0057
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0057
     * @tc.desc   Fill and publish conversation buffer 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(114);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-57', buffer);
      expect(observed).assertEqual(114);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(114);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0058
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0058
     * @tc.desc   Fill and publish conversation buffer 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(116);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-58', buffer);
      expect(observed).assertEqual(116);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(116);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0059
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0059
     * @tc.desc   Fill and publish conversation buffer 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(118);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-59', buffer);
      expect(observed).assertEqual(118);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(118);
    })

    /**
     * @tc.name   testSoftbusPlusBufferDeep0060
     * @tc.number SUB_SOFTBUS_PLUS_BUFFER_DEEP_0060
     * @tc.desc   Fill and publish conversation buffer 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusBufferDeep0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(120);
      const bytes: Uint8Array = new Uint8Array(buffer);
      for (let index: number = 0; index < bytes.length; index++) { bytes[index] = index % 256; }
      let observed: number = -1;
      const cb: conversation.DataCallback = (deviceId: string, data: ArrayBuffer): void => { observed = data.byteLength; };
      cb('peer-60', buffer);
      expect(observed).assertEqual(120);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(1);
      expect(buffer.byteLength).assertEqual(120);
    })
  })
}
