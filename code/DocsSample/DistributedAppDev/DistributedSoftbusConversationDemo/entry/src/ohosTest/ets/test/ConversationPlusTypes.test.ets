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

export default function conversationPlusTypesTest() {
  describe('ConversationPlusTypesTest', () => {

    /**
     * @tc.name   testSoftbusPlusTypes0001
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0001
     * @tc.desc   Exercise conversation data buffer size 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(1);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 1;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-1', buffer);
      expect(seenId).assertEqual('device-1');
      expect(seenLength).assertEqual(1);
      expect(buffer.byteLength).assertEqual(1);
      expect(view[0]).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0002
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0002
     * @tc.desc   Exercise conversation data buffer size 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(2);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 2;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-2', buffer);
      expect(seenId).assertEqual('device-2');
      expect(seenLength).assertEqual(2);
      expect(buffer.byteLength).assertEqual(2);
      expect(view[0]).assertEqual(2);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0003
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0003
     * @tc.desc   Exercise conversation data buffer size 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 3;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-3', buffer);
      expect(seenId).assertEqual('device-3');
      expect(seenLength).assertEqual(3);
      expect(buffer.byteLength).assertEqual(3);
      expect(view[0]).assertEqual(3);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0004
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0004
     * @tc.desc   Exercise conversation data buffer size 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 4;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-4', buffer);
      expect(seenId).assertEqual('device-4');
      expect(seenLength).assertEqual(4);
      expect(buffer.byteLength).assertEqual(4);
      expect(view[0]).assertEqual(4);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0005
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0005
     * @tc.desc   Exercise conversation data buffer size 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(5);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 5;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-5', buffer);
      expect(seenId).assertEqual('device-5');
      expect(seenLength).assertEqual(5);
      expect(buffer.byteLength).assertEqual(5);
      expect(view[0]).assertEqual(5);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0006
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0006
     * @tc.desc   Exercise conversation data buffer size 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(6);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 6;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-6', buffer);
      expect(seenId).assertEqual('device-6');
      expect(seenLength).assertEqual(6);
      expect(buffer.byteLength).assertEqual(6);
      expect(view[0]).assertEqual(6);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0007
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0007
     * @tc.desc   Exercise conversation data buffer size 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(7);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 7;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-7', buffer);
      expect(seenId).assertEqual('device-7');
      expect(seenLength).assertEqual(7);
      expect(buffer.byteLength).assertEqual(7);
      expect(view[0]).assertEqual(7);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0008
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0008
     * @tc.desc   Exercise conversation data buffer size 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 8;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-8', buffer);
      expect(seenId).assertEqual('device-8');
      expect(seenLength).assertEqual(8);
      expect(buffer.byteLength).assertEqual(8);
      expect(view[0]).assertEqual(8);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0009
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0009
     * @tc.desc   Exercise conversation data buffer size 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(9);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 9;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-9', buffer);
      expect(seenId).assertEqual('device-9');
      expect(seenLength).assertEqual(9);
      expect(buffer.byteLength).assertEqual(9);
      expect(view[0]).assertEqual(9);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0010
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0010
     * @tc.desc   Exercise conversation data buffer size 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(10);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 10;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-10', buffer);
      expect(seenId).assertEqual('device-10');
      expect(seenLength).assertEqual(10);
      expect(buffer.byteLength).assertEqual(10);
      expect(view[0]).assertEqual(10);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0011
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0011
     * @tc.desc   Exercise conversation data buffer size 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(11);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 11;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-11', buffer);
      expect(seenId).assertEqual('device-11');
      expect(seenLength).assertEqual(11);
      expect(buffer.byteLength).assertEqual(11);
      expect(view[0]).assertEqual(11);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0012
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0012
     * @tc.desc   Exercise conversation data buffer size 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(12);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 12;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-12', buffer);
      expect(seenId).assertEqual('device-12');
      expect(seenLength).assertEqual(12);
      expect(buffer.byteLength).assertEqual(12);
      expect(view[0]).assertEqual(12);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0013
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0013
     * @tc.desc   Exercise conversation data buffer size 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(13);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 13;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-13', buffer);
      expect(seenId).assertEqual('device-13');
      expect(seenLength).assertEqual(13);
      expect(buffer.byteLength).assertEqual(13);
      expect(view[0]).assertEqual(13);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0014
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0014
     * @tc.desc   Exercise conversation data buffer size 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(14);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 14;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-14', buffer);
      expect(seenId).assertEqual('device-14');
      expect(seenLength).assertEqual(14);
      expect(buffer.byteLength).assertEqual(14);
      expect(view[0]).assertEqual(14);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0015
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0015
     * @tc.desc   Exercise conversation data buffer size 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(15);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 15;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-15', buffer);
      expect(seenId).assertEqual('device-15');
      expect(seenLength).assertEqual(15);
      expect(buffer.byteLength).assertEqual(15);
      expect(view[0]).assertEqual(15);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0016
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0016
     * @tc.desc   Exercise conversation data buffer size 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 16;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-16', buffer);
      expect(seenId).assertEqual('device-16');
      expect(seenLength).assertEqual(16);
      expect(buffer.byteLength).assertEqual(16);
      expect(view[0]).assertEqual(16);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0017
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0017
     * @tc.desc   Exercise conversation data buffer size 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(17);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 17;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-17', buffer);
      expect(seenId).assertEqual('device-17');
      expect(seenLength).assertEqual(17);
      expect(buffer.byteLength).assertEqual(17);
      expect(view[0]).assertEqual(17);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0018
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0018
     * @tc.desc   Exercise conversation data buffer size 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(18);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 18;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-18', buffer);
      expect(seenId).assertEqual('device-18');
      expect(seenLength).assertEqual(18);
      expect(buffer.byteLength).assertEqual(18);
      expect(view[0]).assertEqual(18);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0019
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0019
     * @tc.desc   Exercise conversation data buffer size 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(19);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 19;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-19', buffer);
      expect(seenId).assertEqual('device-19');
      expect(seenLength).assertEqual(19);
      expect(buffer.byteLength).assertEqual(19);
      expect(view[0]).assertEqual(19);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0020
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0020
     * @tc.desc   Exercise conversation data buffer size 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(20);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 20;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-20', buffer);
      expect(seenId).assertEqual('device-20');
      expect(seenLength).assertEqual(20);
      expect(buffer.byteLength).assertEqual(20);
      expect(view[0]).assertEqual(20);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0021
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0021
     * @tc.desc   Exercise conversation data buffer size 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(21);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 21;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-21', buffer);
      expect(seenId).assertEqual('device-21');
      expect(seenLength).assertEqual(21);
      expect(buffer.byteLength).assertEqual(21);
      expect(view[0]).assertEqual(21);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0022
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0022
     * @tc.desc   Exercise conversation data buffer size 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(22);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 22;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-22', buffer);
      expect(seenId).assertEqual('device-22');
      expect(seenLength).assertEqual(22);
      expect(buffer.byteLength).assertEqual(22);
      expect(view[0]).assertEqual(22);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0023
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0023
     * @tc.desc   Exercise conversation data buffer size 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(23);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 23;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-23', buffer);
      expect(seenId).assertEqual('device-23');
      expect(seenLength).assertEqual(23);
      expect(buffer.byteLength).assertEqual(23);
      expect(view[0]).assertEqual(23);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0024
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0024
     * @tc.desc   Exercise conversation data buffer size 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(24);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 24;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-24', buffer);
      expect(seenId).assertEqual('device-24');
      expect(seenLength).assertEqual(24);
      expect(buffer.byteLength).assertEqual(24);
      expect(view[0]).assertEqual(24);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0025
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0025
     * @tc.desc   Exercise conversation data buffer size 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(25);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 25;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-25', buffer);
      expect(seenId).assertEqual('device-25');
      expect(seenLength).assertEqual(25);
      expect(buffer.byteLength).assertEqual(25);
      expect(view[0]).assertEqual(25);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0026
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0026
     * @tc.desc   Exercise conversation data buffer size 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(26);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 26;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-26', buffer);
      expect(seenId).assertEqual('device-26');
      expect(seenLength).assertEqual(26);
      expect(buffer.byteLength).assertEqual(26);
      expect(view[0]).assertEqual(26);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0027
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0027
     * @tc.desc   Exercise conversation data buffer size 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(27);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 27;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-27', buffer);
      expect(seenId).assertEqual('device-27');
      expect(seenLength).assertEqual(27);
      expect(buffer.byteLength).assertEqual(27);
      expect(view[0]).assertEqual(27);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0028
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0028
     * @tc.desc   Exercise conversation data buffer size 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(28);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 28;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-28', buffer);
      expect(seenId).assertEqual('device-28');
      expect(seenLength).assertEqual(28);
      expect(buffer.byteLength).assertEqual(28);
      expect(view[0]).assertEqual(28);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0029
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0029
     * @tc.desc   Exercise conversation data buffer size 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(29);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 29;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-29', buffer);
      expect(seenId).assertEqual('device-29');
      expect(seenLength).assertEqual(29);
      expect(buffer.byteLength).assertEqual(29);
      expect(view[0]).assertEqual(29);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0030
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0030
     * @tc.desc   Exercise conversation data buffer size 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(30);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 30;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-30', buffer);
      expect(seenId).assertEqual('device-30');
      expect(seenLength).assertEqual(30);
      expect(buffer.byteLength).assertEqual(30);
      expect(view[0]).assertEqual(30);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0031
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0031
     * @tc.desc   Exercise conversation data buffer size 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(31);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 31;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-31', buffer);
      expect(seenId).assertEqual('device-31');
      expect(seenLength).assertEqual(31);
      expect(buffer.byteLength).assertEqual(31);
      expect(view[0]).assertEqual(31);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0032
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0032
     * @tc.desc   Exercise conversation data buffer size 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(32);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 32;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-32', buffer);
      expect(seenId).assertEqual('device-32');
      expect(seenLength).assertEqual(32);
      expect(buffer.byteLength).assertEqual(32);
      expect(view[0]).assertEqual(32);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0033
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0033
     * @tc.desc   Exercise conversation data buffer size 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(33);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 33;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-33', buffer);
      expect(seenId).assertEqual('device-33');
      expect(seenLength).assertEqual(33);
      expect(buffer.byteLength).assertEqual(33);
      expect(view[0]).assertEqual(33);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0034
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0034
     * @tc.desc   Exercise conversation data buffer size 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(34);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 34;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-34', buffer);
      expect(seenId).assertEqual('device-34');
      expect(seenLength).assertEqual(34);
      expect(buffer.byteLength).assertEqual(34);
      expect(view[0]).assertEqual(34);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0035
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0035
     * @tc.desc   Exercise conversation data buffer size 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(35);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 35;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-35', buffer);
      expect(seenId).assertEqual('device-35');
      expect(seenLength).assertEqual(35);
      expect(buffer.byteLength).assertEqual(35);
      expect(view[0]).assertEqual(35);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0036
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0036
     * @tc.desc   Exercise conversation data buffer size 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(36);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 36;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-36', buffer);
      expect(seenId).assertEqual('device-36');
      expect(seenLength).assertEqual(36);
      expect(buffer.byteLength).assertEqual(36);
      expect(view[0]).assertEqual(36);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0037
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0037
     * @tc.desc   Exercise conversation data buffer size 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(37);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 37;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-37', buffer);
      expect(seenId).assertEqual('device-37');
      expect(seenLength).assertEqual(37);
      expect(buffer.byteLength).assertEqual(37);
      expect(view[0]).assertEqual(37);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0038
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0038
     * @tc.desc   Exercise conversation data buffer size 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(38);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 38;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-38', buffer);
      expect(seenId).assertEqual('device-38');
      expect(seenLength).assertEqual(38);
      expect(buffer.byteLength).assertEqual(38);
      expect(view[0]).assertEqual(38);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0039
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0039
     * @tc.desc   Exercise conversation data buffer size 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(39);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 39;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-39', buffer);
      expect(seenId).assertEqual('device-39');
      expect(seenLength).assertEqual(39);
      expect(buffer.byteLength).assertEqual(39);
      expect(view[0]).assertEqual(39);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0040
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0040
     * @tc.desc   Exercise conversation data buffer size 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(40);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 40;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-40', buffer);
      expect(seenId).assertEqual('device-40');
      expect(seenLength).assertEqual(40);
      expect(buffer.byteLength).assertEqual(40);
      expect(view[0]).assertEqual(40);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0041
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0041
     * @tc.desc   Exercise conversation data buffer size 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(41);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 41;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-41', buffer);
      expect(seenId).assertEqual('device-41');
      expect(seenLength).assertEqual(41);
      expect(buffer.byteLength).assertEqual(41);
      expect(view[0]).assertEqual(41);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0042
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0042
     * @tc.desc   Exercise conversation data buffer size 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(42);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 42;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-42', buffer);
      expect(seenId).assertEqual('device-42');
      expect(seenLength).assertEqual(42);
      expect(buffer.byteLength).assertEqual(42);
      expect(view[0]).assertEqual(42);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0043
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0043
     * @tc.desc   Exercise conversation data buffer size 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(43);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 43;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-43', buffer);
      expect(seenId).assertEqual('device-43');
      expect(seenLength).assertEqual(43);
      expect(buffer.byteLength).assertEqual(43);
      expect(view[0]).assertEqual(43);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0044
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0044
     * @tc.desc   Exercise conversation data buffer size 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(44);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 44;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-44', buffer);
      expect(seenId).assertEqual('device-44');
      expect(seenLength).assertEqual(44);
      expect(buffer.byteLength).assertEqual(44);
      expect(view[0]).assertEqual(44);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0045
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0045
     * @tc.desc   Exercise conversation data buffer size 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(45);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 45;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-45', buffer);
      expect(seenId).assertEqual('device-45');
      expect(seenLength).assertEqual(45);
      expect(buffer.byteLength).assertEqual(45);
      expect(view[0]).assertEqual(45);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0046
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0046
     * @tc.desc   Exercise conversation data buffer size 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(46);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 46;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-46', buffer);
      expect(seenId).assertEqual('device-46');
      expect(seenLength).assertEqual(46);
      expect(buffer.byteLength).assertEqual(46);
      expect(view[0]).assertEqual(46);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0047
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0047
     * @tc.desc   Exercise conversation data buffer size 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(47);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 47;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-47', buffer);
      expect(seenId).assertEqual('device-47');
      expect(seenLength).assertEqual(47);
      expect(buffer.byteLength).assertEqual(47);
      expect(view[0]).assertEqual(47);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0048
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0048
     * @tc.desc   Exercise conversation data buffer size 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(48);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 48;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-48', buffer);
      expect(seenId).assertEqual('device-48');
      expect(seenLength).assertEqual(48);
      expect(buffer.byteLength).assertEqual(48);
      expect(view[0]).assertEqual(48);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0049
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0049
     * @tc.desc   Exercise conversation data buffer size 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(49);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 49;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-49', buffer);
      expect(seenId).assertEqual('device-49');
      expect(seenLength).assertEqual(49);
      expect(buffer.byteLength).assertEqual(49);
      expect(view[0]).assertEqual(49);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0050
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0050
     * @tc.desc   Exercise conversation data buffer size 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(50);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 50;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-50', buffer);
      expect(seenId).assertEqual('device-50');
      expect(seenLength).assertEqual(50);
      expect(buffer.byteLength).assertEqual(50);
      expect(view[0]).assertEqual(50);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0051
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0051
     * @tc.desc   Exercise conversation data buffer size 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(51);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 51;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-51', buffer);
      expect(seenId).assertEqual('device-51');
      expect(seenLength).assertEqual(51);
      expect(buffer.byteLength).assertEqual(51);
      expect(view[0]).assertEqual(51);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0052
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0052
     * @tc.desc   Exercise conversation data buffer size 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(52);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 52;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-52', buffer);
      expect(seenId).assertEqual('device-52');
      expect(seenLength).assertEqual(52);
      expect(buffer.byteLength).assertEqual(52);
      expect(view[0]).assertEqual(52);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0053
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0053
     * @tc.desc   Exercise conversation data buffer size 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(53);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 53;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-53', buffer);
      expect(seenId).assertEqual('device-53');
      expect(seenLength).assertEqual(53);
      expect(buffer.byteLength).assertEqual(53);
      expect(view[0]).assertEqual(53);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0054
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0054
     * @tc.desc   Exercise conversation data buffer size 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(54);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 54;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-54', buffer);
      expect(seenId).assertEqual('device-54');
      expect(seenLength).assertEqual(54);
      expect(buffer.byteLength).assertEqual(54);
      expect(view[0]).assertEqual(54);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0055
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0055
     * @tc.desc   Exercise conversation data buffer size 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(55);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 55;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-55', buffer);
      expect(seenId).assertEqual('device-55');
      expect(seenLength).assertEqual(55);
      expect(buffer.byteLength).assertEqual(55);
      expect(view[0]).assertEqual(55);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0056
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0056
     * @tc.desc   Exercise conversation data buffer size 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(56);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 56;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-56', buffer);
      expect(seenId).assertEqual('device-56');
      expect(seenLength).assertEqual(56);
      expect(buffer.byteLength).assertEqual(56);
      expect(view[0]).assertEqual(56);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0057
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0057
     * @tc.desc   Exercise conversation data buffer size 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(57);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 57;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-57', buffer);
      expect(seenId).assertEqual('device-57');
      expect(seenLength).assertEqual(57);
      expect(buffer.byteLength).assertEqual(57);
      expect(view[0]).assertEqual(57);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0058
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0058
     * @tc.desc   Exercise conversation data buffer size 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(58);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 58;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-58', buffer);
      expect(seenId).assertEqual('device-58');
      expect(seenLength).assertEqual(58);
      expect(buffer.byteLength).assertEqual(58);
      expect(view[0]).assertEqual(58);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0059
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0059
     * @tc.desc   Exercise conversation data buffer size 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(59);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 59;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-59', buffer);
      expect(seenId).assertEqual('device-59');
      expect(seenLength).assertEqual(59);
      expect(buffer.byteLength).assertEqual(59);
      expect(view[0]).assertEqual(59);
    })

    /**
     * @tc.name   testSoftbusPlusTypes0060
     * @tc.number SUB_SOFTBUS_PLUS_TYPES_0060
     * @tc.desc   Exercise conversation data buffer size 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusTypes0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(60);
      const view: Uint8Array = new Uint8Array(buffer);
      view[0] = 60;
      let seenId: string = '';
      let seenLength: number = -1;
      const callback: conversation.DataCallback = (deviceId: string, message: ArrayBuffer): void => {
        seenId = deviceId;
        seenLength = message.byteLength;
      };
      callback('device-60', buffer);
      expect(seenId).assertEqual('device-60');
      expect(seenLength).assertEqual(60);
      expect(buffer.byteLength).assertEqual(60);
      expect(view[0]).assertEqual(60);
    })
  })
}
