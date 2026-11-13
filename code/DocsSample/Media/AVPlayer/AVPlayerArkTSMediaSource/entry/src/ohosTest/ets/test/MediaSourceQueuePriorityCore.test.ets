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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_mediaSourceQueuePriorityCore]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertClose(expectValue: number, precision: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function mediaSourceQueuePriorityCoreTest(): void {
  describe('mediaSourceQueuePriorityCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0001
     * @tc.name      testExtQueuePriority0000
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c0,b0,a0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a0', 'b0', 'c0'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [0, 1, 2];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c0,b0,a0');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0002
     * @tc.name      testExtQueuePriority0001
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b1,a1,c1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a1', 'b1', 'c1'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [1, 2, 3];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b1,a1,c1');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0003
     * @tc.name      testExtQueuePriority0002
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a2,c2,b2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a2', 'b2', 'c2'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [2, 3, 4];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a2,c2,b2');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0004
     * @tc.name      testExtQueuePriority0003
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c3,b3,a3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a3', 'b3', 'c3'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [3, 4, 0];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c3,b3,a3');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0005
     * @tc.name      testExtQueuePriority0004
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b4,a4,c4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a4', 'b4', 'c4'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [4, 0, 1];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b4,a4,c4');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0006
     * @tc.name      testExtQueuePriority0005
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a5,c5,b5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a5', 'b5', 'c5'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [0, 1, 2];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a5,c5,b5');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0007
     * @tc.name      testExtQueuePriority0006
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c6,b6,a6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a6', 'b6', 'c6'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [1, 2, 3];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c6,b6,a6');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0008
     * @tc.name      testExtQueuePriority0007
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b7,a7,c7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a7', 'b7', 'c7'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [2, 3, 4];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b7,a7,c7');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0009
     * @tc.name      testExtQueuePriority0008
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a8,c8,b8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a8', 'b8', 'c8'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [3, 4, 0];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a8,c8,b8');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0010
     * @tc.name      testExtQueuePriority0009
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c9,b9,a9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a9', 'b9', 'c9'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [4, 0, 1];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c9,b9,a9');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0011
     * @tc.name      testExtQueuePriority0010
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b10,a10,c10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a10', 'b10', 'c10'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [0, 1, 2];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b10,a10,c10');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0012
     * @tc.name      testExtQueuePriority0011
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a11,c11,b11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a11', 'b11', 'c11'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [1, 2, 3];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a11,c11,b11');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0013
     * @tc.name      testExtQueuePriority0012
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c12,b12,a12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a12', 'b12', 'c12'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [2, 3, 4];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c12,b12,a12');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0014
     * @tc.name      testExtQueuePriority0013
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b13,a13,c13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a13', 'b13', 'c13'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [3, 4, 0];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b13,a13,c13');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0015
     * @tc.name      testExtQueuePriority0014
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a14,c14,b14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a14', 'b14', 'c14'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [4, 0, 1];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a14,c14,b14');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0016
     * @tc.name      testExtQueuePriority0015
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c15,b15,a15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a15', 'b15', 'c15'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [0, 1, 2];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c15,b15,a15');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0017
     * @tc.name      testExtQueuePriority0016
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b16,a16,c16.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a16', 'b16', 'c16'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [1, 2, 3];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b16,a16,c16');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0018
     * @tc.name      testExtQueuePriority0017
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a17,c17,b17.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a17', 'b17', 'c17'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [2, 3, 4];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a17,c17,b17');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0019
     * @tc.name      testExtQueuePriority0018
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c18,b18,a18.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a18', 'b18', 'c18'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [3, 4, 0];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c18,b18,a18');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0020
     * @tc.name      testExtQueuePriority0019
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b19,a19,c19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a19', 'b19', 'c19'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [4, 0, 1];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b19,a19,c19');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0021
     * @tc.name      testExtQueuePriority0020
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a20,c20,b20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a20', 'b20', 'c20'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [0, 1, 2];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a20,c20,b20');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0022
     * @tc.name      testExtQueuePriority0021
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c21,b21,a21.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a21', 'b21', 'c21'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [1, 2, 3];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c21,b21,a21');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0023
     * @tc.name      testExtQueuePriority0022
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b22,a22,c22.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a22', 'b22', 'c22'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [2, 3, 4];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b22,a22,c22');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0024
     * @tc.name      testExtQueuePriority0023
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a23,c23,b23.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a23', 'b23', 'c23'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [3, 4, 0];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a23,c23,b23');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0025
     * @tc.name      testExtQueuePriority0024
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c24,b24,a24.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a24', 'b24', 'c24'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [4, 0, 1];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c24,b24,a24');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0026
     * @tc.name      testExtQueuePriority0025
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b25,a25,c25.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a25', 'b25', 'c25'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [0, 1, 2];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b25,a25,c25');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0027
     * @tc.name      testExtQueuePriority0026
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a26,c26,b26.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a26', 'b26', 'c26'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [1, 2, 3];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a26,c26,b26');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0028
     * @tc.name      testExtQueuePriority0027
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c27,b27,a27.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a27', 'b27', 'c27'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [2, 3, 4];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c27,b27,a27');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0029
     * @tc.name      testExtQueuePriority0028
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b28,a28,c28.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a28', 'b28', 'c28'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [3, 4, 0];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b28,a28,c28');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0030
     * @tc.name      testExtQueuePriority0029
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a29,c29,b29.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a29', 'b29', 'c29'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [4, 0, 1];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a29,c29,b29');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0031
     * @tc.name      testExtQueuePriority0030
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c30,b30,a30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a30', 'b30', 'c30'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [0, 1, 2];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c30,b30,a30');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0032
     * @tc.name      testExtQueuePriority0031
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b31,a31,c31.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a31', 'b31', 'c31'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [1, 2, 3];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b31,a31,c31');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0033
     * @tc.name      testExtQueuePriority0032
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a32,c32,b32.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a32', 'b32', 'c32'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [2, 3, 4];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a32,c32,b32');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0034
     * @tc.name      testExtQueuePriority0033
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c33,b33,a33.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a33', 'b33', 'c33'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [3, 4, 0];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c33,b33,a33');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0035
     * @tc.name      testExtQueuePriority0034
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b34,a34,c34.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a34', 'b34', 'c34'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [4, 0, 1];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b34,a34,c34');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0036
     * @tc.name      testExtQueuePriority0035
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a35,c35,b35.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a35', 'b35', 'c35'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [0, 1, 2];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a35,c35,b35');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0037
     * @tc.name      testExtQueuePriority0036
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c36,b36,a36.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a36', 'b36', 'c36'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [1, 2, 3];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c36,b36,a36');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0038
     * @tc.name      testExtQueuePriority0037
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b37,a37,c37.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a37', 'b37', 'c37'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [2, 3, 4];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b37,a37,c37');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0039
     * @tc.name      testExtQueuePriority0038
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a38,c38,b38.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a38', 'b38', 'c38'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [3, 4, 0];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a38,c38,b38');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0040
     * @tc.name      testExtQueuePriority0039
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c39,b39,a39.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a39', 'b39', 'c39'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [4, 0, 1];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c39,b39,a39');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0041
     * @tc.name      testExtQueuePriority0040
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b40,a40,c40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a40', 'b40', 'c40'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [0, 1, 2];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b40,a40,c40');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0042
     * @tc.name      testExtQueuePriority0041
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a41,c41,b41.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a41', 'b41', 'c41'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [1, 2, 3];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a41,c41,b41');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0043
     * @tc.name      testExtQueuePriority0042
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c42,b42,a42.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a42', 'b42', 'c42'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [2, 3, 4];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c42,b42,a42');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0044
     * @tc.name      testExtQueuePriority0043
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b43,a43,c43.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a43', 'b43', 'c43'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [3, 4, 0];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b43,a43,c43');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0045
     * @tc.name      testExtQueuePriority0044
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a44,c44,b44.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a44', 'b44', 'c44'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [4, 0, 1];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a44,c44,b44');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0046
     * @tc.name      testExtQueuePriority0045
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c45,b45,a45.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a45', 'b45', 'c45'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [0, 1, 2];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c45,b45,a45');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0047
     * @tc.name      testExtQueuePriority0046
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b46,a46,c46.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a46', 'b46', 'c46'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [1, 2, 3];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b46,a46,c46');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0048
     * @tc.name      testExtQueuePriority0047
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a47,c47,b47.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a47', 'b47', 'c47'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [2, 3, 4];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a47,c47,b47');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0049
     * @tc.name      testExtQueuePriority0048
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c48,b48,a48.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a48', 'b48', 'c48'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [3, 4, 0];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c48,b48,a48');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0050
     * @tc.name      testExtQueuePriority0049
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b49,a49,c49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a49', 'b49', 'c49'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [4, 0, 1];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b49,a49,c49');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0051
     * @tc.name      testExtQueuePriority0050
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a50,c50,b50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a50', 'b50', 'c50'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [0, 1, 2];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a50,c50,b50');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0052
     * @tc.name      testExtQueuePriority0051
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c51,b51,a51.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a51', 'b51', 'c51'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [1, 2, 3];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c51,b51,a51');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0053
     * @tc.name      testExtQueuePriority0052
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b52,a52,c52.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a52', 'b52', 'c52'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [2, 3, 4];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b52,a52,c52');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0054
     * @tc.name      testExtQueuePriority0053
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a53,c53,b53.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a53', 'b53', 'c53'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [3, 4, 0];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a53,c53,b53');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0055
     * @tc.name      testExtQueuePriority0054
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c54,b54,a54.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a54', 'b54', 'c54'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [4, 0, 1];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c54,b54,a54');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0056
     * @tc.name      testExtQueuePriority0055
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b55,a55,c55.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a55', 'b55', 'c55'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [0, 1, 2];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b55,a55,c55');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0057
     * @tc.name      testExtQueuePriority0056
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a56,c56,b56.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a56', 'b56', 'c56'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [1, 2, 3];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a56,c56,b56');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0058
     * @tc.name      testExtQueuePriority0057
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c57,b57,a57.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a57', 'b57', 'c57'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [2, 3, 4];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c57,b57,a57');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0059
     * @tc.name      testExtQueuePriority0058
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b58,a58,c58.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a58', 'b58', 'c58'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [3, 4, 0];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b58,a58,c58');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0060
     * @tc.name      testExtQueuePriority0059
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a59,c59,b59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a59', 'b59', 'c59'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [4, 0, 1];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a59,c59,b59');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0061
     * @tc.name      testExtQueuePriority0060
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c60,b60,a60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a60', 'b60', 'c60'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [0, 1, 2];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c60,b60,a60');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0062
     * @tc.name      testExtQueuePriority0061
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b61,a61,c61.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a61', 'b61', 'c61'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [1, 2, 3];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b61,a61,c61');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0063
     * @tc.name      testExtQueuePriority0062
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a62,c62,b62.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a62', 'b62', 'c62'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [2, 3, 4];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a62,c62,b62');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0064
     * @tc.name      testExtQueuePriority0063
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c63,b63,a63.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a63', 'b63', 'c63'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [3, 4, 0];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c63,b63,a63');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0065
     * @tc.name      testExtQueuePriority0064
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b64,a64,c64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a64', 'b64', 'c64'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [4, 0, 1];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b64,a64,c64');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0066
     * @tc.name      testExtQueuePriority0065
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a65,c65,b65.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a65', 'b65', 'c65'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [0, 1, 2];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a65,c65,b65');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0067
     * @tc.name      testExtQueuePriority0066
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c66,b66,a66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a66', 'b66', 'c66'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [1, 2, 3];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c66,b66,a66');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0068
     * @tc.name      testExtQueuePriority0067
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b67,a67,c67.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a67', 'b67', 'c67'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [2, 3, 4];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b67,a67,c67');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0069
     * @tc.name      testExtQueuePriority0068
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a68,c68,b68.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a68', 'b68', 'c68'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [3, 4, 0];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a68,c68,b68');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0070
     * @tc.name      testExtQueuePriority0069
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c69,b69,a69.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a69', 'b69', 'c69'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [4, 0, 1];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c69,b69,a69');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0071
     * @tc.name      testExtQueuePriority0070
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b70,a70,c70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a70', 'b70', 'c70'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [0, 1, 2];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b70,a70,c70');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0072
     * @tc.name      testExtQueuePriority0071
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a71,c71,b71.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a71', 'b71', 'c71'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [1, 2, 3];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a71,c71,b71');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0073
     * @tc.name      testExtQueuePriority0072
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c72,b72,a72.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a72', 'b72', 'c72'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [2, 3, 4];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c72,b72,a72');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0074
     * @tc.name      testExtQueuePriority0073
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b73,a73,c73.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a73', 'b73', 'c73'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [3, 4, 0];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b73,a73,c73');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0075
     * @tc.name      testExtQueuePriority0074
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a74,c74,b74.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a74', 'b74', 'c74'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [4, 0, 1];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a74,c74,b74');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0076
     * @tc.name      testExtQueuePriority0075
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c75,b75,a75.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a75', 'b75', 'c75'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [0, 1, 2];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c75,b75,a75');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0077
     * @tc.name      testExtQueuePriority0076
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b76,a76,c76.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a76', 'b76', 'c76'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [1, 2, 3];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b76,a76,c76');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0078
     * @tc.name      testExtQueuePriority0077
     * @tc.desc      Queue priorities [2, 0, 1] resolve order a77,c77,b77.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a77', 'b77', 'c77'];
      const priorities: number[] = [2, 0, 1];
      const sequences: number[] = [2, 3, 4];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('a77,c77,b77');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0079
     * @tc.name      testExtQueuePriority0078
     * @tc.desc      Queue priorities [0, 1, 2] resolve order c78,b78,a78.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a78', 'b78', 'c78'];
      const priorities: number[] = [0, 1, 2];
      const sequences: number[] = [3, 4, 0];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('c78,b78,a78');
      expect(order.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_QUEUE_0080
     * @tc.name      testExtQueuePriority0079
     * @tc.desc      Queue priorities [1, 2, 0] resolve order b79,a79,c79.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtQueuePriority0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['a79', 'b79', 'c79'];
      const priorities: number[] = [1, 2, 0];
      const sequences: number[] = [4, 0, 1];
      const order: number[] = [0, 1, 2];
      order.sort((left: number, right: number) => {
        if (priorities[left] !== priorities[right]) {
          return priorities[right] - priorities[left];
        }
        return sequences[left] - sequences[right];
      });
      const result: string = `${names[order[0]]},${names[order[1]]},${names[order[2]]}`;
      expect(result).assertEqual('b79,a79,c79');
      expect(order.length).assertEqual(3);
    })
  });
}
