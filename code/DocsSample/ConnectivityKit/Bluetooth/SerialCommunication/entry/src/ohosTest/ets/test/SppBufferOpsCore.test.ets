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
import { beforeEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from './YieldToEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF814;
const TAG: string = 'SppBufferTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function concatChunks(chunks: Array<Uint8Array>): Uint8Array {
  let total: number = 0;
  for (let i: number = 0; i < chunks.length; i++) {
    total += chunks[i].length;
  }
  const merged: Uint8Array = new Uint8Array(total);
  let offset: number = 0;
  for (let i: number = 0; i < chunks.length; i++) {
    merged.set(chunks[i], offset);
    offset += chunks[i].length;
  }
  return merged;
}

function readBe16(bytes: Uint8Array, offset: number): number {
  return (bytes[offset] << 8) | bytes[offset + 1];
}

function readLe16(bytes: Uint8Array, offset: number): number {
  return bytes[offset] | (bytes[offset + 1] << 8);
}

function writeBe16(value: number): Uint8Array {
  const out: Uint8Array = new Uint8Array(2);
  out[0] = (value >> 8) & 0xFF;
  out[1] = value & 0xFF;
  return out;
}

function toHexPreview(bytes: Uint8Array): string {
  let text: string = '';
  for (let i: number = 0; i < bytes.length; i++) {
    if (i > 0) {
      text += ' ';
    }
    text += bytes[i].toString(16).toUpperCase().padStart(2, '0');
  }
  return text;
}

class RingBuffer {
  private readonly capacityValue: number;
  private readonly storage: Uint8Array;
  private writePos: number = 0;
  private readPos: number = 0;
  private used: number = 0;

  constructor(capacity: number) {
    this.capacityValue = capacity;
    this.storage = new Uint8Array(capacity);
  }

  public write(data: Uint8Array): number {
    if (data.length > this.capacityValue - this.used) {
      return -1;
    }
    for (let i: number = 0; i < data.length; i++) {
      this.storage[this.writePos] = data[i];
      this.writePos = (this.writePos + 1) % this.capacityValue;
    }
    this.used += data.length;
    return data.length;
  }

  public read(out: Uint8Array): number {
    const want: number = Math.min(out.length, this.used);
    for (let i: number = 0; i < want; i++) {
      out[i] = this.storage[this.readPos];
      this.readPos = (this.readPos + 1) % this.capacityValue;
    }
    this.used -= want;
    return want;
  }

  public getUsed(): number {
    return this.used;
  }
}

export default function sppBufferOpsCoreTest(): void {
  describe('SppBufferOpsCoreTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0101
     * @tc.name      testSppBuffer0101
     * @tc.desc      Verify an empty ArrayBuffer yields a zero length Uint8Array view.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0101 begin');
      const data: Uint8Array = new Uint8Array(new ArrayBuffer(0));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data.length=${data.length}, expected=0`);
      expect(data.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue data !== null=${data !== null}`);
      expect(data !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof data.length=${typeof data.length}, expected='number'`);
      expect(typeof data.length).assertEqual('number');
      log('testSppBuffer0101 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0102
     * @tc.name      testSppBuffer0102
     * @tc.desc      Verify a Uint8Array view keeps the backing buffer byte length.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0102 begin');
      const backing: ArrayBuffer = new ArrayBuffer(8);
      const data: Uint8Array = new Uint8Array(backing);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data.length=${data.length}, expected=8`);
      expect(data.length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual backing.byteLength=${backing.byteLength}, expected=8`);
      expect(backing.byteLength).assertEqual(8);
      log('testSppBuffer0102 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0103
     * @tc.name      testSppBuffer0103
     * @tc.desc      Verify a sixteen byte receive buffer reports sixteen elements.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0103 begin');
      const data: Uint8Array = new Uint8Array(new ArrayBuffer(16));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data.length=${data.length}, expected=16`);
      expect(data.length).assertEqual(16);
      log('testSppBuffer0103 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0104
     * @tc.name      testSppBuffer0104
     * @tc.desc      Verify writes through the view are visible in the backing buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0104 begin');
      const backing: ArrayBuffer = new ArrayBuffer(4);
      const data: Uint8Array = new Uint8Array(backing);
      data[0] = 0xAB;
      const view: DataView = new DataView(backing);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual view.getUint8(0)=${view.getUint8(0)}, expected=0xAB`);
      expect(view.getUint8(0)).assertEqual(0xAB);
      log('testSppBuffer0104 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0105
     * @tc.name      testSppBuffer0105
     * @tc.desc      Verify an empty packet serializes to an empty JSON object in logs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0105 begin');
      const data: Uint8Array = new Uint8Array(new ArrayBuffer(0));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual JSON.stringify(data)=${JSON.stringify(data)}, expected='{}'`);
      expect(JSON.stringify(data)).assertEqual('{}');
      log('testSppBuffer0105 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0106
     * @tc.name      testSppBuffer0106
     * @tc.desc      Verify a three byte packet serializes with index keyed entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0106 begin');
      const data: Uint8Array = new Uint8Array([1, 2, 3]);
      const text: string = JSON.stringify(data);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertContain text=${text}, expected='"0":1'`);
      expect(text).assertContain('"0":1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertContain text=${text}, expected='"1":2'`);
      expect(text).assertContain('"1":2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertContain text=${text}, expected='"2":3'`);
      expect(text).assertContain('"2":3');
      log('testSppBuffer0106 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0107
     * @tc.name      testSppBuffer0107
     * @tc.desc      Verify ascii packet bytes appear numerically in the serialized log.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0107 begin');
      const data: Uint8Array = new Uint8Array([72, 105]);
      const text: string = JSON.stringify(data);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertContain text=${text}, expected='"0":72'`);
      expect(text).assertContain('"0":72');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertContain text=${text}, expected='"1":105'`);
      expect(text).assertContain('"1":105');
      log('testSppBuffer0107 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0108
     * @tc.name      testSppBuffer0108
     * @tc.desc      Verify a zero length packet still passes the not null read guard.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0108 begin');
      const data: Uint8Array = new Uint8Array(new ArrayBuffer(0));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${data !== null && data !== undefined}`);
      expect(data !== null && data !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue data.length === 0=${data.length === 0}`);
      expect(data.length === 0).assertTrue();
      log('testSppBuffer0108 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0109
     * @tc.name      testSppBuffer0109
     * @tc.desc      Verify the packet length field stays a number after view creation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0109 begin');
      const data: Uint8Array = new Uint8Array(new ArrayBuffer(5));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof data.length=${typeof data.length}, expected='number'`);
      expect(typeof data.length).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data.length=${data.length}, expected=5`);
      expect(data.length).assertEqual(5);
      log('testSppBuffer0109 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0110
     * @tc.name      testSppBuffer0110
     * @tc.desc      Verify a subarray window reports the requested element count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0110 begin');
      const data: Uint8Array = new Uint8Array(8);
      const window: Uint8Array = data.subarray(2, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual window.length=${window.length}, expected=3`);
      expect(window.length).assertEqual(3);
      log('testSppBuffer0110 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0111
     * @tc.name      testSppBuffer0111
     * @tc.desc      Verify subarray shares memory with the original packet buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0111 begin');
      const data: Uint8Array = new Uint8Array(8);
      const window: Uint8Array = data.subarray(2, 5);
      window[0] = 9;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data[2]=${data[2]}, expected=9`);
      expect(data[2]).assertEqual(9);
      log('testSppBuffer0111 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0112
     * @tc.name      testSppBuffer0112
     * @tc.desc      Verify slice copies memory instead of sharing it.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0112 begin');
      const data: Uint8Array = new Uint8Array([1, 2, 3, 4]);
      const copy: Uint8Array = data.slice(1, 3);
      copy[0] = 0xFF;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual copy[0]=${copy[0]}, expected=0xFF`);
      expect(copy[0]).assertEqual(0xFF);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data[1]=${data[1]}, expected=2`);
      expect(data[1]).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual copy.length=${copy.length}, expected=2`);
      expect(copy.length).assertEqual(2);
      log('testSppBuffer0112 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0113
     * @tc.name      testSppBuffer0113
     * @tc.desc      Verify DataView single byte write and read round trip.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0113 begin');
      const view: DataView = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 0x5A);
      view.setUint8(1, 0xA5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual view.getUint8(0)=${view.getUint8(0)}, expected=0x5A`);
      expect(view.getUint8(0)).assertEqual(0x5A);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual view.getUint8(1)=${view.getUint8(1)}, expected=0xA5`);
      expect(view.getUint8(1)).assertEqual(0xA5);
      log('testSppBuffer0113 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0114
     * @tc.name      testSppBuffer0114
     * @tc.desc      Verify little endian sixteen bit writes place the low byte first.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0114 begin');
      const view: DataView = new DataView(new ArrayBuffer(2));
      view.setUint16(0, 0x1234, true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual view.getUint8(0)=${view.getUint8(0)}, expected=0x34`);
      expect(view.getUint8(0)).assertEqual(0x34);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual view.getUint8(1)=${view.getUint8(1)}, expected=0x12`);
      expect(view.getUint8(1)).assertEqual(0x12);
      log('testSppBuffer0114 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0115
     * @tc.name      testSppBuffer0115
     * @tc.desc      Verify big endian sixteen bit writes place the high byte first.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0115 begin');
      const view: DataView = new DataView(new ArrayBuffer(2));
      view.setUint16(0, 0x1234, false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual view.getUint8(0)=${view.getUint8(0)}, expected=0x12`);
      expect(view.getUint8(0)).assertEqual(0x12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual view.getUint8(1)=${view.getUint8(1)}, expected=0x34`);
      expect(view.getUint8(1)).assertEqual(0x34);
      log('testSppBuffer0115 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0116
     * @tc.name      testSppBuffer0116
     * @tc.desc      Verify big endian thirty two bit read returns the stored magic value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0116 begin');
      const view: DataView = new DataView(new ArrayBuffer(4));
      view.setUint32(0, 0xDEADBEEF, false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual view.getUint32(0, false)=${view.getUint32(0, false)}`);
      expect(view.getUint32(0, false)).assertEqual(0xDEADBEEF);
      log('testSppBuffer0116 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0117
     * @tc.name      testSppBuffer0117
     * @tc.desc      Verify fill writes the marker byte across the whole buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0117 begin');
      const data: Uint8Array = new Uint8Array(6);
      data.fill(0x5A);
      for (let i: number = 0; i < 6; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data[i]=${data[i]}, expected=0x5A`);
        expect(data[i]).assertEqual(0x5A);
      }
      log('testSppBuffer0117 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0118
     * @tc.name      testSppBuffer0118
     * @tc.desc      Verify ranged fill only touches the requested span.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0118 begin');
      const data: Uint8Array = new Uint8Array(6);
      data.fill(0x11, 2, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data[1]=${data[1]}, expected=0`);
      expect(data[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data[2]=${data[2]}, expected=0x11`);
      expect(data[2]).assertEqual(0x11);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data[4]=${data[4]}, expected=0x11`);
      expect(data[4]).assertEqual(0x11);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data[5]=${data[5]}, expected=0`);
      expect(data[5]).assertEqual(0);
      log('testSppBuffer0118 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0119
     * @tc.name      testSppBuffer0119
     * @tc.desc      Verify set copies a chunk into the buffer at an offset.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0119 begin');
      const data: Uint8Array = new Uint8Array(6);
      const chunk: Uint8Array = new Uint8Array([0xA5, 0x5A]);
      data.set(chunk, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data[3]=${data[3]}, expected=0xA5`);
      expect(data[3]).assertEqual(0xA5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data[4]=${data[4]}, expected=0x5A`);
      expect(data[4]).assertEqual(0x5A);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data[2]=${data[2]}, expected=0`);
      expect(data[2]).assertEqual(0);
      log('testSppBuffer0119 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0120
     * @tc.name      testSppBuffer0120
     * @tc.desc      Verify copyWithin moves a segment inside the same buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0120 begin');
      const data: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      data.copyWithin(2, 0, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data[2]=${data[2]}, expected=1`);
      expect(data[2]).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data[3]=${data[3]}, expected=2`);
      expect(data[3]).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data[4]=${data[4]}, expected=5`);
      expect(data[4]).assertEqual(5);
      log('testSppBuffer0120 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0121
     * @tc.name      testSppBuffer0121
     * @tc.desc      Verify indexOf locates the frame head marker byte.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0121 begin');
      const data: Uint8Array = new Uint8Array([0x00, 0x01, 0xA5, 0x02]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data.indexOf(0xA5)=${data.indexOf(0xA5)}, expected=2`);
      expect(data.indexOf(0xA5)).assertEqual(2);
      log('testSppBuffer0121 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0122
     * @tc.name      testSppBuffer0122
     * @tc.desc      Verify indexOf returns minus one when the marker is absent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0122 begin');
      const data: Uint8Array = new Uint8Array([0x00, 0x01, 0x02]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data.indexOf(0xA5)=${data.indexOf(0xA5)}, expected=-1`);
      expect(data.indexOf(0xA5)).assertEqual(-1);
      log('testSppBuffer0122 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0123
     * @tc.name      testSppBuffer0123
     * @tc.desc      Verify lastIndexOf locates the tail marker from the end.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0123 begin');
      const data: Uint8Array = new Uint8Array([0x5A, 0x01, 0x5A]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data.lastIndexOf(0x5A)=${data.lastIndexOf(0x5A)}, expected=2`);
      expect(data.lastIndexOf(0x5A)).assertEqual(2);
      log('testSppBuffer0123 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0124
     * @tc.name      testSppBuffer0124
     * @tc.desc      Verify two chunks concatenate preserving byte order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0124 begin');
      const a: Uint8Array = new Uint8Array([1, 2]);
      const b: Uint8Array = new Uint8Array([3]);
      const merged: Uint8Array = concatChunks([a, b]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual merged.length=${merged.length}, expected=3`);
      expect(merged.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual merged[0]=${merged[0]}, expected=1`);
      expect(merged[0]).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual merged[1]=${merged[1]}, expected=2`);
      expect(merged[1]).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual merged[2]=${merged[2]}, expected=3`);
      expect(merged[2]).assertEqual(3);
      log('testSppBuffer0124 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0125
     * @tc.name      testSppBuffer0125
     * @tc.desc      Verify three chunks concatenate in arrival order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0125 begin');
      const merged: Uint8Array = concatChunks([
        new Uint8Array([0xA5]),
        new Uint8Array([0x02, 0x07]),
        new Uint8Array([0x5A])
      ]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual merged.length=${merged.length}, expected=4`);
      expect(merged.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual merged[0]=${merged[0]}, expected=0xA5`);
      expect(merged[0]).assertEqual(0xA5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual merged[3]=${merged[3]}, expected=0x5A`);
      expect(merged[3]).assertEqual(0x5A);
      log('testSppBuffer0125 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0126
     * @tc.name      testSppBuffer0126
     * @tc.desc      Verify concatenating two empty chunks yields an empty buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0126 begin');
      const merged: Uint8Array = concatChunks([new Uint8Array(0), new Uint8Array(0)]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual merged.length=${merged.length}, expected=0`);
      expect(merged.length).assertEqual(0);
      log('testSppBuffer0126 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0127
     * @tc.name      testSppBuffer0127
     * @tc.desc      Verify a single chunk concatenates to an equivalent buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0127 begin');
      const chunk: Uint8Array = new Uint8Array([9, 8, 7]);
      const merged: Uint8Array = concatChunks([chunk]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual merged.length=${merged.length}, expected=3`);
      expect(merged.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual merged[0]=${merged[0]}, expected=9`);
      expect(merged[0]).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual merged[2]=${merged[2]}, expected=7`);
      expect(merged[2]).assertEqual(7);
      log('testSppBuffer0127 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0128
     * @tc.name      testSppBuffer0128
     * @tc.desc      Verify concatenation keeps zero and full byte values intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0128 begin');
      const merged: Uint8Array = concatChunks([
        new Uint8Array([0x00]),
        new Uint8Array([0xFF])
      ]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual merged[0]=${merged[0]}, expected=0x00`);
      expect(merged[0]).assertEqual(0x00);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual merged[1]=${merged[1]}, expected=0xFF`);
      expect(merged[1]).assertEqual(0xFF);
      log('testSppBuffer0128 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0129
     * @tc.name      testSppBuffer0129
     * @tc.desc      Verify big endian sixteen bit read decodes 0x0102 as 258.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0129 begin');
      const data: Uint8Array = new Uint8Array([0x01, 0x02]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual readBe16(data, 0), expected=258`);
      expect(readBe16(data, 0)).assertEqual(258);
      log('testSppBuffer0129 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0130
     * @tc.name      testSppBuffer0130
     * @tc.desc      Verify big endian sixteen bit read saturates at 65535.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0130 begin');
      const data: Uint8Array = new Uint8Array([0xFF, 0xFF]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual readBe16(data, 0), expected=65535`);
      expect(readBe16(data, 0)).assertEqual(65535);
      log('testSppBuffer0130 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0131
     * @tc.name      testSppBuffer0131
     * @tc.desc      Verify little endian sixteen bit read decodes 3412 order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0131 begin');
      const data: Uint8Array = new Uint8Array([0x34, 0x12]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual readLe16(data, 0), expected=0x1234`);
      expect(readLe16(data, 0)).assertEqual(0x1234);
      log('testSppBuffer0131 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0132
     * @tc.name      testSppBuffer0132
     * @tc.desc      Verify big endian sixteen bit write round trips value 1234.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0132 begin');
      const data: Uint8Array = writeBe16(1234);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data.length=${data.length}, expected=2`);
      expect(data.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual readBe16(data, 0), expected=1234`);
      expect(readBe16(data, 0)).assertEqual(1234);
      log('testSppBuffer0132 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0133
     * @tc.name      testSppBuffer0133
     * @tc.desc      Verify big endian sixteen bit write of zero emits zero bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0133 begin');
      const data: Uint8Array = writeBe16(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data[0]=${data[0]}, expected=0`);
      expect(data[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data[1]=${data[1]}, expected=0`);
      expect(data[1]).assertEqual(0);
      log('testSppBuffer0133 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0134
     * @tc.name      testSppBuffer0134
     * @tc.desc      Verify remaining capacity equals buffer size minus used bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0134 begin');
      const capacity: number = 16;
      const filled: number = 5;
      const remaining: number = capacity - filled;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual remaining=${remaining}, expected=11`);
      expect(remaining).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue remaining >= 0=${remaining >= 0}`);
      expect(remaining >= 0).assertTrue();
      log('testSppBuffer0134 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0135
     * @tc.name      testSppBuffer0135
     * @tc.desc      Verify ring buffer rejects writes that exceed its capacity.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0135 begin');
      const ring: RingBuffer = new RingBuffer(4);
      const oversized: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ring.write(oversized), expected=-1`);
      expect(ring.write(oversized)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ring.getUsed()=${ring.getUsed()}, expected=0`);
      expect(ring.getUsed()).assertEqual(0);
      log('testSppBuffer0135 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0136
     * @tc.name      testSppBuffer0136
     * @tc.desc      Verify a full ring buffer read returns all written bytes in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0136 begin');
      const ring: RingBuffer = new RingBuffer(4);
      ring.write(new Uint8Array([0x11, 0x22, 0x33, 0x44]));
      const out: Uint8Array = new Uint8Array(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ring.read(out), expected=4`);
      expect(ring.read(out)).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual out[0]=${out[0]}, expected=0x11`);
      expect(out[0]).assertEqual(0x11);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual out[3]=${out[3]}, expected=0x44`);
      expect(out[3]).assertEqual(0x44);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ring.getUsed()=${ring.getUsed()}, expected=0`);
      expect(ring.getUsed()).assertEqual(0);
      log('testSppBuffer0136 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0137
     * @tc.name      testSppBuffer0137
     * @tc.desc      Verify consecutive packets in a ring buffer do not interleave.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0137 begin');
      const ring: RingBuffer = new RingBuffer(8);
      ring.write(new Uint8Array([1, 2]));
      const first: Uint8Array = new Uint8Array(2);
      ring.read(first);
      ring.write(new Uint8Array([3, 4]));
      const second: Uint8Array = new Uint8Array(2);
      ring.read(second);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first[0]=${first[0]}, expected=1`);
      expect(first[0]).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first[1]=${first[1]}, expected=2`);
      expect(first[1]).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second[0]=${second[0]}, expected=3`);
      expect(second[0]).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second[1]=${second[1]}, expected=4`);
      expect(second[1]).assertEqual(4);
      log('testSppBuffer0137 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0138
     * @tc.name      testSppBuffer0138
     * @tc.desc      Verify reading an empty ring buffer returns zero bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0138 begin');
      const ring: RingBuffer = new RingBuffer(4);
      const out: Uint8Array = new Uint8Array(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ring.read(out), expected=0`);
      expect(ring.read(out)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ring.getUsed()=${ring.getUsed()}, expected=0`);
      expect(ring.getUsed()).assertEqual(0);
      log('testSppBuffer0138 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0139
     * @tc.name      testSppBuffer0139
     * @tc.desc      Verify hex preview formats packet bytes upper case with spaces.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0139 begin');
      const data: Uint8Array = new Uint8Array([0xA5, 0x0B]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual toHexPreview(data)=${toHexPreview(data)}, expected='A5 0B'`);
      expect(toHexPreview(data)).assertEqual('A5 0B');
      log('testSppBuffer0139 end');
    })

    /**
     * @tc.number    SUB_SERIAL_COMM_BUFFER_0140
     * @tc.name      testSppBuffer0140
     * @tc.desc      Verify hex preview of an empty packet is an empty string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSppBuffer0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSppBuffer0140 begin');
      const data: Uint8Array = new Uint8Array(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual toHexPreview(data)=${toHexPreview(data)}, expected=''`);
      expect(toHexPreview(data)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof toHexPreview(data)=${typeof toHexPreview(data)}`);
      expect(typeof toHexPreview(data)).assertEqual('string');
      log('testSppBuffer0140 end');
    })
  })
}
